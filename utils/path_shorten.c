#include <stdio.h>

void printstr(char* s, int l)
{
  int i;
  for (i = 0; i < l; ++i)
    printf("%c", s[i]);
}

int main(int argc, char* argv[])
{
  char* path = argv[1];

  int path_length = 0;
  while (path[path_length++]);

  if (path_length <= 30)
  {
    printf("%s",path);
    return 0;
  }

  char* directories[1024];
  int directories_length[1024];
  int num_directories = 0;
  int lst = 0;
  int i,j;

  for (i = 0; i<path_length; ++i)
  {
    if (path[i] == '/')
    {
      directories[num_directories] = path + lst;
      directories_length[num_directories] = i - lst;
      lst = i+1;
      num_directories++;
    }
  }
  directories[num_directories] = path + lst;
  directories_length[num_directories] = i - lst;
  num_directories++;

  int less = 0;
  for (i = 0; i< num_directories-1; ++i)
    if (directories_length[i] <= 2)
      less += 2-directories_length[i];

  int poss_length = directories_length[num_directories-1] + 2 * (num_directories - 1) + (num_directories - 2) - less;
  int to_show = 1;
  while (poss_length + directories_length[num_directories - 1 - to_show] < 30)
  {
    poss_length += directories_length[num_directories - 1 - to_show];
    to_show += 1;
  }

  for (i = 0; i< num_directories-to_show; ++i)
  {
    if (directories_length[i]<=2)
      printstr(directories[i], directories_length[i]);
    else
      printf("%c_",directories[i][0]);
    printf("/");
  }
  for (; i < num_directories; ++i)
  {
    printstr(directories[i], directories_length[i]);
    if (i < num_directories - 1)
      printf("/");
  }
}

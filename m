Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBE23A76DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 08:06:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3yWZ0Fh2z304J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 16:06:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=B93koVoz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B93koVoz; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3yW25BVTz3021
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 16:06:21 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id b13so18852610ybk.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 23:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TbjwGqUHvWaGx5UW+qV3Ea0y3mo5DXpb7BckQX3+/FE=;
 b=B93koVozP9PzGT3naX34mVmyZTw2rMdAcJuhI+4fxGyMY+1UBwPdYJALvGdmRNTJye
 Zd2KOpioK10RMAB7eb39VIRapZXHb8hLSbJTulYdoTiVDFlJYY3rjscdo0HuiI6VLrv7
 RTOxSROa3N1T2N8IwnI20LZrWSsg6YhkVWZx2FUQV9z7NkxOZjBAjsH/Kr+QgFwEuqLw
 QKC7mUJ2sTu1hlnPlnRyW6WfiuXJp9GpDRM9LAJfr+bHnt3WCjlX5Ec0O+dQyTWgnxru
 EAWm6whQn7XJUqQ3yCHLovaLfjoZZ7OCrISjnBdWqHi/ooUwKZEFvGDUxYMJUAtVogKZ
 HDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TbjwGqUHvWaGx5UW+qV3Ea0y3mo5DXpb7BckQX3+/FE=;
 b=t7RRzVN57syKrpL1rJCis/EJUo6+Bl8REu9xXMQm5zBtQ3YeI88poMQwK5sgctUol8
 H+vyVqvVYLvzuEgd63ZqN0VnAABOnTJlx2XwUP4gzZ5R/UfF19kpDpjtsgFyJVCB82YY
 vbxaAX7lwOWpyFI4wxmzwQqymtwFPesu/rOJ7eaGFx1eP59wYiiZgQ0e6/9E1ZBEgvaW
 BOfSgLLg2+oPWIXQ8dcdNrGSnhdUfgj7YSSaqgn+DeAZqu8RViK5rDAY845pwjV4Brbz
 PgxmLdZb+qMDB1HzwtIJiPwk+3YpK8OURLqVM9YMGwSUzpzOb7MIxVE2Wk7MorxalJub
 gmZQ==
X-Gm-Message-State: AOAM5337418VCu2YAEUddRvXQktObofuw3h21C9CCL8oknKRKDzijvLr
 vXQLYIEwNxaCFdAH2aHuXVAOClqh2sHO4lXsUIwr8zKi
X-Google-Smtp-Source: ABdhPJxFY2YKVtnpZY/79otGoiiK+9AbRynk+KY/2XGSrdUJY4M/CzydOGcn+GJwAEmQ5yBye4XFIRXpFGa5Cd4AO0k=
X-Received: by 2002:a25:69ce:: with SMTP id
 e197mr27996838ybc.265.1623737173769; 
 Mon, 14 Jun 2021 23:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210607233709.941102-1-jniethe5@gmail.com>
 <20210607233709.941102-2-jniethe5@gmail.com>
In-Reply-To: <20210607233709.941102-2-jniethe5@gmail.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 15 Jun 2021 16:06:02 +1000
Message-ID: <CACzsE9oV9s-5E-_ATwj6_E0dvo+nO=wq8YPFsPV983ACtWT8BA@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests: Skip TM tests on synthetic TM
 implementations
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Michael Neuling <mikey@neuling.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 8, 2021 at 9:37 AM Jordan Niethe <jniethe5@gmail.com> wrote:
>
> Transactional Memory was removed from the architecture in ISA v3.1. For
> threads running in P8/P9 compatibility mode on P10 a synthetic TM
> implementation is provided. In this implementation, tbegin. always sets
> cr0 eq meaning the abort handler is always called. This is not an issue
> as users of TM are expected to have a fallback non transactional way to
> make forward progress in the abort handler.
>
> As the TM self tests exist only to test TM, no alternative path forward
> is provided, leading to them timing out and failing on the synthetic TM
> implementation.
>
> The TEXASR indicates if a transaction failure is due to a synthetic
> implementation. Check for a synthetic implementation and skip the TM
> tests if so.
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  .../selftests/powerpc/ptrace/ptrace-tm-gpr.c  |  1 +
>  .../powerpc/ptrace/ptrace-tm-spd-gpr.c        |  1 +
>  .../powerpc/ptrace/ptrace-tm-spd-tar.c        |  1 +
>  .../selftests/powerpc/ptrace/ptrace-tm-tar.c  |  1 +
>  .../selftests/powerpc/tm/tm-resched-dscr.c    |  1 +
>  .../selftests/powerpc/tm/tm-signal-stack.c    |  1 +
>  .../testing/selftests/powerpc/tm/tm-syscall.c |  2 +-
>  tools/testing/selftests/powerpc/tm/tm.h       | 36 +++++++++++++++++++
>  8 files changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
> index 7df7100a29be..67ca297c5cca 100644
> --- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
> +++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
> @@ -113,6 +113,7 @@ int ptrace_tm_gpr(void)
>         int ret, status;
>
>         SKIP_IF(!have_htm());
> +       SKIP_IF(htm_is_synthetic());
>         shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
>         pid = fork();
>         if (pid < 0) {
> diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
> index 8706bea5d015..6f2bce1b6c5d 100644
> --- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
> +++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
> @@ -119,6 +119,7 @@ int ptrace_tm_spd_gpr(void)
>         int ret, status;
>
>         SKIP_IF(!have_htm());
> +       SKIP_IF(htm_is_synthetic());
>         shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
>         pid = fork();
>         if (pid < 0) {
> diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
> index 2ecfa1158e2b..e112a34fbe59 100644
> --- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
> +++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
> @@ -129,6 +129,7 @@ int ptrace_tm_spd_tar(void)
>         int ret, status;
>
>         SKIP_IF(!have_htm());
> +       SKIP_IF(htm_is_synthetic());
>         shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
>         pid = fork();
>         if (pid == 0)
> diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
> index 46ef378a15ec..d0db6df0f0ea 100644
> --- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
> +++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
> @@ -117,6 +117,7 @@ int ptrace_tm_tar(void)
>         int ret, status;
>
>         SKIP_IF(!have_htm());
> +       SKIP_IF(htm_is_synthetic());
>         shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
>         pid = fork();
>         if (pid == 0)
> diff --git a/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c b/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c
> index 4cdb83964bb3..85c940ae6ff8 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c
> @@ -40,6 +40,7 @@ int test_body(void)
>         uint64_t rv, dscr1 = 1, dscr2, texasr;
>
>         SKIP_IF(!have_htm());
> +       SKIP_IF(htm_is_synthetic());
>
>         printf("Check DSCR TM context switch: ");
>         fflush(stdout);
> diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-stack.c b/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
> index cdcf8c5bbbc7..68807aac8dd3 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
> @@ -35,6 +35,7 @@ int tm_signal_stack()
>         int pid;
>
>         SKIP_IF(!have_htm());
> +       SKIP_IF(htm_is_synthetic());
>
>         pid = fork();
>         if (pid < 0)
> diff --git a/tools/testing/selftests/powerpc/tm/tm-syscall.c b/tools/testing/selftests/powerpc/tm/tm-syscall.c
> index becb8207b432..467a6b3134b2 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-syscall.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-syscall.c
> @@ -25,7 +25,6 @@ extern int getppid_tm_suspended(void);
>  unsigned retries = 0;
>
>  #define TEST_DURATION 10 /* seconds */
> -#define TM_RETRIES 100
>
>  pid_t getppid_tm(bool suspend)
>  {
> @@ -67,6 +66,7 @@ int tm_syscall(void)
>         struct timeval end, now;
>
>         SKIP_IF(!have_htm_nosc());
> +       SKIP_IF(htm_is_synthetic());
>
>         setbuf(stdout, NULL);
>
> diff --git a/tools/testing/selftests/powerpc/tm/tm.h b/tools/testing/selftests/powerpc/tm/tm.h
> index c5a1e5c163fc..c03c6e778876 100644
> --- a/tools/testing/selftests/powerpc/tm/tm.h
> +++ b/tools/testing/selftests/powerpc/tm/tm.h
> @@ -10,6 +10,9 @@
>  #include <asm/tm.h>
>
>  #include "utils.h"
> +#include "reg.h"
> +
> +#define TM_RETRIES 100
>
>  static inline bool have_htm(void)
>  {
> @@ -31,6 +34,39 @@ static inline bool have_htm_nosc(void)
>  #endif
>  }
>
> +/*
> + * Transactional Memory was removed in ISA 3.1. A synthetic TM implementation
> + * is provided on P10 for threads running in P8/P9 compatibility  mode. The
> + * synthetic implementation immediately fails after tbegin. This failure sets
> + * Bit 7 (Failure Persistent) and Bit 15 (Implementation-specific).
> + */
> +static inline bool htm_is_synthetic(void)
> +{
> +       int i;
> +
> +       /*
> +        * Per the ISA, the Failure Persistent bit may be incorrect. Try a few
> +        * times in case we got an Implementation-specific failure on a non ISA
> +        * v3.1 system. On these systems the Implementation-specific failure
> +        * should not be persistent.
> +        */
> +       for (i = 0; i < TM_RETRIES; i++) {
> +               asm volatile(
> +               "tbegin.;"
> +               "beq 1f;"
> +               "tend.;"
> +               "1:"
> +               :
> +               :
> +               : "memory");
> +
> +               if ((__builtin_get_texasr() & (TEXASR_FP | TEXASR_IC)) !=
> +                   (TEXASR_FP | TEXASR_IC))
> +                       break;
> +       }
> +       return i == TM_RETRIES;
> +}
> +
>  static inline long failure_code(void)
>  {
>         return __builtin_get_texasru() >> 24;
> --
> 2.25.1
>
There's a couple more tests that need the same treatment, Will send a
new version.

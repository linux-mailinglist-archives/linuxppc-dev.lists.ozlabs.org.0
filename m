Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D4745373
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 03:08:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jbybsz1L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvSTX3xNQz3025
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 11:08:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jbybsz1L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=jacobly.alt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qv7vL5jYxz2y1Q
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jul 2023 22:40:45 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-57712d00cc1so42006167b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jul 2023 05:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688301642; x=1690893642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1dWZkJloBET8LXDsDpYxpSua9Iq0SwGTujx63V57eI=;
        b=jbybsz1L9s0WuAS3sp1dwZ+9EAx4GF26NZ4M1EBM7JQXiqk0tYUwE1MNMIzP1ldxQV
         JoC9yxPyKW1QAkApUVGBPqwOG2abbcU0W6tr3Sl6KBnZnaEams/m2DCnmP0DLqhkdBkU
         G2cWXSV8aCw3DCXoFUxgL3y4ql3S/G31xmBAL/N9HziyuXet+syhfjWzyCycnQ7+aN9j
         47hqrQbcEzNpm3IvR+WNOkO5XyyvWCUwFBs1rtM863dvpNGKIqexLGnqPRtxrhbKtquF
         FZTwANlChpjAcfAVotSDxlsvr+E6Os7YOu0Zna+qNQnU1UGWOm5z2OYKc2CoJt5oh5BM
         kt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688301642; x=1690893642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1dWZkJloBET8LXDsDpYxpSua9Iq0SwGTujx63V57eI=;
        b=VIs9+KOMSRjW6O99vx4VIVcxM37ubH7GA9LaGw/ZfR9aq52smxe1kMVU2CCwendKcN
         fpAkoPx0No7i1oNOixfqbBoHXZUW//f6b4ddEYauxiiy/Kx/w9LrsXQ3rDXldYpPOWZb
         fNFx0yyTvGCWWzjf9VURGem5E6rofwo/VDvUnJXfJSVKQnVM1nTYJA2Et286qLy/2Bik
         EcBJ0te7upvHYz9oSAlil7ctctIte+fb6jVMl8hG3yOMdKuvG4zjR2psWwG5nA1xcjaF
         PSx4gku+PAT/APrCt7OZdYAWv8z1PNYQcNZ/Fs61GTtlRpP3mi3VkR5CrSn2cpQ1sycO
         B0QQ==
X-Gm-Message-State: ABy/qLabzlI6WbUhl8g6enU1fKprwTzMbOBdIQ54jHpgtHhoxbCXW+FI
	W/msp2GvPEGOZSRHnibGB7hSJeIk/diWzaY2FH0=
X-Google-Smtp-Source: APBJJlENfqbSeMy1r9gy6ESToUyNzb/A94w9qUwtS2MvFWh9zE+wFgoXJMCLmvI5mG/CHO6rDV/sAX4ArEiHcf2COjM=
X-Received: by 2002:a25:c091:0:b0:c4e:82e1:602 with SMTP id
 c139-20020a25c091000000b00c4e82e10602mr1786702ybf.38.1688301642236; Sun, 02
 Jul 2023 05:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
In-Reply-To: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
From: Jacob Young <jacobly.alt@gmail.com>
Date: Sun, 2 Jul 2023 08:40:31 -0400
Message-ID: <CALrpxLe2VagXEhsHPb9P4vJC97hkBYkLswFJB_jmhu1K+x_QhQ@mail.gmail.com>
Subject: Re: Memory corruption in multithreaded user space program while
 calling fork
To: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a8c6cf05ff805b80"
X-Mailman-Approved-At: Mon, 03 Jul 2023 11:06:49 +1000
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
Cc: Linux Regressions <regressions@lists.linux.dev>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000a8c6cf05ff805b80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Jacob: Can you repeat bisection please? Why did you skip VMA lock-based
page fault commits in your bisection?

All skips were due to compile errors of the form:
make[3]: 'install_headers' is up to date.
In file included from ./include/linux/memcontrol.h:20,
                 from ./include/linux/swap.h:9,
                 from ./include/linux/suspend.h:5,
                 from arch/x86/kernel/asm-offsets.c:14:
./include/linux/mm.h: In function =E2=80=98vma_try_start_write=E2=80=99:
./include/linux/mm.h:702:37: error: =E2=80=98struct vm_area_struct=E2=80=99=
 has no member
named =E2=80=98vm_lock=E2=80=99
  702 |         if (!down_write_trylock(&vma->vm_lock->lock))
      |                                     ^~
./include/linux/mm.h:706:22: error: =E2=80=98struct vm_area_struct=E2=80=99=
 has no member
named =E2=80=98vm_lock=E2=80=99
  706 |         up_write(&vma->vm_lock->lock);
      |                      ^~
make[1]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s]
Error 1
make: *** [Makefile:1286: prepare0] Error 2

On Sun, Jul 2, 2023, 08:27 Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> Hi,
>
> I notice a regression report on Bugzilla [1]. Quoting from it:
>
> > After upgrading to kernel version 6.4.0 from 6.3.9, I noticed frequent
> but random crashes in a user space program.  After a lot of reduction, I
> have come up with the following reproducer program:
> >
> > $ uname -a
> > Linux jacob 6.4.1-gentoo #1 SMP PREEMPT_DYNAMIC Sat Jul  1 19:02:42 EDT
> 2023 x86_64 AMD Ryzen 9 7950X3D 16-Core Processor AuthenticAMD GNU/Linux
> > $ cat repro.c
> > #define _GNU_SOURCE
> > #include <sched.h>
> > #include <sys/wait.h>
> > #include <unistd.h>
> >
> > void *threadSafeAlloc(size_t n) {
> >     static size_t end_index =3D 0;
> >     static char buffer[1 << 25];
> >     size_t start_index =3D __atomic_load_n(&end_index, __ATOMIC_SEQ_CST=
);
> >     while (1) {
> >         if (start_index + n > sizeof(buffer)) _exit(1);
> >         if (__atomic_compare_exchange_n(&end_index, &start_index,
> start_index + n, 1, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST)) return buffer +
> start_index;
> >     }
> > }
> >
> > int thread(void *arg) {
> >     size_t i;
> >     size_t n =3D 1 << 7;
> >     char *items;
> >     (void)arg;
> >     while (1) {
> >         items =3D threadSafeAlloc(n);
> >         for (i =3D 0; i !=3D n; i +=3D 1) items[i] =3D '@';
> >         for (i =3D 0; i !=3D n; i +=3D 1) if (items[i] !=3D '@') _exit(=
2);
> >     }
> > }
> >
> > int main(void) {
> >     static size_t stacks[2][1 << 9];
> >     size_t i;
> >     for (i =3D 0; i !=3D 2; i +=3D 1) clone(&thread, &stacks[i] + 1,
> CLONE_THREAD | CLONE_VM | CLONE_SIGHAND, NULL);
> >     while (1) {
> >         if (fork() =3D=3D 0) _exit(0);
> >         (void)wait(NULL);
> >     }
> > }
> > $ cc repro.c
> > $ ./a.out
> > $ echo $?
> > 2
> >
> > After tuning the various parameters for my computer, exit code 2, which
> indicates that memory corruption was detected, occurs approximately 99% o=
f
> the time.  Exit code 1, which occurs approximately 1% of the time, means =
it
> ran out of statically-allocated memory before reproducing the issue, and
> increasing the memory usage any more only leads to diminishing returns.
> There is also something like a 0.1% chance that it segfaults due to memor=
y
> corruption elsewhere than in the statically-allocated buffer.
> >
> > With this reproducer in hand, I was able to perform the following
> bisection:
> >
> > git bisect start
> > # status: waiting for both good and bad commits
> > # bad: [6995e2de6891c724bfeb2db33d7b87775f913ad1] Linux 6.4
> > git bisect bad 6995e2de6891c724bfeb2db33d7b87775f913ad1
> > # status: waiting for good commit(s), bad commit known
> > # good: [457391b0380335d5e9a5babdec90ac53928b23b4] Linux 6.3
> > git bisect good 457391b0380335d5e9a5babdec90ac53928b23b4
> > # good: [d42b1c47570eb2ed818dc3fe94b2678124af109d] Merge tag
> 'devicetree-for-6.4-1' of git://
> git.kernel.org/pub/scm/linux/kernel/git/robh/linux
> > git bisect good d42b1c47570eb2ed818dc3fe94b2678124af109d
> > # bad: [58390c8ce1bddb6c623f62e7ed36383e7fa5c02f] Merge tag
> 'iommu-updates-v6.4' of git://
> git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
> > git bisect bad 58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
> > # good: [888d3c9f7f3ae44101a3fd76528d3dd6f96e9fd0] Merge tag
> 'sysctl-6.4-rc1' of git://
> git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux
> > git bisect good 888d3c9f7f3ae44101a3fd76528d3dd6f96e9fd0
> > # bad: [86e98ed15b3e34460d1b3095bd119b6fac11841c] Merge tag
> 'cgroup-for-6.4' of git://
> git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup
> > git bisect bad 86e98ed15b3e34460d1b3095bd119b6fac11841c
> > # bad: [7fa8a8ee9400fe8ec188426e40e481717bc5e924] Merge tag
> 'mm-stable-2023-04-27-15-30' of git://
> git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > git bisect bad 7fa8a8ee9400fe8ec188426e40e481717bc5e924
> > # bad: [0120dd6e4e202e19a0e011e486fb2da40a5ea279] zram: make
> zram_bio_discard more self-contained
> > git bisect bad 0120dd6e4e202e19a0e011e486fb2da40a5ea279
> > # good: [fce0b4213edb960859dcc65ea414c8efb11948e1] mm/page_alloc: add
> helper for checking if check_pages_enabled
> > git bisect good fce0b4213edb960859dcc65ea414c8efb11948e1
> > # bad: [59f876fb9d68a4d8c20305d7a7a0daf4ee9478a8] mm: avoid passing 0 t=
o
> __ffs()
> > git bisect bad 59f876fb9d68a4d8c20305d7a7a0daf4ee9478a8
> > # good: [0050d7f5ee532f92e8ab1efcec6547bfac527973] afs: split
> afs_pagecache_valid() out of afs_validate()
> > git bisect good 0050d7f5ee532f92e8ab1efcec6547bfac527973
> > # good: [2ac0af1b66e3b66307f53b1cc446514308ec466d] mm: fall back to
> mmap_lock if vma->anon_vma is not yet set
> > git bisect good 2ac0af1b66e3b66307f53b1cc446514308ec466d
> > # skip: [0d2ebf9c3f7822e7ba3e4792ea3b6b19aa2da34a] mm/mmap: free
> vm_area_struct without call_rcu in exit_mmap
> > git bisect skip 0d2ebf9c3f7822e7ba3e4792ea3b6b19aa2da34a
> > # skip: [70d4cbc80c88251de0a5b3e8df3275901f1fa99a] powerc/mm: try VMA
> lock-based page fault handling first
> > git bisect skip 70d4cbc80c88251de0a5b3e8df3275901f1fa99a
> > # good: [444eeb17437a0ef526c606e9141a415d3b7dfddd] mm: prevent
> userfaults to be handled under per-vma lock
> > git bisect good 444eeb17437a0ef526c606e9141a415d3b7dfddd
> > # bad: [e06f47a16573decc57498f2d02f9af3bb3e84cf2] s390/mm: try VMA
> lock-based page fault handling first
> > git bisect bad e06f47a16573decc57498f2d02f9af3bb3e84cf2
> > # skip: [0bff0aaea03e2a3ed6bfa302155cca8a432a1829] x86/mm: try VMA
> lock-based page fault handling first
> > git bisect skip 0bff0aaea03e2a3ed6bfa302155cca8a432a1829
> > # skip: [cd7f176aea5f5929a09a91c661a26912cc995d1b] arm64/mm: try VMA
> lock-based page fault handling first
> > git bisect skip cd7f176aea5f5929a09a91c661a26912cc995d1b
> > # good: [52f238653e452e0fda61e880f263a173d219acd1] mm: introduce per-VM=
A
> lock statistics
> > git bisect good 52f238653e452e0fda61e880f263a173d219acd1
> > # bad: [c7f8f31c00d187a2c71a241c7f2bd6aa102a4e6f] mm: separate vma->loc=
k
> from vm_area_struct
> > git bisect bad c7f8f31c00d187a2c71a241c7f2bd6aa102a4e6f
> > # only skipped commits left to test
> > # possible first bad commit: [c7f8f31c00d187a2c71a241c7f2bd6aa102a4e6f]
> mm: separate vma->lock from vm_area_struct
> > # possible first bad commit: [0d2ebf9c3f7822e7ba3e4792ea3b6b19aa2da34a]
> mm/mmap: free vm_area_struct without call_rcu in exit_mmap
> > # possible first bad commit: [70d4cbc80c88251de0a5b3e8df3275901f1fa99a]
> powerc/mm: try VMA lock-based page fault handling first
> > # possible first bad commit: [cd7f176aea5f5929a09a91c661a26912cc995d1b]
> arm64/mm: try VMA lock-based page fault handling first
> > # possible first bad commit: [0bff0aaea03e2a3ed6bfa302155cca8a432a1829]
> x86/mm: try VMA lock-based page fault handling first
> >
> > I do not usually see any kernel log output while running the program,
> just occasional logs about user space segfaults.
>
> See Bugzilla for the full thread.
>
> Jacob: Can you repeat bisection please? Why did you skip VMA lock-based
> page fault commits in your bisection?
>
> Anyway, I'm adding it to regzbot:
>
> #regzbot introduced: 0bff0aaea03e2a..c7f8f31c00d187
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217624
> #regzbot <https://bugzilla.kernel.org/show_bug.cgi?id=3D217624#regzbot>
> title: Memory corruption in multithreaded user space program while callin=
g
> fork (possibly caused by trying VMA lock-based page fault)
>
> Thanks.
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217624
>
> --
> An old man doll... just what I always wanted! - Clara
>

--000000000000a8c6cf05ff805b80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">&gt;=20
Jacob: Can you repeat bisection please? Why did you skip VMA lock-based<br>
page fault commits in your bisection?</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">All skips were due to compile errors of the form:<br>make[3]:=
 &#39;install_headers&#39; is up to date.<br>In file included from ./includ=
e/linux/memcontrol.h:20,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from ./include/linux/swap.h:9,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ./include/linux/suspend.h:5,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from arch/x86=
/kernel/asm-offsets.c:14:<br>./include/linux/mm.h: In function =E2=80=98vma=
_try_start_write=E2=80=99:<br>./include/linux/mm.h:702:37: error: =E2=80=98=
struct vm_area_struct=E2=80=99 has no member named =E2=80=98vm_lock=E2=80=
=99<br>=C2=A0 702 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!down_write_trylock(&am=
p;vma-&gt;vm_lock-&gt;lock))<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~<br>./include/linux/mm.h:706:22: error: =
=E2=80=98struct vm_area_struct=E2=80=99 has no member named =E2=80=98vm_loc=
k=E2=80=99<br>=C2=A0 706 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 up_write(&amp;vma-&g=
t;vm_lock-&gt;lock);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>make[1]: *** [scripts=
/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1<br>make: *** [M=
akefile:1286: prepare0] Error 2</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 2, 2023, 08:27 Bagas Sanja=
ya &lt;<a href=3D"mailto:bagasdotme@gmail.com" target=3D"_blank">bagasdotme=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi,<br>
<br>
I notice a regression report on Bugzilla [1]. Quoting from it:<br>
<br>
&gt; After upgrading to kernel version 6.4.0 from 6.3.9, I noticed frequent=
 but random crashes in a user space program.=C2=A0 After a lot of reduction=
, I have come up with the following reproducer program:<br>
&gt; <br>
&gt; $ uname -a<br>
&gt; Linux jacob 6.4.1-gentoo #1 SMP PREEMPT_DYNAMIC Sat Jul=C2=A0 1 19:02:=
42 EDT 2023 x86_64 AMD Ryzen 9 7950X3D 16-Core Processor AuthenticAMD GNU/L=
inux<br>
&gt; $ cat repro.c<br>
&gt; #define _GNU_SOURCE<br>
&gt; #include &lt;sched.h&gt;<br>
&gt; #include &lt;sys/wait.h&gt;<br>
&gt; #include &lt;unistd.h&gt;<br>
&gt; <br>
&gt; void *threadSafeAlloc(size_t n) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0static size_t end_index =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0static char buffer[1 &lt;&lt; 25];<br>
&gt;=C2=A0 =C2=A0 =C2=A0size_t start_index =3D __atomic_load_n(&amp;end_ind=
ex, __ATOMIC_SEQ_CST);<br>
&gt;=C2=A0 =C2=A0 =C2=A0while (1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (start_index + n &gt; sizeof(buffe=
r)) _exit(1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (__atomic_compare_exchange_n(&amp;=
end_index, &amp;start_index, start_index + n, 1, __ATOMIC_SEQ_CST, __ATOMIC=
_SEQ_CST)) return buffer + start_index;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
&gt; <br>
&gt; int thread(void *arg) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0size_t i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0size_t n =3D 1 &lt;&lt; 7;<br>
&gt;=C2=A0 =C2=A0 =C2=A0char *items;<br>
&gt;=C2=A0 =C2=A0 =C2=A0(void)arg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0while (1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0items =3D threadSafeAlloc(n);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i !=3D n; i +=3D 1) ite=
ms[i] =3D &#39;@&#39;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i !=3D n; i +=3D 1) if =
(items[i] !=3D &#39;@&#39;) _exit(2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
&gt; <br>
&gt; int main(void) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0static size_t stacks[2][1 &lt;&lt; 9];<br>
&gt;=C2=A0 =C2=A0 =C2=A0size_t i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i !=3D 2; i +=3D 1) clone(&amp;thread=
, &amp;stacks[i] + 1, CLONE_THREAD | CLONE_VM | CLONE_SIGHAND, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0while (1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fork() =3D=3D 0) _exit(0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void)wait(NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
&gt; $ cc repro.c<br>
&gt; $ ./a.out<br>
&gt; $ echo $?<br>
&gt; 2<br>
&gt; <br>
&gt; After tuning the various parameters for my computer, exit code 2, whic=
h indicates that memory corruption was detected, occurs approximately 99% o=
f the time.=C2=A0 Exit code 1, which occurs approximately 1% of the time, m=
eans it ran out of statically-allocated memory before reproducing the issue=
, and increasing the memory usage any more only leads to diminishing return=
s.=C2=A0 There is also something like a 0.1% chance that it segfaults due t=
o memory corruption elsewhere than in the statically-allocated buffer.<br>
&gt; <br>
&gt; With this reproducer in hand, I was able to perform the following bise=
ction:<br>
&gt; <br>
&gt; git bisect start<br>
&gt; # status: waiting for both good and bad commits<br>
&gt; # bad: [6995e2de6891c724bfeb2db33d7b87775f913ad1] Linux 6.4<br>
&gt; git bisect bad 6995e2de6891c724bfeb2db33d7b87775f913ad1<br>
&gt; # status: waiting for good commit(s), bad commit known<br>
&gt; # good: [457391b0380335d5e9a5babdec90ac53928b23b4] Linux 6.3<br>
&gt; git bisect good 457391b0380335d5e9a5babdec90ac53928b23b4<br>
&gt; # good: [d42b1c47570eb2ed818dc3fe94b2678124af109d] Merge tag &#39;devi=
cetree-for-6.4-1&#39; of git://<a href=3D"http://git.kernel.org/pub/scm/lin=
ux/kernel/git/robh/linux" rel=3D"noreferrer noreferrer" target=3D"_blank">g=
it.kernel.org/pub/scm/linux/kernel/git/robh/linux</a><br>
&gt; git bisect good d42b1c47570eb2ed818dc3fe94b2678124af109d<br>
&gt; # bad: [58390c8ce1bddb6c623f62e7ed36383e7fa5c02f] Merge tag &#39;iommu=
-updates-v6.4&#39; of git://<a href=3D"http://git.kernel.org/pub/scm/linux/=
kernel/git/joro/iommu" rel=3D"noreferrer noreferrer" target=3D"_blank">git.=
kernel.org/pub/scm/linux/kernel/git/joro/iommu</a><br>
&gt; git bisect bad 58390c8ce1bddb6c623f62e7ed36383e7fa5c02f<br>
&gt; # good: [888d3c9f7f3ae44101a3fd76528d3dd6f96e9fd0] Merge tag &#39;sysc=
tl-6.4-rc1&#39; of git://<a href=3D"http://git.kernel.org/pub/scm/linux/ker=
nel/git/mcgrof/linux" rel=3D"noreferrer noreferrer" target=3D"_blank">git.k=
ernel.org/pub/scm/linux/kernel/git/mcgrof/linux</a><br>
&gt; git bisect good 888d3c9f7f3ae44101a3fd76528d3dd6f96e9fd0<br>
&gt; # bad: [86e98ed15b3e34460d1b3095bd119b6fac11841c] Merge tag &#39;cgrou=
p-for-6.4&#39; of git://<a href=3D"http://git.kernel.org/pub/scm/linux/kern=
el/git/tj/cgroup" rel=3D"noreferrer noreferrer" target=3D"_blank">git.kerne=
l.org/pub/scm/linux/kernel/git/tj/cgroup</a><br>
&gt; git bisect bad 86e98ed15b3e34460d1b3095bd119b6fac11841c<br>
&gt; # bad: [7fa8a8ee9400fe8ec188426e40e481717bc5e924] Merge tag &#39;mm-st=
able-2023-04-27-15-30&#39; of git://<a href=3D"http://git.kernel.org/pub/sc=
m/linux/kernel/git/akpm/mm" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>git.kernel.org/pub/scm/linux/kernel/git/akpm/mm</a><br>
&gt; git bisect bad 7fa8a8ee9400fe8ec188426e40e481717bc5e924<br>
&gt; # bad: [0120dd6e4e202e19a0e011e486fb2da40a5ea279] zram: make zram_bio_=
discard more self-contained<br>
&gt; git bisect bad 0120dd6e4e202e19a0e011e486fb2da40a5ea279<br>
&gt; # good: [fce0b4213edb960859dcc65ea414c8efb11948e1] mm/page_alloc: add =
helper for checking if check_pages_enabled<br>
&gt; git bisect good fce0b4213edb960859dcc65ea414c8efb11948e1<br>
&gt; # bad: [59f876fb9d68a4d8c20305d7a7a0daf4ee9478a8] mm: avoid passing 0 =
to __ffs()<br>
&gt; git bisect bad 59f876fb9d68a4d8c20305d7a7a0daf4ee9478a8<br>
&gt; # good: [0050d7f5ee532f92e8ab1efcec6547bfac527973] afs: split afs_page=
cache_valid() out of afs_validate()<br>
&gt; git bisect good 0050d7f5ee532f92e8ab1efcec6547bfac527973<br>
&gt; # good: [2ac0af1b66e3b66307f53b1cc446514308ec466d] mm: fall back to mm=
ap_lock if vma-&gt;anon_vma is not yet set<br>
&gt; git bisect good 2ac0af1b66e3b66307f53b1cc446514308ec466d<br>
&gt; # skip: [0d2ebf9c3f7822e7ba3e4792ea3b6b19aa2da34a] mm/mmap: free vm_ar=
ea_struct without call_rcu in exit_mmap<br>
&gt; git bisect skip 0d2ebf9c3f7822e7ba3e4792ea3b6b19aa2da34a<br>
&gt; # skip: [70d4cbc80c88251de0a5b3e8df3275901f1fa99a] powerc/mm: try VMA =
lock-based page fault handling first<br>
&gt; git bisect skip 70d4cbc80c88251de0a5b3e8df3275901f1fa99a<br>
&gt; # good: [444eeb17437a0ef526c606e9141a415d3b7dfddd] mm: prevent userfau=
lts to be handled under per-vma lock<br>
&gt; git bisect good 444eeb17437a0ef526c606e9141a415d3b7dfddd<br>
&gt; # bad: [e06f47a16573decc57498f2d02f9af3bb3e84cf2] s390/mm: try VMA loc=
k-based page fault handling first<br>
&gt; git bisect bad e06f47a16573decc57498f2d02f9af3bb3e84cf2<br>
&gt; # skip: [0bff0aaea03e2a3ed6bfa302155cca8a432a1829] x86/mm: try VMA loc=
k-based page fault handling first<br>
&gt; git bisect skip 0bff0aaea03e2a3ed6bfa302155cca8a432a1829<br>
&gt; # skip: [cd7f176aea5f5929a09a91c661a26912cc995d1b] arm64/mm: try VMA l=
ock-based page fault handling first<br>
&gt; git bisect skip cd7f176aea5f5929a09a91c661a26912cc995d1b<br>
&gt; # good: [52f238653e452e0fda61e880f263a173d219acd1] mm: introduce per-V=
MA lock statistics<br>
&gt; git bisect good 52f238653e452e0fda61e880f263a173d219acd1<br>
&gt; # bad: [c7f8f31c00d187a2c71a241c7f2bd6aa102a4e6f] mm: separate vma-&gt=
;lock from vm_area_struct<br>
&gt; git bisect bad c7f8f31c00d187a2c71a241c7f2bd6aa102a4e6f<br>
&gt; # only skipped commits left to test<br>
&gt; # possible first bad commit: [c7f8f31c00d187a2c71a241c7f2bd6aa102a4e6f=
] mm: separate vma-&gt;lock from vm_area_struct<br>
&gt; # possible first bad commit: [0d2ebf9c3f7822e7ba3e4792ea3b6b19aa2da34a=
] mm/mmap: free vm_area_struct without call_rcu in exit_mmap<br>
&gt; # possible first bad commit: [70d4cbc80c88251de0a5b3e8df3275901f1fa99a=
] powerc/mm: try VMA lock-based page fault handling first<br>
&gt; # possible first bad commit: [cd7f176aea5f5929a09a91c661a26912cc995d1b=
] arm64/mm: try VMA lock-based page fault handling first<br>
&gt; # possible first bad commit: [0bff0aaea03e2a3ed6bfa302155cca8a432a1829=
] x86/mm: try VMA lock-based page fault handling first<br>
&gt; <br>
&gt; I do not usually see any kernel log output while running the program, =
just occasional logs about user space segfaults.<br>
<br>
See Bugzilla for the full thread.<br>
<br>
Jacob: Can you repeat bisection please? Why did you skip VMA lock-based<br>
page fault commits in your bisection?<br>
<br>
Anyway, I&#39;m adding it to regzbot:<br>
<br>
#regzbot introduced: 0bff0aaea03e2a..c7f8f31c00d187 <a href=3D"https://bugz=
illa.kernel.org/show_bug.cgi?id=3D217624#regzbot" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://bugzilla.kernel.org/show_bug.cgi?id=3D217624=
<br>
#regzbot</a> title: Memory corruption in multithreaded user space program w=
hile calling fork (possibly caused by trying VMA lock-based page fault)<br>
<br>
Thanks.<br>
<br>
[1]: <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D217624" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.kernel.org/sh=
ow_bug.cgi?id=3D217624</a><br>
<br>
-- <br>
An old man doll... just what I always wanted! - Clara<br>
</blockquote></div>

--000000000000a8c6cf05ff805b80--

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F84AD158
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 07:09:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtCJL27RRz30MQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 17:09:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JosSCXEX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=zhouzhouyi@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JosSCXEX; dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtCHd6hgLz2xDD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 17:08:29 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id cf2so19130606edb.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Feb 2022 22:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HSoBw25ClBPC/8rhLlCFfHxN+d20Sf4n2fpZSweaWsQ=;
 b=JosSCXEX0fv6ktN3jvNLDjKjamlYP6AEuWx59C6UDKvzYPJ0CUMnOw6VTpLcsyOkoA
 90dvm+5ktI3MXUyO0K5exU78HANaH++erJWugoRuqZfC7wHWNX+BhSdZrYsR0wIowggq
 C/r0JQGBVW7TSvLcabhWutmGNz9Sx+TR+6EOPTqcK+92ZqQ6OrecvewVUSQpCZjoKDPu
 jP+hzWO5aHcJFMiXI7sSMsPXr6LR6xKYmNfCCNfG00gwkFCDqbJt7XeyvR+d2yEtEmPU
 2mHtVrBkLYTh4bt/BAevIFgTNVPm82zBuda407Jpz7ImTJZ23IAl0Mb2J5GvgKNkEBKh
 pXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HSoBw25ClBPC/8rhLlCFfHxN+d20Sf4n2fpZSweaWsQ=;
 b=3NIAIipsSvg+aSJQatcLUqUv6PdRjUuVcIvr2cx+6DIkrCTL8wuPPdZviuDZftLYUZ
 eSA3SxDxkd74daT9m07JJCZb9pkhB6v+Ix+X6AHFknegyVWFj3Z4JNL1oXzuI31l+Y8/
 6SyTOdy1+uhLoIQdWsUABrFlTtX44SDyS5gFij+77Qb/zdl06V2tBN3kwt1B3RffOqE+
 6g1xMO8odA5WNQW08+briK0/EVbf0bDhJtKIWxaGK2A70gAmiy0nKL05ZH4YO8Z8US1v
 QtlmZSu7bcGF15YPwJngYygqEmbwSCmwdvTp1RpV+b5jjB8osxOi3sEKmpm86ooCYB6d
 BDGg==
X-Gm-Message-State: AOAM530SyUlyW0aMbgaNe8+xif1cbhv0zhx9klH+fd7DNZPVr1efbzEx
 /hrqKRBLc9Sa9OYuDt5SMarlOTxYlP7CvIjCNik=
X-Google-Smtp-Source: ABdhPJxtPJx92R9zg25Ywv6jUvrUJa9JuHS6yZ5Nd6hlF0s3kiGqSOn/4Mv9RHul5+MQhbhOtpLd/O5txX8k/iSzO38=
X-Received: by 2002:a05:6402:35c3:: with SMTP id
 z3mr2805237edc.17.1644300505846; 
 Mon, 07 Feb 2022 22:08:25 -0800 (PST)
MIME-Version: 1.0
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
 <20220207175139.GD4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2y10vv+fUWO+NWY=ckAX-cOkCPfQ1jsoSA=i2PzeFMkUg@mail.gmail.com>
In-Reply-To: <CAABZP2y10vv+fUWO+NWY=ckAX-cOkCPfQ1jsoSA=i2PzeFMkUg@mail.gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 8 Feb 2022 14:08:14 +0800
Message-ID: <CAABZP2xUX0CPGhhXkux8xmBXsekXA=f6bqf-FeeaogSZxAc+NQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_rcutorture=E2=80=99s_init_segfaults_in_ppc64le_VM?=
To: "Paul E. McKenney" <paulmck@kernel.org>
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
Cc: rcu <rcu@vger.kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 linuxppc-dev@lists.ozlabs.org, w@1wt.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

The mailing list forward the emails to me in periodic style, very
sorry not seeing Willy's email until I visited
https://lore.kernel.org/rcu/20220207180901.GB14608@1wt.eu/T/#u,  I am
also very interested in testing Willy's proposal.

Thanks a lot
Zhouyi

On Tue, Feb 8, 2022 at 1:46 PM Zhouyi Zhou <zhouzhouyi@gmail.com> wrote:
>
> Dear Paul
>
> I am also very interested in the topic.
> The Open source lab of Oregon State University has lent me a 8 core
> power ppc64el VM for 3 months, I guess I can try reproducing this bug
> in the Virtual Machine by executing qemu in non hardware accelerated
> mode (using -no-kvm argument).
> I am currently doing research on
> https://lore.kernel.org/rcu/20220201175023.GW4285@paulmck-ThinkPad-P17-Gen-1/T/#mc7e5f8ec99e3794bec1e38fbbb130e71172e4759,
> I think I can give a preliminary short report on that previous topic
> tomorrow. And I am very interested in doing a search on the new topic
> the day after tomorrow.
>
> Thank you both for providing me an opportunity to improve myself ;-)
>
> Thanks again
> Zhouyi
>
> On Tue, Feb 8, 2022 at 12:10 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Mon, Feb 07, 2022 at 05:44:47PM +0100, Paul Menzel wrote:
> > > Dear Linux folks,
> > >
> > >
> > > On the POWER8 server IBM S822LC running Ubuntu 21.10, building Linux
> > > 5.17-rc2+ with rcutorture tests
> > >
> > >     $ tools/testing/selftests/rcutorture/bin/torture.sh --duration 10
> > >
> > > the built init
> > >
> > >     $ file tools/testing/selftests/rcutorture/initrd/init
> > >     tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB
> > > executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically
> > > linked, BuildID[sha1]=0ded0e45649184a296f30d611f7a03cc51ecb616, for
> > > GNU/Linux 3.10.0, stripped
> > >
> > > segfaults in QEMU. From one of the log files
> > >
> > >
> > > /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-rcutorture/TREE03/console.log
> > >
> > >     [    1.119803][    T1] Run /init as init process
> > >     [    1.122011][    T1] init[1]: segfault (11) at f0656d90 nip 10000a18
> > > lr 0 code 1 in init[10000000+d0000]
> > >     [    1.124863][    T1] init[1]: code: 2c2903e7 f9210030 4081ff84
> > > 4bffff58 00000000 01000000 00000580 3c40100f
> > >     [    1.128823][    T1] init[1]: code: 38427c00 7c290b78 782106e4
> > > 38000000 <f821ff81> 7c0803a6 f8010000 e9028010
> > >
> > > Executing the init, which just seems to be an endless loop, from userspace
> > > work:
> > >
> > >     $ strace ./tools/testing/selftests/rcutorture/initrd/init
> > >     execve("./tools/testing/selftests/rcutorture/initrd/init",
> > > ["./tools/testing/selftests/rcutor"...], 0x7ffffdb9e860 /* 31 vars */) = 0
> > >     brk(NULL)                               = 0x1001d940000
> > >     brk(0x1001d940b98)                      = 0x1001d940b98
> > >     set_tid_address(0x1001d9400d0)          = 2890832
> > >     set_robust_list(0x1001d9400e0, 24)      = 0
> > >     uname({sysname="Linux",
> > > nodename="flughafenberlinbrandenburgwillybrandt.molgen.mpg.de", ...}) = 0
> > >     prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024,
> > > rlim_max=RLIM64_INFINITY}) = 0
> > >     readlink("/proc/self/exe", "/dev/shm/linux/tools/testing/sel"..., 4096)
> > > = 61
> > >     getrandom("\xf1\x30\x4c\x9e\x82\x8d\x26\xd7", 8, GRND_NONBLOCK) = 8
> > >     brk(0x1001d970b98)                      = 0x1001d970b98
> > >     brk(0x1001d980000)                      = 0x1001d980000
> > >     mprotect(0x100e0000, 65536, PROT_READ)  = 0
> > >     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0},
> > > 0x7ffffb22c8a8) = 0
> > >     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0},
> > > 0x7ffffb22c8a8) = 0
> > >     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0}, ^C{tv_sec=0,
> > > tv_nsec=872674044}) = ? ERESTART_RESTARTBLOCK (Interrupted by signal)
> > >     strace: Process 2890832 detached
> >
> > Huh.  In PowerPC, is there some difference between system calls
> > executed in initrd and those same system calls executed in userspace?
> >
> > And just to make sure, the above strace was from exactly the same
> > binary "init" file that is included in initrd, correct?
> >
> > Adding Willy Tarreau for his thoughts.
> >
> >                                                         Thanx, Paul
> >
> > > Any ideas, what `mkinitrd.sh` [2] should do differently?
> > >
> > > ```
> > > cat > init.c << '___EOF___'
> > > #ifndef NOLIBC
> > > #include <unistd.h>
> > > #include <sys/time.h>
> > > #endif
> > >
> > > volatile unsigned long delaycount;
> > >
> > > int main(int argc, int argv[])
> > > {
> > >       int i;
> > >       struct timeval tv;
> > >       struct timeval tvb;
> > >
> > >       for (;;) {
> > >               sleep(1);
> > >               /* Need some userspace time. */
> > >               if (gettimeofday(&tvb, NULL))
> > >                       continue;
> > >               do {
> > >                       for (i = 0; i < 1000 * 100; i++)
> > >                               delaycount = i * i;
> > >                       if (gettimeofday(&tv, NULL))
> > >                               break;
> > >                       tv.tv_sec -= tvb.tv_sec;
> > >                       if (tv.tv_sec > 1)
> > >                               break;
> > >                       tv.tv_usec += tv.tv_sec * 1000 * 1000;
> > >                       tv.tv_usec -= tvb.tv_usec;
> > >               } while (tv.tv_usec < 1000);
> > >       }
> > >       return 0;
> > > }
> > > ___EOF___
> > >
> > > # build using nolibc on supported archs (smaller executable) and fall
> > > # back to regular glibc on other ones.
> > > if echo -e "#if __x86_64__||__i386__||__i486__||__i586__||__i686__" \
> > >            "||__ARM_EABI__||__aarch64__\nyes\n#endif" \
> > >    | ${CROSS_COMPILE}gcc -E -nostdlib -xc - \
> > >    | grep -q '^yes'; then
> > >       # architecture supported by nolibc
> > >         ${CROSS_COMPILE}gcc -fno-asynchronous-unwind-tables -fno-ident \
> > >               -nostdlib -include ../../../../include/nolibc/nolibc.h \
> > >               -s -static -Os -o init init.c -lgcc
> > > else
> > >       ${CROSS_COMPILE}gcc -s -static -Os -o init init.c
> > > fi
> > > ```
> > >
> > >
> > > Kind regards,
> > >
> > > Paul
> > >
> > >
> > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/rcutorture/doc/initrd.txt
> > > [2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/rcutorture/bin/mkinitrd.sh

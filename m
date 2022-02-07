Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8C44AC7F4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 18:52:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JstyD6GD4z3cDC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 04:52:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jmg/Q2ZO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=t6ma=sw=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jmg/Q2ZO; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JstxX17Vjz2yPm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 04:51:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1964E61029;
 Mon,  7 Feb 2022 17:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D53C004E1;
 Mon,  7 Feb 2022 17:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644256299;
 bh=UZehaMBOob/tLwn9ZZrZgy7XhzHoi0mrEtK6vxdEtoA=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=Jmg/Q2ZOhsvzTIKvXg4JFDvwH5LxIRcbWdqQyKVwwZslDLq2jI+q9KVXWlIJ5sgvN
 pfwtDp1coWOMobbIKBZbYHvNcE1v1Ed8m3T63X2Q+YREm0JuntILOtXKpofpLtLQCx
 rd3potzCPUGX6Tzycvdwe89SkQvId6zzHOGSdultzO0wVcPLT3B43Qu480a5OTl02q
 z7xBdipczH+KqsED4eSShnpQntpcc5oiBR0+5pZ1zPaYMzZlcmiztRrWIg9EFnyix1
 ruXvCKkwJX+d7ch2I0CQfqm+u4909Cpe37bCcdciXKD9EhJBYTGfgkGblYtMzCQNEF
 LH0J6+nHv7ERw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 4C78B5C04EC; Mon,  7 Feb 2022 09:51:39 -0800 (PST)
Date: Mon, 7 Feb 2022 09:51:39 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: =?utf-8?Q?rcutorture=E2=80=99?= =?utf-8?Q?s?= init segfaults in
 ppc64le VM
Message-ID: <20220207175139.GD4285@paulmck-ThinkPad-P17-Gen-1>
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
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
Reply-To: paulmck@kernel.org
Cc: rcu@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 07, 2022 at 05:44:47PM +0100, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On the POWER8 server IBM S822LC running Ubuntu 21.10, building Linux
> 5.17-rc2+ with rcutorture tests
> 
>     $ tools/testing/selftests/rcutorture/bin/torture.sh --duration 10
> 
> the built init
> 
>     $ file tools/testing/selftests/rcutorture/initrd/init
>     tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB
> executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically
> linked, BuildID[sha1]=0ded0e45649184a296f30d611f7a03cc51ecb616, for
> GNU/Linux 3.10.0, stripped
> 
> segfaults in QEMU. From one of the log files
> 
> 
> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-rcutorture/TREE03/console.log
> 
>     [    1.119803][    T1] Run /init as init process
>     [    1.122011][    T1] init[1]: segfault (11) at f0656d90 nip 10000a18
> lr 0 code 1 in init[10000000+d0000]
>     [    1.124863][    T1] init[1]: code: 2c2903e7 f9210030 4081ff84
> 4bffff58 00000000 01000000 00000580 3c40100f
>     [    1.128823][    T1] init[1]: code: 38427c00 7c290b78 782106e4
> 38000000 <f821ff81> 7c0803a6 f8010000 e9028010
> 
> Executing the init, which just seems to be an endless loop, from userspace
> work:
> 
>     $ strace ./tools/testing/selftests/rcutorture/initrd/init
>     execve("./tools/testing/selftests/rcutorture/initrd/init",
> ["./tools/testing/selftests/rcutor"...], 0x7ffffdb9e860 /* 31 vars */) = 0
>     brk(NULL)                               = 0x1001d940000
>     brk(0x1001d940b98)                      = 0x1001d940b98
>     set_tid_address(0x1001d9400d0)          = 2890832
>     set_robust_list(0x1001d9400e0, 24)      = 0
>     uname({sysname="Linux",
> nodename="flughafenberlinbrandenburgwillybrandt.molgen.mpg.de", ...}) = 0
>     prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024,
> rlim_max=RLIM64_INFINITY}) = 0
>     readlink("/proc/self/exe", "/dev/shm/linux/tools/testing/sel"..., 4096)
> = 61
>     getrandom("\xf1\x30\x4c\x9e\x82\x8d\x26\xd7", 8, GRND_NONBLOCK) = 8
>     brk(0x1001d970b98)                      = 0x1001d970b98
>     brk(0x1001d980000)                      = 0x1001d980000
>     mprotect(0x100e0000, 65536, PROT_READ)  = 0
>     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0},
> 0x7ffffb22c8a8) = 0
>     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0},
> 0x7ffffb22c8a8) = 0
>     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0}, ^C{tv_sec=0,
> tv_nsec=872674044}) = ? ERESTART_RESTARTBLOCK (Interrupted by signal)
>     strace: Process 2890832 detached

Huh.  In PowerPC, is there some difference between system calls
executed in initrd and those same system calls executed in userspace?

And just to make sure, the above strace was from exactly the same
binary "init" file that is included in initrd, correct?

Adding Willy Tarreau for his thoughts.

							Thanx, Paul

> Any ideas, what `mkinitrd.sh` [2] should do differently?
> 
> ```
> cat > init.c << '___EOF___'
> #ifndef NOLIBC
> #include <unistd.h>
> #include <sys/time.h>
> #endif
> 
> volatile unsigned long delaycount;
> 
> int main(int argc, int argv[])
> {
> 	int i;
> 	struct timeval tv;
> 	struct timeval tvb;
> 
> 	for (;;) {
> 		sleep(1);
> 		/* Need some userspace time. */
> 		if (gettimeofday(&tvb, NULL))
> 			continue;
> 		do {
> 			for (i = 0; i < 1000 * 100; i++)
> 				delaycount = i * i;
> 			if (gettimeofday(&tv, NULL))
> 				break;
> 			tv.tv_sec -= tvb.tv_sec;
> 			if (tv.tv_sec > 1)
> 				break;
> 			tv.tv_usec += tv.tv_sec * 1000 * 1000;
> 			tv.tv_usec -= tvb.tv_usec;
> 		} while (tv.tv_usec < 1000);
> 	}
> 	return 0;
> }
> ___EOF___
> 
> # build using nolibc on supported archs (smaller executable) and fall
> # back to regular glibc on other ones.
> if echo -e "#if __x86_64__||__i386__||__i486__||__i586__||__i686__" \
>            "||__ARM_EABI__||__aarch64__\nyes\n#endif" \
>    | ${CROSS_COMPILE}gcc -E -nostdlib -xc - \
>    | grep -q '^yes'; then
> 	# architecture supported by nolibc
>         ${CROSS_COMPILE}gcc -fno-asynchronous-unwind-tables -fno-ident \
> 		-nostdlib -include ../../../../include/nolibc/nolibc.h \
> 		-s -static -Os -o init init.c -lgcc
> else
> 	${CROSS_COMPILE}gcc -s -static -Os -o init init.c
> fi
> ```
> 
> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/rcutorture/doc/initrd.txt
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/rcutorture/bin/mkinitrd.sh

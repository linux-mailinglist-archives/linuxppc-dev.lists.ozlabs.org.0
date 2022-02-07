Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A56164AC864
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 19:20:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsvZM386yz3cCj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 05:20:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=1wt.eu
 (client-ip=62.212.114.60; helo=1wt.eu; envelope-from=w@1wt.eu;
 receiver=<UNKNOWN>)
X-Greylist: delayed 631 seconds by postgrey-1.36 at boromir;
 Tue, 08 Feb 2022 05:19:47 AEDT
Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JsvYv34Tnz3002
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 05:19:47 +1100 (AEDT)
Received: (from willy@localhost)
 by pcw.home.local (8.15.2/8.15.2/Submit) id 217I91om015125;
 Mon, 7 Feb 2022 19:09:01 +0100
Date: Mon, 7 Feb 2022 19:09:01 +0100
From: Willy Tarreau <w@1wt.eu>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: rcutorture's init segfaults in ppc64le VM
Message-ID: <20220207180901.GB14608@1wt.eu>
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
 <20220207175139.GD4285@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207175139.GD4285@paulmck-ThinkPad-P17-Gen-1>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: rcu@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Paul,

On Mon, Feb 07, 2022 at 09:51:39AM -0800, Paul E. McKenney wrote:
(...)
> >     $ file tools/testing/selftests/rcutorture/initrd/init
> >     tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB
> > executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically
> > linked, BuildID[sha1]=0ded0e45649184a296f30d611f7a03cc51ecb616, for
> > GNU/Linux 3.10.0, stripped
> > 
> > segfaults in QEMU. From one of the log files
> > 
> > 
> > /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-rcutorture/TREE03/console.log
> > 
> >     [    1.119803][    T1] Run /init as init process
> >     [    1.122011][    T1] init[1]: segfault (11) at f0656d90 nip 10000a18
> > lr 0 code 1 in init[10000000+d0000]
> >     [    1.124863][    T1] init[1]: code: 2c2903e7 f9210030 4081ff84
> > 4bffff58 00000000 01000000 00000580 3c40100f
> >     [    1.128823][    T1] init[1]: code: 38427c00 7c290b78 782106e4
> > 38000000 <f821ff81> 7c0803a6 f8010000 e9028010

It would be useful to disassemble the executable and spot exactly
the corresponding code locations and instructions.

> > Executing the init, which just seems to be an endless loop, from userspace
> > work:
> > 
> >     $ strace ./tools/testing/selftests/rcutorture/initrd/init
> >     execve("./tools/testing/selftests/rcutorture/initrd/init",
> > ["./tools/testing/selftests/rcutor"...], 0x7ffffdb9e860 /* 31 vars */) = 0
> >     brk(NULL)                               = 0x1001d940000
> >     brk(0x1001d940b98)                      = 0x1001d940b98
> >     set_tid_address(0x1001d9400d0)          = 2890832
> >     set_robust_list(0x1001d9400e0, 24)      = 0
> >     uname({sysname="Linux",
> > nodename="flughafenberlinbrandenburgwillybrandt.molgen.mpg.de", ...}) = 0
> >     prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024,
> > rlim_max=RLIM64_INFINITY}) = 0
> >     readlink("/proc/self/exe", "/dev/shm/linux/tools/testing/sel"..., 4096)
> > = 61

Just guessing, maybe the loader is missing a test when /proc is not
mounted ?

> >     getrandom("\xf1\x30\x4c\x9e\x82\x8d\x26\xd7", 8, GRND_NONBLOCK) = 8
> >     brk(0x1001d970b98)                      = 0x1001d970b98
> >     brk(0x1001d980000)                      = 0x1001d980000
> >     mprotect(0x100e0000, 65536, PROT_READ)  = 0
> >     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0},
> > 0x7ffffb22c8a8) = 0
> >     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0},
> > 0x7ffffb22c8a8) = 0
> >     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0}, ^C{tv_sec=0,
> > tv_nsec=872674044}) = ? ERESTART_RESTARTBLOCK (Interrupted by signal)
> >     strace: Process 2890832 detached
> 
> Huh.  In PowerPC, is there some difference between system calls
> executed in initrd and those same system calls executed in userspace?

I've faced some issues in the past with certain syscalls not working
exactly the same on pid 1 (I think it was setsid() or setpgrp(), but
I could be wrong, that was ~10 years ago). Maybe here we're seeing
something similar with set_tid_address() or set_robust_list().

> And just to make sure, the above strace was from exactly the same
> binary "init" file that is included in initrd, correct?
> 
> Adding Willy Tarreau for his thoughts.
> 
> 							Thanx, Paul
> 
> > Any ideas, what `mkinitrd.sh` [2] should do differently?

I think that we could add a fork() to see if the PID changes anything:

> > #ifndef NOLIBC
> > #include <unistd.h>
> > #include <sys/time.h>
> > #endif
> > 
> > volatile unsigned long delaycount;
> > 
> > int main(int argc, int argv[])
> > {
> > 	int i;
> > 	struct timeval tv;
> > 	struct timeval tvb;

Could you try with this ugly hack here ?

+	if (fork() > 0) {
+		wait(NULL);
+		return 0;
+	}

> > 	for (;;) {
> > 		sleep(1);
> > 		/* Need some userspace time. */
> > 		if (gettimeofday(&tvb, NULL))
> > 			continue;
> > 		do {
> > 			for (i = 0; i < 1000 * 100; i++)
> > 				delaycount = i * i;
> > 			if (gettimeofday(&tv, NULL))
> > 				break;
> > 			tv.tv_sec -= tvb.tv_sec;
> > 			if (tv.tv_sec > 1)
> > 				break;
> > 			tv.tv_usec += tv.tv_sec * 1000 * 1000;
> > 			tv.tv_usec -= tvb.tv_usec;
> > 		} while (tv.tv_usec < 1000);
> > 	}
> > 	return 0;
> > }
(...)

Regards,
Willy

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F04AC650
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 17:45:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JssSs4wtPz3bYw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 03:45:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JssSS5f4mz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 03:44:54 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aee58.dynamic.kabel-deutschland.de
 [95.90.238.88])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9E65D61E64846;
 Mon,  7 Feb 2022 17:44:47 +0100 (CET)
Message-ID: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
Date: Mon, 7 Feb 2022 17:44:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: =?UTF-8?Q?rcutorture=e2=80=99s_init_segfaults_in_ppc64le_VM?=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: rcu@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Linux folks,


On the POWER8 server IBM S822LC running Ubuntu 21.10, building Linux 
5.17-rc2+ with rcutorture tests

     $ tools/testing/selftests/rcutorture/bin/torture.sh --duration 10

the built init

     $ file tools/testing/selftests/rcutorture/initrd/init
     tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB 
executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically 
linked, BuildID[sha1]=0ded0e45649184a296f30d611f7a03cc51ecb616, for 
GNU/Linux 3.10.0, stripped

segfaults in QEMU. From one of the log files

 
/dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-rcutorture/TREE03/console.log

     [    1.119803][    T1] Run /init as init process
     [    1.122011][    T1] init[1]: segfault (11) at f0656d90 nip 
10000a18 lr 0 code 1 in init[10000000+d0000]
     [    1.124863][    T1] init[1]: code: 2c2903e7 f9210030 4081ff84 
4bffff58 00000000 01000000 00000580 3c40100f
     [    1.128823][    T1] init[1]: code: 38427c00 7c290b78 782106e4 
38000000 <f821ff81> 7c0803a6 f8010000 e9028010

Executing the init, which just seems to be an endless loop, from 
userspace work:

     $ strace ./tools/testing/selftests/rcutorture/initrd/init
     execve("./tools/testing/selftests/rcutorture/initrd/init", 
["./tools/testing/selftests/rcutor"...], 0x7ffffdb9e860 /* 31 vars */) = 0
     brk(NULL)                               = 0x1001d940000
     brk(0x1001d940b98)                      = 0x1001d940b98
     set_tid_address(0x1001d9400d0)          = 2890832
     set_robust_list(0x1001d9400e0, 24)      = 0
     uname({sysname="Linux", 
nodename="flughafenberlinbrandenburgwillybrandt.molgen.mpg.de", ...}) = 0
     prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024, 
rlim_max=RLIM64_INFINITY}) = 0
     readlink("/proc/self/exe", "/dev/shm/linux/tools/testing/sel"..., 
4096) = 61
     getrandom("\xf1\x30\x4c\x9e\x82\x8d\x26\xd7", 8, GRND_NONBLOCK) = 8
     brk(0x1001d970b98)                      = 0x1001d970b98
     brk(0x1001d980000)                      = 0x1001d980000
     mprotect(0x100e0000, 65536, PROT_READ)  = 0
     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0}, 
0x7ffffb22c8a8) = 0
     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0}, 
0x7ffffb22c8a8) = 0
     clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=1, tv_nsec=0}, 
^C{tv_sec=0, tv_nsec=872674044}) = ? ERESTART_RESTARTBLOCK (Interrupted 
by signal)
     strace: Process 2890832 detached

Any ideas, what `mkinitrd.sh` [2] should do differently?

```
cat > init.c << '___EOF___'
#ifndef NOLIBC
#include <unistd.h>
#include <sys/time.h>
#endif

volatile unsigned long delaycount;

int main(int argc, int argv[])
{
	int i;
	struct timeval tv;
	struct timeval tvb;

	for (;;) {
		sleep(1);
		/* Need some userspace time. */
		if (gettimeofday(&tvb, NULL))
			continue;
		do {
			for (i = 0; i < 1000 * 100; i++)
				delaycount = i * i;
			if (gettimeofday(&tv, NULL))
				break;
			tv.tv_sec -= tvb.tv_sec;
			if (tv.tv_sec > 1)
				break;
			tv.tv_usec += tv.tv_sec * 1000 * 1000;
			tv.tv_usec -= tvb.tv_usec;
		} while (tv.tv_usec < 1000);
	}
	return 0;
}
___EOF___

# build using nolibc on supported archs (smaller executable) and fall
# back to regular glibc on other ones.
if echo -e "#if __x86_64__||__i386__||__i486__||__i586__||__i686__" \
            "||__ARM_EABI__||__aarch64__\nyes\n#endif" \
    | ${CROSS_COMPILE}gcc -E -nostdlib -xc - \
    | grep -q '^yes'; then
	# architecture supported by nolibc
         ${CROSS_COMPILE}gcc -fno-asynchronous-unwind-tables -fno-ident \
		-nostdlib -include ../../../../include/nolibc/nolibc.h \
		-s -static -Os -o init init.c -lgcc
else
	${CROSS_COMPILE}gcc -s -static -Os -o init init.c
fi
```


Kind regards,

Paul


[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/rcutorture/doc/initrd.txt
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/rcutorture/bin/mkinitrd.sh

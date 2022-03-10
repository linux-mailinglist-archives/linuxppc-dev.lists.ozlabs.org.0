Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F67D4D4242
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 09:11:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDhb86pvPz308J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 19:11:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDhZj27KZz2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 19:10:33 +1100 (AEDT)
Received: from [192.168.0.3] (ip5f5ae8f6.dynamic.kabel-deutschland.de
 [95.90.232.246])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 43CA561E6478B;
 Thu, 10 Mar 2022 09:10:27 +0100 (CET)
Message-ID: <e473c17a-c61c-de8c-f4b4-0956922d220b@molgen.mpg.de>
Date: Thu, 10 Mar 2022 09:10:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: =?UTF-8?Q?Re=3a_rcutorture=e2=80=99s_init_segfaults_in_ppc64le_VM?=
Content-Language: en-US
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
 <871r0dmzzm.fsf@mpe.ellerman.id.au>
 <e7498a9d-7420-ff52-99e4-8194f3d177f0@molgen.mpg.de>
 <CAABZP2zdyWr8qYuQa-5DU2LszaThyZPQ8hi-wyDU2F8hLJCOWQ@mail.gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CAABZP2zdyWr8qYuQa-5DU2LszaThyZPQ8hi-wyDU2F8hLJCOWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: rcu@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Zhouyi,


Thank you for still looking into this.


Am 10.03.22 um 03:37 schrieb Zhouyi Zhou:

> I try to reproduce the bug in ppc64 VM in Oregon State University
> using the vmlinux extracted from
> https://owww.molgen.mpg.de/~pmenzel/rcutorture-2022.02.01-21.52.37-torture-locktorture-kasan-lock01.tar.xz
> 
> the ppc64 VM in which I run the qemu without hardware acceleration is:
> Linux version 5.4.0-100-generic (buildd@bos02-ppc64el-021) (gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #113-Ubuntu SMP Thu Feb 3 18:43:11 UTC 2022 (Ubuntu 5.4.0-100.113-generic 5.4.166)
> 
> 
> The qemu command I use to test:
> cd /tmp/dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-locktorture-kasan/LOCK01$
> $qemu-system-ppc64   -nographic -smp cores=2,threads=1 -net none -M
> pseries -nodefaults -device spapr-vscsi -serial file:/tmp/console.log
> -m 512 -kernel ./vmlinux -append "debug_boot_weak_hash panic=-1
> console=ttyS0 rcutorture.onoff_interval=200
> rcutorture.onoff_holdoff=30 rcutree.gp_preinit_delay=12
> rcutree.gp_init_delay=3 rcutree.gp_cleanup_delay=3
> rcutree.kthread_prio=2 threadirqs tree.use_softirq=0
> rcutorture.n_barrier_cbs=4 rcutorture.stat_interval=15
> rcutorture.shutdown_secs=1800 rcutorture.test_no_idle_hz=1
> rcutorture.verbose=1"
> 
> The console.log is uploaded to:
> http://154.223.142.244/logs/20220310/console.paul.log
> The log tells us it is illegal instruction that causes the trouble:
> [    4.246387][    T1] init[1]: illegal instruction (4) at 1002c308 nip 1002c308 lr 10001684 code 1 in init[10000000+d0000]
> [    4.251400][    T1] init[1]: code: f90d88c0 f92a0008 f9480008 7c2004ac 2c2d0000 f9490000 386d88d0 380000e8
> [    4.253416][    T1] init[1]: code: 41820098 e92d8f98 75290010 4182008c <44000001> 2c2d0000 60000000 8902f438
> 
> 
> Meanwhile, the vmlinux compiled by myself runs smoothly.

How did you build it? Using GCC or clang? I forgot, if the problem was 
only reproducible if the host Linux kernel was built with clang or the 
VM kernel.

> Then I modify mkinitrd.sh to let it panic manually:
> http://154.223.142.244/logs/20220310/mkinitrd.sh

I only see the change:

     -
     +	int *ptr = 0;
     +	*ptr =  0;

> The log tells us it is a segfault (instead of a illegal instruction):
> http://154.223.142.244/logs/20220310/console.zhouyi.log
> 
> Then I use gdb to debug the init in host:
> ubuntu@zhouzhouyi-1:~/newkernel/linux-next$ gdb
> tools/testing/selftests/rcutorture/initrd/init
> (gdb) run
> Starting program:
> /home/ubuntu/newkernel/linux-next/tools/testing/selftests/rcutorture/initrd/init
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x0000000010000b2c in ?? ()
> (gdb) x/10i $pc
> => 0x10000b2c:    stw     r9,0(r9)
>     0x10000b30:    trap
>     0x10000b34:    .long 0x0
>     0x10000b38:    .long 0x0
>     0x10000b3c:    .long 0x0
>     0x10000b40:    lis     r2,4110
>     0x10000b44:    addi    r2,r2,31488
>     0x10000b48:    mr      r9,r1
>     0x10000b4c:    rldicr  r1,r1,0,59
>     0x10000b50:    li      r0,0
> (gdb) p $r9
> $1 = 0
> (gdb) x/30x $pc - 0x30
> 0x10000afc:    0x38840040    0x387f0040    0xf8010040    0x48026919
> 0x10000b0c:    0x60000000    0xe8010040    0x7c0803a6    0x4bffff24
> 0x10000b1c:    0x00000000    0x01000000    0x00000180    0x39200000
> 0x10000b2c:    0x91290000    0x7fe00008    0x00000000    0x00000000
> which matches the hex content of
> http://154.223.142.244/logs/20220310/console.zhouyi.log:
> [    5.077431][    T1] init[1]: segfault (11) at 0 nip 10000b2c lr 10001024 code 1 in init[10000000+d0000]
> [    5.087167][    T1] init[1]: code: 38840040 387f0040 f8010040 48026919 60000000 e8010040 7c0803a6 4bffff24
> [    5.093987][    T1] init[1]: code: 00000000 01000000 00000180 39200000 <91290000> 7fe00008 00000000 00000000
> 
> 
> Conclusions: there might be something wrong when packing the init into
> vmlinux in your environment.
> 
> I will continue to do research on this interesting problem with you.

As written I think it’s a problem with LLVM/clang. Unfortunately, I 
won’t be able to retest before next week.


Kind regards,

Paul

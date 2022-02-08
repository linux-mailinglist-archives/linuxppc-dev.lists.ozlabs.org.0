Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919F4AD82E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 13:13:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtMNT6L3Vz3cPj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 23:13:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtMN15rv7z2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 23:12:47 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aebc2.dynamic.kabel-deutschland.de
 [95.90.235.194])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0DD5B61E6478B;
 Tue,  8 Feb 2022 13:12:43 +0100 (CET)
Message-ID: <e7498a9d-7420-ff52-99e4-8194f3d177f0@molgen.mpg.de>
Date: Tue, 8 Feb 2022 13:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: =?UTF-8?Q?Re=3a_rcutorture=e2=80=99s_init_segfaults_in_ppc64le_VM?=
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
 <871r0dmzzm.fsf@mpe.ellerman.id.au>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <871r0dmzzm.fsf@mpe.ellerman.id.au>
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
Cc: rcu@vger.kernel.org, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Willy Tarreau <w@1wt.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Michael,


Thank you for looking into this.

Am 08.02.22 um 11:09 schrieb Michael Ellerman:
> Paul Menzel writes:

[…]

>> On the POWER8 server IBM S822LC running Ubuntu 21.10, building Linux
>> 5.17-rc2+ with rcutorture tests
> 
> I'm not sure if that's the host kernel version or the version you're
> using of rcutorture? Can you tell us the sha1 of your host kernel and of
> the tree you're running rcutorture from?

The host system runs Linux 5.17-rc1+ started with kexec. Unfortunately, 
I am unable to find the exact sha1.

     $ more /proc/version
     Linux version 5.17.0-rc1+ 
(pmenzel@flughafenberlinbrandenburgwillybrandt.molgen.mpg.de) (Ubuntu 
clang version 13.0.0-2, LLD 13.0.0) #1 SMP Fri Jan 28
17:13:04 CET 2022

The Linux tree, from where I run rcutorture from, is at commit 
dfd42facf1e4 (Linux 5.17-rc3) with four patches on top:

     $ git log --oneline -6
     207cec79e752 (HEAD -> master, origin/master, origin/HEAD) Problems 
with rcutorture on ppc64le: allmodconfig(2) and other failures
     8c82f96fbe57 ata: libata-sata: improve sata_link_debounce()
     a447541d925f ata: libata-sata: remove debounce delay by default
     afd84e1eeafc ata: libata-sata: introduce struct sata_deb_timing
     f4caf7e48b75 ata: libata-sata: Simplify sata_link_resume() interface
     dfd42facf1e4 (tag: v5.17-rc3) Linux 5.17-rc3

>>       $ tools/testing/selftests/rcutorture/bin/torture.sh --duration 10
>>
>> the built init
>>
>>       $ file tools/testing/selftests/rcutorture/initrd/init
>>       tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, BuildID[sha1]=0ded0e45649184a296f30d611f7a03cc51ecb616, for GNU/Linux 3.10.0, stripped
> 
> Mine looks pretty much identical:
> 
>    $ file tools/testing/selftests/rcutorture/initrd/init
>    tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, BuildID[sha1]=86078bf6e5d54ab0860d36aa9a65d52818b972c8, for GNU/Linux 3.10.0, stripped
> 
>> segfaults in QEMU. From one of the log files
> 
> But mine doesn't segfault, it runs fine and the test completes.
> 
> What qemu version are you using?
> 
> I tried 4.2.1 and 6.2.0, both worked.

     $ qemu-system-ppc64le --version
     QEMU emulator version 6.0.0 (Debian 1:6.0+dfsg-2expubuntu1.1)
     Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

>> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-rcutorture/TREE03/console.log

Sorry, that was the wrong path/test. The correct one for the excerpt 
below is:

 
/dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-locktorture-kasan/LOCK01/console.log

(For TREE03, QEMU does not start the Linux kernel at all, that means no 
output after:

     Booting Linux via __start() @ 0x0000000000400000 ...
)

>>       [    1.119803][    T1] Run /init as init process
>>       [    1.122011][    T1] init[1]: segfault (11) at f0656d90 nip 10000a18 lr 0 code 1 in init[10000000+d0000]
>>       [    1.124863][    T1] init[1]: code: 2c2903e7 f9210030 4081ff84 4bffff58 00000000 01000000 00000580 3c40100f
>>       [    1.128823][    T1] init[1]: code: 38427c00 7c290b78 782106e4 38000000 <f821ff81> 7c0803a6 f8010000 e9028010
> 
> The disassembly from 3c40100f is:
>    lis     r2,4111
>    addi    r2,r2,31744
>    mr      r9,r1
>    rldicr  r1,r1,0,59
>    li      r0,0
>    stdu    r1,-128(r1)		<- fault
>    mtlr    r0
>    std     r0,0(r1)
>    ld      r8,-32752(r2)
> 
> 
> I think you'll find that's the code at the ELF entry point. You can
> check with:
> 
>   $ readelf -e tools/testing/selftests/rcutorture/initrd/init | grep Entry
>     Entry point address:               0x10000c0c
> 
>   $ objdump -d tools/testing/selftests/rcutorture/initrd/init | grep -m 1 -A 8 10000c0c
>      10000c0c:   0e 10 40 3c     lis     r2,4110
>      10000c10:   00 7b 42 38     addi    r2,r2,31488
>      10000c14:   78 0b 29 7c     mr      r9,r1
>      10000c18:   e4 06 21 78     rldicr  r1,r1,0,59
>      10000c1c:   00 00 00 38     li      r0,0
>      10000c20:   81 ff 21 f8     stdu    r1,-128(r1)
>      10000c24:   a6 03 08 7c     mtlr    r0
>      10000c28:   00 00 01 f8     std     r0,0(r1)
>      10000c2c:   10 80 02 e9     ld      r8,-32752(r2)
> 
> The fault you're seeing is the first store using the stack pointer (r1),
> which is setup by the kernel.
> 
> The fault address f0656d90 is weirdly low, the stack should be up near 128TB.
> 
> I'm not sure how we end up with a bad r1.
> 
> Can you dump some info about the kernel that was built, something like:
> 
> $ file /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-rcutorture/TREE03/vmlinux
> 
> And maybe paste/attach the full log, maybe there's a clue somewhere.

You can now download the content of 
`/dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-locktorture-kasan/LOCK01` 
[1, 65 MB].

Can you reproduce the segmentation fault with the line below?

     $ qemu-system-ppc64 -enable-kvm -nographic -smp cores=1,threads=8 
-net none -enable-kvm -M pseries -nodefaults -device spapr-vscsi -serial 
stdio -m 512 -kernel 
/dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-locktorture-kasan/LOCK01/vmlinux 
-append "debug_boot_weak_hash panic=-1 console=ttyS0 
torture.disable_onoff_at_boot locktorture.onoff_interval=3 
locktorture.onoff_holdoff=30 locktorture.stat_interval=15 
locktorture.shutdown_secs=60 locktorture.verbose=1"


Kind regards,

Paul


[1]: 
https://owww.molgen.mpg.de/~pmenzel/rcutorture-2022.02.01-21.52.37-torture-locktorture-kasan-lock01.tar.xz

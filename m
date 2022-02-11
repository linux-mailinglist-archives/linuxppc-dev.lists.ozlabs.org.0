Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFDA4B27B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 15:20:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwG3d75Lwz3cV7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 01:20:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwG3D5VF0z2xrG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 01:19:50 +1100 (AEDT)
Received: from [192.168.0.7] (ip5f5aebe1.dynamic.kabel-deutschland.de
 [95.90.235.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6B30261EA1927;
 Fri, 11 Feb 2022 15:19:43 +0100 (CET)
Message-ID: <6ae23d59-fe88-6f14-7d9f-648afa3dc298@molgen.mpg.de>
Date: Fri, 11 Feb 2022 15:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: =?UTF-8?Q?Re=3a_rcutorture=e2=80=99s_init_segfaults_in_ppc64le_VM?=
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
 <871r0dmzzm.fsf@mpe.ellerman.id.au>
 <e7498a9d-7420-ff52-99e4-8194f3d177f0@molgen.mpg.de>
 <87y22irx5k.fsf@mpe.ellerman.id.au>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <87y22irx5k.fsf@mpe.ellerman.id.au>
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


Am 11.02.22 um 02:48 schrieb Michael Ellerman:
> Paul Menzel writes:
>> Am 08.02.22 um 11:09 schrieb Michael Ellerman:
>>> Paul Menzel writes:
>>
>> […]
>>
>>>> On the POWER8 server IBM S822LC running Ubuntu 21.10, building Linux
>>>> 5.17-rc2+ with rcutorture tests
>>>
>>> I'm not sure if that's the host kernel version or the version you're
>>> using of rcutorture? Can you tell us the sha1 of your host kernel and of
>>> the tree you're running rcutorture from?
>>
>> The host system runs Linux 5.17-rc1+ started with kexec. Unfortunately,
>> I am unable to find the exact sha1.
>>
>>       $ more /proc/version
>>       Linux version 5.17.0-rc1+ (x@eddb.molgen.mpg.de) (Ubuntu clang version 13.0.0-2, LLD 13.0.0) #1 SMP Fri Jan 28 17:13:04 CET 2022
> 
> OK. In general rc1 kernels can have issues, so it might be worth
> rebooting the host into either v5.17-rc3 or a distro or stable kernel.
> Just to rule out any issues on the host.

Yes, that was a good test. It works with Ubuntu’s 5.13 Linux kernel.

     $ more /proc/version
     Linux version 5.13.0-28-generic (buildd@bos02-ppc64el-013) (gcc 
(Ubuntu 11.2.0-7ubuntu2) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.37) 
#31-Ubuntu SMP Thu Jan 13 17:40:19 UTC 2022

I have to do more tests, but it could be LLVM/clang related.

>> The Linux tree, from where I run rcutorture from, is at commit
>> dfd42facf1e4 (Linux 5.17-rc3) with four patches on top:
>>
>>       $ git log --oneline -6
>>       207cec79e752 (HEAD -> master, origin/master, origin/HEAD) Problems with rcutorture on ppc64le: allmodconfig(2) and other failures
>>       8c82f96fbe57 ata: libata-sata: improve sata_link_debounce()
>>       a447541d925f ata: libata-sata: remove debounce delay by default
>>       afd84e1eeafc ata: libata-sata: introduce struct sata_deb_timing
>>       f4caf7e48b75 ata: libata-sata: Simplify sata_link_resume() interface
>>       dfd42facf1e4 (tag: v5.17-rc3) Linux 5.17-rc3
>>
>>>>        $ tools/testing/selftests/rcutorture/bin/torture.sh --duration 10
>>>>
>>>> the built init
>>>>
>>>>        $ file tools/testing/selftests/rcutorture/initrd/init
>>>>        tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, BuildID[sha1]=0ded0e45649184a296f30d611f7a03cc51ecb616, for GNU/Linux 3.10.0, stripped
>>>
>>> Mine looks pretty much identical:
>>>
>>>     $ file tools/testing/selftests/rcutorture/initrd/init
>>>     tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, BuildID[sha1]=86078bf6e5d54ab0860d36aa9a65d52818b972c8, for GNU/Linux 3.10.0, stripped
>>>
>>>> segfaults in QEMU. From one of the log files
>>>
>>> But mine doesn't segfault, it runs fine and the test completes.
>>>
>>> What qemu version are you using?
>>>
>>> I tried 4.2.1 and 6.2.0, both worked.
>>
>>       $ qemu-system-ppc64le --version
>>       QEMU emulator version 6.0.0 (Debian 1:6.0+dfsg-2expubuntu1.1)
>>       Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
> 
> OK, that's one difference between our setups, but I'd be surprised if it
> explains this bug, but I guess anything's possible.
> 
>>>> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-rcutorture/TREE03/console.log
>>
>> Sorry, that was the wrong path/test. The correct one for the excerpt
>> below is:
>>
>>   
>> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-locktorture-kasan/LOCK01/console.log
>>
>> (For TREE03, QEMU does not start the Linux kernel at all, that means no
>> output after:
>>
>>       Booting Linux via __start() @ 0x0000000000400000 ...
> 
> OK yeah I see that too.
> 
> Removing "threadirqs" from tools/testing/selftests/rcutorture/configs/rcu/TREE03.boot
> seems to fix it.

Nice find. I have no idea, what that means though.

> I still see some preempt related warnings, we clearly have some bugs
> with preempt enabled.
> 
>> You can now download the content of
>> `/dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-locktorture-kasan/LOCK01`
>> [1, 65 MB].
>>
>> Can you reproduce the segmentation fault with the line below?
>>
>>       $ qemu-system-ppc64 -enable-kvm -nographic -smp cores=1,threads=8 \
>>       -net none -enable-kvm -M pseries -nodefaults -device spapr-vscsi -serial stdio -m 512 \
>>       -kernel /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-locktorture-kasan/LOCK01/vmlinux \
>>       -append "debug_boot_weak_hash panic=-1 console=ttyS0 \
>>       torture.disable_onoff_at_boot locktorture.onoff_interval=3 \
>>       locktorture.onoff_holdoff=30 locktorture.stat_interval=15 \
>>       locktorture.shutdown_secs=60 locktorture.verbose=1"
> 
> That works fine for me, boots and runs the test, then shuts down.
> 
> I assume you see the segfault on every boot, not intermittently?
> 
> So the differences between our setups are the host kernel and the qemu
> version. Can you try a different host kernel easily?
> 
> The other thing would be to try a different qemu version, you might need
> to build from source, but it's not that hard :)

Indeed. I needed to find a current Meson, but then it didn’t make a 
difference, as found out above, it’s related to the Linux kernel.


Kind regards,

Paul

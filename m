Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 878164B1B9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 02:49:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvxNw1hXWz3cQc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 12:49:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qYDJADX8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvxNG48h4z30K4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 12:48:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qYDJADX8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JvxND3dLJz4xRB;
 Fri, 11 Feb 2022 12:48:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644544108;
 bh=oiur8ROejXDAFfftCT4xiG8PdwuDd8kRMQstnmOp138=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qYDJADX8qT7w4qPH8/4rcADkwBUxflRX0kT6rXATHLjhXoRbHKsfeFpMq6CxJyNXv
 cUDVhWz0XMdy5CSSHgSYXMrGMLEq39hnadmzvkAsWBkA846yOdpcBbZiOSbZbY/QYy
 ESB9GW6QDAXDVTrRwLxqYsZIhMb+tfL9xf3FP6bnkGhpLc8+K54DQ4+cAabEaiZ0ak
 5rjKBv9Q142TMn7wUkMQgCza8RPJ4poBsUrCM0ZxSUmzfUHdfwZI9I6JBkP1Fq7gZs
 Pm6kNSUCz0N61mWE8kEEyq4fzL7m44rk1Paphgei+c8X1l1Qcu/+XMSZ1VSBCZWzzp
 GZxUhZ+2pmRMA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Menzel <pmenzel@molgen.mpg.de>, "Paul E. McKenney"
 <paulmck@kernel.org>
Subject: Re: =?utf-8?Q?rcutorture=E2=80=99s?= init segfaults in ppc64le VM
In-Reply-To: <e7498a9d-7420-ff52-99e4-8194f3d177f0@molgen.mpg.de>
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
 <871r0dmzzm.fsf@mpe.ellerman.id.au>
 <e7498a9d-7420-ff52-99e4-8194f3d177f0@molgen.mpg.de>
Date: Fri, 11 Feb 2022 12:48:23 +1100
Message-ID: <87y22irx5k.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Paul Menzel <pmenzel@molgen.mpg.de> writes:
> Am 08.02.22 um 11:09 schrieb Michael Ellerman:
>> Paul Menzel writes:
>
> [=E2=80=A6]
>
>>> On the POWER8 server IBM S822LC running Ubuntu 21.10, building Linux
>>> 5.17-rc2+ with rcutorture tests
>>=20
>> I'm not sure if that's the host kernel version or the version you're
>> using of rcutorture? Can you tell us the sha1 of your host kernel and of
>> the tree you're running rcutorture from?
>
> The host system runs Linux 5.17-rc1+ started with kexec. Unfortunately,=20
> I am unable to find the exact sha1.
>
>      $ more /proc/version
>      Linux version 5.17.0-rc1+=20
> (pmenzel@flughafenberlinbrandenburgwillybrandt.molgen.mpg.de) (Ubuntu=20
> clang version 13.0.0-2, LLD 13.0.0) #1 SMP Fri Jan 28
> 17:13:04 CET 2022

OK. In general rc1 kernels can have issues, so it might be worth
rebooting the host into either v5.17-rc3 or a distro or stable kernel.
Just to rule out any issues on the host.

> The Linux tree, from where I run rcutorture from, is at commit=20
> dfd42facf1e4 (Linux 5.17-rc3) with four patches on top:
>
>      $ git log --oneline -6
>      207cec79e752 (HEAD -> master, origin/master, origin/HEAD) Problems=20
> with rcutorture on ppc64le: allmodconfig(2) and other failures
>      8c82f96fbe57 ata: libata-sata: improve sata_link_debounce()
>      a447541d925f ata: libata-sata: remove debounce delay by default
>      afd84e1eeafc ata: libata-sata: introduce struct sata_deb_timing
>      f4caf7e48b75 ata: libata-sata: Simplify sata_link_resume() interface
>      dfd42facf1e4 (tag: v5.17-rc3) Linux 5.17-rc3
>
>>>       $ tools/testing/selftests/rcutorture/bin/torture.sh --duration 10
>>>
>>> the built init
>>>
>>>       $ file tools/testing/selftests/rcutorture/initrd/init
>>>       tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB ex=
ecutable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked=
, BuildID[sha1]=3D0ded0e45649184a296f30d611f7a03cc51ecb616, for GNU/Linux 3=
.10.0, stripped
>>=20
>> Mine looks pretty much identical:
>>=20
>>    $ file tools/testing/selftests/rcutorture/initrd/init
>>    tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB execut=
able, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, Bu=
ildID[sha1]=3D86078bf6e5d54ab0860d36aa9a65d52818b972c8, for GNU/Linux 3.10.=
0, stripped
>>=20
>>> segfaults in QEMU. From one of the log files
>>=20
>> But mine doesn't segfault, it runs fine and the test completes.
>>=20
>> What qemu version are you using?
>>=20
>> I tried 4.2.1 and 6.2.0, both worked.
>
>      $ qemu-system-ppc64le --version
>      QEMU emulator version 6.0.0 (Debian 1:6.0+dfsg-2expubuntu1.1)
>      Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project develop=
ers

OK, that's one difference between our setups, but I'd be surprised if it
explains this bug, but I guess anything's possible.


>>> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.=
37-torture/results-rcutorture/TREE03/console.log
>
> Sorry, that was the wrong path/test. The correct one for the excerpt=20
> below is:
>
>=20=20
> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37=
-torture/results-locktorture-kasan/LOCK01/console.log
>
> (For TREE03, QEMU does not start the Linux kernel at all, that means no=20
> output after:
>
>      Booting Linux via __start() @ 0x0000000000400000 ...

OK yeah I see that too.

Removing "threadirqs" from tools/testing/selftests/rcutorture/configs/rcu/T=
REE03.boot
seems to fix it.

I still see some preempt related warnings, we clearly have some bugs
with preempt enabled.

> You can now download the content of=20
> `/dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.3=
7-torture/results-locktorture-kasan/LOCK01`=20
> [1, 65 MB].
>
> Can you reproduce the segmentation fault with the line below?
>
>      $ qemu-system-ppc64 -enable-kvm -nographic -smp cores=3D1,threads=3D=
8=20
> -net none -enable-kvm -M pseries -nodefaults -device spapr-vscsi -serial=
=20
> stdio -m 512 -kernel=20
> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37=
-torture/results-locktorture-kasan/LOCK01/vmlinux=20
> -append "debug_boot_weak_hash panic=3D-1 console=3DttyS0=20
> torture.disable_onoff_at_boot locktorture.onoff_interval=3D3=20
> locktorture.onoff_holdoff=3D30 locktorture.stat_interval=3D15=20
> locktorture.shutdown_secs=3D60 locktorture.verbose=3D1"

That works fine for me, boots and runs the test, then shuts down.

I assume you see the segfault on every boot, not intermittently?

So the differences between our setups are the host kernel and the qemu
version. Can you try a different host kernel easily?

The other thing would be to try a different qemu version, you might need
to build from source, but it's not that hard :)

cheers

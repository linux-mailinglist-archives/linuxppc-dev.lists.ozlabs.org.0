Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BF54D4068
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 05:49:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDc6d5T2vz301k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 15:49:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ranitPte;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=g2li=tv=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ranitPte; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDc5y2rMwz2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 15:48:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2AEC6186A;
 Thu, 10 Mar 2022 04:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2090FC340E8;
 Thu, 10 Mar 2022 04:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646887730;
 bh=gdu22LZE3Ny0NvX7st47RSP4WVzNLaiqW+Mg00yxVT4=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=ranitPte5adWuN4bI7YlCcO4XC1K1+H6OXL06guNeLqFwgto7YU3UEdoCL65mP51g
 j4GrNrPuC3PQSVGYCcCNn4Yh7tH4CxGVcCCtvm03GzoQ2YOBi+MKExfw1CGQvZIz1z
 bCGo5Mgdz22BHR9hcvtHsZoKGC/TIKiErwhHBsLikSfY1pzqGBVDDDspt6H/wsFQj9
 dQh6SRd0GF3hYlDGcczlEgUdM03t1hTsL3ogAP9WMShsZk+s2PEpCFseHpfqTxUXLU
 SY5tsBgF6Px+M1Vf7F2rChdOYCdcMWenPT4onKuvLkVqmLr3r7E1k971xxhFf35vlj
 fZ4PlnFctrt0Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id B5C5D5C03DB; Wed,  9 Mar 2022 20:48:49 -0800 (PST)
Date: Wed, 9 Mar 2022 20:48:49 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: =?utf-8?Q?rcutorture=E2=80=99?= =?utf-8?Q?s?= init segfaults in
 ppc64le VM
Message-ID: <20220310044849.GJ4285@paulmck-ThinkPad-P17-Gen-1>
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
 <871r0dmzzm.fsf@mpe.ellerman.id.au>
 <e7498a9d-7420-ff52-99e4-8194f3d177f0@molgen.mpg.de>
 <CAABZP2zdyWr8qYuQa-5DU2LszaThyZPQ8hi-wyDU2F8hLJCOWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABZP2zdyWr8qYuQa-5DU2LszaThyZPQ8hi-wyDU2F8hLJCOWQ@mail.gmail.com>
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
Cc: rcu <rcu@vger.kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 linuxppc-dev@lists.ozlabs.org, Willy Tarreau <w@1wt.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 10, 2022 at 10:37:12AM +0800, Zhouyi Zhou wrote:
> Dear Paul
> 
> I try to reproduce the bug in ppc64 VM in Oregon State University
> using the vmlinux extracted from
> https://owww.molgen.mpg.de/~pmenzel/rcutorture-2022.02.01-21.52.37-torture-locktorture-kasan-lock01.tar.xz
> 
> the ppc64 VM in which I run the qemu without hardware acceleration is:
> Linux version 5.4.0-100-generic (buildd@bos02-ppc64el-021) (gcc
> version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #113-Ubuntu SMP Thu Feb
> 3 18:43:11 UTC 2022 (Ubuntu 5.4.0-100.113-generic 5.4.166)
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
> [    4.246387][    T1] init[1]: illegal instruction (4) at 1002c308
> nip 1002c308 lr 10001684 code 1 in init[10000000+d0000]
> [    4.251400][    T1] init[1]: code: f90d88c0 f92a0008 f9480008
> 7c2004ac 2c2d0000 f9490000 386d88d0 380000e8
> [    4.253416][    T1] init[1]: code: 41820098 e92d8f98 75290010
> 4182008c <44000001> 2c2d0000 60000000 8902f438
> 
> 
> Meanwhile, the vmlinux compiled by myself runs smoothly.
> 
> Then I modify mkinitrd.sh to let it panic manually:
> http://154.223.142.244/logs/20220310/mkinitrd.sh
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
>    0x10000b30:    trap
>    0x10000b34:    .long 0x0
>    0x10000b38:    .long 0x0
>    0x10000b3c:    .long 0x0
>    0x10000b40:    lis     r2,4110
>    0x10000b44:    addi    r2,r2,31488
>    0x10000b48:    mr      r9,r1
>    0x10000b4c:    rldicr  r1,r1,0,59
>    0x10000b50:    li      r0,0
> (gdb) p $r9
> $1 = 0
> (gdb) x/30x $pc - 0x30
> 0x10000afc:    0x38840040    0x387f0040    0xf8010040    0x48026919
> 0x10000b0c:    0x60000000    0xe8010040    0x7c0803a6    0x4bffff24
> 0x10000b1c:    0x00000000    0x01000000    0x00000180    0x39200000
> 0x10000b2c:    0x91290000    0x7fe00008    0x00000000    0x00000000
> which matches the hex content of
> http://154.223.142.244/logs/20220310/console.zhouyi.log:
> [    5.077431][    T1] init[1]: segfault (11) at 0 nip 10000b2c lr
> 10001024 code 1 in init[10000000+d0000]
> [    5.087167][    T1] init[1]: code: 38840040 387f0040 f8010040
> 48026919 60000000 e8010040 7c0803a6 4bffff24
> [    5.093987][    T1] init[1]: code: 00000000 01000000 00000180
> 39200000 <91290000> 7fe00008 00000000 00000000
> 
> 
> Conclusions: there might be something wrong when packing the init into
> vmlinux in your environment.

Quite possibly!  Or the compiler might not be being invoked properly
by the mkinitrd.sh script.

> I will continue to do research on this interesting problem with you.

Please let me know how it goes!

							Thanx, Paul

> Thanks
> Kind Regards
> Zhouyi
> 
> 
> 
> On Tue, Feb 8, 2022 at 8:12 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> >
> > Dear Michael,
> >
> >
> > Thank you for looking into this.
> >
> > Am 08.02.22 um 11:09 schrieb Michael Ellerman:
> > > Paul Menzel writes:
> >
> > […]
> >
> > >> On the POWER8 server IBM S822LC running Ubuntu 21.10, building Linux
> > >> 5.17-rc2+ with rcutorture tests
> > >
> > > I'm not sure if that's the host kernel version or the version you're
> > > using of rcutorture? Can you tell us the sha1 of your host kernel and of
> > > the tree you're running rcutorture from?
> >
> > The host system runs Linux 5.17-rc1+ started with kexec. Unfortunately,
> > I am unable to find the exact sha1.
> >
> >      $ more /proc/version
> >      Linux version 5.17.0-rc1+
> > (pmenzel@flughafenberlinbrandenburgwillybrandt.molgen.mpg.de) (Ubuntu
> > clang version 13.0.0-2, LLD 13.0.0) #1 SMP Fri Jan 28
> > 17:13:04 CET 2022
> >
> > The Linux tree, from where I run rcutorture from, is at commit
> > dfd42facf1e4 (Linux 5.17-rc3) with four patches on top:
> >
> >      $ git log --oneline -6
> >      207cec79e752 (HEAD -> master, origin/master, origin/HEAD) Problems
> > with rcutorture on ppc64le: allmodconfig(2) and other failures
> >      8c82f96fbe57 ata: libata-sata: improve sata_link_debounce()
> >      a447541d925f ata: libata-sata: remove debounce delay by default
> >      afd84e1eeafc ata: libata-sata: introduce struct sata_deb_timing
> >      f4caf7e48b75 ata: libata-sata: Simplify sata_link_resume() interface
> >      dfd42facf1e4 (tag: v5.17-rc3) Linux 5.17-rc3
> >
> > >>       $ tools/testing/selftests/rcutorture/bin/torture.sh --duration 10
> > >>
> > >> the built init
> > >>
> > >>       $ file tools/testing/selftests/rcutorture/initrd/init
> > >>       tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, BuildID[sha1]=0ded0e45649184a296f30d611f7a03cc51ecb616, for GNU/Linux 3.10.0, stripped
> > >
> > > Mine looks pretty much identical:
> > >
> > >    $ file tools/testing/selftests/rcutorture/initrd/init
> > >    tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, BuildID[sha1]=86078bf6e5d54ab0860d36aa9a65d52818b972c8, for GNU/Linux 3.10.0, stripped
> > >
> > >> segfaults in QEMU. From one of the log files
> > >
> > > But mine doesn't segfault, it runs fine and the test completes.
> > >
> > > What qemu version are you using?
> > >
> > > I tried 4.2.1 and 6.2.0, both worked.
> >
> >      $ qemu-system-ppc64le --version
> >      QEMU emulator version 6.0.0 (Debian 1:6.0+dfsg-2expubuntu1.1)
> >      Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
> >
> > >> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-rcutorture/TREE03/console.log
> >
> > Sorry, that was the wrong path/test. The correct one for the excerpt
> > below is:
> >
> >
> > /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-locktorture-kasan/LOCK01/console.log
> >
> > (For TREE03, QEMU does not start the Linux kernel at all, that means no
> > output after:
> >
> >      Booting Linux via __start() @ 0x0000000000400000 ...
> > )
> >
> > >>       [    1.119803][    T1] Run /init as init process
> > >>       [    1.122011][    T1] init[1]: segfault (11) at f0656d90 nip 10000a18 lr 0 code 1 in init[10000000+d0000]
> > >>       [    1.124863][    T1] init[1]: code: 2c2903e7 f9210030 4081ff84 4bffff58 00000000 01000000 00000580 3c40100f
> > >>       [    1.128823][    T1] init[1]: code: 38427c00 7c290b78 782106e4 38000000 <f821ff81> 7c0803a6 f8010000 e9028010
> > >
> > > The disassembly from 3c40100f is:
> > >    lis     r2,4111
> > >    addi    r2,r2,31744
> > >    mr      r9,r1
> > >    rldicr  r1,r1,0,59
> > >    li      r0,0
> > >    stdu    r1,-128(r1)                <- fault
> > >    mtlr    r0
> > >    std     r0,0(r1)
> > >    ld      r8,-32752(r2)
> > >
> > >
> > > I think you'll find that's the code at the ELF entry point. You can
> > > check with:
> > >
> > >   $ readelf -e tools/testing/selftests/rcutorture/initrd/init | grep Entry
> > >     Entry point address:               0x10000c0c
> > >
> > >   $ objdump -d tools/testing/selftests/rcutorture/initrd/init | grep -m 1 -A 8 10000c0c
> > >      10000c0c:   0e 10 40 3c     lis     r2,4110
> > >      10000c10:   00 7b 42 38     addi    r2,r2,31488
> > >      10000c14:   78 0b 29 7c     mr      r9,r1
> > >      10000c18:   e4 06 21 78     rldicr  r1,r1,0,59
> > >      10000c1c:   00 00 00 38     li      r0,0
> > >      10000c20:   81 ff 21 f8     stdu    r1,-128(r1)
> > >      10000c24:   a6 03 08 7c     mtlr    r0
> > >      10000c28:   00 00 01 f8     std     r0,0(r1)
> > >      10000c2c:   10 80 02 e9     ld      r8,-32752(r2)
> > >
> > > The fault you're seeing is the first store using the stack pointer (r1),
> > > which is setup by the kernel.
> > >
> > > The fault address f0656d90 is weirdly low, the stack should be up near 128TB.
> > >
> > > I'm not sure how we end up with a bad r1.
> > >
> > > Can you dump some info about the kernel that was built, something like:
> > >
> > > $ file /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-rcutorture/TREE03/vmlinux
> > >
> > > And maybe paste/attach the full log, maybe there's a clue somewhere.
> >
> > You can now download the content of
> > `/dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-locktorture-kasan/LOCK01`
> > [1, 65 MB].
> >
> > Can you reproduce the segmentation fault with the line below?
> >
> >      $ qemu-system-ppc64 -enable-kvm -nographic -smp cores=1,threads=8
> > -net none -enable-kvm -M pseries -nodefaults -device spapr-vscsi -serial
> > stdio -m 512 -kernel
> > /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-locktorture-kasan/LOCK01/vmlinux
> > -append "debug_boot_weak_hash panic=-1 console=ttyS0
> > torture.disable_onoff_at_boot locktorture.onoff_interval=3
> > locktorture.onoff_holdoff=30 locktorture.stat_interval=15
> > locktorture.shutdown_secs=60 locktorture.verbose=1"
> >
> >
> > Kind regards,
> >
> > Paul
> >
> >
> > [1]:
> > https://owww.molgen.mpg.de/~pmenzel/rcutorture-2022.02.01-21.52.37-torture-locktorture-kasan-lock01.tar.xz

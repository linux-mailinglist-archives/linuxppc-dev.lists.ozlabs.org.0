Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B764D3F4B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 03:38:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDYC60xjyz30J7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 13:38:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e1FQy9/r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e;
 helo=mail-ed1-x52e.google.com; envelope-from=zhouzhouyi@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=e1FQy9/r; dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDYBP4ky1z2xBK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 13:37:31 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id y8so146011edl.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Mar 2022 18:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wFB6zV/NEp7SgsUmp8N76nrNf6b/W9mdetSaO5jN/VI=;
 b=e1FQy9/rspdk7y57jezV9hSEGzYGCEGZFia5jgIo5ztlQSMuQFzWuNLsozmBpAQOjs
 YIX+JNIaUXdNvDfA/+gzzMhSEby6Mf6NNQRtyBEin6ubTv9tiyxZo8CqH+I+eGbvnXNS
 30CvLQSH3mXSas+Kd/Xadv/xN/533qYrtTVGQahgfcF1bV9uo3NAQy8ajust/8cIo5lG
 JmBAHbSRSSOxvF6nBzHi4s/Rz8uAQNy77OU1o0+3Meo0mSNQcemBim7f9SEYD8g6a4CP
 Q1aO7mu1C3N/zV3hbYWDaW5376vPzp9LVh9OO1HItU7qmuWDyGN267A5qR4RHuprpKh8
 R39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wFB6zV/NEp7SgsUmp8N76nrNf6b/W9mdetSaO5jN/VI=;
 b=l6JWtvwmPd8oCabbc982yqK/xvO0sNkbi/hlJAeKW75qDDz0IHu89AAYSM7PfAzvo1
 AAQJ9E2oj0Kwz1i/BnNfk7WiBBWpixIA5sCpRfsWEDyGkpoIaorbsw9vL5xy+jnBHHw/
 6hHVyWH4g5Kj0QLuUgMlBJ/ePxoNq+wNymV82iv7Wf0gmBNlmvzi+kSFDEzLHxxINRl4
 8GU8bC3+PvzFVjc2X3hUriwP3qmUwT0xZfTjEKr+TZTkYZpeHkO/2hXsX6JXGMSjjshq
 iJHWTT6LTr6Sj9AHsKBDMaGXpV+/qCAKq4yXMcOVzz9l9HfbRFrXjq5hRGmQ0Cr5U7h7
 XzXg==
X-Gm-Message-State: AOAM530PEsB659tgR9K8kbCv8dkOVoMgOAS/AW8r580sKHvYWCxhpZU2
 uGRQzZD+jPMlRrvvZtB9ELdkIfBfki1Zn8akAIQ=
X-Google-Smtp-Source: ABdhPJzoi9mjztaoilSp2lk7qnOAp9ElmXRJNfscZx3wqaAZ5LeCdTYVW9tdFoGsdQwM5oCOSMjcMX7QeokBpJzJ7ZA=
X-Received: by 2002:a05:6402:26d3:b0:416:4186:6d7d with SMTP id
 x19-20020a05640226d300b0041641866d7dmr2295158edd.129.1646879844437; Wed, 09
 Mar 2022 18:37:24 -0800 (PST)
MIME-Version: 1.0
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
 <871r0dmzzm.fsf@mpe.ellerman.id.au>
 <e7498a9d-7420-ff52-99e4-8194f3d177f0@molgen.mpg.de>
In-Reply-To: <e7498a9d-7420-ff52-99e4-8194f3d177f0@molgen.mpg.de>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 10 Mar 2022 10:37:12 +0800
Message-ID: <CAABZP2zdyWr8qYuQa-5DU2LszaThyZPQ8hi-wyDU2F8hLJCOWQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_rcutorture=E2=80=99s_init_segfaults_in_ppc64le_VM?=
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: rcu <rcu@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Paul

I try to reproduce the bug in ppc64 VM in Oregon State University
using the vmlinux extracted from
https://owww.molgen.mpg.de/~pmenzel/rcutorture-2022.02.01-21.52.37-torture-=
locktorture-kasan-lock01.tar.xz

the ppc64 VM in which I run the qemu without hardware acceleration is:
Linux version 5.4.0-100-generic (buildd@bos02-ppc64el-021) (gcc
version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #113-Ubuntu SMP Thu Feb
3 18:43:11 UTC 2022 (Ubuntu 5.4.0-100.113-generic 5.4.166)


The qemu command I use to test:
cd /tmp/dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.=
52.37-torture/results-locktorture-kasan/LOCK01$
$qemu-system-ppc64   -nographic -smp cores=3D2,threads=3D1 -net none -M
pseries -nodefaults -device spapr-vscsi -serial file:/tmp/console.log
-m 512 -kernel ./vmlinux -append "debug_boot_weak_hash panic=3D-1
console=3DttyS0 rcutorture.onoff_interval=3D200
rcutorture.onoff_holdoff=3D30 rcutree.gp_preinit_delay=3D12
rcutree.gp_init_delay=3D3 rcutree.gp_cleanup_delay=3D3
rcutree.kthread_prio=3D2 threadirqs tree.use_softirq=3D0
rcutorture.n_barrier_cbs=3D4 rcutorture.stat_interval=3D15
rcutorture.shutdown_secs=3D1800 rcutorture.test_no_idle_hz=3D1
rcutorture.verbose=3D1"

The console.log is uploaded to:
http://154.223.142.244/logs/20220310/console.paul.log
The log tells us it is illegal instruction that causes the trouble:
[    4.246387][    T1] init[1]: illegal instruction (4) at 1002c308
nip 1002c308 lr 10001684 code 1 in init[10000000+d0000]
[    4.251400][    T1] init[1]: code: f90d88c0 f92a0008 f9480008
7c2004ac 2c2d0000 f9490000 386d88d0 380000e8
[    4.253416][    T1] init[1]: code: 41820098 e92d8f98 75290010
4182008c <44000001> 2c2d0000 60000000 8902f438


Meanwhile, the vmlinux compiled by myself runs smoothly.

Then I modify mkinitrd.sh to let it panic manually:
http://154.223.142.244/logs/20220310/mkinitrd.sh
The log tells us it is a segfault (instead of a illegal instruction):
http://154.223.142.244/logs/20220310/console.zhouyi.log

Then I use gdb to debug the init in host:
ubuntu@zhouzhouyi-1:~/newkernel/linux-next$ gdb
tools/testing/selftests/rcutorture/initrd/init
(gdb) run
Starting program:
/home/ubuntu/newkernel/linux-next/tools/testing/selftests/rcutorture/initrd=
/init

Program received signal SIGSEGV, Segmentation fault.
0x0000000010000b2c in ?? ()
(gdb) x/10i $pc
=3D> 0x10000b2c:    stw     r9,0(r9)
   0x10000b30:    trap
   0x10000b34:    .long 0x0
   0x10000b38:    .long 0x0
   0x10000b3c:    .long 0x0
   0x10000b40:    lis     r2,4110
   0x10000b44:    addi    r2,r2,31488
   0x10000b48:    mr      r9,r1
   0x10000b4c:    rldicr  r1,r1,0,59
   0x10000b50:    li      r0,0
(gdb) p $r9
$1 =3D 0
(gdb) x/30x $pc - 0x30
0x10000afc:    0x38840040    0x387f0040    0xf8010040    0x48026919
0x10000b0c:    0x60000000    0xe8010040    0x7c0803a6    0x4bffff24
0x10000b1c:    0x00000000    0x01000000    0x00000180    0x39200000
0x10000b2c:    0x91290000    0x7fe00008    0x00000000    0x00000000
which matches the hex content of
http://154.223.142.244/logs/20220310/console.zhouyi.log:
[    5.077431][    T1] init[1]: segfault (11) at 0 nip 10000b2c lr
10001024 code 1 in init[10000000+d0000]
[    5.087167][    T1] init[1]: code: 38840040 387f0040 f8010040
48026919 60000000 e8010040 7c0803a6 4bffff24
[    5.093987][    T1] init[1]: code: 00000000 01000000 00000180
39200000 <91290000> 7fe00008 00000000 00000000


Conclusions: there might be something wrong when packing the init into
vmlinux in your environment.

I will continue to do research on this interesting problem with you.

Thanks
Kind Regards
Zhouyi



On Tue, Feb 8, 2022 at 8:12 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Michael,
>
>
> Thank you for looking into this.
>
> Am 08.02.22 um 11:09 schrieb Michael Ellerman:
> > Paul Menzel writes:
>
> [=E2=80=A6]
>
> >> On the POWER8 server IBM S822LC running Ubuntu 21.10, building Linux
> >> 5.17-rc2+ with rcutorture tests
> >
> > I'm not sure if that's the host kernel version or the version you're
> > using of rcutorture? Can you tell us the sha1 of your host kernel and o=
f
> > the tree you're running rcutorture from?
>
> The host system runs Linux 5.17-rc1+ started with kexec. Unfortunately,
> I am unable to find the exact sha1.
>
>      $ more /proc/version
>      Linux version 5.17.0-rc1+
> (pmenzel@flughafenberlinbrandenburgwillybrandt.molgen.mpg.de) (Ubuntu
> clang version 13.0.0-2, LLD 13.0.0) #1 SMP Fri Jan 28
> 17:13:04 CET 2022
>
> The Linux tree, from where I run rcutorture from, is at commit
> dfd42facf1e4 (Linux 5.17-rc3) with four patches on top:
>
>      $ git log --oneline -6
>      207cec79e752 (HEAD -> master, origin/master, origin/HEAD) Problems
> with rcutorture on ppc64le: allmodconfig(2) and other failures
>      8c82f96fbe57 ata: libata-sata: improve sata_link_debounce()
>      a447541d925f ata: libata-sata: remove debounce delay by default
>      afd84e1eeafc ata: libata-sata: introduce struct sata_deb_timing
>      f4caf7e48b75 ata: libata-sata: Simplify sata_link_resume() interface
>      dfd42facf1e4 (tag: v5.17-rc3) Linux 5.17-rc3
>
> >>       $ tools/testing/selftests/rcutorture/bin/torture.sh --duration 1=
0
> >>
> >> the built init
> >>
> >>       $ file tools/testing/selftests/rcutorture/initrd/init
> >>       tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB e=
xecutable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linke=
d, BuildID[sha1]=3D0ded0e45649184a296f30d611f7a03cc51ecb616, for GNU/Linux =
3.10.0, stripped
> >
> > Mine looks pretty much identical:
> >
> >    $ file tools/testing/selftests/rcutorture/initrd/init
> >    tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB execu=
table, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, B=
uildID[sha1]=3D86078bf6e5d54ab0860d36aa9a65d52818b972c8, for GNU/Linux 3.10=
.0, stripped
> >
> >> segfaults in QEMU. From one of the log files
> >
> > But mine doesn't segfault, it runs fine and the test completes.
> >
> > What qemu version are you using?
> >
> > I tried 4.2.1 and 6.2.0, both worked.
>
>      $ qemu-system-ppc64le --version
>      QEMU emulator version 6.0.0 (Debian 1:6.0+dfsg-2expubuntu1.1)
>      Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project develop=
ers
>
> >> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52=
.37-torture/results-rcutorture/TREE03/console.log
>
> Sorry, that was the wrong path/test. The correct one for the excerpt
> below is:
>
>
> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37=
-torture/results-locktorture-kasan/LOCK01/console.log
>
> (For TREE03, QEMU does not start the Linux kernel at all, that means no
> output after:
>
>      Booting Linux via __start() @ 0x0000000000400000 ...
> )
>
> >>       [    1.119803][    T1] Run /init as init process
> >>       [    1.122011][    T1] init[1]: segfault (11) at f0656d90 nip 10=
000a18 lr 0 code 1 in init[10000000+d0000]
> >>       [    1.124863][    T1] init[1]: code: 2c2903e7 f9210030 4081ff84=
 4bffff58 00000000 01000000 00000580 3c40100f
> >>       [    1.128823][    T1] init[1]: code: 38427c00 7c290b78 782106e4=
 38000000 <f821ff81> 7c0803a6 f8010000 e9028010
> >
> > The disassembly from 3c40100f is:
> >    lis     r2,4111
> >    addi    r2,r2,31744
> >    mr      r9,r1
> >    rldicr  r1,r1,0,59
> >    li      r0,0
> >    stdu    r1,-128(r1)                <- fault
> >    mtlr    r0
> >    std     r0,0(r1)
> >    ld      r8,-32752(r2)
> >
> >
> > I think you'll find that's the code at the ELF entry point. You can
> > check with:
> >
> >   $ readelf -e tools/testing/selftests/rcutorture/initrd/init | grep En=
try
> >     Entry point address:               0x10000c0c
> >
> >   $ objdump -d tools/testing/selftests/rcutorture/initrd/init | grep -m=
 1 -A 8 10000c0c
> >      10000c0c:   0e 10 40 3c     lis     r2,4110
> >      10000c10:   00 7b 42 38     addi    r2,r2,31488
> >      10000c14:   78 0b 29 7c     mr      r9,r1
> >      10000c18:   e4 06 21 78     rldicr  r1,r1,0,59
> >      10000c1c:   00 00 00 38     li      r0,0
> >      10000c20:   81 ff 21 f8     stdu    r1,-128(r1)
> >      10000c24:   a6 03 08 7c     mtlr    r0
> >      10000c28:   00 00 01 f8     std     r0,0(r1)
> >      10000c2c:   10 80 02 e9     ld      r8,-32752(r2)
> >
> > The fault you're seeing is the first store using the stack pointer (r1)=
,
> > which is setup by the kernel.
> >
> > The fault address f0656d90 is weirdly low, the stack should be up near =
128TB.
> >
> > I'm not sure how we end up with a bad r1.
> >
> > Can you dump some info about the kernel that was built, something like:
> >
> > $ file /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01=
-21.52.37-torture/results-rcutorture/TREE03/vmlinux
> >
> > And maybe paste/attach the full log, maybe there's a clue somewhere.
>
> You can now download the content of
> `/dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.3=
7-torture/results-locktorture-kasan/LOCK01`
> [1, 65 MB].
>
> Can you reproduce the segmentation fault with the line below?
>
>      $ qemu-system-ppc64 -enable-kvm -nographic -smp cores=3D1,threads=3D=
8
> -net none -enable-kvm -M pseries -nodefaults -device spapr-vscsi -serial
> stdio -m 512 -kernel
> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37=
-torture/results-locktorture-kasan/LOCK01/vmlinux
> -append "debug_boot_weak_hash panic=3D-1 console=3DttyS0
> torture.disable_onoff_at_boot locktorture.onoff_interval=3D3
> locktorture.onoff_holdoff=3D30 locktorture.stat_interval=3D15
> locktorture.shutdown_secs=3D60 locktorture.verbose=3D1"
>
>
> Kind regards,
>
> Paul
>
>
> [1]:
> https://owww.molgen.mpg.de/~pmenzel/rcutorture-2022.02.01-21.52.37-tortur=
e-locktorture-kasan-lock01.tar.xz

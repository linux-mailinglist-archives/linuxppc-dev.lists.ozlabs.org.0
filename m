Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 223964D5466
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 23:14:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF3JT0NbXz30C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 09:14:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CnF2rGUx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=zhouzhouyi@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CnF2rGUx; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF3Hn0NxSz2x9M
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 09:13:54 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id qt6so15134561ejb.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 14:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+uQZCxyXu3eG6bnCjXrfDuobUCgfm0mVYgSxQl1zLaw=;
 b=CnF2rGUx3oAfPez7mLI4Jp/LpzEMM4y8a8TLV6czxKtazkpEKAIlcr7zXCqEf7uRx8
 T6Knb+BLgRv9VRYGnO13lhhi9NsSF0NNoteJxd31KbLg0TL3BhLAAMHe3GVBK+lSMRNs
 eN9ohQcRu78tJ3zhNmVU7qBvUG7VXNOgicWm7kyUH8clzAzzq/lGY5nl3jtAgcoWBk0j
 29BeADccAByhVOD5OjYJRPFMZ2hdbv36WYpTGBlQ7KSscr5TMkgN0QWu4MzgAVfuMseS
 iPBkjR7POeujuBEqsJIxHwldGW2AmiopwIk2x7FQzYlKiKipMYuryiq/jH6zV1IBCQPd
 RAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+uQZCxyXu3eG6bnCjXrfDuobUCgfm0mVYgSxQl1zLaw=;
 b=57GobOS++nAeHj7LenffgNat3ozQR67bRHm+5Bvg1TN4/Dv4c2DHK7ch5eTjlfYcsa
 2J2qedaX0OEjAstK08j6sJzlezXepues+v4wz2QQaLCWMtDRMsiohwJ6+4vy4WwtdhGs
 nlFKkxJKgYiRg/ofuXfTIpxbX1aVl8ApVP1ByChJw0GU3ctP/MlZvhSjihBNP13dIPKt
 p2DOjF4v/ayIWd9ot1YVLfcX/ZSCZoEGMLxnKJqpPIHIEB8EMwi7LNt2yHtl5/hAQvuM
 4TXnHZWmjoaC9Yix7a5TuSxLW9gZbGxZcmp1WfgALL9YHuzV4j86+2hXt25RsK61bUo9
 bB3A==
X-Gm-Message-State: AOAM531fiei7UTJx7BD2RWk23q1v/5OAPIIR/bWueCe3jGzkUsdNmWJh
 I4pxVaZ53fImyjPxdmMveFF1/pQGRtCiCis/arg=
X-Google-Smtp-Source: ABdhPJzJBvzV/E32JyKA/2bqeakQ6CgAXF4gMQNVlfMSaMRxWpp6JNPEbrsjB+zxq5Kt6uqZtWkMqxvWpCieVDrZE2Q=
X-Received: by 2002:a17:906:58b:b0:6cf:65f5:de28 with SMTP id
 11-20020a170906058b00b006cf65f5de28mr5959924ejn.614.1646950428347; Thu, 10
 Mar 2022 14:13:48 -0800 (PST)
MIME-Version: 1.0
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
 <871r0dmzzm.fsf@mpe.ellerman.id.au>
 <e7498a9d-7420-ff52-99e4-8194f3d177f0@molgen.mpg.de>
 <CAABZP2zdyWr8qYuQa-5DU2LszaThyZPQ8hi-wyDU2F8hLJCOWQ@mail.gmail.com>
 <e473c17a-c61c-de8c-f4b4-0956922d220b@molgen.mpg.de>
In-Reply-To: <e473c17a-c61c-de8c-f4b4-0956922d220b@molgen.mpg.de>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Fri, 11 Mar 2022 06:13:36 +0800
Message-ID: <CAABZP2zHfr2Fk23X35EUSg1qCUza+cDKosw_cjXjAJyFsxgtgQ@mail.gmail.com>
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

On Thu, Mar 10, 2022 at 4:10 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Zhouyi,
>
>
> Thank you for still looking into this.
You are very welcome ;-)
>
>
> Am 10.03.22 um 03:37 schrieb Zhouyi Zhou:
>
> > I try to reproduce the bug in ppc64 VM in Oregon State University
> > using the vmlinux extracted from
> > https://owww.molgen.mpg.de/~pmenzel/rcutorture-2022.02.01-21.52.37-tort=
ure-locktorture-kasan-lock01.tar.xz
> >
> > the ppc64 VM in which I run the qemu without hardware acceleration is:
> > Linux version 5.4.0-100-generic (buildd@bos02-ppc64el-021) (gcc version=
 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)) #113-Ubuntu SMP Thu Feb 3 18:43:11 U=
TC 2022 (Ubuntu 5.4.0-100.113-generic 5.4.166)
> >
> >
> > The qemu command I use to test:
> > cd /tmp/dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01=
-21.52.37-torture/results-locktorture-kasan/LOCK01$
> > $qemu-system-ppc64   -nographic -smp cores=3D2,threads=3D1 -net none -M
> > pseries -nodefaults -device spapr-vscsi -serial file:/tmp/console.log
> > -m 512 -kernel ./vmlinux -append "debug_boot_weak_hash panic=3D-1
> > console=3DttyS0 rcutorture.onoff_interval=3D200
> > rcutorture.onoff_holdoff=3D30 rcutree.gp_preinit_delay=3D12
> > rcutree.gp_init_delay=3D3 rcutree.gp_cleanup_delay=3D3
> > rcutree.kthread_prio=3D2 threadirqs tree.use_softirq=3D0
> > rcutorture.n_barrier_cbs=3D4 rcutorture.stat_interval=3D15
> > rcutorture.shutdown_secs=3D1800 rcutorture.test_no_idle_hz=3D1
> > rcutorture.verbose=3D1"
> >
> > The console.log is uploaded to:
> > http://154.223.142.244/logs/20220310/console.paul.log
> > The log tells us it is illegal instruction that causes the trouble:
> > [    4.246387][    T1] init[1]: illegal instruction (4) at 1002c308 nip=
 1002c308 lr 10001684 code 1 in init[10000000+d0000]
> > [    4.251400][    T1] init[1]: code: f90d88c0 f92a0008 f9480008 7c2004=
ac 2c2d0000 f9490000 386d88d0 380000e8
> > [    4.253416][    T1] init[1]: code: 41820098 e92d8f98 75290010 418200=
8c <44000001> 2c2d0000 60000000 8902f438
> >
> >
> > Meanwhile, the vmlinux compiled by myself runs smoothly.
>
> How did you build it? Using GCC or clang? I forgot, if the problem was
I built vmlinux(es) using GCC and clang both. The compiled vmlinux(es)
runs smoothly.
> only reproducible if the host Linux kernel was built with clang or the
> VM kernel.
Yes, I also remember this, the dependence of how the host Linux kernel
is built makes things more complex.
>
> > Then I modify mkinitrd.sh to let it panic manually:
> > http://154.223.142.244/logs/20220310/mkinitrd.sh
>
> I only see the change:
>
>      -
>      +  int *ptr =3D 0;
>      +  *ptr =3D  0;
>
Yes, I make the segfault happen manually.
> > The log tells us it is a segfault (instead of a illegal instruction):
> > http://154.223.142.244/logs/20220310/console.zhouyi.log
> >
> > Then I use gdb to debug the init in host:
> > ubuntu@zhouzhouyi-1:~/newkernel/linux-next$ gdb
> > tools/testing/selftests/rcutorture/initrd/init
> > (gdb) run
> > Starting program:
> > /home/ubuntu/newkernel/linux-next/tools/testing/selftests/rcutorture/in=
itrd/init
> >
> > Program received signal SIGSEGV, Segmentation fault.
> > 0x0000000010000b2c in ?? ()
> > (gdb) x/10i $pc
> > =3D> 0x10000b2c:    stw     r9,0(r9)
> >     0x10000b30:    trap
> >     0x10000b34:    .long 0x0
> >     0x10000b38:    .long 0x0
> >     0x10000b3c:    .long 0x0
> >     0x10000b40:    lis     r2,4110
> >     0x10000b44:    addi    r2,r2,31488
> >     0x10000b48:    mr      r9,r1
> >     0x10000b4c:    rldicr  r1,r1,0,59
> >     0x10000b50:    li      r0,0
> > (gdb) p $r9
> > $1 =3D 0
> > (gdb) x/30x $pc - 0x30
> > 0x10000afc:    0x38840040    0x387f0040    0xf8010040    0x48026919
> > 0x10000b0c:    0x60000000    0xe8010040    0x7c0803a6    0x4bffff24
> > 0x10000b1c:    0x00000000    0x01000000    0x00000180    0x39200000
> > 0x10000b2c:    0x91290000    0x7fe00008    0x00000000    0x00000000
> > which matches the hex content of
> > http://154.223.142.244/logs/20220310/console.zhouyi.log:
> > [    5.077431][    T1] init[1]: segfault (11) at 0 nip 10000b2c lr 1000=
1024 code 1 in init[10000000+d0000]
> > [    5.087167][    T1] init[1]: code: 38840040 387f0040 f8010040 480269=
19 60000000 e8010040 7c0803a6 4bffff24
> > [    5.093987][    T1] init[1]: code: 00000000 01000000 00000180 392000=
00 <91290000> 7fe00008 00000000 00000000
> >
> >
> > Conclusions: there might be something wrong when packing the init into
> > vmlinux in your environment.
> >
> > I will continue to do research on this interesting problem with you.
>
> As written I think it=E2=80=99s a problem with LLVM/clang. Unfortunately,=
 I
> won=E2=80=99t be able to retest before next week.
Roger that, no need to hurry ;-)

Kind regards
Zhouyi
> Kind regards,
>
> Paul

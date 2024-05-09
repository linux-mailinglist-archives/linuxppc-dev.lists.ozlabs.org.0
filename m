Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC828C0AE3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 07:16:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=re04k7U+;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ABUcpmgn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZgGp5RNzz3cXn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 15:16:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=re04k7U+;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ABUcpmgn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZgG22Fxyz30V2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 15:15:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1715231742; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tU9kWewsTKj0yhumo71yAl7y43IcYVSzNKZyzRFaOobWOBU9sD6pwpzOF4I6sGnjaN
    f18jrCL3dYYXwROKOxFEzQ6Ydb8o1uF50aPApP94G32AAnOMSNAw2nlUQqu4T281ZeTb
    CKzEviR7vaQSGCbIlSOXCkSTYfD/4RVIZueAb6YNq0bZ/uDPxCmpXsWqBYJ82XXgs3x1
    Q19XePUpAXG6c2udoKp1hzqXOMY8hMdMXp1jIFQ53iKZgdLcj3Xm9I66a4o1oNJn3Nxi
    vypDC17b2I2c26UwF+0Cxd7OaMaBDaHVb0+qAYJ+P7WdsFSv1TwGkEBUlsJSpH7b3K0Q
    Nymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1715231742;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=mCL8pSG9AWkT6SEudFQ9hv0MnHpMhl58zohH24QCcig=;
    b=BwSQgXXazj+CdHprgrSCvA87JtJ+vx3REB8RgB1XoJ7Zdzt0y65Vm5SPQg64weBgOV
    yu4TNEhfEUdQjnjJPxB8laucSKSSI+wWVtQK+BKhmvDA2jt0D1FxhW6SFsBLbk2up5yv
    wYT0dGJuRXA2PUTGPMP2xSDn3JwdhjcD6IA/jmnzCO8KOcn40n5TM5MnLt3RFU50nk+5
    aBOEc1UNAeAgNv3gDTgF50+u0Bqhb1e2SxNTAaB9EaENCP2GfwHF2bjWVFrbYOk/Flhf
    WVWj1/jEQVyumWTZqSHx+DHr8ro/adxIhzbO6rHCu65c95UGcpt3pVofLzy+3KB8ADK3
    kkyQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1715231742;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=mCL8pSG9AWkT6SEudFQ9hv0MnHpMhl58zohH24QCcig=;
    b=re04k7U+p/PIYYWtT9fJ1sEIxImWigyOMBeEM7dyUWuV6ote9u5gAAon4JnMlG2Y88
    2WhV+YT7kzdNRpE/0PkAeErpOMeIzZ6t43z9xD9pbEFF0vtEgNMwepvHcVzMaM9NMplD
    zT3D7/Rw2xUOlPIzc1JMMDuhPusSdhghRBnr3eGXeRedThKQKsC6BOB356eANUSRqSEu
    /jHjIMFARbvS7/jqoA4zY/VEnxxiI9D4Zme6egzVQYbM80HJU6Sja8W/92J+zakjNzWe
    T+2msB/iejXcUJf8w4uq1/D+d0rHWvpxChWO3xqvPakT+fgcGVoinNLHfSfx7Bnz9Na0
    FlYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1715231742;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=mCL8pSG9AWkT6SEudFQ9hv0MnHpMhl58zohH24QCcig=;
    b=ABUcpmgnL/WyG+6+wqUwOKjvI+XzAAHdSRzqupF6gGmte8zqyQGd6bcNnWj6gsU9i2
    8Uh9ul794XC4/jyytdAg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7U5i8syjBCi4sgpqClzUpb5xJBIZWc8GdXycTTA=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e092ae0495FfwP9
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 9 May 2024 07:15:41 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [FSL P50x0] Kernel 6.9-rc1 compiling issue
Date: Thu, 9 May 2024 07:15:30 +0200
Message-Id: <36E31B17-ADC9-4CAD-A2CB-D234E5E09AC9@xenosoft.de>
References: <87edbgavwq.fsf@mail.lhotse>
In-Reply-To: <87edbgavwq.fsf@mail.lhotse>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: iPhone Mail (21E236)
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd@a-eon.com>, hbathini@linux.ibm.com, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=EF=BB=BFChristophe Leroy <christophe.leroy@csgroup.eu> writes:
Hi Christian, hi Hari,

Le 04/04/2024 =C3=A0 19:44, Christian Zigotzky a =C3=A9crit :
Shall we use CONFIG_CRASH_DUMP to get int crashing_cpu =3D -1;?

Further information:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2024-March/269985.html
<https://lists.ozlabs.org/pipermail/linuxppc-dev/2024-March/269985.html>

Looking at problematic commit 5c4233cc0920 ("powerpc/kdump: Split
KEXEC_CORE and CRASH_DUMP dependency"), my feeling is that the change
should be as follows.

Hari, can you confirm ?

diff --git a/arch/powerpc/platforms/85xx/smp.c
b/arch/powerpc/platforms/85xx/smp.c
index 40aa58206888..3209fc92ac19 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -362,7 +362,7 @@ struct smp_ops_t smp_85xx_ops =3D {
 #endif
 };

-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 #ifdef CONFIG_PPC32
 atomic_t kexec_down_cpus =3D ATOMIC_INIT(0);

@@ -465,7 +465,7 @@ static void mpc85xx_smp_machine_kexec(struct kimage
*image)

     default_machine_kexec(image);
 }
-#endif /* CONFIG_KEXEC_CORE */
+#endif /* CONFIG_CRASH_DUMP */

- - - -

On 8. Apr 2024, at 14:20, Michael Ellerman <mpe@ellerman.id.au> wrote:

That doesn't look right to me.

I think it needs something like below.

cheers

diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx=
/smp.c
index 40aa58206888..276060c993a0 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -398,6 +398,7 @@ static void mpc85xx_smp_kexec_cpu_down(int crash_shutdow=
n, int secondary)
   hard_irq_disable();
   mpic_teardown_this_cpu(secondary);

+#ifdef CONFIG_CRASH_DUMP
   if (cpu =3D=3D crashing_cpu && cpu_thread_in_core(cpu) !=3D 0) {
       /*
        * We enter the crash kernel on whatever cpu crashed,
@@ -406,9 +407,11 @@ static void mpc85xx_smp_kexec_cpu_down(int crash_shutdo=
wn, int secondary)
        */
       disable_threadbit =3D 1;
       disable_cpu =3D cpu_first_thread_sibling(cpu);
-    } else if (sibling !=3D crashing_cpu &&
-           cpu_thread_in_core(cpu) =3D=3D 0 &&
-           cpu_thread_in_core(sibling) !=3D 0) {
+    } else if (sibling =3D=3D crashing_cpu)
+        return;
+#endif
+    if (cpu_thread_in_core(cpu) =3D=3D 0 &&
+        cpu_thread_in_core(sibling) !=3D 0) {
       disable_threadbit =3D 2;
       disable_cpu =3D sibling;
   }

- - - -

Any news? I still need a patch for compiling the kernel.

- - Christian=


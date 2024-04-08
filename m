Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1589BEC4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 14:20:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jszKtjXW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCp8d4G8nz3vZL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 22:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jszKtjXW;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCp7x2KCvz3cT2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 22:20:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712578808;
	bh=/JG55rmCfQafksSlgt4QPBxfeVFD7DKWQ3hRMmI8JII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jszKtjXWzk1lY6Sc/QSKN/cnC+z9yQ8Kwgn/GS88qE/UFbRP82Lkx15dmiPRGXHHx
	 rkkzKeLjAqef2QzRL2vkE+69cbsHh35V+1jLWtvyemBqNjgvJNqUHunFQRNPEW93Q0
	 smQRAWBfz9WbJyvD3KA+Ye0zZukG3xsO6FpWcECzZ7Tt55GNd9WSrnUg1yfWDQc5hZ
	 ERY4+/Hk8mU+J3wu4dExGhhdOlj8vi6H8ksMcB6YHT7SvK0ZYSL31Hq6Udm5iRLdL2
	 zl3n2ZvOc0Vpoqz8FlbpNGWjolYP65xOIur9TWkAYsOxjaYRu99eluo04XpvQxuz2h
	 ej2UQer1129jA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VCp7p1sr0z4wd3;
	Mon,  8 Apr 2024 22:20:06 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Christian Zigotzky
 <chzigotzky@xenosoft.de>, "hbathini@linux.ibm.com"
 <hbathini@linux.ibm.com>
Subject: Re: [FSL P50x0] Kernel 6.9-rc1 compiling issue
In-Reply-To: <41ff5851-6ff4-4c45-8f47-6336fd6c11ac@csgroup.eu>
References: <a4320985-f585-4033-8229-63937a49aa84@xenosoft.de>
 <3FDFD539-844A-44B7-BEA7-BE4F3BE4EAEE@xenosoft.de>
 <41ff5851-6ff4-4c45-8f47-6336fd6c11ac@csgroup.eu>
Date: Mon, 08 Apr 2024 22:20:05 +1000
Message-ID: <87edbgavwq.fsf@mail.lhotse>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd@a-eon.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Matthew Leaman <matthew@a-eon.biz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi Christian, hi Hari,
>
> Le 04/04/2024 =C3=A0 19:44, Christian Zigotzky a =C3=A9crit=C2=A0:
>> Shall we use CONFIG_CRASH_DUMP to get int crashing_cpu =3D -1;?
>>=20
>> Further information:=20
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2024-March/269985.html=20
>> <https://lists.ozlabs.org/pipermail/linuxppc-dev/2024-March/269985.html>
>
> Looking at problematic commit 5c4233cc0920 ("powerpc/kdump: Split=20
> KEXEC_CORE and CRASH_DUMP dependency"), my feeling is that the change=20
> should be as follows.
>
> Hari, can you confirm ?
>
> diff --git a/arch/powerpc/platforms/85xx/smp.c=20
> b/arch/powerpc/platforms/85xx/smp.c
> index 40aa58206888..3209fc92ac19 100644
> --- a/arch/powerpc/platforms/85xx/smp.c
> +++ b/arch/powerpc/platforms/85xx/smp.c
> @@ -362,7 +362,7 @@ struct smp_ops_t smp_85xx_ops =3D {
>   #endif
>   };
>
> -#ifdef CONFIG_KEXEC_CORE
> +#ifdef CONFIG_CRASH_DUMP
>   #ifdef CONFIG_PPC32
>   atomic_t kexec_down_cpus =3D ATOMIC_INIT(0);
>
> @@ -465,7 +465,7 @@ static void mpc85xx_smp_machine_kexec(struct kimage=20
> *image)
>
>   	default_machine_kexec(image);
>   }
> -#endif /* CONFIG_KEXEC_CORE */
> +#endif /* CONFIG_CRASH_DUMP */

That doesn't look right to me.

I think it needs something like below.

cheers

diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85x=
x/smp.c
index 40aa58206888..276060c993a0 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -398,6 +398,7 @@ static void mpc85xx_smp_kexec_cpu_down(int crash_shutdo=
wn, int secondary)
 	hard_irq_disable();
 	mpic_teardown_this_cpu(secondary);
=20
+#ifdef CONFIG_CRASH_DUMP
 	if (cpu =3D=3D crashing_cpu && cpu_thread_in_core(cpu) !=3D 0) {
 		/*
 		 * We enter the crash kernel on whatever cpu crashed,
@@ -406,9 +407,11 @@ static void mpc85xx_smp_kexec_cpu_down(int crash_shutd=
own, int secondary)
 		 */
 		disable_threadbit =3D 1;
 		disable_cpu =3D cpu_first_thread_sibling(cpu);
-	} else if (sibling !=3D crashing_cpu &&
-		   cpu_thread_in_core(cpu) =3D=3D 0 &&
-		   cpu_thread_in_core(sibling) !=3D 0) {
+	} else if (sibling =3D=3D crashing_cpu)
+		return;
+#endif
+	if (cpu_thread_in_core(cpu) =3D=3D 0 &&
+	    cpu_thread_in_core(sibling) !=3D 0) {
 		disable_threadbit =3D 2;
 		disable_cpu =3D sibling;
 	}

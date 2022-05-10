Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3358521248
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 12:34:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyDtV4F7Bz3cBf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 20:34:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=kYFx1nfb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyDsv3DyBz3bmW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 20:33:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=kYFx1nfb; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KyDsq61dSz4ySZ;
 Tue, 10 May 2022 20:33:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1652178835;
 bh=LJAf2AB1VtWHbZhDAsR4IEpdZbINpfdn2dVKJ0sy5IQ=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=kYFx1nfb2EUvjtiID8tV81UOsPKrtZHfED1JwLdsbeC0LrMwPF0jz00ssWWVRghc8
 rZOyzs8BkiSlRrBS3hKSv4nKaG9ps855Ae1DHTjIIh2EQxOGw739UOuielkWR+3cAj
 tC5wyIDBVyxmX5s8kp06Im50OfWiHmnUn6MDWl0uWCBIwWdfjRY5L35FjDUpPRC6No
 PKzb58lnw2/YcpQXLnDMM0YRa68+J8WjbZNLgIVOxEDngu6V/4WpT29CLL5xMycxiu
 dayLr/eKoFsQHWFCa7+2iZLj2m4plAhGxtedmxGWY5RZLsMcA2b++H16vMXUWFYlpH
 xhrRv4Jog1kIA==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] KVM: PPC: Book3S PR: Enable MSR_DR for
 switch_mmu_context()
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <20220509202355.13985-1-graf@amazon.com>
Date: Tue, 10 May 2022 11:33:45 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <5CBF19EB-F2DA-4DBA-9BD0-D38E3A3F959A@ozlabs.org>
References: <20220509202355.13985-1-graf@amazon.com>
To: Alexander Graf <graf@amazon.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alex,

> On 9 May 2022, at 21:23, Alexander Graf <graf@amazon.com> wrote:
>=20
> Commit 863771a28e27 ("powerpc/32s: Convert switch_mmu_context() to C")
> moved the switch_mmu_context() to C. While in principle a good idea, =
it
> meant that the function now uses the stack. The stack is not =
accessible
> from real mode though.
>=20
> So to keep calling the function, let's turn on MSR_DR while we call =
it.
> That way, all pointer references to the stack are handled virtually.
>=20
> Reported-by: Matt Evans <matt@ozlabs.org>
> Fixes: 863771a28e27 ("powerpc/32s: Convert switch_mmu_context() to C")
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Cc: stable@vger.kernel.org

Many thanks - this addresses the issue I saw, and has been...

Tested-by: Matt Evans <matt@ozlabs.org>

...on a G4 host.  One comment though:

> =E2=80=94
> arch/powerpc/kvm/book3s_32_sr.S | 20 +++++++++++++++-----
> 1 file changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_32_sr.S =
b/arch/powerpc/kvm/book3s_32_sr.S
> index e3ab9df6cf19..bd4f798f7a46 100644
> --- a/arch/powerpc/kvm/book3s_32_sr.S
> +++ b/arch/powerpc/kvm/book3s_32_sr.S
> @@ -122,11 +122,21 @@
>=20
> 	/* 0x0 - 0xb */
>=20
> -	/* 'current->mm' needs to be in r4 */
> -	tophys(r4, r2)
> -	lwz	r4, MM(r4)
> -	tophys(r4, r4)
> -	/* This only clobbers r0, r3, r4 and r5 */
> +	/* switch_mmu_context() needs paging, let's enable it */
> +	mfmsr   r9
> +	ori     r11, r9, MSR_DR
> +	mtmsr   r11
> +	sync
> +
> +	/* Calling switch_mmu_context(<inv>, current->mm, <inv>); */
> +	lwz	r4, MM(r2)
> 	bl	switch_mmu_context

Of the volatile registers, I believe r12 is still valuable here and =
would need to be preserved.
(I can=E2=80=99t spot any others but would defer to your judgement =
here.)

For example:

diff --git a/arch/powerpc/kvm/book3s_32_sr.S =
b/arch/powerpc/kvm/book3s_32_sr.S
index e3ab9df6cf19..41fc9ca12d38 100644
--- a/arch/powerpc/kvm/book3s_32_sr.S
+++ b/arch/powerpc/kvm/book3s_32_sr.S
@@ -122,11 +122,23 @@
=20
 	/* 0x0 - 0xb */
=20
-	/* 'current->mm' needs to be in r4 */
-	tophys(r4, r2)
-	lwz	r4, MM(r4)
-	tophys(r4, r4)
-	/* This only clobbers r0, r3, r4 and r5 */
+	/* switch_mmu_context() needs paging, let's enable it */
+	mfmsr   r9
+	ori     r11, r9, MSR_DR
+	mtmsr   r11
+	sync
+
+	SAVE_GPR(12, r1)
+	/* Calling switch_mmu_context(<inv>, current->mm, <inv>); */
+	lwz	r4, MM(r2)
 	bl	switch_mmu_context
+	REST_GPR(12, r1)
+
+	/* Disable paging again */
+	mfmsr   r9
+	li      r6, MSR_DR
+	andc    r9, r9, r6
+	mtmsr	r9
+	sync
=20
 .endm


Matt

>=20
> +	/* Disable paging again */
> +	mfmsr   r9
> +	li      r6, MSR_DR
> +	andc    r9, r9, r6
> +	mtmsr	r9
> +	sync
> +
> .endm
> --=20
> 2.28.0.394.ge197136389
>=20
>=20
>=20
>=20
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
>=20
>=20
>=20


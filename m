Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C229B5619AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 13:56:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYcHV54qNz3cg2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 21:56:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eYTBD2zj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=bce9=xf=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eYTBD2zj;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYcGv1t35z3blK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 21:55:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6419A61880;
	Thu, 30 Jun 2022 11:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25C7C3411E;
	Thu, 30 Jun 2022 11:55:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eYTBD2zj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1656590147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zSJ31YasJkDqrlVi72J02pjb/teAFiek12PS2a8izQI=;
	b=eYTBD2zjqgPMBGZmvw6tl/NAnitp0ffi98PMkpBjEG6smqJULeiJPCsmlILNRoNJMKSUcQ
	eh2Bnt8lrqNzG/9j//THl81jUf40g3OhoD+bSwXOp64MlGnNlysCtaRlJiRW5shUUVZ8Pu
	6t/2F9O9+28e4IATZYezCAEEs2BtAFE=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d4913224 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Thu, 30 Jun 2022 11:55:47 +0000 (UTC)
Date: Thu, 30 Jun 2022 13:55:45 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [next-20220629] kobject warnings during boot
Message-ID: <Yr2PQSZWVtr+Y7a2@zx2c4.com>
References: <FCDBE9B3-FC5A-4CA3-9C0F-33A04460CA43@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <FCDBE9B3-FC5A-4CA3-9C0F-33A04460CA43@linux.ibm.com>
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sachin,

On Thu, Jun 30, 2022 at 05:01:57PM +0530, Sachin Sant wrote:
> [    0.000478] kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is being called.
> [    0.002925] [c000000002a0fb30] [c00000000073b0bc] kobject_get+0x8c/0x100 (unreliable)
> [    0.003071] [c000000002a0fba0] [c00000000087e464] device_add+0xf4/0xb00
> [    0.003194] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
> [    0.003321] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
> [    0.003476] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
> [    0.003623] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214

Huh, that's a surprise, because random_init() is being called long after
all of the arch-specific stuff is initialized. This might point to
something else fishy happening during ppc's init? Or maybe the of device
needs a parent that hasn't been initialized yet. Not sure... But see if
the below patch fixes the issue. I don't have a POWER8 machine to try
this on, but if it works for you, I'll build it into a real patch.

Jason

diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index 463c78c52cc5..bd5ad5f351c2 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -176,12 +176,8 @@ static int __init pnv_get_random_long_early(unsigned long *v)
 		    NULL) != pnv_get_random_long_early)
 		return 0;

-	for_each_compatible_node(dn, NULL, "ibm,power-rng") {
-		if (rng_create(dn))
-			continue;
-		/* Create devices for hwrng driver */
-		of_platform_device_create(dn, NULL, NULL);
-	}
+	for_each_compatible_node(dn, NULL, "ibm,power-rng")
+		rng_create(dn);

 	if (!ppc_md.get_random_seed)
 		return 0;
@@ -205,10 +201,16 @@ void __init pnv_rng_init(void)

 static int __init pnv_rng_late_init(void)
 {
+	struct device_node *dn;
 	unsigned long v;
+
 	/* In case it wasn't called during init for some other reason. */
 	if (ppc_md.get_random_seed == pnv_get_random_long_early)
 		pnv_get_random_long_early(&v);
+	if (ppc_md.get_random_seed == powernv_get_random_long) {
+		for_each_compatible_node(dn, NULL, "ibm,power-rng")
+			of_platform_device_create(dn, NULL, NULL);
+	}
 	return 0;
 }
 machine_subsys_initcall(powernv, pnv_rng_late_init);

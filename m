Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EAC927FB3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 03:20:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dScaGYx/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFbKx6gZDz3ccN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 11:20:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dScaGYx/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFbKD5VV8z3cP7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 11:19:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720142382;
	bh=UCMaIVTnGE08WOL8bGCywK+Z7TDVAMtL/zyKNBMfqBk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dScaGYx/VAT1PxfoDVsug+gCtBq4YJ4QfRBfg7DW04HpffBYfKmUJHAruupwwMsWr
	 GNYcEBSFfTl/llWg1f8VT1LwAU/H1dVxv6OcCPQLAkUwzCbA70fo+FcimqPKJ17YGV
	 wK2VO3TdDquqcngJsKeg4bCN1NWoT/sBJbKt9c9tVeNSVhDcWeZG9yicBKCFn9x8bm
	 /wxenOnMKvQEudhsKzijOqw5Rv0DGEPUhbWLrTAEbc3+7aGvg5qNzIfKs4VP8EkHFP
	 xTdd0jdhCobAWneOQdFmCEYpjGKyRusmZY8J/w8VJepbBHSU4V7Fh/6yLH2v2/rXHN
	 S8QgFt72S/IBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WFbK93fn5z4w2F;
	Fri,  5 Jul 2024 11:19:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
In-Reply-To: <dfc7ec00-5216-4590-9347-ee10cd1e8380@xenosoft.de>
References: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de>
 <86zfqzhgys.wl-maz@kernel.org>
 <ccf14173-9818-44ef-8610-db2900c67ae8@xenosoft.de>
 <874j95jrur.fsf@mail.lhotse>
 <3baff554-e8f6-42b0-b931-207175a4d8fd@xenosoft.de>
 <dfc7ec00-5216-4590-9347-ee10cd1e8380@xenosoft.de>
Date: Fri, 05 Jul 2024 11:19:39 +1000
Message-ID: <87o77ciqj8.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> On 04.07.24 20:27, Christian Zigotzky wrote:
>> On 04.07.24 13:53, Michael Ellerman wrote:
>>> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
...
>>>
>>> Instead of that patch, can you try the one below. AFAICS the device tree
>>> fixups done in early boot mean the interrupt-map is not needed, and also
>>> has the wrong content, so if we can remove it entirely that might avoid
>>> the problems in the parsing code.
>>>
>>> I don't know if your firmware actually implements those methods, I
>>> couldn't find anything online to confirm or deny it. Seems the only
>>> option is to test it.
...
>
> Unfortunately, the kernel 6.10-rc6 doesn't compile with your patch. "rc" 
> is undeclared.

Right, I had some debug code that I removed before posting.

This version should compile :}

cheers

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index fbb68fc28ed3..965d58c54fab 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -3123,6 +3123,7 @@ static void __init fixup_device_tree_pasemi(void)
 	u32 interrupts[2], parent, rval, val = 0;
 	char *name, *pci_name;
 	phandle iob, node;
+	int rc;
 
 	/* Find the root pci node */
 	name = "/pxp@0,e0000000";
@@ -3138,6 +3139,14 @@ static void __init fixup_device_tree_pasemi(void)
 
 	prom_setprop(iob, name, "interrupt-controller", &val, 0);
 
+	prom_printf("nemo: deleting interrupt-map properties\n");
+	rc = call_prom("interpret", 1, 1,
+		      " s\" /pxp@0,e0000000\" find-device"
+		      " s\" interrupt-map\" delete-property"
+		      " s\" interrupt-map-mask\" delete-property"
+		      " device-end");
+	prom_printf("nemo: interpret returned %d\n", rc);
+
 	pci_name = "/pxp@0,e0000000/pci@11";
 	node = call_prom("finddevice", 1, 1, ADDR(pci_name));
 	parent = ADDR(iob);

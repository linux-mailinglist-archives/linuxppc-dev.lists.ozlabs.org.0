Return-Path: <linuxppc-dev+bounces-4449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E2B9FAEA3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 13:58:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGykp1H4Fz300C;
	Mon, 23 Dec 2024 23:58:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734958722;
	cv=none; b=RWChRCs47E6imEEnhgYvSmTojOKlM9IAzgnRCC1GKzsTbxg1bleQmV1R28YtZJUfCr2hk/Ub1YHCIePgOIrcG7RykDFl3b5QKywiKKO4e7473yB1xLYUU+XLbS0hCjIgimcqwDvSfVh7pSBqCLGxymH6cJ2zH1pddqjsgtgJ2zfgrnOMXzVtkGqkMxiQ6EnbtT9wVMwsSzADC0KF13vD6ev4w22n/KCW0NbH9TPFze44MRz9fLsGPRb9qR6bvMbrWyYx/DBZrdJxztcLDkMt8eKPEtrHjeIKctCXA4FJtpgeoRCOiUO4iZAFFBYwnwYAxpPYzeANUiWM0EPxW7Y/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734958722; c=relaxed/relaxed;
	bh=NHgITMAdmUC8mMNPJKHZ8BPmPOuewFGww6HzwR6v3GE=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j+OUJAwbvd5chxjizy/0zCcmyn0hk9km0Q7cFC5hKIv8nH0Gnp84CcCOCCeU3t7XO3I5gSC7NF9+2ZlAy1L9oUcpVbtcpbCJdGWoWHiGVVZoLiRuK9G95RoBtONf2ASrerzpymn3Ke1XsIRgxduuvr1/vQ/vfLGeK5DACat4CoBe+SpZFEbI8xHF5iFgNb4H5RzXAT6JcvXC6GIgWrZ1ezEDjaqBl8FERtrTeuDNr2xwwXl7BaySMT3Kb8ZiG2WdnZ53lp53vTTw6V0FieP6gI3zcpxf6ZCdh80oPe86KUFqrnqU732oiNMHU+/NXJXFh1cFbZaBueNjHY2FrAG+GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CiAxMgdQ; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CiAxMgdQ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGykl4tVzz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 23:58:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734958707;
	bh=NHgITMAdmUC8mMNPJKHZ8BPmPOuewFGww6HzwR6v3GE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=CiAxMgdQ+FjO5Py95XgJ7qX2EcDrDqX5JUgN1GhnqvzeHAlpGop96hO5GtAs2DOx+
	 WOzkbcJqg5Db23NX4OsW45fLq/0IpX00Rd0F3Az6gj/oQiHRzXXjp3zyMn3Jr4ENCK
	 77eGoxq1ZoZb8fc/7XfX7eLxLpLxNvM+qtrTBGNezBgu6wfPuT/2u5eiTIRTXLBjsm
	 YXn4Pqj+QOQGXGv03PQIH2s+G76pKcxtOtfpOOKdva1s4V/0qllK3eEPuTXw9HxMGh
	 eW5pH5EoDkaMDj+9aBcpo8XPSCGIuoc8/9ENZC/M6PnuUNbvZCoU1eu2SUwKdsqHUz
	 T9nQcLXxDPaAQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YGykW43vSz4wvd;
	Mon, 23 Dec 2024 23:58:27 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: Missing '#size-cells' in /ht@0,f2000000/pci@8/mac-io@7/i2s@0 on
 G5/G4 (kernel 6.13-rc3)
In-Reply-To: <20241219000749.6836d610@yea>
References: <20241219000749.6836d610@yea>
Date: Mon, 23 Dec 2024 23:58:26 +1100
Message-ID: <87jzbqpnd9.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URI_HEX autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Erhard Furtner <erhard_f@mailbox.org> writes:
> Greetings!
>
> I am aware there is commit cf89c9434af122f28a3552e6f9cc5158c33ce50a
> (already merged in v6.13-rc3) which fixes some of the "Missing
> '#size-cells' errors" but there is more:
>
> ------------[ cut here ]------------
> hub 3-0:1.0: USB hub found
> Missing '#size-cells' in /ht@0,f2000000/pci@8/mac-io@7/i2s@0

Something like below might fix it.

cheers


diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 8e776ba39497..462ee36ef891 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2898,11 +2898,11 @@ static void __init fixup_device_tree_pmac(void)
 	char type[8];
 	phandle node;
 
-	// Some pmacs are missing #size-cells on escc nodes
+	// Some pmacs are missing #size-cells on escc & i2s nodes
 	for (node = 0; prom_next_node(&node); ) {
 		type[0] = '\0';
 		prom_getprop(node, "device_type", type, sizeof(type));
-		if (prom_strcmp(type, "escc"))
+		if (prom_strcmp(type, "escc") && prom_strcmp(type, "i2s"))
 			continue;
 
 		if (prom_getproplen(node, "#size-cells") != PROM_ERROR)



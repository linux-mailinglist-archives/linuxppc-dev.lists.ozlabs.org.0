Return-Path: <linuxppc-dev+bounces-12726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9340BC719E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 03:24:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chsbj1wp2z3cYG;
	Thu,  9 Oct 2025 12:24:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759973057;
	cv=none; b=maMkEJ89t6auW930j0udvucNHxotFeFmHxYkE5/WbXeKTMi91vX01/akA5zv2tQGgJx/FPrD+MBseKksnD58f7Foy6XbVpAxloMxAjP0IxCNB4TUcf99fzHOOjk/KUlFJcVMYB2YnEIXyO5+4mMMT942B56rwUtR+76pNbknkHZ8CsovYpDCF7uqalWhkADNWD9DkzpbJ9qJwUqQjO+wW1mocwLNBb/qYvAaxDJMkerTK0hZ04BTuQadcFxRYAlTgq/5k2wb0b/nS7py6CUZvpaLkijY+idpEHPrCZKPXRJ/dHBnz6cjORhdHcl+Ueo0K6g5i493hni+vokA1XVAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759973057; c=relaxed/relaxed;
	bh=wH76QaA6cQIIFmvkWPd3MSINH29g1dYAewLynal9CZ0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=oVkbbUKcE3IGZmN8A37mEsdBBmhKw0B2tDVupDTwog0y+BbUSIk7CRMp4/PVkok0HOP5rUvlG+astyVwoYug7pyclHpjMoOFzDmJNq0TNf9RGDMix+Kt6KUmRyMj5PUjLcsq+9SH2Elg8QtdmIcq2tm56cmdtWWwFtyJxlDMoD5OmGRWlL98c7246AAWF/Yq00JwfON+ffBdX0ytF5sRAGHqNje+3DYH6EKigEgwu3w2Y+yskisy93ZQsMHv5QBgAOMNUgKDEHj33CB8rO06OpUK15XsL9up79F4XtPJXssAmUtb8SRXAN4jpY7ZA/IlIVQUTTKFYHb7fCIMkwFrow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=j2BraAd6; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=j2BraAd6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chsbf4l5xz3cDN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 12:24:14 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0ACFF8285375;
	Wed,  8 Oct 2025 20:24:12 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ry9d_JeTyqY6; Wed,  8 Oct 2025 20:24:11 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id F01058285568;
	Wed,  8 Oct 2025 20:24:10 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F01058285568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1759973051; bh=wH76QaA6cQIIFmvkWPd3MSINH29g1dYAewLynal9CZ0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=j2BraAd69mxGNQJsEoom0NyNyG9ejKh734vs/s2BpNIRoNSbW3fI1tPNQy+XxhZCs
	 iBwvnIpgfcVeqTzgfw1wpMa0pcE4SvTFc8sZspS9xBW4u3/6r4Ahxz/rTW31bpieHj
	 Rm2AT1k041TXB5tuLhaG7HnVmFRZPEXJr9Q/q3Ps=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GmGs_Ytpky-r; Wed,  8 Oct 2025 20:24:10 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B455B8285375;
	Wed,  8 Oct 2025 20:24:10 -0500 (CDT)
Date: Wed, 8 Oct 2025 20:24:08 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <97746540.1782404.1759973048120.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <304758063.1694752.1757427687463.JavaMail.zimbra@raptorengineeringinc.com>
References: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com> <2013845045.1359852.1752615367790.JavaMail.zimbra@raptorengineeringinc.com> <bf390f9e-e06f-4743-a9dc-e0b995c2bab2@kernel.org> <304758063.1694752.1757427687463.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH] PCI: pnv_php: Fix potential NULL dereference in slot
  allocator
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: pnv_php: Fix potential NULL dereference in slot allocator
Thread-Index: zJ41UwgzYhwlCvtgYnXhkcd+rlAB7J0jwKRh
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A highly unlikely NULL dereference in the allocation error handling path was
introduced in 466861909255.  Avoid dereferencing php_slot->bus by using
dev_warn() instead of SLOT_WARN() in the error path.

Fixes: 466861909255 ("PCI: pnv_php: Clean up allocated IRQs on unplug")
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/pci/hotplug/pnv_php.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index c5345bff9a55..f735935d80e7 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -804,7 +804,7 @@ static struct pnv_php_slot *pnv_php_alloc_slot(struct device_node *dn)
 	/* Allocate workqueue for this slot's interrupt handling */
 	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
 	if (!php_slot->wq) {
-		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");
+		dev_warn(&bus->dev, "Cannot alloc workqueue\n");
 		kfree(php_slot->name);
 		kfree(php_slot);
 		return NULL;
-- 
2.39.5



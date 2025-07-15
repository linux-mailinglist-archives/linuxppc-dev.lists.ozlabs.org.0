Return-Path: <linuxppc-dev+bounces-10259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1068B068A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 23:37:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhXbP6KsYz2y8W;
	Wed, 16 Jul 2025 07:37:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752615457;
	cv=none; b=nIPyrx+25JdIdNHalJ6yMEKkJgP1a4AD872yv5lSPAFqc5RwfISSYvJB/RmyiSIg4oVQBDxTGEVCEgt2C8/Hp+85yq8gODRqR75M7Bt5UED0tZ7L++wH4nNeyEamt4JzkZ5cZEzsbu/fVGNhF1eXAyZXz9+bLpdCtGoRy/y4uOJSpaDu3C/blEPZcFLV3yts2jK3CgcfVLHjO4yAFXuJ2JAniM5qPTXmiLBGMF1EiJv6RpXTEq4TDVyV7eWNXW6+joQ+nTE0Ybe9agbg8aCuBEptoGV+FQdZps7nDQBL5IDGniTPbdLFlVJG0a3/WWsGRMJRYGNkfcNSA5jMfq7J6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752615457; c=relaxed/relaxed;
	bh=a/RHOZtuKI3IFnHAVZbUtLVWSIeWz5dK8J8PMYUdjSM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Qu8foS/hswhqqGAuQXmzWe/N++JkJdlbK+XPX05oo2fljm2T13zOEiUXdMa/fx/n+oo4GrGfg9/+1G5EeBr4QFh5jyuzZlx0UnCCo3mw1m7dKtCMuVg1KiUk76JwK1rcVfxU6rVVRjNgIx9laq1x3I75yBFMiPmvNpfjRngCgV3qlpBbd2gSf1mhTTXIP8JPddBmCF2YsP51okFAF8zzsr6Zpg0E6ApyxuGPEXdi5NhEOLIlG88ToQKq37r/DkSdFomx60CZu/jKafgQtV/8j13R9tVnxVC694WM/JlwO3HXiX0KPe12O9zWU/9WcsMnwtAQ/CiwXwEvPJ0QaSLcGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=BixKi5jV; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=BixKi5jV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhXbP2FWpz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jul 2025 07:37:37 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 8008B8287698;
	Tue, 15 Jul 2025 16:37:35 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id DXqvs6LDPYCI; Tue, 15 Jul 2025 16:37:35 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E43148288591;
	Tue, 15 Jul 2025 16:37:34 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E43148288591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1752615454; bh=a/RHOZtuKI3IFnHAVZbUtLVWSIeWz5dK8J8PMYUdjSM=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=BixKi5jVzM1CraSKJsc/j0p65Q52gyeo3hTO/e4RST7uJhulhOPSkAzgY8mRW6vA6
	 vrsf58GgVMF8udf1XFP+aOqazqL/HsM3bZiTasLSxvthaY/FcScEKMms6dhypiuSxs
	 e3AJxjNziEmTIAPWG13wC8PSWiCGbb6zd1YBUPSQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jUiqRAhxzMqk; Tue, 15 Jul 2025 16:37:34 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id AB7398287698;
	Tue, 15 Jul 2025 16:37:34 -0500 (CDT)
Date: Tue, 15 Jul 2025 16:37:34 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <1778535414.1359858.1752615454618.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com>
References: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v3 3/6] powerpc/eeh: Export eeh_unfreeze_pe()
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
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC138 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc/eeh: Export eeh_unfreeze_pe()
Thread-Index: XyF2OaMn/3q+H+nwsGaxXLVF4U4PF4wBZI2J
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The PowerNV hotplug driver needs to be able to clear any frozen PE(s)
on the PHB after suprise removal of a downstream device.

Export the eeh_unfreeze_pe() symbol to allow implementation of this
functionality in the php_nv module.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/eeh.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index ca7f7bb2b478..2b5f3323e107 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1139,6 +1139,7 @@ int eeh_unfreeze_pe(struct eeh_pe *pe)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(eeh_unfreeze_pe);
 
 
 static struct pci_device_id eeh_reset_ids[] = {
-- 
2.39.5



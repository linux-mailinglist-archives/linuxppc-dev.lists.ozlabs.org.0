Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06820722EF2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 20:49:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZjMZ5zCZz3f6B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 04:49:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=BMK9Wfwi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=BMK9Wfwi;
	dkim-atps=neutral
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZjLj71ZPz30Qq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 04:49:01 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0BA16828591B;
	Mon,  5 Jun 2023 13:48:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id mrk5dH3-I7E6; Mon,  5 Jun 2023 13:48:57 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 21C558285928;
	Mon,  5 Jun 2023 13:48:57 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 21C558285928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1685990937; bh=qjsvB92Mo1aEmN7VzZ1qG9m9TdU1JrkCpmI134+8JAU=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=BMK9WfwijsEtivDiFVUpin9H9pVTegEkVqFjD1taqXsMqav82XM5ytEDvxGRWcZCO
	 UGQxfGdYlwLAbdqmd3xS1UUmyGjdBTDQLwixMOV56XSqiQgEHSwP6HYIFPL/AOQ/Fp
	 fiC2SpSJ8C/RSs/fJDxi2BrpoYxNqeAFvpFTC0XQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xYHeHVE4pcSX; Mon,  5 Jun 2023 13:48:57 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 01490828591B;
	Mon,  5 Jun 2023 13:48:57 -0500 (CDT)
Date: Mon, 5 Jun 2023 13:48:56 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <2015925968.3546872.1685990936823.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH] powerpc/iommu: Only build sPAPR access functions on pSeries
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC114 (Linux)/8.5.0_GA_3042)
Thread-Index: K4xnSrLYG/rJ+Ig8XqK6lEDeYCTyDA==
Thread-Topic: powerpc/iommu: Only build sPAPR access functions on pSeries
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 and PowerNV

A build failure with CONFIG_HAVE_PCI=y set without PSERIES or POWERNV
set was caught by the random configuration checker.  Guard the sPAPR
specific IOMMU functions on CONFIG_PPC_PSERIES || CONFIG_PPC_POWERNV.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 67f0b01e6ff5..c52449ae6936 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1090,6 +1090,7 @@ void iommu_tce_kill(struct iommu_table *tbl,
 }
 EXPORT_SYMBOL_GPL(iommu_tce_kill);
 
+#if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_PPC_POWERNV)
 static int iommu_take_ownership(struct iommu_table *tbl)
 {
 	unsigned long flags, i, sz = (tbl->it_size + 7) >> 3;
@@ -1140,6 +1141,7 @@ static void iommu_release_ownership(struct iommu_table *tbl)
 		spin_unlock(&tbl->pools[i].lock);
 	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
 }
+#endif
 
 int iommu_add_device(struct iommu_table_group *table_group, struct device *dev)
 {
@@ -1171,6 +1173,7 @@ int iommu_add_device(struct iommu_table_group *table_group, struct device *dev)
 }
 EXPORT_SYMBOL_GPL(iommu_add_device);
 
+#if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_PPC_POWERNV)
 /*
  * A simple iommu_table_group_ops which only allows reusing the existing
  * iommu_table. This handles VFIO for POWER7 or the nested KVM.
@@ -1398,5 +1401,6 @@ static int __init spapr_tce_setup_phb_iommus_initcall(void)
 	return 0;
 }
 postcore_initcall_sync(spapr_tce_setup_phb_iommus_initcall);
+#endif
 
 #endif /* CONFIG_IOMMU_API */
-- 
2.30.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 292AB6DE1E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 06:26:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qdHY35CzzDqLT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 14:26:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="BFespdZf"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qcjT57kczDqfd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 14:00:29 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C5462189F;
 Fri, 19 Jul 2019 04:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563508827;
 bh=Bgd0Bw6dCsfqG18nCU1TXezh7rwvgVoQ1pq5kShUpig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BFespdZfk4ajjYEZG76H9K9t1aX/GiI+XInOIZUBWXmHRrWSHqbQOv4bnAJEfy4Gz
 OhwjtWXkLm7Xz3i9qV9xMXWTX8RysO8+Xh64IBjTLwWltFCbKeEhEVc4t0dhPs7HK9
 Gn94Ol6VglOkf2cDrCMyOVEefYx1GTw2/GSQhZ2U=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 112/171] powerpc/mm: Handle page table allocation
 failures
Date: Thu, 18 Jul 2019 23:55:43 -0400
Message-Id: <20190719035643.14300-112-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

[ Upstream commit 2230ebf6e6dd0b7751e2921b40f6cfe34f09bb16 ]

This fixes kernel crash that arises due to not handling page table allocation
failures while allocating hugetlb page table.

Fixes: e2b3d202d1db ("powerpc: Switch 16GB and 16MB explicit hugepages to a different page table format")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/hugetlbpage.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index b5d92dc32844..1de0f43a68e5 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -130,6 +130,8 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
 	} else {
 		pdshift = PUD_SHIFT;
 		pu = pud_alloc(mm, pg, addr);
+		if (!pu)
+			return NULL;
 		if (pshift == PUD_SHIFT)
 			return (pte_t *)pu;
 		else if (pshift > PMD_SHIFT) {
@@ -138,6 +140,8 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
 		} else {
 			pdshift = PMD_SHIFT;
 			pm = pmd_alloc(mm, pu, addr);
+			if (!pm)
+				return NULL;
 			if (pshift == PMD_SHIFT)
 				/* 16MB hugepage */
 				return (pte_t *)pm;
@@ -154,12 +158,16 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
 	} else {
 		pdshift = PUD_SHIFT;
 		pu = pud_alloc(mm, pg, addr);
+		if (!pu)
+			return NULL;
 		if (pshift >= PUD_SHIFT) {
 			ptl = pud_lockptr(mm, pu);
 			hpdp = (hugepd_t *)pu;
 		} else {
 			pdshift = PMD_SHIFT;
 			pm = pmd_alloc(mm, pu, addr);
+			if (!pm)
+				return NULL;
 			ptl = pmd_lockptr(mm, pm);
 			hpdp = (hugepd_t *)pm;
 		}
-- 
2.20.1


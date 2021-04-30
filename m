Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFD036F9D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 14:11:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWrnC49n7z3byW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 22:11:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CYVIxRPt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CYVIxRPt; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWrlP1bcKz2xMd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 22:09:36 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id j3so34207316qvs.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qWb3iMxKG0SSu3D8RWOJus3sgC3/X5T1NmRjRP8LfMk=;
 b=CYVIxRPtWrZ74CLfdDSgEbYnyZb5D1teR9WBUXmMS3cmILa3msCkDQq1PtmBMT87UO
 hXC6LMHw99Hg8jA8IzEq2aHQpWPgOntptY3fzOGMFUvST7P7QhHugRBOefqiGr9oGbOj
 9toWDHp16NXGwpCrQDJwO4xQSS7ghxekwfATUwMKCbH25tFIL2RSSyW47c9rG1vHtIeZ
 PbHOp4bwt0K6lYoyPF/+CXrjgSxhsohckGSP2ryqM5Jtpwi9Uq14ErmCUqhUM7Tze1xd
 +03kd9nZXHGpETch3JDxSylydb2lh/nKFl1hfoO9aj3Fy4YFHyIdmcqs2OoHXiA3FeTn
 o8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qWb3iMxKG0SSu3D8RWOJus3sgC3/X5T1NmRjRP8LfMk=;
 b=c/3sNunaa7Qs9zYTuPifGWp/Pk8Ucv5zigcLV1GxmhouyibxuaJdd+XT0xo2dX/NC9
 jAwoofuW6bu+jc0UV4DNEcj6xT23J4FRzFLRtxE9EfTGLwzi3kIwf4AGL+X2b02jitYQ
 gh8gNli7HOY/aTdaI26Nvc3N7QHX/ZMLJBb5GXfTtv2ORmT8Y/TAXyg9H56Slte3dCvv
 Qhe8KWvLUas969NSXjrO+R7TxJUbOBgDDusnTF9abwlEp0/c2z1yk4VakPLlf0Cj5Nwp
 /OGPpCAUW+vpfuwg9A1V7+FvBDzOY9oa9dq4rT3Lh0qZL2QjNiHDqDFJbxyC2yPWx1PS
 fCTg==
X-Gm-Message-State: AOAM531qPzOoLzRWSelQzkjq8IovwVm6RiPjmo5uNhrguQ3+f3XLixyG
 xEF8bkJceIFKEEWXHQCvI3vdAv4AJCnVtg==
X-Google-Smtp-Source: ABdhPJx/AjtwsICBZBrgmBue2+zMVHxk5egpzXiqWFDV0PJNoGdf409/DhkaSWU7Pr7ATpLl3SyodA==
X-Received: by 2002:ad4:5bef:: with SMTP id k15mr5161805qvc.16.1619784574162; 
 Fri, 30 Apr 2021 05:09:34 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:6de0:3db1:1b8e:b097:6036])
 by smtp.gmail.com with ESMTPSA id p190sm928951qke.13.2021.04.30.05.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 05:09:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] pseries/hotplug-memory.c: adding
 dlpar_memory_remove_lmbs_common()
Date: Fri, 30 Apr 2021 09:09:17 -0300
Message-Id: <20210430120917.217951-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430120917.217951-1-danielhb413@gmail.com>
References: <20210430120917.217951-1-danielhb413@gmail.com>
MIME-Version: 1.0
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

One difference between dlpar_memory_remove_by_count() and
dlpar_memory_remove_by_ic() is that the latter, added in commit
753843471cbb, removes the LMBs in a contiguous block. This was done
because QEMU works with DIMMs, which is nothing more than a set of LMBs,
that must be added or removed together. Failing to remove one LMB must
fail the removal of the entire set of LMBs. Another difference is that
dlpar_memory_remove_by_ic() is going to set the LMB DRC to unisolate in
case of a removal error, which is a no-op for the hypervisors that
doesn't care about this error handling knob, and could be called by
remove_by_count() without issues.

Aside from that, the logic is the same for both functions, and yet we
keep them separated and having to duplicate LMB removal logic in both.

This patch introduces a helper called dlpar_memory_remove_lmbs_common()
to be used by both functions. The helper handles the case of block
removal of remove_by_ic() by failing earlier in the validation and
removal steps if the helper was called by remove_by_ic() (i.e. it was
called with a drc_index) while preserving the more relaxed behavior of
remove_by_count() if drc_index is 0.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 .../platforms/pseries/hotplug-memory.c        | 163 +++++++-----------
 1 file changed, 67 insertions(+), 96 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 4e6d162c3f1a..a031993725ca 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -399,25 +399,43 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 	return 0;
 }
 
-static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
+static int dlpar_memory_remove_lmbs_common(u32 lmbs_to_remove, u32 drc_index)
 {
-	struct drmem_lmb *lmb;
-	int lmbs_removed = 0;
+	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
 	int lmbs_available = 0;
+	int lmbs_removed = 0;
 	int rc;
-
-	pr_info("Attempting to hot-remove %d LMB(s)\n", lmbs_to_remove);
+	/*
+	 * dlpar_memory_remove_by_ic() wants to remove all
+	 * 'lmbs_to_remove' LMBs, starting from drc_index, in a
+	 * contiguous block.
+	 */
+	bool block_removal;
 
 	if (lmbs_to_remove == 0)
 		return -EINVAL;
 
+	block_removal = drc_index != 0;
+
+	if (block_removal) {
+		rc = get_lmb_range(drc_index, lmbs_to_remove, &start_lmb, &end_lmb);
+		if (rc)
+			return -EINVAL;
+	} else {
+		start_lmb = &drmem_info->lmbs[0];
+		end_lmb = &drmem_info->lmbs[drmem_info->n_lmbs];
+	}
+
 	/* Validate that there are enough LMBs to satisfy the request */
-	for_each_drmem_lmb(lmb) {
-		if (lmb_is_removable(lmb))
+	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
+		if (lmb_is_removable(lmb)) {
 			lmbs_available++;
 
-		if (lmbs_available == lmbs_to_remove)
+			if (lmbs_available == lmbs_to_remove)
+				break;
+		} else if (block_removal) {
 			break;
+		}
 	}
 
 	if (lmbs_available < lmbs_to_remove) {
@@ -426,28 +444,40 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 		return -EINVAL;
 	}
 
-	for_each_drmem_lmb(lmb) {
+	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
 		rc = dlpar_remove_lmb(lmb);
-		if (rc)
-			continue;
 
-		/* Mark this lmb so we can add it later if all of the
-		 * requested LMBs cannot be removed.
-		 */
-		drmem_mark_lmb_reserved(lmb);
+		if (!rc) {
+			/* Mark this lmb so we can add it later if all of the
+			 * requested LMBs cannot be removed.
+			 */
+			drmem_mark_lmb_reserved(lmb);
 
-		lmbs_removed++;
-		if (lmbs_removed == lmbs_to_remove)
+			lmbs_removed++;
+			if (lmbs_removed == lmbs_to_remove)
+				break;
+		} else if (block_removal) {
 			break;
+		}
 	}
 
 	if (lmbs_removed != lmbs_to_remove) {
-		pr_err("Memory hot-remove failed, adding LMB's back\n");
+		if (block_removal)
+			pr_err("Memory indexed-count-remove failed, adding any removed LMBs\n");
+		else
+			pr_err("Memory hot-remove failed, adding LMB's back\n");
 
-		for_each_drmem_lmb(lmb) {
+		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
 			if (!drmem_lmb_reserved(lmb))
 				continue;
 
+			/*
+			 * Setting the isolation state of an UNISOLATED/CONFIGURED
+			 * device to UNISOLATE is a no-op, but the hypervisor can
+			 * use it as a hint that the LMB removal failed.
+			 */
+			dlpar_unisolate_drc(lmb->drc_index);
+
 			rc = dlpar_add_lmb(lmb);
 			if (rc)
 				pr_err("Failed to add LMB back, drc index %x\n",
@@ -458,13 +488,13 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 
 		rc = -EINVAL;
 	} else {
-		for_each_drmem_lmb(lmb) {
+		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
 			if (!drmem_lmb_reserved(lmb))
 				continue;
 
 			dlpar_release_drc(lmb->drc_index);
-			pr_info("Memory at %llx was hot-removed\n",
-				lmb->base_addr);
+			pr_info("Memory at %llx (drc index %x) was hot-removed\n",
+				lmb->base_addr, lmb->drc_index);
 
 			drmem_remove_lmb_reservation(lmb);
 		}
@@ -474,6 +504,21 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 	return rc;
 }
 
+static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
+{
+	pr_info("Attempting to hot-remove %d LMB(s)\n", lmbs_to_remove);
+
+	return dlpar_memory_remove_lmbs_common(lmbs_to_remove, 0);
+}
+
+static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
+{
+	pr_info("Attempting to hot-remove %u LMB(s) at %x\n",
+		lmbs_to_remove, drc_index);
+
+	return dlpar_memory_remove_lmbs_common(lmbs_to_remove, drc_index);
+}
+
 static int dlpar_memory_remove_by_index(u32 drc_index)
 {
 	struct drmem_lmb *lmb;
@@ -506,80 +551,6 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
 	return rc;
 }
 
-static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
-{
-	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
-	int lmbs_available = 0;
-	int rc;
-
-	pr_info("Attempting to hot-remove %u LMB(s) at %x\n",
-		lmbs_to_remove, drc_index);
-
-	if (lmbs_to_remove == 0)
-		return -EINVAL;
-
-	rc = get_lmb_range(drc_index, lmbs_to_remove, &start_lmb, &end_lmb);
-	if (rc)
-		return -EINVAL;
-
-	/* Validate that there are enough LMBs to satisfy the request */
-	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-		if (!lmb_is_removable(lmb))
-			break;
-
-		lmbs_available++;
-	}
-
-	if (lmbs_available < lmbs_to_remove)
-		return -EINVAL;
-
-	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-		rc = dlpar_remove_lmb(lmb);
-		if (rc)
-			break;
-
-		drmem_mark_lmb_reserved(lmb);
-	}
-
-	if (rc) {
-		pr_err("Memory indexed-count-remove failed, adding any removed LMBs\n");
-
-
-		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
-
-			/*
-			 * Setting the isolation state of an UNISOLATED/CONFIGURED
-			 * device to UNISOLATE is a no-op, but the hypervisor can
-			 * use it as a hint that the LMB removal failed.
-			 */
-			dlpar_unisolate_drc(lmb->drc_index);
-
-			rc = dlpar_add_lmb(lmb);
-			if (rc)
-				pr_err("Failed to add LMB, drc index %x\n",
-				       lmb->drc_index);
-
-			drmem_remove_lmb_reservation(lmb);
-		}
-		rc = -EINVAL;
-	} else {
-		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-			if (!drmem_lmb_reserved(lmb))
-				continue;
-
-			dlpar_release_drc(lmb->drc_index);
-			pr_info("Memory at %llx (drc index %x) was hot-removed\n",
-				lmb->base_addr, lmb->drc_index);
-
-			drmem_remove_lmb_reservation(lmb);
-		}
-	}
-
-	return rc;
-}
-
 #else
 static inline int pseries_remove_memblock(unsigned long base,
 					  unsigned long memblock_size)
-- 
2.30.2


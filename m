Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFE4228DCA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 03:54:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBJRM1VrlzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 11:54:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pYO6TpN3; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBJPZ1xtXzDqZ2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 11:52:29 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id 8so343566pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 18:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1flvzJIyMu46yQ0CPE4U+mwSVIT5iwrLmgpuQZeTscw=;
 b=pYO6TpN3qaCmJs3O0e+Qr2If9F2OYIsn2xb0Zk1F/M76FgXfFb2azjOAZw7PlqeC4M
 1NBH7tPl/qCDVsBTEA0wA40eH9l3yS0ZoPlNQd79o0t0m3X/npFn9zlApiPZ0s3+eNw9
 K+Oo8SKOHGbKOlO9SKbnWVzpzhLQkCWogCg/hRe1lKFeyJOULiY3S9GiTkYXN6aOhTIY
 pwBl/h7MHeId+SkTeucAaxoDI+m6KROpPG7AVu2mAOZk78Z3FnVaNW+Bjj/zG5Ml89EK
 cutVSsGdY2W4Mt16S7dZOY3AT3uP+bfmUQtKSAM0DzY3GfeovkloDF4ToFvnurB2uMab
 Z0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1flvzJIyMu46yQ0CPE4U+mwSVIT5iwrLmgpuQZeTscw=;
 b=XddOnWMtI2vwE38QPlis2gz5P06DIzB2tBcEd+BITm9wiyW7L9/Fc64Ny28D3e/qPs
 jjZ1RiJzKItYwCyRDAzL1VL/TRAv5SEGH8wZ3qEcKB5v6AXlAVfRBfaUJZlLH/lQkN0j
 E1jnKe2RaPG8dcPiP6rbe/O41q+k9ugVkJVcquQUxZ3j6VSEr9CkVm25LLRhNCdVLLR1
 SjaA/wvsHd08BBWrzk2uTvGH0wRZ0EtpU644VsTjRfQPBCNsT9z+myI4jQCjzXEP/LWr
 4lLC5D/5wjCekRlVeJgqpjs59HpdWlNL+AARV50rCO72wt5Ua/Mj6zfmPCLv/84BJOxA
 nfkg==
X-Gm-Message-State: AOAM532GIcPbW1YNBdTd+W0sWrmC8x8A+5LNvQWDSwkjUpIC/mOaLmNG
 Z5HdJAl/uqMbJ6N5z/J4VKQW0y4=
X-Google-Smtp-Source: ABdhPJwDE++NhhfIzoQDEhMJqUrq8ChRnsCb/eCUg/Dy9VW7yZFLzte3EAVVL8feEreXy258+Eqewg==
X-Received: by 2002:a17:90a:8082:: with SMTP id
 c2mr7414158pjn.204.1595382745972; 
 Tue, 21 Jul 2020 18:52:25 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v22sm21533746pfe.48.2020.07.21.18.52.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 18:52:25 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv3 1/2] powerpc/pseries: group lmb operation and memblock's
Date: Wed, 22 Jul 2020 09:52:09 +0800
Message-Id: <1595382730-10565-1-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, kexec@lists.infradead.org,
 Hari Bathini <hbathini@linux.ibm.com>, Pingfan Liu <kernelfans@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch prepares for the incoming patch which swaps the order of KOBJ_
uevent and dt's updating.

It has no functional effect, just groups lmb operation and memblock's in
order to insert dt updating operation easily, and makes it easier to
review.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org
---
v2 -> v3: rebase onto ppc next-test branch
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 26 ++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 5d545b7..1a3ac3b 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -355,7 +355,8 @@ static int dlpar_add_lmb(struct drmem_lmb *);
 static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 {
 	unsigned long block_sz;
-	int rc;
+	phys_addr_t base_addr;
+	int rc, nid;
 
 	if (!lmb_is_removable(lmb))
 		return -EINVAL;
@@ -364,17 +365,19 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 	if (rc)
 		return rc;
 
+	base_addr = lmb->base_addr;
+	nid = lmb->nid;
 	block_sz = pseries_memory_block_size();
 
-	__remove_memory(lmb->nid, lmb->base_addr, block_sz);
-
-	/* Update memory regions for memory remove */
-	memblock_remove(lmb->base_addr, block_sz);
-
 	invalidate_lmb_associativity_index(lmb);
 	lmb_clear_nid(lmb);
 	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
 
+	__remove_memory(nid, base_addr, block_sz);
+
+	/* Update memory regions for memory remove */
+	memblock_remove(base_addr, block_sz);
+
 	return 0;
 }
 
@@ -603,6 +606,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 	}
 
 	lmb_set_nid(lmb);
+	lmb->flags |= DRCONF_MEM_ASSIGNED;
+
 	block_sz = memory_block_size_bytes();
 
 	/* Add the memory */
@@ -614,11 +619,14 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
 	rc = dlpar_online_lmb(lmb);
 	if (rc) {
-		__remove_memory(lmb->nid, lmb->base_addr, block_sz);
+		int nid = lmb->nid;
+		phys_addr_t base_addr = lmb->base_addr;
+
 		invalidate_lmb_associativity_index(lmb);
 		lmb_clear_nid(lmb);
-	} else {
-		lmb->flags |= DRCONF_MEM_ASSIGNED;
+		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
+
+		__remove_memory(nid, base_addr, block_sz);
 	}
 
 	return rc;
-- 
2.7.5


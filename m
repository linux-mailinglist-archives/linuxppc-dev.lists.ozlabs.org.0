Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB952403A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 10:55:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ8tF3PQlzDqSx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 18:55:01 +1000 (AEST)
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
 header.s=20161025 header.b=UZlPqlNj; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ8rP6VjPzDqFG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 18:53:25 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id i92so8614355pje.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=syfV4Bk5Z9GSYjF9LXZkXeQGUUhDfc2cPnA/cJTbdak=;
 b=UZlPqlNj39K0S7+ExBLC0QU6DEuIx8V/R3LTsTvDrR7eL9iURW08IDUhI3KfzDLWDm
 B84RewUvpkND9U5hdnFWZdlyPfK34ily1eBINFG3vNyToNE5hMRc4+K7co0pnRhWb3xG
 PtfigLfDW2hn2xcboXQ76JblOZVNGoZpNQ6+g/08T8VGmR6f7l9SvF+/ZyYgIz50a+Ws
 Pa5SOyEfjLum6e0cr9fEMaiGuQPI7Yj6ZUzilv8JiY1Q2PvuGTLJxCnEkad4oHm/xXbZ
 zSzslN8BS0AjP0lWDCK8CluxnHwY04Uq1v2fy7KJXrBLT75q4GqCb8e2OWzGOzukctG8
 H3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=syfV4Bk5Z9GSYjF9LXZkXeQGUUhDfc2cPnA/cJTbdak=;
 b=i/eKnzD7DEyL+jSti6TJJsopODodkEkLEeLEAnLJ6FCXJPNK/Aw20IJuQ42uKI0Vbl
 sInWJdaWSaYXOgrIPuA9s/8Mm42w/ZsZ5AnGuAZfQ0YbFa1XHnZkZNCSkFJ0H7nogxZ/
 NnSthhz4YdftAi3qlbxtEipGdFLu6JMH0tBwObr68Rw+AjD8vtOWfqki3S0bz2dzoCrM
 tyV0bHPnxq+Vw8REWTyaSjHqqLYeOYRlkNKYpTRLWGeqEzGnPAH92ltPl70zy4rMRGcB
 Obt9uyEawsXau6/nZgM8V9CgByaDtPjDdk5pWPbpyAA9flgbbvbUi7A1hB8H3rtpPjmC
 jAeg==
X-Gm-Message-State: AOAM531FiEk3GA1T8/ecCGARkqbyJUkMQZtOjBVgXcNtFGcFKJJOK3Lf
 B15YKWcE30XQVqpztmuiZvr+Xiw=
X-Google-Smtp-Source: ABdhPJwBTsFfLqP2AoUGV8HqMFOmCPjiOeK30bCwn9zO8ngl/vriLzcJkCIGQSh1iLUQj7mjWmJUdA==
X-Received: by 2002:a17:90a:4709:: with SMTP id
 h9mr11379050pjg.235.1597049603206; 
 Mon, 10 Aug 2020 01:53:23 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f3sm22754783pfj.206.2020.08.10.01.53.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Aug 2020 01:53:22 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv5 1/2] powerpc/pseries: group lmb operation and memblock's
Date: Mon, 10 Aug 2020 16:52:49 +0800
Message-Id: <1597049570-19536-1-git-send-email-kernelfans@gmail.com>
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
 Pingfan Liu <kernelfans@gmail.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch prepares for the incoming patch which swaps the order of
KOBJ_ADD/REMOVE uevent and dt's updating.

The dt updating should come after lmb operations, and before
__remove_memory()/__add_memory().  Accordingly, grouping all lmb operations
before the memblock's.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org
---
v4 -> v5: fix the miss of clearing DRCONF_MEM_ASSIGNED in a failure path
 arch/powerpc/platforms/pseries/hotplug-memory.c | 28 +++++++++++++++++--------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 5d545b7..46cbcd1 100644
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
 
@@ -603,22 +606,29 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 	}
 
 	lmb_set_nid(lmb);
+	lmb->flags |= DRCONF_MEM_ASSIGNED;
+
 	block_sz = memory_block_size_bytes();
 
 	/* Add the memory */
 	rc = __add_memory(lmb->nid, lmb->base_addr, block_sz);
 	if (rc) {
 		invalidate_lmb_associativity_index(lmb);
+		lmb_clear_nid(lmb);
+		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
 		return rc;
 	}
 
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF8233347
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:44:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHWq93ydnzDqdP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AsKazd2i; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHWb33kJtzDr7g
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 23:33:50 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id g19so1560830plq.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8oppU/bcgKSzNokcs/2JASOd9ZMzMREFaO3W+avaPsE=;
 b=AsKazd2iY/WrWAw6zfzJKcXV1+73/WRol8adO5cGz7WsOQq7y9XQJtyAyNofJ4Mvoy
 a/wOCF6WkGJaoUi/VokrlXE9WqprXQE+Tiv70RNh5mHokEVD2fjmishIjanI4OCN7hMr
 K/7gnO3dh+/FBTXupVuv471bYtuf8MsLa4+c8s5arcSzq/pVO6QCFVDGxIxW1kFMvSnt
 IjcCKAbk8eQInQeOOOXG55a+RwW8aBhISM72RnhWZGLnlWYsNfsIMTBQU0BBvX6xYj5O
 7h6KouHAgGz3Z4KjEg7ZhIbFmt2QYW3SECwJoy2k7qEaSVBfu9r9bjGLilqxAjn6fVnD
 nlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8oppU/bcgKSzNokcs/2JASOd9ZMzMREFaO3W+avaPsE=;
 b=PIxGFxpwfZEylHvS5tWFgHvIo9DnltIt7JPRBXQZ8lnq/0xfoMn6lzo+7HbkTANB5V
 hRmo0pe2xLOAkQWDbx+PaE/7HzbK/FJBMbQZsfOXJXTzmi4IftqRRwmfNUz3vnJ5J9Fq
 Edc4yntPxLebDGrhZFosgizypBct+gi5OstRgJpo/7LJrf4PegaMH3qEkIQjOPZDsOIF
 TQ+Bly5sLELkP+ykaQRk80jEWEaZ+3fYe3Jdm8opj47w+JMNfFKMN1juNLrhT4ie4jJR
 c1GIJii0nkm/w7XsMFehKzegTCIPDZlRITcyIeqZvKjwSCos7pl+tpYZ8FO04PXbqI00
 3DRw==
X-Gm-Message-State: AOAM532/ewT7JaMbaR37a6sBqt2PleaMubC8KBLO3xRQ3dNT+f/csHsq
 u++KcVzTTQ1+5ZYJIWlbFFUkrGM=
X-Google-Smtp-Source: ABdhPJzXeoWmA8FqYnUyDHt1H+1i1lT4NG5VEGYB3aayjeqQWbIR2j1I9eog3zPHNJleVGEQz0K1xw==
X-Received: by 2002:a63:ab4f:: with SMTP id k15mr35374114pgp.247.1596116026949; 
 Thu, 30 Jul 2020 06:33:46 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f89sm5981313pjg.5.2020.07.30.06.33.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:33:45 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv4 1/2] powerpc/pseries: group lmb operation and memblock's
Date: Thu, 30 Jul 2020 21:33:24 +0800
Message-Id: <1596116005-27511-1-git-send-email-kernelfans@gmail.com>
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
 Hari Bathini <hbathini@linux.ibm.com>
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
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org
---
v3 -> v4: improve commit log
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


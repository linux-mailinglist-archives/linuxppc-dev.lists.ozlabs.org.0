Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77525158882
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 04:04:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Gng70FnhzDqMC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 14:04:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=InBKraSF; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gnd64TwNzDqFm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 14:02:31 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id f2so439792pjq.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 19:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6B8koftBLrJDRWsxr6z2TFPm4iMsY2o3qs+tDinMff0=;
 b=InBKraSFiqSGyDmus3TCOMGIumhYKcRYHegPQdIcmR2sZKnIVOZezmDgNJes2S+78B
 6XetujltT/fMKLymnlUbwgOhGVz/gQZbTX6yXfwf5zaKcgOYO6Otr+G1PPNTcELsjZWY
 wD8la3Je3I8ej13kvJlodqETmdb3e6L4b6/Aln7c61IHnA8N6b7q77h/78MSypIk+DwM
 bK9RxTd+S9KOwljXwhwEErrWjiHBefR2kw2ahjNMVvRR1VSuWEijRigDAShY2jefHIHo
 TV++8c6XRKiHSv9uxBnUbun1FgEBUq8qVLZx9I4xHTN48Ge88ZoMkcDUwaUR+UZyxiLl
 7KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6B8koftBLrJDRWsxr6z2TFPm4iMsY2o3qs+tDinMff0=;
 b=MDIvV/3JPx+Y2weScw03OBNzk/TIhof0B4aMfTIvmHhmELQdfoJTbGYT1c210cFfbG
 yyfT21FlDB9UCiRyE1WvFD2Cl7I6tyb65a6eDN4V9lMdQ//s3/Gj6TuAKDYTLoXJMdjW
 33pZ7cO9peLBFRLG195SEMZnzXyAGs7MntqQBdXKH2LJAnYcekmdjcbq0cAtefGsH6JS
 AkNZCdsw+R1FGlSuAey7IZRDE6Ib8fE1H0W3Thbqq2fRCONPVx/9m+WzeiwYaDRsnPuw
 rb7+Mekli7xC8OTwJs+t+I6p74SKVgebuD05pTRbDqDk9qH6L+POeF4cGyijHap4BlJX
 38ZQ==
X-Gm-Message-State: APjAAAUSXD/EfN9Mamdol1AwxD7rccRljEYJSTbFmL8S7BOkGV+6Qrik
 SyE9CZss5MS4l9YiRZyZ/fN8oBM=
X-Google-Smtp-Source: APXvYqxk/wxKJbVrY6xNhPK0ZmuQcxunZ4TKmL5ApijvUqtr0xxEO8C1JUMioQRBYQEik2hJOYh7Jw==
X-Received: by 2002:a17:902:74c3:: with SMTP id
 f3mr16432519plt.0.1581390147995; 
 Mon, 10 Feb 2020 19:02:27 -0800 (PST)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id m71sm1290633pje.0.2020.02.10.19.02.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Feb 2020 19:02:27 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/pseries: group lmb operation and memblock's
Date: Tue, 11 Feb 2020 10:59:41 +0800
Message-Id: <1581389982-5701-1-git-send-email-kernelfans@gmail.com>
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
Cc: kexec@lists.infradead.org, Pingfan Liu <kernelfans@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Hari Bathini <hbathini@linux.ibm.com>
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 26 ++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index c126b94..a3a9353 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -375,7 +375,8 @@ static int dlpar_add_lmb(struct drmem_lmb *);
 static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 {
 	unsigned long block_sz;
-	int rc;
+	phys_addr_t base_addr;
+	int rc, nid;
 
 	if (!lmb_is_removable(lmb))
 		return -EINVAL;
@@ -384,17 +385,19 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
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
 
@@ -661,6 +664,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 	}
 
 	lmb_set_nid(lmb);
+	lmb->flags |= DRCONF_MEM_ASSIGNED;
+
 	block_sz = memory_block_size_bytes();
 
 	/* Add the memory */
@@ -672,11 +677,14 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
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


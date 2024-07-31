Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 373BF942882
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 09:59:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jjps5A7Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYkyJ10s8z3dD2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 17:59:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jjps5A7Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYkvm2ByDz3d87
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 17:57:08 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7a23fbb372dso3530416a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 00:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722412624; x=1723017424; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcPszrP5nDAVyyhdxZhwDa2dtlM+ONcznOdsoeX7+5Q=;
        b=Jjps5A7QftC73zMQvLmQCcRUhA/xGoDrRxH8aOUuxQJFDZw3WbN4QjXFhveFHoyvTg
         O+sVbmybsemMCtrXmjJdMkwQYNSiB+kNuj2Bh+wj0gRhXOUh0p9J8dfQZurnPaaykhhF
         yaJapEmzCwaR/aaeLmQVjRQHslPNcuyyrjIgRMe7XrfZhSBa5VuA5NmOL2fJ78BshcWA
         irpuU4PUKFzr00OWhi0yVvoKTIXYDHm4z1gMfPlE+5UFo0IhP4iVITqYw3TgJauhWX5L
         KO5eOUTeU23lA3KLjhUprjs4k3JDe6izzLvEpXfQc6KUz/p7oq5dDsUbj2QYSgkY/qAR
         Re4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412624; x=1723017424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcPszrP5nDAVyyhdxZhwDa2dtlM+ONcznOdsoeX7+5Q=;
        b=TOggjPtWNXGJ3mgyh3G+dFVIEW+fvZ3qPc2qD6YUo16Ybz6UAnhOMwUeQPv7YhwHKt
         5Eyk1xHj1tUEEbROmGpb/EKb08zCseDu1pQZju+2lVOBvTsTQfk0RjhIFNfH35eXSnwx
         6hfWFB8xpCRJA07ie7qm6vdfa+1FNezsGni8KqzeaAHRRDMSc0omd6RvxmbCalQK0Uq0
         XFWNm9X6gETXcJOF1jU2ifSDe8ASA8DfvfFLjPgEWk0BEFbvRCwkqMoHBKY6Qo+RBQl0
         Zh1hTnLysoVZeMLGf30/K2W3oO6m0opXTrpYNXDHu4/cjuF5+suFR9C5xeyIjuPs4BJ6
         P9AA==
X-Gm-Message-State: AOJu0YwOjxxdsZNfIghlw7Z+/vmSwloXZsuNzspdCROlj4vrRnlmMWZI
	jP6W/vdwaI2t5btl4ywXvitySrFPqtTVDArjuK4oOL2cn9SOjJQQm8jZLQ==
X-Google-Smtp-Source: AGHT+IHXQVX/nkFW9qGUznlg3Vm08dkDE6A6Sz1MOQ6mxgY8IoDHpkrOVkSdXVk9SkR3accdWASViw==
X-Received: by 2002:a05:6a20:9c88:b0:1c4:dae8:c72f with SMTP id adf61e73a8af0-1c4dae8c982mr6926811637.19.1722412624282;
        Wed, 31 Jul 2024 00:57:04 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.83.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e16fbsm9788372b3a.19.2024.07.31.00.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:57:03 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC v1 03/10] book3s64/hash: Add hash_debug_pagealloc_add_slot() function
Date: Wed, 31 Jul 2024 13:26:07 +0530
Message-ID: <09f67a7d467ebb1e90fa48a3c6944c1ab5f89f64.1722408881.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722408881.git.ritesh.list@gmail.com>
References: <cover.1722408881.git.ritesh.list@gmail.com>
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
Cc: Donet Tom <donettom@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds hash_debug_pagealloc_add_slot() function instead of open
coding that in htab_bolt_mapping(). This is required since we will be
separating kfence functionality to not depend upon debug_pagealloc.

No functionality change in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index b6ae955971bf..47b40b9b49d6 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -328,6 +328,14 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
 				     mmu_kernel_ssize, 0);
 }
 
+static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot)
+{
+	if (!debug_pagealloc_enabled())
+		return;
+	if ((paddr >> PAGE_SHIFT) < linear_map_hash_count)
+		linear_map_hash_slots[paddr >> PAGE_SHIFT] = slot | 0x80;
+}
+
 int hash__kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long flags, vaddr, lmi;
@@ -353,6 +361,7 @@ int hash__kernel_map_pages(struct page *page, int numpages,
 {
 	return 0;
 }
+static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot) {}
 #endif /* CONFIG_DEBUG_PAGEALLOC */
 
 /*
@@ -513,9 +522,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 			break;
 
 		cond_resched();
-		if (debug_pagealloc_enabled() &&
-			(paddr >> PAGE_SHIFT) < linear_map_hash_count)
-			linear_map_hash_slots[paddr >> PAGE_SHIFT] = ret | 0x80;
+		hash_debug_pagealloc_add_slot(paddr, ret);
 	}
 	return ret < 0 ? ret : 0;
 }
-- 
2.45.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA531942887
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 10:00:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N+IhfqaU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYkzs5lvpz3dDM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 18:00:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N+IhfqaU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYkw73jNhz3d87
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 17:57:27 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-70d25b5b6b0so3967262b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722412644; x=1723017444; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCk5qyX5EiGs1jnjvmC4tFgRzaEbSCoUcjAyI+/hRpE=;
        b=N+IhfqaUBObbqZXnERxcE0v2EUcj5ozaFT4e7LR44NvyIEZdjZIC8nwHs6R/fsY8Ks
         cQjq9bqcgMj6QCswPxUrnIujcA5ZT3X2uKmW5++9qEGLcEs5sOoJyGYRlKP7WIUh6KF2
         1DH9sbxt2rbw+rZZ6/BPeUEwTGOf+5jFcBWU4IYsXFwUb5kNr/Fa5niddRjPoXrfQ8Vj
         hEimTo7+ezx2/0h2VCz/WJfrY4cmq232Us/EMcyRogjgdH7zCuOjNTbqKNF7Wo5kb40b
         L0s8zOhyBvLmbK/iEvIy01lDurgCDlN6dd+g6thXYufH69V3VUwwdHZoVYHd4KKwHolU
         DRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412644; x=1723017444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCk5qyX5EiGs1jnjvmC4tFgRzaEbSCoUcjAyI+/hRpE=;
        b=kFP0/i9eaUkSqPulz4qnHhA0116X4d7jM1Bx7nbH1UATh+iQYSqN3U7MKF2M+RKxZ4
         SXMynXPx7Ai1/4pxDWCmbUQBLyxH01dxUgTemSnrIkKBaYhhBQeEWiQQhZ7kKlJZLl/e
         QOs9ICu5mPeOsa4vaWg3/2tjyXe6mUJkTRHgY/VHiGo7bVQW+4QjwlpW7lb5F09vk8tf
         3dnKEf33zR3ZoYodsI8THHH9RhUAG7Mq1Y4l5sB8yZX50kRPyt4pq4mkAdC3AKXEz4av
         RYe6W4iwvKYKuf1USfAwmLEp3SCz0U2iEQUVV8l+UM08nVWYC/K3UQTH6amRqyJ2kcLE
         NJAw==
X-Gm-Message-State: AOJu0Yy/mLHae6TdOWFeqL3XJvYR+GVorSWg4yFITxghOdTS+QCdIX7g
	p/vGS/KUEaktrn7zMZi3SL8l9mry7DmEYlDBz2ae5wVi1Vb7S1PaDyCSiQ==
X-Google-Smtp-Source: AGHT+IG8QLOsWSlBzAJF3KQen4GILrtrhJ4wWDH2SHSC9DjRMhP8zoXIX7GlbIOjsEMOoX44iOr7Ng==
X-Received: by 2002:a05:6a00:4f94:b0:70a:f65e:b13d with SMTP id d2e1a72fcca58-70ecedbc284mr12237333b3a.27.1722412643644;
        Wed, 31 Jul 2024 00:57:23 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.83.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e16fbsm9788372b3a.19.2024.07.31.00.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:57:23 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC v1 05/10] book3s64/hash: Refactor hash__kernel_map_pages() function
Date: Wed, 31 Jul 2024 13:26:09 +0530
Message-ID: <2ef6b884c2ec5ce974c09e5290a66d3ae00c6be4.1722408881.git.ritesh.list@gmail.com>
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

This refactors hash__kernel_map_pages() function to call
hash_debug_pagealloc_map_pages(). This will come useful when we will add
kfence support.

No functionality changes in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 6af47b996e79..b96bbb0025fb 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -349,7 +349,8 @@ static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot)
 		linear_map_hash_slots[paddr >> PAGE_SHIFT] = slot | 0x80;
 }
 
-int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+static int hash_debug_pagealloc_map_pages(struct page *page, int numpages,
+					  int enable)
 {
 	unsigned long flags, vaddr, lmi;
 	int i;
@@ -368,6 +369,12 @@ int hash__kernel_map_pages(struct page *page, int numpages, int enable)
 	local_irq_restore(flags);
 	return 0;
 }
+
+int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	return hash_debug_pagealloc_map_pages(page, numpages, enable);
+}
+
 #else /* CONFIG_DEBUG_PAGEALLOC */
 int hash__kernel_map_pages(struct page *page, int numpages,
 					 int enable)
-- 
2.45.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF161910FB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 19:58:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kYXp291T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4pBq4Sh5z3clw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 03:58:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kYXp291T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4pB209kcz3cSd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 03:58:02 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1f6da06ba24so8863065ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 10:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906280; x=1719511080; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJqqXRh/eOzPQsK99Bb/yzPgqho23i5/Ws9ra3QtPAE=;
        b=kYXp291Twihmv4GfnovuhRqc0EJwR8P9rX66NMEv1fQnw1jSE5nWmny6yKk43NDWka
         +whWiTESVXZMzE2297eyaMm37+dVQQStmmbzs7sTLdkVJLU6luXF2EeEE2oyMCQLrmYV
         A38KW63MNgLnty2qxA2ZkIX9++t0ahSYvSmE4FAOr3SPqaiyXGcMdTTx+S7KJLo1sZY0
         S4Dn8MfU6zrKsCv0MlqS3frAGnDuEDtiQPwkcnkUe2VwAsKN75acSibICGXtMI41uuOl
         GYXu5i/2s4Dgk211OJy9/jz2cv4rtuqA+CvQaK4TDvFVo89B0/nFcph/tOn7it/8k7r4
         73Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906280; x=1719511080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJqqXRh/eOzPQsK99Bb/yzPgqho23i5/Ws9ra3QtPAE=;
        b=InBUXmZfkGzcqXAuBtb/XWEmKAqvSl48SZSrWoI+Uq1jrXRxp//RVPOeySntondAAH
         D80wUIiXznqcpNkNCit7zfqQ0/Ebghyw1AL0aV4vZb2LxxQ/cE25b6ZolCwR1GQicP8Z
         R9RRKYIusY30XRr+viYSJmD+taVa8YoaakgisgrJacJcIgSjMvD2nTE7qxXsQO0kUB1n
         2JQ9YibdXhYBRaiXzZD5jjjr6EES1oHffJ+a9xi8uKaaE95M0REpvWBbatCF3xfGWmPL
         WTOSPODr7t3T6gd0rIAhdWAbk7y8/Np0zMbVakN9vQYZtvfcQGO0Fy24BHO2YLcsnZRP
         exAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdsWUoDWgJaHfaQYctKxlqmoeUfICpc/Ku7UWQ/dMDYxXukbkRtoMxNbLHKzA3OIKAiSxeuahn5np/gj3bR4RxbguDdkA2MYlyXjVUFg==
X-Gm-Message-State: AOJu0YwAIW3NdvuGr2NDzr1dgy/n7u5P+LnjTFevS8eaeLNV6hSDP+at
	BI5TuiwGr3X7JL9cSbkUvQ8HcGZgUG9TW+ZALVs3mg7iD/W1sR+q
X-Google-Smtp-Source: AGHT+IF4qTXDJh2dmu7C8j7KbrNKpNe1traR1hBaJSEqONmhCH9MELk4yXOVD6L7Rof1XKmaGu/wKA==
X-Received: by 2002:a17:903:1211:b0:1f8:3c9e:3ba8 with SMTP id d9443c01a7336-1f9aa3b50b0mr70367035ad.10.1718906280486;
        Thu, 20 Jun 2024 10:58:00 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f339fbsm139710805ad.262.2024.06.20.10.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:00 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Colin Ian King <colin.i.king@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 18/40] powerpc: optimize arch code by using atomic find_bit() API
Date: Thu, 20 Jun 2024 10:56:41 -0700
Message-ID: <20240620175703.605111-19-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620175703.605111-1-yury.norov@gmail.com>
References: <20240620175703.605111-1-yury.norov@gmail.com>
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
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Jan Kara <jack@suse.cz>, Bart Van Assche <bvanassche@acm.org>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matthew Wilcox <willy@infradead.org>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, Linus Torvalds <torvalds@linux-foundation.org>, Alexey Klimov <alexey.klimov@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use find_and_{set,clear}_bit() where appropriate and simplify the logic.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/mm/book3s32/mmu_context.c     | 11 +++---
 arch/powerpc/platforms/pasemi/dma_lib.c    | 46 ++++++----------------
 arch/powerpc/platforms/powernv/pci-sriov.c | 13 ++----
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/mmu_context.c b/arch/powerpc/mm/book3s32/mmu_context.c
index 1922f9a6b058..ece7b55b6cdb 100644
--- a/arch/powerpc/mm/book3s32/mmu_context.c
+++ b/arch/powerpc/mm/book3s32/mmu_context.c
@@ -17,6 +17,7 @@
  *    Copyright (C) 1991, 1992, 1993, 1994  Linus Torvalds
  */
 
+#include <linux/find_atomic.h>
 #include <linux/mm.h>
 #include <linux/init.h>
 #include <linux/export.h>
@@ -50,13 +51,11 @@ static unsigned long context_map[LAST_CONTEXT / BITS_PER_LONG + 1];
 
 unsigned long __init_new_context(void)
 {
-	unsigned long ctx = next_mmu_context;
+	unsigned long ctx;
 
-	while (test_and_set_bit(ctx, context_map)) {
-		ctx = find_next_zero_bit(context_map, LAST_CONTEXT+1, ctx);
-		if (ctx > LAST_CONTEXT)
-			ctx = 0;
-	}
+	ctx = find_and_set_next_bit(context_map, LAST_CONTEXT + 1, next_mmu_context);
+	if (ctx > LAST_CONTEXT)
+		ctx = 0;
 	next_mmu_context = (ctx + 1) & LAST_CONTEXT;
 
 	return ctx;
diff --git a/arch/powerpc/platforms/pasemi/dma_lib.c b/arch/powerpc/platforms/pasemi/dma_lib.c
index 1be1f18f6f09..db008902e5f3 100644
--- a/arch/powerpc/platforms/pasemi/dma_lib.c
+++ b/arch/powerpc/platforms/pasemi/dma_lib.c
@@ -5,6 +5,7 @@
  * Common functions for DMA access on PA Semi PWRficient
  */
 
+#include <linux/find_atomic.h>
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/pci.h>
@@ -118,14 +119,9 @@ static int pasemi_alloc_tx_chan(enum pasemi_dmachan_type type)
 		limit = MAX_TXCH;
 		break;
 	}
-retry:
-	bit = find_next_bit(txch_free, MAX_TXCH, start);
-	if (bit >= limit)
-		return -ENOSPC;
-	if (!test_and_clear_bit(bit, txch_free))
-		goto retry;
-
-	return bit;
+
+	bit = find_and_clear_next_bit(txch_free, MAX_TXCH, start);
+	return bit < limit ? bit : -ENOSPC;
 }
 
 static void pasemi_free_tx_chan(int chan)
@@ -136,15 +132,9 @@ static void pasemi_free_tx_chan(int chan)
 
 static int pasemi_alloc_rx_chan(void)
 {
-	int bit;
-retry:
-	bit = find_first_bit(rxch_free, MAX_RXCH);
-	if (bit >= MAX_TXCH)
-		return -ENOSPC;
-	if (!test_and_clear_bit(bit, rxch_free))
-		goto retry;
-
-	return bit;
+	int bit = find_and_clear_bit(rxch_free, MAX_RXCH);
+
+	return bit < MAX_TXCH ? bit : -ENOSPC;
 }
 
 static void pasemi_free_rx_chan(int chan)
@@ -374,16 +364,9 @@ EXPORT_SYMBOL(pasemi_dma_free_buf);
  */
 int pasemi_dma_alloc_flag(void)
 {
-	int bit;
+	int bit = find_and_clear_bit(flags_free, MAX_FLAGS);
 
-retry:
-	bit = find_first_bit(flags_free, MAX_FLAGS);
-	if (bit >= MAX_FLAGS)
-		return -ENOSPC;
-	if (!test_and_clear_bit(bit, flags_free))
-		goto retry;
-
-	return bit;
+	return bit < MAX_FLAGS ? bit : -ENOSPC;
 }
 EXPORT_SYMBOL(pasemi_dma_alloc_flag);
 
@@ -439,16 +422,9 @@ EXPORT_SYMBOL(pasemi_dma_clear_flag);
  */
 int pasemi_dma_alloc_fun(void)
 {
-	int bit;
-
-retry:
-	bit = find_first_bit(fun_free, MAX_FLAGS);
-	if (bit >= MAX_FLAGS)
-		return -ENOSPC;
-	if (!test_and_clear_bit(bit, fun_free))
-		goto retry;
+	int bit = find_and_clear_bit(fun_free, MAX_FLAGS);
 
-	return bit;
+	return bit < MAX_FLAGS ? bit : -ENOSPC;
 }
 EXPORT_SYMBOL(pasemi_dma_alloc_fun);
 
diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index cc7b1dd54ac6..e33e57c559f7 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -3,6 +3,7 @@
 #include <linux/kernel.h>
 #include <linux/ioport.h>
 #include <linux/bitmap.h>
+#include <linux/find_atomic.h>
 #include <linux/pci.h>
 
 #include <asm/opal.h>
@@ -397,18 +398,12 @@ static int64_t pnv_ioda_map_m64_single(struct pnv_phb *phb,
 
 static int pnv_pci_alloc_m64_bar(struct pnv_phb *phb, struct pnv_iov_data *iov)
 {
-	int win;
+	int win = find_and_set_bit(&phb->ioda.m64_bar_alloc, phb->ioda.m64_bar_idx + 1);
 
-	do {
-		win = find_next_zero_bit(&phb->ioda.m64_bar_alloc,
-				phb->ioda.m64_bar_idx + 1, 0);
-
-		if (win >= phb->ioda.m64_bar_idx + 1)
-			return -1;
-	} while (test_and_set_bit(win, &phb->ioda.m64_bar_alloc));
+	if (win >= phb->ioda.m64_bar_idx + 1)
+		return -1;
 
 	set_bit(win, iov->used_m64_bar_mask);
-
 	return win;
 }
 
-- 
2.43.0


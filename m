Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5F280E19F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 03:29:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R6nIzw3v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq2cN2NShz3bt5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 13:29:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R6nIzw3v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq2bW4gVvz2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 13:28:23 +1100 (AEDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5e19bfb258cso7451457b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 18:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702348100; x=1702952900; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRG7J1XhtxmqjKk8mPyX2ntR1/BM7lRJBdNSI5UPjng=;
        b=R6nIzw3vgyeILOZ3aXVuBKBfSdAN0r/829YjidKNIR82q0C2sI8EI+kFo4+lCg5RLJ
         /tVXT0ddZcgx1DJhy4D7jaA87UtKYS1WDaNLbnaPnS7S2xQiVQy2YNBEDx+uBd7ua+5U
         GKDBzm2uawa/ydtYUKzfQX0CvOjKB5E9hUXBe9/dDaH9ZC6AHec5/YUXGx6p1xB+eXpp
         6iSn54jdnJZyirz4XPVnu9VVSUIcjEytTKjt9YXe3eVnRC1Olm+IT5Sz6zBjc1Y6h6Ct
         H7SSVbO5Ixxo96jcRmRINiaFf4CY9z6FYzXHxlLl3Xpzj/7uLN5t7b+QDpJYoFLytNJu
         m1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348100; x=1702952900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRG7J1XhtxmqjKk8mPyX2ntR1/BM7lRJBdNSI5UPjng=;
        b=M+thMVT25sryxbvRsKZdApHhbBXHJuNV947M2A/InAZEeNbS9BM28F3bHeqFsCUBMq
         o9DoEh7lNrapFQ0QGNZCAyh2M60K8rMiYSCRF3ublBQIYSsnh9pAOE3JpFvYyKlvPeOG
         JiJQx1uyN3WlPIjHJsE0Y1dQVkorolKEwkPPwaX7pWZQNRfQCqn/olZVLzoHqWwLtbRg
         AaulH75gI/xM0d+Hx5o2a2WXqmjQQvJLcNDMgKP4rQ8oaeUDIMyR3ZbyreRCnA835G2C
         8617omwNmsvHG5ninePVLlmONnW1DcD0pYyGcgL52r1gV+TvgCS7mEkgldAUFtwNfI63
         03dw==
X-Gm-Message-State: AOJu0Yy5ENTh4gfNjmk3r/pecoJCqC4msG+ZGZe3moqWsTHMeCVyE6PL
	pW1HO214ziwyGJ/fhRECTV0=
X-Google-Smtp-Source: AGHT+IEDe1TuBstt/JdS9sN5Jdici8f/pUIezbr57W0n76Ca29aTWuI7Tr1KCRpW5+wpaFn4T9eZhA==
X-Received: by 2002:a25:6b52:0:b0:dbc:af4d:e1a6 with SMTP id o18-20020a256b52000000b00dbcaf4de1a6mr1177824ybm.1.1702348100254;
        Mon, 11 Dec 2023 18:28:20 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:38aa:1c88:df05:9b73])
        by smtp.gmail.com with ESMTPSA id k15-20020a056902024f00b00d89679f6d22sm2865838ybs.64.2023.12.11.18.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 18:28:19 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Yury Norov <yury.norov@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 18/35] powerpc: optimize arch code by using atomic find_bit() API
Date: Mon, 11 Dec 2023 18:27:32 -0800
Message-Id: <20231212022749.625238-19-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212022749.625238-1-yury.norov@gmail.com>
References: <20231212022749.625238-1-yury.norov@gmail.com>
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
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Jan Kara <jack@suse.cz>, Bart Van Assche <bvanassche@acm.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matthew Wilcox <willy@infradead.org>, Alexey Klimov <klimov.linux@gmail.com>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use find_and_{set,clear}_bit() where appropriate and simplify the logic.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/mm/book3s32/mmu_context.c     | 10 ++---
 arch/powerpc/platforms/pasemi/dma_lib.c    | 45 +++++-----------------
 arch/powerpc/platforms/powernv/pci-sriov.c | 12 ++----
 3 files changed, 17 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/mmu_context.c b/arch/powerpc/mm/book3s32/mmu_context.c
index 1922f9a6b058..7db19f173c2e 100644
--- a/arch/powerpc/mm/book3s32/mmu_context.c
+++ b/arch/powerpc/mm/book3s32/mmu_context.c
@@ -50,13 +50,11 @@ static unsigned long context_map[LAST_CONTEXT / BITS_PER_LONG + 1];
 
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
index 1be1f18f6f09..906dabee0132 100644
--- a/arch/powerpc/platforms/pasemi/dma_lib.c
+++ b/arch/powerpc/platforms/pasemi/dma_lib.c
@@ -118,14 +118,9 @@ static int pasemi_alloc_tx_chan(enum pasemi_dmachan_type type)
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
@@ -136,15 +131,9 @@ static void pasemi_free_tx_chan(int chan)
 
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
@@ -374,16 +363,9 @@ EXPORT_SYMBOL(pasemi_dma_free_buf);
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
 
@@ -439,16 +421,9 @@ EXPORT_SYMBOL(pasemi_dma_clear_flag);
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
index 59882da3e742..640e387e6d83 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -397,18 +397,12 @@ static int64_t pnv_ioda_map_m64_single(struct pnv_phb *phb,
 
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
2.40.1


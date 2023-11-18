Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C387F008F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 16:52:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E5kIVMuH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXdZH2z40z3dH1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 02:52:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E5kIVMuH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXdYP0twZz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 02:51:36 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dae7cc31151so2736135276.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 07:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700322694; x=1700927494; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sgPttQUTNTuJ1Gv7B+hCylz5123eQWSPdiwCHEz6H8=;
        b=E5kIVMuHQkQ2dGtZBRa58SiMUGIvoiifTu7xVGIIqNLoXJzJJ89Ru7sZb1eTJoS656
         fB0yEVQX2rL3bf5r+O59LH9kwuWQ4MtZi4E/1JbGAJQE8PsmT1DDbXqa5Rya6fKi8ocC
         K/xLCo1AcQIy23OC15eWDPSR3gOpZt3fbrnIyrB3d/fhRkbt2aBlcmcrfW1QBjgNzDi1
         h0pD53wnLFSkcBdjmBhJHm6SCeF5cdot7WnwQMpoNtgT317dDopHXvQauRG1f2Y6APnL
         PIypuzJfoikdeKjnOpAu4E/zQWin2e5ehKrxMzkDPmCuFfSWGtcPxYcFSZwHxjMNNv+/
         DIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700322694; x=1700927494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sgPttQUTNTuJ1Gv7B+hCylz5123eQWSPdiwCHEz6H8=;
        b=LhkGZtLojiENyhQffrJOKX37orLekUcq/cQ/J7pR5fNQFMWJdDcSMnTcETZuqnCAXI
         rtvGmXXwLAYK2VuTvEq7HVuPKMbzIxX2tKzSn4YI+J7PQe9gycxhImFyLCLc3zyN2TOh
         FZcWlElzKs6zbQesJzvCQdbe9R9EqO9OQoyJomgxsKwsczSeH5IAOgPigUn8dJUnWbUR
         U7LlR3vyqazPmhtZZhj961SNHEE0xMak4Pms+uoMIFZ8OpWDsFEkL9bVPD3m9x5B3Sf6
         cwyBsj9k2bKngbMCsKn03fJrrQRiDqO7rkJeNRAiS+edtuVhspigQrQRau2htayM+4/o
         4BOA==
X-Gm-Message-State: AOJu0YyCtb6+UIHRnpA4EUqXIYrWKG8dJsOu/OVpMWfyXpPGIcuD3vM2
	IoGLSJGAcboW7xesmoWxGEs=
X-Google-Smtp-Source: AGHT+IH3c8eQ4c+uzbxwI+kH3hUCZgJt3MgED5/a9/Dtof5xSXMrcPkxFIL9d3IXLZ+C5ahKbRF/xw==
X-Received: by 2002:a25:6d44:0:b0:da0:9735:b012 with SMTP id i65-20020a256d44000000b00da09735b012mr2056422ybc.11.1700322693911;
        Sat, 18 Nov 2023 07:51:33 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:48a9:bd4c:868d:dc97])
        by smtp.gmail.com with ESMTPSA id u14-20020a05690201ce00b00d7b8a1074d4sm967654ybh.57.2023.11.18.07.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 07:51:33 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Yury Norov <yury.norov@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/34] powerpc: use atomic find_bit() API where appropriate
Date: Sat, 18 Nov 2023 07:50:47 -0800
Message-Id: <20231118155105.25678-17-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118155105.25678-1-yury.norov@gmail.com>
References: <20231118155105.25678-1-yury.norov@gmail.com>
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
Cc: Jan Kara <jack@suse.cz>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matthew Wilcox <willy@infradead.org>, Alexey Klimov <klimov.linux@gmail.com>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix opencoded find_and_{set,clear}_bit() by using dedicated functions.

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
2.39.2


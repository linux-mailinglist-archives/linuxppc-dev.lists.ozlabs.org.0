Return-Path: <linuxppc-dev+bounces-2254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F88099DBA8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:35:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGqG0CM5z3c52;
	Tue, 15 Oct 2024 12:34:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956074;
	cv=none; b=mG5btRYUXH44BhAYXWNfigXkYhvnFNZYf8IEuptF9TE44aGqHlAtVwEp/E5MK4xeZc+3MlUlu/EpPuzyAPW9+xeH3pfIidA2cUDvS1T34iRgjeO1XUSQFJG7C3tLZVVY7g+XdxfA5ShNnUEyMxe96lr9CrkbaSMijVeg7FUdW7/evlWs3Is5466Wuro6kQBy3UJ3rsanWfrJ0Vmz+vISQmP2xKXxPXwrbbkk4jl8rI3q7QWj32llCgtpnbxyt8IuIe/rkB3FyOkdnCr9UimaSMIuLa4VBOx2tHMfZtcsFxvswMevtEzVybaEBLAJXeiRr2DgoEhAycN30eplv4bWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956074; c=relaxed/relaxed;
	bh=jpwPGGqxMjTTALmPRltkI2obnVC0TIxSM0BTVcrrVEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5UrdvlaKrLusbEgEsfZOTTC+wEa2GUp8WZVca4HNWm4Azh/8Qb+SXv0qHgwUSr4ycmUYHzpzwyEmOhBJfwv7OPkon11yfZwfKxzx9vKsFLVD2Bigomstm29220A/gBBZvMe8VFEBUoQXtWjqw4eSOx5wcLQ2C0Q7i7KxAoMY4TuUHsvF0a14qFaOgKoFAITZvAVnxUiknc7yiepOUsZ+0XaXG6w1IuEaPuvQ/pKu2wme14HUtHe1USy74mebX6NJdr/TOXxaLFTip96jsPVAyzLPTc4PO7aiw3HfR28SIrfpt0FBcm8StTzu5KPYVZ7SMDKhFOr4eMJeBQy8rf9bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SqpgNiwL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SqpgNiwL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGqF0w5lz3c4f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:34:33 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e580256c2so1488709b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956071; x=1729560871; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpwPGGqxMjTTALmPRltkI2obnVC0TIxSM0BTVcrrVEU=;
        b=SqpgNiwLje4PRgC2rtsvzMEs2UeKvv0BDc408ZhHgCiSlvnT/LGM5N0jmq/IvE3bik
         82Pqh73Y7qxrjbtVS/caf1+DkF4mV28e6DfdjN8YchuODgFss8GirNjLlySBc8Xm/9NA
         PllulDTZgtXPspG6WNuqTU7dSQqMLdLkZXLvH2iujkFBwmkUFsch/knslIihcrZCwYpF
         FXGAHEwJQnMFJrf91lkmATl1IkoI8BSGAzDZeBlE0a7QSq17slu6cRfAvMXWGMJ0Ietm
         6b9nw3m9Vmi/UbNWEtAIC4ZBZO5NULs/4a8VkDCoZwhvBomTFybq3fHstt1SVY4f2ib8
         qXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956071; x=1729560871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpwPGGqxMjTTALmPRltkI2obnVC0TIxSM0BTVcrrVEU=;
        b=ROYjdzf4Giqz9ltWL5/marL+mdQhkpT2YZb7EZU1h+plMECkmHQgkXllxAOLGcj8Il
         wYR6yJq5OrKPQw3rSh62w9TOIezOLTWYur9TPuyLErOMFBjGdXwMhXWQTHaF7IJVd/Qd
         1dsIFVBuVP455h8TJgXZGJ0w3pMxqNd2J4DPWZRTMXtBS4/rvi7Pc8lzofsnz/xcJbmO
         ua4G2wQAL29Qj0WG8e0ZLndcUVuFfo37JMISICOaX5UrpbuV5b281otJKb2kkTlJ0Duq
         bF9Kh5fj6Yowy8QsWT92D3EW/W6FpFnjM8QZISZoWt/fgVmKKNX9B26Elm8EK9XF3rRY
         e6uA==
X-Gm-Message-State: AOJu0YxTLP88ncGEwPqUN8/wXBXehpiDHwv0opPRMAmQfzeN38EUkOYw
	WQlzDz2TsItXtjdGeEE/WX90pTnyf4riQwTTw2Lw7Q6O29XDJgWFzN2mBw==
X-Google-Smtp-Source: AGHT+IHYwbiuRk5aKKEVmS1LD0xBTPgGenAkQ5XvzCOzwV/g1bm0dITYhUx7OfVFtgaRIRCqBx30PA==
X-Received: by 2002:a05:6a20:c997:b0:1d8:adea:3f7c with SMTP id adf61e73a8af0-1d8bcf18038mr20979021637.14.1728956070636;
        Mon, 14 Oct 2024 18:34:30 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:34:30 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC RESEND v2 09/13] book3s64/hash: Disable debug_pagealloc if it requires more memory
Date: Tue, 15 Oct 2024 07:03:32 +0530
Message-ID: <79552bdb6dac0d0a39d9c639bdf92f4e66dcaa55.1728954719.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1728954719.git.ritesh.list@gmail.com>
References: <cover.1728954719.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Make size of the linear map to be allocated in RMA region to be of
ppc64_rma_size / 4. If debug_pagealloc requires more memory than that
then do not allocate any memory and disable debug_pagealloc.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index cc2eaa97982c..cffbb6499ac4 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -331,9 +331,19 @@ static unsigned long linear_map_hash_count;
 static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
 static inline void hash_debug_pagealloc_alloc_slots(void)
 {
+	unsigned long max_hash_count = ppc64_rma_size / 4;
+
 	if (!debug_pagealloc_enabled())
 		return;
 	linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
+	if (unlikely(linear_map_hash_count > max_hash_count)) {
+		pr_info("linear map size (%llu) greater than 4 times RMA region (%llu). Disabling debug_pagealloc\n",
+			((u64)linear_map_hash_count << PAGE_SHIFT),
+			ppc64_rma_size);
+		linear_map_hash_count = 0;
+		return;
+	}
+
 	linear_map_hash_slots = memblock_alloc_try_nid(
 			linear_map_hash_count, 1, MEMBLOCK_LOW_LIMIT,
 			ppc64_rma_size,	NUMA_NO_NODE);
@@ -344,7 +354,7 @@ static inline void hash_debug_pagealloc_alloc_slots(void)
 
 static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot)
 {
-	if (!debug_pagealloc_enabled())
+	if (!debug_pagealloc_enabled() || !linear_map_hash_count)
 		return;
 	if ((paddr >> PAGE_SHIFT) < linear_map_hash_count)
 		linear_map_hash_slots[paddr >> PAGE_SHIFT] = slot | 0x80;
@@ -356,6 +366,9 @@ static int hash_debug_pagealloc_map_pages(struct page *page, int numpages,
 	unsigned long flags, vaddr, lmi;
 	int i;
 
+	if (!debug_pagealloc_enabled() || !linear_map_hash_count)
+		return 0;
+
 	local_irq_save(flags);
 	for (i = 0; i < numpages; i++, page++) {
 		vaddr = (unsigned long)page_address(page);
-- 
2.46.0



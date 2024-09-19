Return-Path: <linuxppc-dev+bounces-1438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E6A97C2F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:57:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8KtF0g2sz2y8X;
	Thu, 19 Sep 2024 12:56:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714613;
	cv=none; b=O2LBThWEmVLo0udO30h5YYS9nVVdIDT2zIcTqm/sleuUiJuyYM81+FXN11OV1we5cguLIoMdq0f9Vn6ScVlaHwcNZe4ZJ3v3tMZ9fuP0DIJi11IT1MAWnVKnd88EpJDawgq8Ox0vfC2WoKgIFerK/3U1CerD/U2dAGN8CFitSRqhRFPw3pTx7Dzo61/30y5RFIjtv2/cHDpUHEYTrnfoOhlX50Gqu2sWcbarWa4Dz2bzy0ieNjYeFzG/MGdG2J98STA/jWot0v5H8kPJEfxAQLrboZmkykBxOLMlRjtfWNquICqYxK6ZAzNydOTtMO7b7Ds1lg3cqPCD4TAHBr77Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714613; c=relaxed/relaxed;
	bh=U+q0qzhvgy5Htf+jNoj0jpwh62QEw37SjQucvD3DcJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/sngYeLIRraTtYRfPON4hiJ6N9oloFqIZnukLbCcpPVtBFr1cBR4W1ve4mc2/4QSwLLaCSXZJgaUPa+WqZwq3Jh/O4FujE8mZwPagtmRD1++tISNIZsVIDq5ex+gPTuqc9acIMrn+hvPk19JcC+sEI4TQRmudjZJTm5pRcD12ymwyf6liHQ9ocIt96hz/uKTvDtqUsixHtPvOHdwvqXqzIl3x3xAVeN4jYQ06GoV16GJPO8tt3tMmtzIbpzo/vk3nY4TAV/dk+UN8SyVNIwvqyw4I5qFR5jZ9pBLU1rPLbo7UZcVObEF6ueZlDHb9DaW44SfEH/8EmH2TIiqQdvZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Uv6S030i; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Uv6S030i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8KtD5YQ2z2xpp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:56:52 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20543fdb7acso3502525ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714610; x=1727319410; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+q0qzhvgy5Htf+jNoj0jpwh62QEw37SjQucvD3DcJc=;
        b=Uv6S030iK6qw00SXoHSRx3XD82X/ldxer/a08VAXbvgxXJcT6U7yVtBUkV48JFkf6K
         CkcLupgrcRmKodPeb51aUoSBc1aVI8wq6lL7CWgBWAej2Jo3DHtWm46ZkryxjKNkxlkp
         4OTjt+CUfWsSNirufpBe7o7IUaoIhnychxWM7A10XU0YXzI4sPrEaEnavG2+C32MM/2T
         xwrwkNPe1KdJv21kVqLz0n9CqhngwbyjvnjGPMoWw38CZBxmZcNjTiT/nrqfA6DVk4bp
         X9BHD393Qg2YNUCyEN2+8lyaWqdoB8lDCcyMW8tgJ0rVPA+h4S0FiryQ1yMXyJDMWGDV
         Eqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714610; x=1727319410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+q0qzhvgy5Htf+jNoj0jpwh62QEw37SjQucvD3DcJc=;
        b=KgjsS1RVWZUsxXAkYM7EhA1Us6VG4HfxzPrc/6vv3mnZZ4jwAtM52DFtAVbCucMNJ0
         wMUGnufxVcZkdeqVC3iF0csYTDib9ClgGQPsgWQmS32OOAHtcIwFwAy7ugXXRTzlrym1
         rlMKbKKrGNXKnNZYisWFF/SU1Y5B5wW5rIQQNebF66Yk4HJN7LA8AqCbJU3SXAgGTHic
         u3fU8gh9Oh5F7OTceYoLi6fzEei4d6gBp2G5S58tYOFdha1Q5gin/B476mxXTx4PBXCG
         NbX/dWT9/mxsepqQCFRYJuhaKwZEHFwZaROAjAL+LhMJ8xMVEod/0/ujmDZwWbZ+ng/e
         7TjA==
X-Gm-Message-State: AOJu0YxD/1aDgVJXVrLSWgdohj0H/bQ/++ZoV8XVSLVZ3SYS41zHQplr
	MGDeTmtGP/U/tF2J8C8fmBMEo1+c2DimVh4ZsnzbS8vdbPQYw2PWFXMInw==
X-Google-Smtp-Source: AGHT+IHDCEhyE6aDKQMLRWn1dVpCIu8ywaRfsfF6B1LtKOZnRl3x2/5HVbN1RjELYtzDCtK/03wddQ==
X-Received: by 2002:a17:903:2452:b0:200:869c:95e3 with SMTP id d9443c01a7336-20781b42cfcmr332110025ad.4.1726714610017;
        Wed, 18 Sep 2024 19:56:50 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:56:49 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	Nirjhar Roy <nirjhar@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kasan-dev@googlegroups.com,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v2 05/13] book3s64/hash: Add hash_debug_pagealloc_add_slot() function
Date: Thu, 19 Sep 2024 08:26:03 +0530
Message-ID: <b8a835318147d3b8edd0e3236f5dcaa18789de16.1726571179.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726571179.git.ritesh.list@gmail.com>
References: <cover.1726571179.git.ritesh.list@gmail.com>
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

This adds hash_debug_pagealloc_add_slot() function instead of open
coding that in htab_bolt_mapping(). This is required since we will be
separating kfence functionality to not depend upon debug_pagealloc.

No functionality change in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 82151fff9648..6e3860224351 100644
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
2.46.0



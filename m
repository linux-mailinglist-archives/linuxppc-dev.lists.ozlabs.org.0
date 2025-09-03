Return-Path: <linuxppc-dev+bounces-11685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19096B4293E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 21:00:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHBk61nLTz30V3;
	Thu,  4 Sep 2025 04:59:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756925982;
	cv=none; b=eOnas6UBnwAYVNGfuD3WWFwLjQRfZUd20W2XiI9ksupNSckX3LU8xe95R1mG6S2Aq1dZ5+WkSWe6kVZk1LQJcHq/JSCEUfuDUyqTaRxd9/3enwGXGT7KWkNBkSBXm49FhL+Q3J1yfBbR+mWc91aRYupJIknC/9E3SS2N/tJZh0uCUewx+Z5F/vvJg2Rs3P93Wu4Z2wrtbFuqipX2c/h9Itr8VpT2rIM8Qw53vZUkX6VCTwVAcVrdomLNKqPjo8NAy5qlkO415nPcF511gJi1HC/adoWTFdFrlEmyKV0fw0d0th6KBgT6rK47WLEHtRDnV4+UW5bje1yc2hQebDWEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756925982; c=relaxed/relaxed;
	bh=6wz/bZSqqVx6pRJeL2TZzvIUdrr6/vXiyt+C/9X3zJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbPFHOJsNARmi86TJsxsdkBJeb7Ne08+ca9qbYA7xYOk/pIP8i++zpTIN8NFF4TeU8toOUU+Wwi50RT72tTEmHEUNz3uN7LTGePQheutDHTUB5POznyN6eMs+nIvEdRjacTusjIcSvPOMutUuR+U0BF1wSQw0oKY+qo4M3YUTCtNbM2XwFp2/uhl1kQPnFk/HC9kO0DruIEkwMwYsLOe5e05YJHHurTuK7215gSDRMHa2/gGN0lJgMAHEMJ8hP8BE80fBH3KqjNJospzrzz+PHwhJqVHveUOc69cXY1Nbj2PAKf5+slvxdzToRzDTOFfmGLyn40HFj5mVmaDzH1B4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k090hkwC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k090hkwC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHBk54FLkz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 04:59:41 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24b2de2e427so2176555ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 11:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925979; x=1757530779; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wz/bZSqqVx6pRJeL2TZzvIUdrr6/vXiyt+C/9X3zJM=;
        b=k090hkwCbTFVR+uGLNriLuv22CMfdnQgJBK3J/zJKB+R5iXBhcugYz4XTuNtc+pCkG
         YOT8n5ej8+z/ZhCDnVJ6fsaAc4W8WqNUfEQqVPmnlFZiDpJI1XbXbIxb8RpZfAAa30Pt
         worpOyf1vNN0NQ12ndatzNCKT4gXewy3sVMGPSIpP09OvmQNOIbWzISBw7wESj6iEN9M
         10d0uq0PEsR5q7GQeF3GUxJa9fsEdBsEVuExmcvGGz9Ovr2/NB+1n1nA3mmTAipY7jNo
         F9C+BGg9vZ3QmIeJT7dFqlFDQyBoN2fa96/hzabLaULtcdnmfb+uL5adEajRqjPB40U0
         A7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925979; x=1757530779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wz/bZSqqVx6pRJeL2TZzvIUdrr6/vXiyt+C/9X3zJM=;
        b=sZSlG++X/HtWLDnyB0/I6S6OpdIOY+Q+4QkAhtfB0tWfYgXHLEpvfrJ0YOGFlDS1QN
         maeeidmop5jSp+hYshpuCe41Xi9SEMJTS85m+OIDt1UOmFXsgAmIsAAexV6e23xQSmg2
         ekqlSMqUKNL+/MhHqMC5LRnRtHGdva8BpCwvK0OVDsZsWuf4/M2OBlHWf8mA3T2p24sY
         /mpgLWXOshUr0XxlkqFqPV0yOMYIFDu1w3btd0i0sLTJfCfKm6JIpa4X4zyUbQ4gQLhC
         +/VpGdKfOFbW9SfSyQ631i/ifCzNiC6cE2nkHdw44NLpEtzD5azPmxMvpCJxqbR9RuSA
         3gEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4F8QAUUEC/4NAC5tJDo75+ccVStXz3AGVUICX1T0a0i89pBSYPKZMWGimbV2LYgTjPNfoml1V3LDl9g8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwSBeV8sF0z3PQ/ozDr2bogqIcWws5mwoafRcSZVBkPHiBVvoi4
	27m5Rt+C7ZQcqcPeteC+YmiiNEcfx5qbbcvu0Wn82DgRIah3w5r+sdtL
X-Gm-Gg: ASbGncvqTaDVkX/lJlbJJj3v8cC4aVI/Tb7kcCr6Py9ZzUOktmUW0wAMv9av6vCGGNi
	XLlJDq6/D2LGaW+j/77/QEUhThP/P3ZRd0QK5YLaVCzBa7QuSbfWIYxdIJjK2OiqCKIYljcLxVv
	p7Xo9k5AASvbIz6E4Su5FVVe811lw7HU/ctHcpmmqWeLrkZLEq+rvUP2ukMn/NB2dbKJosIs28P
	oK2LdqVz5rVe0/O8aDHft2G6ZFI/ylqrQj9oyefkxFbJ505WVAT63fxzv9CrZllHtB1dg+itQzV
	1egrR9IrM3b+ntPnkh3CCBX677+Q4NmEnJ7gQ6e6C5fjcStM7WpEWii4CLYz9SbCLw/4ftIDzic
	cRHK+sR7kmM0tfsFMH2p2qbaakESAXsL4b8RN+4mG0Fz/gSWPLcUVEA==
X-Google-Smtp-Source: AGHT+IFLYxGq/uXWczWSmoJ4dYmB1R4jOWZAcKlvb1pf3KqvOH6hTCxx8eQlFrsP54M7TPt133nTbQ==
X-Received: by 2002:a17:902:f789:b0:246:d383:3964 with SMTP id d9443c01a7336-249448ac3c8mr239306545ad.18.1756925979423;
        Wed, 03 Sep 2025 11:59:39 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:38 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	virtualization@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v3 3/7] x86: Stop calling page_address() in free_pages()
Date: Wed,  3 Sep 2025 11:59:17 -0700
Message-ID: <20250903185921.1785167-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

free_pages() should be used when we only have a virtual address. We
should call __free_pages() directly on our page instead.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/mm/init_64.c          | 2 +-
 arch/x86/platform/efi/memmap.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index b9426fce5f3e..0e4270e20fad 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1031,7 +1031,7 @@ static void __meminit free_pagetable(struct page *page, int order)
 		free_reserved_pages(page, nr_pages);
 #endif
 	} else {
-		free_pages((unsigned long)page_address(page), order);
+		__free_pages(page, order);
 	}
 }
 
diff --git a/arch/x86/platform/efi/memmap.c b/arch/x86/platform/efi/memmap.c
index 061b8ecc71a1..023697c88910 100644
--- a/arch/x86/platform/efi/memmap.c
+++ b/arch/x86/platform/efi/memmap.c
@@ -42,7 +42,7 @@ void __init __efi_memmap_free(u64 phys, unsigned long size, unsigned long flags)
 		struct page *p = pfn_to_page(PHYS_PFN(phys));
 		unsigned int order = get_order(size);
 
-		free_pages((unsigned long) page_address(p), order);
+		__free_pages(p, order);
 	}
 }
 
-- 
2.51.0



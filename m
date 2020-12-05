Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A98912CFA39
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 08:17:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp19f0McMzDqx6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 18:17:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ukqOtiGe; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp0m250wqzDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 17:58:42 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id w16so4935250pga.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 22:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cxeoavWkBKpHEVfZRK3a60KePQvEOREDyC26QCPQwGc=;
 b=ukqOtiGe7P2XNpwcoCHPv4PLVVLigIR0wfkbWLYHCk03Qwl78XRRc25X9C1RXu0jHe
 71KyORclr783FXhdRwXEwnRYE8V5N9Dlyrpf+r1au98v+1tkhP1N6fl1HslUf7ZQ6F5a
 XTq1ZFQ+e2jvjUGVPu2b86zd+bEI1VIn6WCJ/qjsEj8yxdBoHFWiVg+eMQZWOAY5xRFj
 C11oel1teBnWh8SCk/mPyWyo/bfzkUXfP4dXdfU1VwuAWLs0NLmFg3F0v74OQujpFaki
 9EIdB0FMiyQGzJUoI3N8vq5BLpK4IyZzsPMZT6nSzTsZ26MvND8g+ErfJa8+fsz1pJ2o
 6LkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cxeoavWkBKpHEVfZRK3a60KePQvEOREDyC26QCPQwGc=;
 b=lxpKGfnCv2A3KPxp4Er7fiTTgni9ycvFjbg/bKFlq33DJVzKc3adU+WuQE1NPvXkwN
 ya0nhMqZkwSbeelTIqqvTk+FZjEIXSpk2j5cK+jDbs0ImpccEj3maPFK/d00R+RQT9tc
 neQe+f7GT/oUrthPUH9Jr7/ZTnOeCE7OsNUkJm22Y+NVjT4nUOEWtm/Txq9kMQCgarF5
 +D6Lhbehsv5XyN2Uu7hJG4AddRX1w/QYnMEjfFOMvVAyBsD6MJMg7btLeueUZLBfNowV
 xsCjKn5ivhAEdrQUuMxuesXVTMW4teksr9PO4ZU/8hZkN5WjDr/c2yg0LkmauDp4wt5R
 +deg==
X-Gm-Message-State: AOAM5338O/eGFv5bgpbUxtLrSdeLcX7oP8SDsjHZk6qtCWXVt/M78qIE
 k9UENOaBMtzdRcervV5zU7M=
X-Google-Smtp-Source: ABdhPJy4ceoebyQbTqB4fE0S1EBU/ZP1A2fSE/NXY9uIYYRFQfIy2FdDgibtFhuJU5XMFvZqvTYP+Q==
X-Received: by 2002:aa7:8052:0:b029:196:4dbb:99fe with SMTP id
 y18-20020aa780520000b02901964dbb99femr7374783pfm.11.1607151518507; 
 Fri, 04 Dec 2020 22:58:38 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.129.145.238])
 by smtp.gmail.com with ESMTPSA id a14sm1110848pfl.141.2020.12.04.22.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 22:58:38 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 10/12] mm/vmalloc: add vmap_range_noflush variant
Date: Sat,  5 Dec 2020 16:57:23 +1000
Message-Id: <20201205065725.1286370-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201205065725.1286370-1-npiggin@gmail.com>
References: <20201205065725.1286370-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As a side-effect, the order of flush_cache_vmap() and
arch_sync_kernel_mappings() calls are switched, but that now matches
the other callers in this file.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/vmalloc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 2f236aeeac24..ee9c3bee67f5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -235,7 +235,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 	return 0;
 }
 
-int vmap_range(unsigned long addr, unsigned long end,
+static int vmap_range_noflush(unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift)
 {
@@ -257,14 +257,24 @@ int vmap_range(unsigned long addr, unsigned long end,
 			break;
 	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
 
-	flush_cache_vmap(start, end);
-
 	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
 		arch_sync_kernel_mappings(start, end);
 
 	return err;
 }
 
+int vmap_range(unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	int err;
+
+	err = vmap_range_noflush(addr, end, phys_addr, prot, max_page_shift);
+	flush_cache_vmap(addr, end);
+
+	return err;
+}
+
 static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			     pgtbl_mod_mask *mask)
 {
-- 
2.23.0


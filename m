Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE4E24D908
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 17:47:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY5WT0X0RzDrDY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 01:47:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u6yhubFc; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY4lq3P6rzDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 01:13:27 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id p37so1140126pgl.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 08:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ik3l57t0FyOClvLjEe+sb/BhE/y0hhY0gnEqux751Uc=;
 b=u6yhubFcXihID2fWq+QiE0CcG9dvjSoF59E015bcoBinPTWoTc6VB4OCRmb/y5KRsT
 qJkbjXob1gFUX91mcQBSG3U26lx8vo9W5U8g0dpaAxpbW8ExWeJzgZEfBwuwalftHFZn
 0wke4MbGjU2ojD8aQbwZOkVbPO2SYtKoHSz12zM/hQNNjeYeWZF7jE5g2AHPO0aB+DYw
 8C6ylDWaxR7KccTt7GD+eLNOYbuhrkEsjTe/Yv3CvgZ8RSQ10W7DxFdo98xlAAYx2wTT
 XzgU57hcg/H50XvMaweP1v5brBYXdmpavwyQpD5YyHUNi2KfejW5mx/+gd2ao61mGiJ9
 ZR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ik3l57t0FyOClvLjEe+sb/BhE/y0hhY0gnEqux751Uc=;
 b=hrDhxbTzdLb0DacOb2Cu04AVHM8jLieaX3l4E9u1gXsGtLJY2K6AEaD0z1fvdBoe+X
 Fc6itR47uohfubrJslsgIxHGKNJkhty9HhWNpQoXkX2nNSZPiSB8+8CwSV8+slLYzseb
 opd9eBb8AMD66pH6jJgYWM8kp6mUy7vWLBTl5g4hNi9vIF2sJRkpSHeg7DA/0e9UBNPw
 h+72NZ4WXSQ13WJdQ0uKmFuEzE5oZngaiMGg85PuFWkfr2oV2qwbSVD3Kh2FkTZlASHh
 jacUBR3NePeN81ifCjHGL4u3WJ83SF9k/022HBql7+arJ/PC8GJt3jE6x0IMHQ87mhUt
 3SGg==
X-Gm-Message-State: AOAM532g5hg+eXXQ35hdQIyT8td45FODtjxySIxlYAZRBW2GNk5yHdpL
 vmlw/TkF8KsnxW534fLQWtn+uyPL3PM=
X-Google-Smtp-Source: ABdhPJzOk8LezUqei41Rt5u2ralsl0Vc1m91oWRQQQjcIB5tNWY2WeZkdOIgpy1cX1Su0SK2t1NhyA==
X-Received: by 2002:a63:5256:: with SMTP id s22mr2774026pgl.325.1598022805468; 
 Fri, 21 Aug 2020 08:13:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id s8sm3126985pfc.122.2020.08.21.08.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:13:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 10/12] mm/vmalloc: add vmap_range_noflush variant
Date: Sat, 22 Aug 2020 01:12:14 +1000
Message-Id: <20200821151216.1005117-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200821151216.1005117-1-npiggin@gmail.com>
References: <20200821151216.1005117-1-npiggin@gmail.com>
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
 linuxppc-dev@lists.ozlabs.org
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
index 256554d598e6..1d6cad16bda3 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -237,7 +237,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 	return 0;
 }
 
-int vmap_range(unsigned long addr, unsigned long end,
+static int vmap_range_noflush(unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift)
 {
@@ -259,14 +259,24 @@ int vmap_range(unsigned long addr, unsigned long end,
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


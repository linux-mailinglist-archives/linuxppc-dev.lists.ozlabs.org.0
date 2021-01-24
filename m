Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43954301AAD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 09:42:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNmhc21XmzDqRB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 19:42:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LD1AJ6Q7; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNmHG44YszDqlK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 19:23:54 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id s15so5729930plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TVhRROVZ7z046qTJ4ejm1G9xGCLJycEigvvpkf2Te7E=;
 b=LD1AJ6Q7eOjSujKmrwu2p/+JbN0Zfr5LtB3ZkyFdzthlHqp5+5bXxUIPms0GZPIEI1
 j8iC6ALOlnNPw7NvBm8g+wvNrzaRNyHGNbry4++c389NU654HOe92r7RSbw9ZyWG84gc
 kp2FgcVZUe9J6ouu30w7uKhA3EG4S+Ee1y+5Cad0k2E5Qg71u/s7n0t0KG/7ghJfui11
 M9VJFibtXnmgzbuQat5H0d9DFSHOp4Kj27NTnsD2LZk65R7tFL3xKYvKblgjj1omjdo8
 0laPVyur/H+mRgYddO4EAAw7KpMtM0p8cACx9kN1MlkXAqWRH/vc/B4wLdXNu0P0Y4t5
 Rsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TVhRROVZ7z046qTJ4ejm1G9xGCLJycEigvvpkf2Te7E=;
 b=YDhGZ9lB46wfE9zyL5o32l6OAL8vXex3B6iIlb7vB7OVd4NNt+mmetPch4Qy31PEqE
 viBFCX3OWV5Ly6kLJgwON9icle4YXnlpD3ixGTF+J+A11rhhdH3r2oKTLtdroW6yuv30
 aj3G0lqLsPbglou3R6t0vv1nW1rdi01+c3kKEenAW1WZkvZsrztJ5B2OtUAT5mkQ7PFI
 AXL2wjtbsADBr4/ZvOVAGW5MmrEFsSRg/qlwGl9kEvsbf6ipKkq+QKayt8AP4OKtm5KD
 ylB6szL/Dm0LwT2qcEIE7Di7E664NiqVqZCHNf9c+ijDVzQ3e5+HMCHDvprKM2Gz7oFm
 69Dw==
X-Gm-Message-State: AOAM533UpWPv4aiKp9bTN6DCq8loTvZrn6KABVzpidxons+A25AhdfFw
 RJYKmSoVsqjIq4s+TYu1jtc=
X-Google-Smtp-Source: ABdhPJwYhf2C3cY0UzUjCepD6a2ETZbd8HZtvD4C0FN52jeC88VQLzQc0VPtpNQam4pZa9M23WLv4Q==
X-Received: by 2002:a17:902:bb8c:b029:dc:2e5e:2b2 with SMTP id
 m12-20020a170902bb8cb02900dc2e5e02b2mr13915452pls.10.1611476631232; 
 Sun, 24 Jan 2021 00:23:51 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id gb12sm11799757pjb.51.2021.01.24.00.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 00:23:50 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v10 10/12] mm/vmalloc: add vmap_range_noflush variant
Date: Sun, 24 Jan 2021 18:22:28 +1000
Message-Id: <20210124082230.2118861-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210124082230.2118861-1-npiggin@gmail.com>
References: <20210124082230.2118861-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
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
index 5d79148b7fa7..0377e1d059e5 100644
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


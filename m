Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE728251C57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 17:33:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbY0Y0D1FzDqDD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 01:33:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jFDbXQGW; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbXFD4r9wzDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 00:58:56 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id q93so960516pjq.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 07:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ik3l57t0FyOClvLjEe+sb/BhE/y0hhY0gnEqux751Uc=;
 b=jFDbXQGWGSUzk7/GJ+Z/Evd9q3iiU/BfiaMC4g83Na9QhLkZaoeFiiSi/FDNx+q0/o
 JzPfzJTgJWm/P9pW+kiyHgiJ3OxnIaNeOA/VQFt0osyMoqtV8dJGZoFOSLHI8ZJp2LQG
 uXQsCruf53J3N+40TqcYQYhQU5JOrltFKObIJtcT8dIGteWrwQ63Li+XqNWXfO/8TIcX
 O5Y3C++e90X5Ov1fyAwEZ0Pw1S8c0WlG2BrKjPLNiDRIjxzpQXbwnzWTA+RXKohUt+G4
 zwS57mS4cvrbf9wiDvxEB6b1vNXZ5voiRSKhtoS77rvCe8CCQIRYn7SJtz8+EOdXbboI
 nZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ik3l57t0FyOClvLjEe+sb/BhE/y0hhY0gnEqux751Uc=;
 b=nK9xNZIkTMeQ+S/jl0kgthryJLrHdcF1c8LGfcm1nWVkuijY3MdCNs6SC5xyy+EnA9
 GsS5G2IeejgKG5ulR0xZQSuvzFVNfUL1T2fX+Td2z7FPu7YTSud2jT7J7sdFRX5beXSm
 aIPbWu/g1wLZAE9ApqyqwNjEnVbQRX57xAQMkeGFEWinN4Lr7CahxaMPT7W2UBKvSELn
 MTAmZIsyFlrk+XneV03ikx15qoyoaV56sj7e6E4C8SMMSc0Q3S4Z7UpVMKvVn3mY6UNo
 JC4eExhF/zy140Rq/HiN9KD3YtLo4DLgcl8dMk2L/IzqseEhES5Sn8cZrtk0NLbL0b9q
 MQ1w==
X-Gm-Message-State: AOAM532zeoq9kuCgi7ROxHv+jx7P4rAB5Y0DuCidZxJNO7Vii0o/5onv
 Rx0mZ//HD+Cd32d3pYhyxmQ=
X-Google-Smtp-Source: ABdhPJzHo6/7MAKEoI/XmiBkadcGmQ+3ea7nzB3CCBEUR/YsmN15UifwlOMYYbga1Z5fsGVrMds0VQ==
X-Received: by 2002:a17:90a:a101:: with SMTP id
 s1mr1788302pjp.205.1598367533484; 
 Tue, 25 Aug 2020 07:58:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id e29sm15755956pfj.92.2020.08.25.07.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 07:58:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 10/12] mm/vmalloc: add vmap_range_noflush variant
Date: Wed, 26 Aug 2020 00:57:51 +1000
Message-Id: <20200825145753.529284-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200825145753.529284-1-npiggin@gmail.com>
References: <20200825145753.529284-1-npiggin@gmail.com>
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


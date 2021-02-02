Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 781AD30D0AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:14:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVkHK0CVVzDqs8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:14:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q54VSUyx; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVMSt5H2WzDqnF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 22:06:38 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id lw17so1516602pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Feb 2021 03:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hrndBY8R68kIi1pHIRutw3ucH/2Px5UWTBnGPJp9HrY=;
 b=Q54VSUyxFjq2LjEeAJPNCU+WR/2kVaNjZk0Za03INShYBYMhttc3N1NUHL8847fVRe
 VSV5Rei6EI7nFdF3pwZ2uOgu9iQwSWdeE0Dw7rB+pYopphuQUNVaSqCCTMbZhsQU4u2K
 0NgsEQRVnBDvlh8VkwnQPzb4LWG7wrbTmw39IukkODmXHpxSu6gMxhNJBvOAdnC24OqL
 rzjtQckiW5DLg38VK2eDDwKAxn8b69a/UBiF3QjrhShfJZ9eXz9qJCD8f/bEyqyHF+1t
 gKKEfDyAghVhHxbs8rpruo8U7ouDGssyNUMrKY0CYNQvacFpXZog2qGClmKyim4Hief8
 pIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hrndBY8R68kIi1pHIRutw3ucH/2Px5UWTBnGPJp9HrY=;
 b=DsXmwKWs3nbWzkUa/OANV1fmQt4k59ds7STCFMNid11QBtX5VJq+G8JWggolS/S4vt
 4dc4TPNMg4uDsTwve3l2YQ17SjcqpEiH7n7F2J4ccztOKKupiMrw+q/oJ72d0k59Dwc9
 kyujQD8eZLaxQFswRYCBJmmCggLPf89mbw00GUwAaCwJaVTkr1Yd2yjRzyuN+b2kc8iA
 XuYcPIPgd7+FgZtfgkEZZTJS7KiyqoA6gocCNEFADqtAq7ZGMr9flMqZK6HhRQUV2lg7
 2yughW2WOo49ZGnozIkLccC03+FDZK0HY/zIhx4aliX6IgBbw7THuBN/hMjF3Sxph6y/
 F+rA==
X-Gm-Message-State: AOAM532Z4BMmT5ldYLYiVdmjimYX01FsFyPYRSFOkb8IS7zT5GfJJxcp
 MMWzdygVuGVMgiBSWv2p59M=
X-Google-Smtp-Source: ABdhPJxRTy9eWr3BNvH4OMX3zh1FH14Nb6sVUmv6Fk/NPAKR8HOPVuT+15Bqzg23KyJaTsRYWg71Vw==
X-Received: by 2002:a17:902:e783:b029:e1:24a9:a5c6 with SMTP id
 cp3-20020a170902e783b02900e124a9a5c6mr18981686plb.43.1612263995617; 
 Tue, 02 Feb 2021 03:06:35 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-242-11-44.static.tpgi.com.au.
 [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id g19sm3188979pfk.113.2021.02.02.03.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 03:06:35 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v12 12/14] mm/vmalloc: add vmap_range_noflush variant
Date: Tue,  2 Feb 2021 21:05:13 +1000
Message-Id: <20210202110515.3575274-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210202110515.3575274-1-npiggin@gmail.com>
References: <20210202110515.3575274-1-npiggin@gmail.com>
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
 Christoph Hellwig <hch@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As a side-effect, the order of flush_cache_vmap() and
arch_sync_kernel_mappings() calls are switched, but that now matches
the other callers in this file.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/vmalloc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f043386bb51d..47ab4338cfff 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -240,7 +240,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 	return 0;
 }
 
-int vmap_range(unsigned long addr, unsigned long end,
+static int vmap_range_noflush(unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift)
 {
@@ -263,14 +263,24 @@ int vmap_range(unsigned long addr, unsigned long end,
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


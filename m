Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B652C6FCC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:39:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cjwf92jjkzDscf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:39:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Mp0zn+oB; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjwN70g75zDrRx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 02:27:03 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id l1so4098561pld.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cxeoavWkBKpHEVfZRK3a60KePQvEOREDyC26QCPQwGc=;
 b=Mp0zn+oBNq23JKWM/VThMMhPZwOv3ULXqyHMSbU+8eq462RFm0HjxEft5FwwThVa2g
 Gdri/pSNwbSjd4GaBz7LMT7YU4sY+pCpvoKDDARY6wTEO1mOWMrZFvNV76XW71W3IYC8
 Sy97jC4i3tcEucGD5CeJs3bSrFigN60xly++kizAtnlCqvYm0U8ZYqb63x5SyfoRlNht
 /01j3f7AfaN6eKgeFj4VDZoJjwecKRpm+EOre9dlnVWQ58a54p8t0zy7dbaS44WgmHkp
 vdbvtn1f0WRrOS2xbTQK2bp2rXfc+KTBnwUK7oaNJ+cHrevFjLn3+MrrSl3LOcd2DFGX
 VUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cxeoavWkBKpHEVfZRK3a60KePQvEOREDyC26QCPQwGc=;
 b=YWVVznXITsUVILdHHWyWc6//QW72t5JCauMUvgqzW+7vxXkIkWSDeO6rKzcEJSubyW
 W5SUmtgMU8srK9ieS+s3R14RTH0SGlFar0cgpHKEvYrmMRU3/jtDN3PkJZiSETurFSqM
 pDx7ptNlY5cxkM8kC16AwcTPktLOYl635B3YcU9+iSo1uQs5UYefIcB2zrvWMDKhbjAQ
 I0OsGXgcJBqJ3iekOc0uFyDxoRj1R8/zxZ2406Euq4u4d2iE9OJtO6mfCvt4vYYfep9M
 QWWUdVgKJJSRw1MN+QFet8wLEDsZtuduod7ILd96ADrkkeqsNdAj+aUIH0rcqtYkmnel
 6J4w==
X-Gm-Message-State: AOAM532ZLfbrKu5Dwjbm+PNbuxDZFAbjXBfNNxNC3xBQ/cGJYmko9VJP
 h303AWQY2L4vCdcerLLzAeQa+HIcMTQ=
X-Google-Smtp-Source: ABdhPJzuZ3Dhw6J8hTZ/FG/h2c0xFsw7tIsXj/w3J/q6NkcPqqpvR5GqBDTkYAO1QuSMgiGsudTbdg==
X-Received: by 2002:a17:902:bb8b:b029:da:beb:b81e with SMTP id
 m11-20020a170902bb8bb02900da0bebb81emr11684808pls.44.1606577220717; 
 Sat, 28 Nov 2020 07:27:00 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id d22sm15500173pjw.11.2020.11.28.07.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 07:27:00 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 10/12] mm/vmalloc: add vmap_range_noflush variant
Date: Sun, 29 Nov 2020 01:25:57 +1000
Message-Id: <20201128152559.999540-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128152559.999540-1-npiggin@gmail.com>
References: <20201128152559.999540-1-npiggin@gmail.com>
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


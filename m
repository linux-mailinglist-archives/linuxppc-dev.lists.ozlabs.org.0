Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 789CA245710
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Aug 2020 11:24:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BTsFv4H5HzDqRp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Aug 2020 19:24:51 +1000 (AEST)
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
 header.s=20161025 header.b=oQlIsW4j; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BTrwn0m14zDqRx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Aug 2020 19:10:00 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id mt12so6307362pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Aug 2020 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8C8wdRPXIlS04tUD/986mX054vDuu2PdIQ/xTcAZZAA=;
 b=oQlIsW4jf6QdaM41v1DAzwkm/rUCXyiKKAHM7uRLQyLEF7lxXjR7GmEvQPShvtKNQf
 dETlAFV1UwJxM+uJ3hw4p+i6HjdZ1KaUBRDFnyZ1LZfv7LViQGsume3ZFDlou062UCRW
 JERsTRYkRNxB8GTDfdMkpO6z8LDG5x9/cYyiDL0NPA8A8r/rv4NwzlGCwJiFTznJYcLi
 a9+GxQoBiIh/oEFboZbnFS+PIOXYCRnGyGpdqYXeMHtOssz4U0nXw/L2tDv8F5qCy41R
 eQO0EaYIzsJnXoToRJzFrrJ1hrJkMkk9481LETndvWuLQcDVqKpHKM0dWPQNXgse3SQy
 uL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8C8wdRPXIlS04tUD/986mX054vDuu2PdIQ/xTcAZZAA=;
 b=lkVSB+OVOTHvzz07dD/eTm2jVpzkeUheHGXn91vTygXVrwDiUOOhSHSDNBQPv+AH86
 q5QsRK6oJ2uskPNEnCmuYLO8NKQ6k9Dp7qvo12qTCU3M1596kmEUlrJUufYOCJipCSi1
 Aer7/Cj4eUUibuIkSeX6TWCS9YinAzoBVhRoXs6W9Xv5Vo56w2WqHGmx/Y4Il7ZtaVGW
 g4fK42yZL4KyO699z3n9C9cUFUHveegSkaP8CNl7ts1FPsHUvNNtzWnt9KDf4VL/qLoQ
 gc/ujJWR2l0d8tSVB2wAFAk2SuSFlgGLE3+R8RCe43c3K9DC1/JhRxwyiorB6AaIaFed
 PR/A==
X-Gm-Message-State: AOAM532R4NVMxEU9rBhA8PMboWnFkpSZUsHnwEDAl566z+LBokBTBY+q
 BybgsSsWQlCXvyoJsmVuAh8=
X-Google-Smtp-Source: ABdhPJzRG648jeLeZZ2Z4oujD6qX3vm8KDLEE34yBusy/W9VPlVLdok2Quap0oZrYbchmPfC1Ozb0A==
X-Received: by 2002:a17:90a:f68b:: with SMTP id
 cl11mr8361244pjb.68.1597568998489; 
 Sun, 16 Aug 2020 02:09:58 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-193-175.tpgi.com.au.
 [193.116.193.175])
 by smtp.gmail.com with ESMTPSA id o19sm12768369pjs.8.2020.08.16.02.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 02:09:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH v4 7/8] mm/vmalloc: add vmap_range_noflush variant
Date: Sun, 16 Aug 2020 19:09:03 +1000
Message-Id: <20200816090904.83947-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200816090904.83947-1-npiggin@gmail.com>
References: <20200816090904.83947-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Zefan Li <lizefan@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As a side-effect, the order of flush_cache_vmap() and
arch_sync_kernel_mappings() calls are switched, but that now matches
the other callers in this file.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/vmalloc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 129f10545bb1..4e5cb7c7f780 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -234,8 +234,8 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 	return 0;
 }
 
-int vmap_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift)
+static int vmap_range_noflush(unsigned long addr, unsigned long end, phys_addr_t phys_addr,
+			pgprot_t prot, unsigned int max_page_shift)
 {
 	pgd_t *pgd;
 	unsigned long start;
@@ -255,14 +255,23 @@ int vmap_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgp
 			break;
 	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
 
-	flush_cache_vmap(start, end);
-
 	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
 		arch_sync_kernel_mappings(start, end);
 
 	return err;
 }
 
+int vmap_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C16E22400F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 04:42:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ0cJ669vzDqVb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 12:42:24 +1000 (AEST)
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
 header.s=20161025 header.b=fvgC0Iga; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ0JH6MvkzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 12:28:31 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id d4so4160526pjx.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Aug 2020 19:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8C8wdRPXIlS04tUD/986mX054vDuu2PdIQ/xTcAZZAA=;
 b=fvgC0IgaVGBBCP46Zn2yjyIZBeVrRa8NWp7JGxI+yUxhgJTd3YVhaytoaDsU/lDFxs
 4iHYUOz1X6WPpfvjY4IF1lTRGWy4UjbYIjINrDDfjUjnH8Hv2o6be0jAQjOR4a4F7CLi
 2RVr+OFdQqc/sDLwlZ1kM/3YAAHJN7AadRjMtJsROlN1GaMxJ8U9SxHRPbwbs9d5PTiK
 Aq4OFkLg9VtrOcx/FpLXPv5ctO8m9w9rrlcTOmRnfvSDCUXu9gcTF/7W4PID3Hqf3Iwu
 eaRu+KC82AZk5/OL9BigF/IAiD7pXYIiFsHSf6z1CuFlumZsmCM6WM4iS6Z0hakBUkZ+
 //MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8C8wdRPXIlS04tUD/986mX054vDuu2PdIQ/xTcAZZAA=;
 b=BRPeZ+g6qdpChW2D0vzxNp34ehSUquBx0MqMkdFsVtgi46n32hTWhp3u9a1Einmbzr
 ZXhMkV3CSTg+4Tqhaeu31v9wGBIX1SDV+Al6VE2fu1YtiilhuVvWQZ84YjRPxqeANK2f
 ewt/C5Ze7sfesl3mugOK7YcnE2R5Km45/t9+txkNVJfa/MOW5HgPEs4ZLwNtbxyh3nNF
 h64zdomL0ZMucOPQr8KlKEaSNRQbzqXld3h/o3FaQxHoTxwQysXagl4LdBmA19BI5Gv9
 ajhe0A4OeliZCyLWT5iuRszW1qkbcPuIfYeNQ3OX8NKw7fi5aSf/VYZsjfYFExUq0c4P
 GRXg==
X-Gm-Message-State: AOAM530ma/WYzxNUrIXNb/QHk1ZQ00rfQRGSMGughSg69x04pDhgIj2m
 9ax+PhbKj8B4xQvEaXZLRRE=
X-Google-Smtp-Source: ABdhPJzqg/csRjQI/X8gAPnWHF45ru/8heKZxPOpRtPbcR9UPs4MpJo+AuvP7KubNHtfifF+p8MeWw==
X-Received: by 2002:a17:902:8685:: with SMTP id
 g5mr22059716plo.201.1597026505571; 
 Sun, 09 Aug 2020 19:28:25 -0700 (PDT)
Received: from bobo.ibm.com (193-116-100-32.tpgi.com.au. [193.116.100.32])
 by smtp.gmail.com with ESMTPSA id l17sm21863475pff.126.2020.08.09.19.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 19:28:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH v3 7/8] mm/vmalloc: add vmap_range_noflush variant
Date: Mon, 10 Aug 2020 12:27:31 +1000
Message-Id: <20200810022732.1150009-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200810022732.1150009-1-npiggin@gmail.com>
References: <20200810022732.1150009-1-npiggin@gmail.com>
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
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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


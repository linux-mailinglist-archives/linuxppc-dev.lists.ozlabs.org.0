Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFAC46506F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:51:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J428Z4TmVz3fFq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:51:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gwiKybdt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gwiKybdt; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yj32wZz3c6N
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:37 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id q16so23805567pgq.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vr71fDnYlMZ9ZfKvkOy0j8nvyhhNhUQ/BncbTGlahFQ=;
 b=gwiKybdtSJFUDhe2sAS023GyAk4yk/8RChfx12RzDo7ym/ZL/QCtOVn2RfD6ufziOw
 cCzZqT4Ed98JQq5tznbvQOMgLNWvNjNu5IPoWqtA7CK1Lij4PAtluUGNrnCJI5COTn7z
 LQ71P5Rw0A3jcdA+LG/zP3ZHu44HKxZeEwb7tj8zltQFe2k8X1COOGj4Ola6qpsz+doY
 9c0BoK1utOJNihirhVr2DBz+oU/rF67LM0g5Q6hi2R/jwmMEipXTLdJH7EGUfpYIU02O
 53vhnu/bek9MSkbdB24lJ68qS28OBoap9+BytgfUaUNUJQfi5mxuKLQFxis/HHkL6bqY
 Z8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vr71fDnYlMZ9ZfKvkOy0j8nvyhhNhUQ/BncbTGlahFQ=;
 b=ShD32YalvoHmzKgvs3wGcW+W8Wok0kQsYP6nDuuOakY0wGyWO8XRdEQvQugGlOyzXA
 MW6DEVr2JGVPqZAq/0oocvRUXXRUWpdTuaGcOE/yl6mg1yslQJdDG46qZd6d+JM8ItmD
 VGk76rzZFrvMHof6Qb0wtDVLV2dQOYiK4+92Mye3iNgrep5p+el2Oycf1D7A1IcBzxao
 sy9xNBu/q8hs39jhPgJqgVdXpHkOp0Y4pAfgUvKTqyzJsyfSYYg1issdewP9nXel4adB
 c0gyIy8U0WhTbF/MxPW2zmH+VfJfdTtmnkJ8gnMQKvr0mCEvPfmRWHuBRhH5Uc+F6sFP
 Jesw==
X-Gm-Message-State: AOAM530kaYCc/3bd5JwdIUoGZG6AdkUvm7lu5PtVlU1ZF7PeYVdM6AuB
 0Q8XhLSHRcWfjGf0MT51Fmp8KZ+lFVU=
X-Google-Smtp-Source: ABdhPJzhdPB+aD3PUV2K3dc6L3ZC8A+Ayr5o4n8OaOI94mthXqZAsbx2sdFrLxlJhsmP412E3l7UYQ==
X-Received: by 2002:a63:708:: with SMTP id 8mr5014563pgh.290.1638369755164;
 Wed, 01 Dec 2021 06:42:35 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 13/18] powerpc/64e: remove mmu_linear_psize
Date: Thu,  2 Dec 2021 00:41:48 +1000
Message-Id: <20211201144153.2456614-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mmu_linear_psize is only set at boot once on 64e, is not necessarily
the correct size of the linear map pages, and is never used anywhere.
Remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/nohash/mmu-book3e.h | 1 -
 arch/powerpc/mm/nohash/tlb.c                 | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/mmu-book3e.h b/arch/powerpc/include/asm/nohash/mmu-book3e.h
index e43a418d3ccd..787e6482e299 100644
--- a/arch/powerpc/include/asm/nohash/mmu-book3e.h
+++ b/arch/powerpc/include/asm/nohash/mmu-book3e.h
@@ -284,7 +284,6 @@ static inline unsigned int mmu_psize_to_shift(unsigned int mmu_psize)
 #error Unsupported page size
 #endif
 
-extern int mmu_linear_psize;
 extern int mmu_vmemmap_psize;
 
 struct tlb_core_data {
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 647bf454a0fa..311281063d48 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -150,7 +150,6 @@ static inline int mmu_get_tsize(int psize)
  */
 #ifdef CONFIG_PPC64
 
-int mmu_linear_psize;		/* Page size used for the linear mapping */
 int mmu_pte_psize;		/* Page size used for PTE pages */
 int mmu_vmemmap_psize;		/* Page size used for the virtual mem map */
 int book3e_htw_mode;		/* HW tablewalk?  Value is PPC_HTW_* */
@@ -657,14 +656,6 @@ static void early_init_this_mmu(void)
 
 static void __init early_init_mmu_global(void)
 {
-	/* XXX This will have to be decided at runtime, but right
-	 * now our boot and TLB miss code hard wires it. Ideally
-	 * we should find out a suitable page size and patch the
-	 * TLB miss code (either that or use the PACA to store
-	 * the value we want)
-	 */
-	mmu_linear_psize = MMU_PAGE_1G;
-
 	/* XXX This should be decided at runtime based on supported
 	 * page sizes in the TLB, but for now let's assume 16M is
 	 * always there and a good fit (which it probably is)
-- 
2.23.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 223D1460D1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:17:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vrd71gKz3dpB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:17:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dgW0ssJW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dgW0ssJW; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vfz65t7z3c9G
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:43 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id o14so10999731plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vr71fDnYlMZ9ZfKvkOy0j8nvyhhNhUQ/BncbTGlahFQ=;
 b=dgW0ssJWkGm54bnu7OVVW5VZH1nFAK6n29XGYutrBYrKL/7KixLjgaLF5Dgw3PvFuv
 6TjC19cGhul9wvyyNObdmfjMXhc7K+n4Su10gzG2Vze+Dbe8Z9cRxfK6hZlGMXCOVxSE
 heOa4AQfaUIBg5BCN5sR2UCUy7bomFKY+rKOm/Xhig3pnnQlVoDw36MBx/UHICjvMHM2
 Ux6SWKixhQLLXfaSLyIKovnUrJyHGLcwri8N/LguQh1g0JJbWI39pqYXy6plUpeZr7DX
 kDW0KM7SCKX0+yDbX4wsxKhVDW/VqamT/nDpKnic/kdOdz8rnvGbGoe63hpVopAdemrf
 gKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vr71fDnYlMZ9ZfKvkOy0j8nvyhhNhUQ/BncbTGlahFQ=;
 b=1dcC/6dLOIEWz3IAwuAA6XYPBaipPGt1fAMikUEkapEZOVtyvD/maIfXb8FC9cS8aI
 hRZZKEpPNDzwXnxWhfeyDi+mqy66MyNadVXoWSfE13v87QvKBlBTeBhNre7EgG3QcPST
 z8O/zBF/CqHgttwalWYdmZ8WRv26ujQm1kBRkT7dUFrr1Es/ylRocEdXra/ZsQ6W2fxa
 JAl0xZCs3I06FRpj6ToW6hn1g7PckhtTepNZHc9cLCt9D4UZYbQqpcQ6PKtM5b1Ne8pE
 q9MWLbn5Hs77EavbE35uymJjWY6/4m8Tg+sO+yeWB+N6TnNOVLWcbChuKrn3Ao9i8c/I
 3Ikw==
X-Gm-Message-State: AOAM532i+wQMiDtJn0KDmGolkT6zycyGHxmWMEA4CzWXDYAJhKXwTcGU
 ivlemgnigKzCfPHIcjoh6zW6j3vN0Xg=
X-Google-Smtp-Source: ABdhPJzt8o58ycUIv3E0MjsdGiRSTw4woA2PVEdct2bbbEpygme8/AZ0BeMOMJFIYOlHSpEkFADHSw==
X-Received: by 2002:a17:90b:190f:: with SMTP id
 mp15mr35185869pjb.210.1638155321693; 
 Sun, 28 Nov 2021 19:08:41 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 13/17] powerpc/64e: remove mmu_linear_psize
Date: Mon, 29 Nov 2021 13:07:59 +1000
Message-Id: <20211129030803.1888161-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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


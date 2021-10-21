Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69760436D9D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:39:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2Tk6mR8z3f8S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:39:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lstd1ge+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lstd1ge+; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2J26bfLz3c5m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:30:58 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id oa4so1557387pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WO1bZlr7ufesKPtpLR+xmlqKf+I9UOlWA1x90//1/yo=;
 b=lstd1ge+Jzfkz8FuQMFj0OjA1pSbGL4WU+f76adbsIJMpZUJasno+ogrhQf3oMzEaR
 OTQL6fl/f26TuKhmPBlI6BhqiFvZE/J9Xqo46boRyjypeNQJhO/AwSwja3OVKhEQix9m
 yFx49UT7sO3bL/ncP/31MozUUBcoYPojohLEPGTwYirxf0Eh8MjWSq2getm82ToPQrFE
 cHnM++hJOlnl3PJVkE/ULT5OktJuV3McGv8FiwBMEd4n00Gum7XCXa1h9chedmbabPho
 DnZSKAKrg0tyGS0twpj9zXnVtrN6e8cMaqchx7B2Frp90SCOH10dn+tW92sWRg3ECRvg
 CBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WO1bZlr7ufesKPtpLR+xmlqKf+I9UOlWA1x90//1/yo=;
 b=1fxM9Q9brYFj3am1YTBR7ycek1SrfYAsA3zBGiMThK6STC71viSkOzT6fhZrDClMWo
 yCT5uAd+UOemLOOkoPMWNPkcgQq/2B6Rw7IKJCEDOZZKioDxEdh+/O9zvXbfAft2WL5G
 ix2fxyLjqOER+msO6XCS3N4S3bHezRrncDJltQUYSLYd2dtSxTdgBe7bD6ZYUungTcOR
 GJyXaONt9uW1inUhBXk6aWoFsuou1VVfYbRnc0tEtEGfb98/9nRgVk3ZsOWZOmP/QT4/
 2+3d9zifeTzJm0MNm9oHI6CKTr/v8CV5yeL6TZLj3K11Kbj+oDHM7Hm1bAqsIB3DRrIS
 xP0w==
X-Gm-Message-State: AOAM533Gn5V3HnGqIRLMfCteIkltMnbROGZUtJWJMOvO5astdbE86Mtv
 gkHo+ETcgTjPxrw5UvYQEb/8AmHur+w=
X-Google-Smtp-Source: ABdhPJwqGrfRBzllKIceRaDgPhzvb85qpXZvcwM1OjrZ+lxxS5IkwsUfJz+PbKFQsHX+bXtf66K+gA==
X-Received: by 2002:a17:90a:2c02:: with SMTP id
 m2mr9965190pjd.109.1634855456444; 
 Thu, 21 Oct 2021 15:30:56 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 13/18] powerpc/64e: remove mmu_linear_psize
Date: Fri, 22 Oct 2021 08:30:08 +1000
Message-Id: <20211021223013.2641952-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021223013.2641952-1-npiggin@gmail.com>
References: <20211021223013.2641952-1-npiggin@gmail.com>
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
 arch/powerpc/mm/nohash/tlb.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 5872f69141d5..8c1523ae7f7f 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -150,7 +150,6 @@ static inline int mmu_get_tsize(int psize)
  */
 #ifdef CONFIG_PPC64
 
-int mmu_linear_psize;		/* Page size used for the linear mapping */
 int mmu_pte_psize;		/* Page size used for PTE pages */
 int mmu_vmemmap_psize;		/* Page size used for the virtual mem map */
 int book3e_htw_mode;		/* HW tablewalk?  Value is PPC_HTW_* */
@@ -655,14 +654,6 @@ static void early_init_this_mmu(void)
 
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


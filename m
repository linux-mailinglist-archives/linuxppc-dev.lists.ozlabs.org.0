Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 694A977350D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 01:34:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GmyaVraw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKXhY27bMz3dG3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GmyaVraw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKX4M55pvz3c5k
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:06:11 +1000 (AEST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-56c7f47ec42so3600576eaf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449570; x=1692054370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XaHpTf3P/utbT17OPG/H5MolPsiYyRMVXSdV5AvoHU=;
        b=GmyaVrawFabDS7oM/FJ2wsqOTnvNiSZkWHllyllBSGtBhNSpEmhqjU2xmr+48gvMwO
         LUXnCk58UhmfTImv2R4R9LNF0+WlzxXIVQ4Y7ZC5fEeHoGrn0o/ogRSADB0Y+NluFrtN
         MrrlZ4Lz/gi5878wRIWP06wgFFKVx+8i+ghKFpBHekPx9T0p+3sqj2xh34rznNB4nw+U
         O7FH+uzt41O2vvO9FAauF/idvM9r4rw7Q35Wwsa8GbYTT2MLxcQcKcfZ8291m/c55wrV
         URc64VPnBpaXKs/Bni+oDqsCjGnYy/ppZbjbVbnispVrc0PlqosfX2g85SuErvT0W1h1
         o3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449570; x=1692054370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XaHpTf3P/utbT17OPG/H5MolPsiYyRMVXSdV5AvoHU=;
        b=ZTylFmO7XNWzA7LbDg76MeFF0B4naKSElX+bUFL0IgVFdWwJn3lJShypQoqfLQhYSP
         Uw8JD1u9JO+KIxGig5ErT4vjxqbuqlcoC8W89LdLcF9raTykGCt433Q4g9QXZx4gtF/1
         7eX0vgDrMdmbl4zRB9CcczgmR0JfP8DElw/4ovX620IV796ZjxSGsGK/L+r9OkLA4K2y
         QvSKcmmua81naawX6f16bRFtT51UTgXvdIvTRG+FHGQTrby1IdpgWillCyAK1rEW76tE
         zEpzstxPjQmzvW2XPUw+8SPC4ifkfVwLw58zyeraMMFdM0KXLbrblcPVnX0+7zUI38u7
         BL/Q==
X-Gm-Message-State: AOJu0YzQO4Vaw3Y558fmEy8Unhggm/3MrpjZFtVr769YuuCLyFR35rJe
	7B7+0hPVbWluZM7Nj3sS344=
X-Google-Smtp-Source: AGHT+IFfR71b5uGC/N7nUJvkV7EEf+q4ZrD/2jbgt4p5+XAZUesJuHroaMR2T6Qu+08oLKK4OIq5Tg==
X-Received: by 2002:a05:6808:1997:b0:3a7:5314:e55e with SMTP id bj23-20020a056808199700b003a75314e55emr14747526oib.24.1691449569767;
        Mon, 07 Aug 2023 16:06:09 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:06:09 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v9 25/31] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:07 -0700
Message-Id: <20230807230513.102486-26-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Jonas Bonn <jonas@southpole.se>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..c6a73772a546 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,10 +66,10 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)	\
-do {					\
-	pgtable_pte_page_dtor(pte);	\
-	tlb_remove_page((tlb), (pte));	\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1


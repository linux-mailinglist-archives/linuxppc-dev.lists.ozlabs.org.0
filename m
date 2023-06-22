Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5592173AB80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:21:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=F65orfGp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnCx51gycz3f3k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:21:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=F65orfGp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnCQj1hbDz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 06:58:53 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7653bd3ff2fso79938485a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 13:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467530; x=1690059530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSsj72OOim1moFehILf4IJ+e4eXIj/xtfG6kDsakLCY=;
        b=F65orfGp6lPWpCrD9sAMHQjbb/7dPkBeEZwnbqaqoaG+jHKHFKOpyv5U+mRswUePBl
         O+w6mgJQE0929R7HfQnempO9NwPEm6qT8tc34OERTuMiOZXiohUbt3LRN+VbVJEKUKkc
         tcmSj8t+FV4PGg1S/0RDnwUBY8C4sUVvlY/c/d4jqvMe/jl29yqPCuiM1limtTye3/Mt
         Xl+0XJrX90O7Fe0pzMoOa3o991eJyDuyXmsTPhqv2ERTFkUraPYZpwk4UgntXrYBzy7x
         tG0gCzAga9PV8hPLOnhqVRtX7sCVqxvHBH7A5BvtHK+faRxZPp8TVFIuHWDaefij0y+Q
         y3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467530; x=1690059530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSsj72OOim1moFehILf4IJ+e4eXIj/xtfG6kDsakLCY=;
        b=i2DzU99j4WOZNmVqnAnNRcmc/yVD8chQypyB0jCAp7QmhjPR9AxLUbNcp6AenRshKp
         G6BoZroQO6y710VAPz2RmXSQ1ZOcUznEKy7vim52E3JjUSPUSdEJTZFoM/uU49tB/SQJ
         bUzPnH0jOJZmV5GmKq8h9o5bKVB6F4Y/zIQ6AWRGvCNxwZYx2UJJxXi0ScF13aE7D/Xs
         hYfhiL8p91q5NnZOyyA1q3BejbtDeGpl/w3YSSqLrkdTkxfSgV269rfbuZ2eLPZiL1Pk
         U41c0enq4sw6Q9fNsWSiC1HAPIr9rglzJWTuBxZ9UK5eSJAyy6kp8onYp+Ab5LngeFTX
         0VTg==
X-Gm-Message-State: AC+VfDyPeIML+002AqvpyihTnPK61Rwg3PQwh/mBb9U9PB58fOo6/2Qc
	NaDlT9YmI8BkTH0rl7CjcLA=
X-Google-Smtp-Source: ACHHUZ7lI8iuHKQsEsdck4SAEFHmt9QQs6haysqfy7wOJRfjq9Goxv7w27b3gm3WMVCksX2Z3AB04Q==
X-Received: by 2002:a05:620a:84c:b0:762:883a:f5a6 with SMTP id u12-20020a05620a084c00b00762883af5a6mr11201137qku.41.1687467529856;
        Thu, 22 Jun 2023 13:58:49 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:49 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:38 -0700
Message-Id: <20230622205745.79707-27-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/nios2/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ecd1657bb2ce..ce6bb8e74271 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-	do {							\
-		pgtable_pte_page_dtor(pte);			\
-		tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)					\
+	do {								\
+		pagetable_pte_dtor(page_ptdesc(pte));			\
+		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
-- 
2.40.1


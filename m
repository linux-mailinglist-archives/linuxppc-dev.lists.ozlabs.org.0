Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A87CA73F2D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 05:35:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=m20u0ufi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqr1y4DHxz3bXT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 13:35:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=m20u0ufi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qqqbw4CsNz3bZn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:15:56 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-570284c7e61so43272307b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835754; x=1690427754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=m20u0ufiAKGaCJ1eF+oXsWKBIRL5JTjyvtae8lqFZvtXfIrM7cJtjjAu/m4Uz73Z8l
         2OzyWyLCkpN3ueHXh3OYTXgBp8fMDOqyT852NuEeBcWkgEMJmVKnx3KmXsByRx3AKFHF
         Vg5wuji9LMQRgJRH1HqmX3jxPY497r0xZlE76FEouiAeDZpP9QjhFrAgiTXpIz8r0/Pn
         raAur9OcS2AWjvRxW5kW7BBQEK8M8XOe3JN2fYON+zb1b/iUEGPKmhswAXipr/RMjiJ1
         5Ou/YPdkNRNCdvvgrCiDyHNc6JnGXPl8TTudPcGz7r3XrC0of8M4idYi+6qLUVc137gj
         TxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835754; x=1690427754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=l8RiS0Q36PQg8UlKvdMI9rLTF74q5HfM3r4a3tOngdRcxllUQIUarWANmIEiEoK6dg
         EyAsYf5VzCDsse0ZTl9Mdsa1IzlS5JdiRRcVKBqLB40zDYhRrchG2L2ChNm9puMgAl3O
         Lhewuoepaqh7Wx+VTReX80Y6gPN+6CQAzvJV+Zp8mFWpa0XEON9V92deRMdUr2UrtKsF
         PuEny76f6uicJhFLXCFfzmZgTLx+vUdd9x7jqgvlNP4Qb7MtJhee3VTNdAzpPGuBry+S
         XxGAzfsChIqNDHa4oI5tLffUEh7b9ZCMuE0cWoB7RBfBr6MEto5cN3ptzzyZoDVKVdy4
         T5/Q==
X-Gm-Message-State: AC+VfDxeICsz0T9cT2aAmsY7DOEJDaKZkYRA7bqkF+W0+Ys2BhzNeMa2
	5HXSeig1FtzBXpUHr19XGCU=
X-Google-Smtp-Source: ACHHUZ5MOzNqvj1LDJTcnkC+L2S0i67qvPaFwWjlYeZ+6A+ljBIE978bk3O2AZxZRJ0D8kmPxN2z/Q==
X-Received: by 2002:a81:7189:0:b0:56f:ecdd:ded7 with SMTP id m131-20020a817189000000b0056fecddded7mr30983642ywc.10.1687835754377;
        Mon, 26 Jun 2023 20:15:54 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:54 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v6 22/33] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:20 -0700
Message-Id: <20230627031431.29653-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/hexagon/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index f0c47e6a7427..55988625e6fb 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,10 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 		max_kernel_seg = pmdindex;
 }
 
-#define __pte_free_tlb(tlb, pte, addr)		\
-do {						\
-	pgtable_pte_page_dtor((pte));		\
-	tlb_remove_page((tlb), (pte));		\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1


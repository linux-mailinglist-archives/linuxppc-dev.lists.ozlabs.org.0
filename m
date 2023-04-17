Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6476E7858
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dYT4Pndz3ffZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:17:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DU+PC+Lb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DU+PC+Lb;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0fQk14Gdz3f53
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 06:53:17 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id kx14so7223697pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764796; x=1684356796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=DU+PC+Lb75+sxyzE8TFBhUq23MhtXNiuA1nw0c/GhsuV5IK3M7l/Hh4azDLq1DRa+j
         fu7HXiEzvV3T+N5Mt1is7DhkrUBl4PJsqFnRPYaX3oFVj8P6Qlk5ZLs6mljyu96mU+sv
         zpquQbUhbrKn4GUU7udC1O03s9ThOPwnMOZQlJkJdwRy8ikjPxI0naLAwtnZbb4WzEoy
         3BNpuQVnvIHEKJKSenAtt9bKOamb6q7fxWlfz+PtLFjOTztncr7nNFnGXeF7WX7UQ2CN
         r/J7luQKDmaqSpU1aG4/YKRgzEf0E8SysEU40ARw1q6PEFiJTtJVgg7dYOEMGKOTGrN2
         xyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764796; x=1684356796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=BZd2HOOvW0E/RHk6kzT4d0v/r5Sz2pqTNGv1Sn8y/y02OEt6Vxru7aOTYWcOr8Kq11
         QSXYFuCsMwrPUyv8PS5mpEkL4700nfDTryvFORM3aHngZBpdHmqpIKyArYS4KU9pPh5l
         9O9aGCpZUNdrY2BK8A0DZBWbEpfvuoaz0WmcJxRBocbLnjaiAOP68lOAsttuSERORglQ
         Um91uOsD0buqOWCOZq1MIlEXqbZF5D/5PtFEVMX7u1n06eFmf7uliLPdDzc9JlJJW8Ax
         OBShAvWMNqrAPHb9UY5Ls3npkB+7zKmzR1owG5jNDy/WcVQkV5Ngw/G3/+wOm84D2oZ+
         4PIg==
X-Gm-Message-State: AAQBX9diHNwVF8Gbe+YKCW0eSiBIuOL0eEDf584m+D+FXdsP85Vc3Xj4
	5FPJajftNS8o0jeNHhNXgyg=
X-Google-Smtp-Source: AKy350ZcoHXe5N321oYs87Q7Ayd5DnxwU4W2BhAi27QaGMsyV7i9NrgOQAsujiVTD54cy1B75qhHjg==
X-Received: by 2002:a17:90b:3b8c:b0:23f:9d83:ad76 with SMTP id pc12-20020a17090b3b8c00b0023f9d83ad76mr12727299pjb.23.1681764795745;
        Mon, 17 Apr 2023 13:53:15 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:15 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 22/33] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:37 -0700
Message-Id: <20230417205048.15870-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/hexagon/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index f0c47e6a7427..0f8432430e68 100644
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
+	ptdesc_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.39.2


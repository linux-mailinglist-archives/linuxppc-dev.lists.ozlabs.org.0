Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBB37734F2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 01:28:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gXJTXcEv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKXYq4Tb7z3cPr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:28:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gXJTXcEv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKX4C2GxYz300C
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:06:03 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-ccc462deca6so5489248276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449559; x=1692054359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5tIdqLMLMEIndKmulGbjbVGcWP2eiFuISuM6iDOZlQ=;
        b=gXJTXcEvyVT7IoetVDXBwB8IPw8UIwzytrLAqRYME0pNQ9C4uggCnI6RPeBYUmiABc
         NGa1RjP9x6Az35hUll5l4sYYgp98uBkULFey+10bJthE9R/J1BfMB4fjSuNmCpJ1YXG1
         ARmLg59bINaXUvevzM80HySnkL9LRFKwNZ83rXMUa4P0U6g1vYwZDB00ToF81qaBEF1+
         SCcl4G/9B02tlTVDHjLxfkMGL5hqppCgW9NlCKGjCO3XjVlW37imlXi2cPPjZHQnQLsK
         WyhHmorW6P7DI7CdyMJrfi88WQs4xcY1ld9fhabvXIyG+tqrpY5PfVFDlBq81eHbR+r8
         HFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449559; x=1692054359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5tIdqLMLMEIndKmulGbjbVGcWP2eiFuISuM6iDOZlQ=;
        b=dPfV21y6QNtRpIcTofQbTBWUaU8mJ/x5IyXre7ILrY3rA8YuJa/x6C2QaZytLBly2Y
         7ZNvQNknn9Dd0ZM388Wk9yROBiDCwIyGIYztZUl4unVmShKu2DOpU6+HL2+g2Fn9bYhP
         TcggWoxSWYOZC7pF5M28D5KqhRXQ2TdsC7K6OUDCfhRY9p28V+GYqNXUdRvdETdmxXBQ
         fib8aGssSBdCeYEDVDv8o66oUy9/scySDRh0bOsyO5NMcLXrlUF+VG0AR2Nk1Ex1am+8
         MQmTn2Esk2xgdMiKkjnUvKkfdE/y8YuMuWirTX6Ggnpiizisuu/G7vilMXW+bJqWq8cW
         Ad/A==
X-Gm-Message-State: AOJu0YzTuSaDcNQIe+60vqoNINSOHCdawIcYgumk/vP8yrM4mCTgZHkc
	vZVLZO7AfHUa+u3Y8cFpX0o=
X-Google-Smtp-Source: AGHT+IHgbeu9fOmMS+FNlr/kvyOX24cSJUZ4nRlF6aWfNWe7W/NjYriU1Zmx+jVELg0QXXl18qiXKg==
X-Received: by 2002:a25:4b81:0:b0:d4b:ec36:bb85 with SMTP id y123-20020a254b81000000b00d4bec36bb85mr7290071yba.50.1691449559015;
        Mon, 07 Aug 2023 16:05:59 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:58 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v9 20/31] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:02 -0700
Message-Id: <20230807230513.102486-21-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
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


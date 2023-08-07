Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E4773515
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 01:38:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZmZBlK2B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKXnx1zy1z3dLW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:38:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZmZBlK2B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKX4b08CBz3cNP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:06:22 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d44c2ca78ceso4742226276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449580; x=1692054380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9QlLO1dPeyZnWI5hHw1TuJlTK1nfQVgIvIYX0JocUU=;
        b=ZmZBlK2BE47dPXTqc8IQ1uTKCUobrHijjQnotS76WbJUUgCGVOPFVEmsLAOFQve7Mq
         8k04A5/AuFSS607BBJG/Nd5XpAmnH5zPypJPEnlo7r978iqN52fpsMDyDxOev3Z41hLb
         CpvzpxqdWGHuM0xgZvYoYbOi2GTwb0pfPUe0oyJziB36Q6lozhNOIAq2JTvWjnhFdQ2U
         4BFxzsH5/HG/XXl5/YPVavhDi3L4gvkLB1NxxGw9654yYac9diJlEe3+5Z8y0K4G8C7u
         mJwXJ96QObfNW/oMJd7PgnIP4//NNbVjGeiAj0SJF/1wFKYAbBETcCfRmwi4qkbVDTFa
         RY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449580; x=1692054380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9QlLO1dPeyZnWI5hHw1TuJlTK1nfQVgIvIYX0JocUU=;
        b=l5KD/uryDie4BSbTSMAPU0D+HOhlzy2XrWzs0HElc383FOwB6vL+xVqHw5UHVlqaTX
         t1yRT4XxyWZJve8RikRArQicOpIqMmZGto0ez6xNZSYct4/duW9J3nZIEWgKE7dPBdkl
         ln9ob2/RowQ0P/c6CPuW4aawLiLQxT2t5a8MGzQsEzNSVujcP4/zWuCK2qoRHwrGhH/4
         gtAhx2xMzA59f9p2MjNHdq0DHgPUgmaoKGMVT3h1fv9M6olC5/MBreUPc4J+ZeCeyOpo
         9AE/gmwGMIk8vkAmduYDTRqJ3P+FaDoMYuBHu9CRt2nLcFZhlpgB4W0cTpaaS0IzKT8m
         M/2Q==
X-Gm-Message-State: AOJu0YydPhU222+v5+g9hjOpeHIrbDBpogwrD6pTu5+jN0bof7nzQxwj
	KTtyPqqYpvcpWmDcHiSgR3M=
X-Google-Smtp-Source: AGHT+IFhMlpHJ+7onf6BYxf2ZEVLLZTaCynnVlAbd/4Vka+RTYiQ5OXzXPwOq0O9emhI9trC6wG3Sw==
X-Received: by 2002:a5b:f8c:0:b0:d0b:7e30:6d17 with SMTP id q12-20020a5b0f8c000000b00d0b7e306d17mr8498276ybh.14.1691449580620;
        Mon, 07 Aug 2023 16:06:20 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:06:20 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v9 30/31] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:12 -0700
Message-Id: <20230807230513.102486-31-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, Richard Weinberger <richard@nod.at>, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..de5e31c64793 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.40.1


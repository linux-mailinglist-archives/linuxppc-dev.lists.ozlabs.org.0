Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE60C72D35B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:33:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ciZzI2nn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg4fn5Tnvz3dml
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:33:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ciZzI2nn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg43L50Lwz2yHr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:05:50 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-56cf913434cso30441917b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603947; x=1689195947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSn6cSkj4IeRf8/BsqHClLl3fDsZeC4rpAPYblqUB6Q=;
        b=ciZzI2nnG7zqntS0kYws3Bstzr3nXcXM7AVbRLfJcQTue8B9i+jyLvzKLDy2A9P30Z
         c8kXhocxLYHnQ/QqwZQBscO/Jnyd5DcosG/E4dwS3uAecJsY0Ja9Z3xqw7MsgC6nHjA4
         QA0ciLqLZYMqWOytaJmxjnukXuzthDnZTPicAtRgEtVTuV0GYf1zJiBPTow39XMnG090
         B3bVtajux9wQLuem4VZP38wdaF1Bx4OpAJ5RgPldzLuFMNXFpzdfCqZWClGqvnQMYt00
         /HHhjhqAxABJiO4Fj5XqD6Wx6l8ZOt09hebTgkaibUDXMgVCd7dGCAjsjguwOTWs8p4I
         GZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603947; x=1689195947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSn6cSkj4IeRf8/BsqHClLl3fDsZeC4rpAPYblqUB6Q=;
        b=gwC2Sd4EM/LCo7v5PSvFgHtGx2v5qOEA8YRv7kR4iitTmLpIIbQnnIqKNWJTK4NQqY
         k3kupP1VQ6OaHBGqGfrYaDMd6DS7+TjKimGjmMEiNEam2rpucR9MtcbSf+UCmJ8YkRkP
         aIUjHA/PtEFsYHwQ7tvWYs/WSPOXcuZqPHNJEMKcsCFq/YKPQwUsfCihcBv26tTQ30vs
         Wq7smy4mzqfrTq/FW1cgV/99jZW2iE/74ZT/adzUs46kQ4KqL40kF5MO1sHBtWeNQzzU
         Wwu210WwCu1mokFH79R5TOzHjXbNB83TOA4Vd0X7hOMn1v2C7VDBVfFxuFOmjV3q76zM
         rhsA==
X-Gm-Message-State: AC+VfDzgOhqXeHDvVVT6ikZqkwMHdCEo9gfxd2gN3MGtfmJJz6CczBdg
	TpWWMvtjUXjWLgYOCctgN2w=
X-Google-Smtp-Source: ACHHUZ51WXkZSpSQz/Euz4h9t2P7hzzB/r3I54c+WRfw9gtRQcMJQg//XHj3D4qG81G3nuV3fW1fKw==
X-Received: by 2002:a81:49c7:0:b0:56d:540b:ed07 with SMTP id w190-20020a8149c7000000b0056d540bed07mr513566ywa.48.1686603947200;
        Mon, 12 Jun 2023 14:05:47 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:46 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 30/34] sh: Convert pte_free_tlb() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:19 -0700
Message-Id: <20230612210423.18611-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
 arch/sh/include/asm/pgalloc.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..5d8577ab1591 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_SH_PGALLOC_H
 #define __ASM_SH_PGALLOC_H
 
+#include <linux/mm.h>
 #include <asm/page.h>
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
@@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
-#define __pte_free_tlb(tlb,pte,addr)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.40.1


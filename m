Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B976F3880
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 21:53:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9DRR0PxSz3fmZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 05:53:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AK+jJQIn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AK+jJQIn;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9CvL5wN1z3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 05:29:18 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64115e652eeso29041939b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 12:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969358; x=1685561358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aCjEZJk/he0B507v8WHbAo+ayyw9u0whNe5hSh1Qc0=;
        b=AK+jJQIndwyipvZ3j74RRrDCnGWb55RfRTFZCAj1QjfEP6JtcEnkxab8VHfUxlnJqD
         nzyDIYAX6jvOrQqc9g/TswPCkcqNA0B0b+SVKLMEmNApHkelPozzZarkoTrP2UobldQU
         E6NqDV1CfueV3wQaPICMNftiMflroUHircwtbGv3hyeRwqO/KqZCxi3BNAP0dk8lYID7
         5OwqBACQpi+nvrf0goZMdOfhVuRwRiXsUHvkFH+vRl0eIOaoeix6IqEc2ZJsYZWlONhr
         qoO4S8rXijotpMJHxa1FWYbjKdY7R5WGEGDzLNmBq3rOIwjAHcvHuIBKVpOdfgv+tSJ1
         RDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969358; x=1685561358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aCjEZJk/he0B507v8WHbAo+ayyw9u0whNe5hSh1Qc0=;
        b=MxcbRWSzJMX5AdjVMQpXV0f5tINLce9dG+HEdsm9Bxm42PGbWdxQeGe8Eiur7F0osP
         HxniTvq3lXLYAYxSFmtRm0ChwxPoibZ6CdhTPchkAGyva70cnFqDyrXn6F22uiTvfNlf
         PfwAcBrtNBC496e9KOnkQMyA95b3w7zMuH1pWJJ/awGdpZsk7G1aJuMgWTLkUN/vHeS/
         I3ckUX9DGigEN722WGaeuFNNBCvW8LqzcHJMDEZ+c7Oi8WEYpwHneKeNb724P+tzu+u8
         lSgUFtTWRLzwEEe8lrorarvFYMVs1NsIIANb1zyNjJtKpLcCaqtvloXIatikWDe+nXPd
         AU7g==
X-Gm-Message-State: AC+VfDx2j1EdIhizzExSqAUbS++yB9nJk7dlh4AQ3uCvUVOPC5jo/DBX
	7/omvVyphWOFbS2wAkgKGcs=
X-Google-Smtp-Source: ACHHUZ6t8R71ld5pjw9YJiJ63m1PjvmCLBjw2ONvK02V0vikRtqecj56I+goZm4GypngOeaNmv5J/w==
X-Received: by 2002:a17:903:2307:b0:19a:96ea:3850 with SMTP id d7-20020a170903230700b0019a96ea3850mr18111173plh.17.1682969358236;
        Mon, 01 May 2023 12:29:18 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:17 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 30/34] sh: Convert pte_free_tlb() to use ptdescs
Date: Mon,  1 May 2023 12:28:25 -0700
Message-Id: <20230501192829.17086-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sh/include/asm/pgalloc.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..ce2ba99dbd84 100644
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
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.39.2


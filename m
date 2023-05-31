Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F260718D87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:51:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjd81p3Bz3ff7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:51:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HVGvjPgu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HVGvjPgu;
	dkim-atps=neutral
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjBz4mqMz3fH4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:31:55 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5689335d2b6so717117b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568715; x=1688160715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELrYSGf3rZcM0SKncNLanyoUH1rFlxcI1YjdtaAHWOM=;
        b=HVGvjPguQLfPfWkiro39nbW+VW4H5uAeLDGXOc+QtDych5ss5NctDwcG9I1c/6SDfz
         APKwygjUx+f7skr0RtKISqSCz+AX9pojhDKoYcMCQyYniYHupBRU0wOHCUoFqOcXQqMh
         s5WPVmf9msAVfThs98QJDhYbBO3Us7PGfZ8s6z4W61niHbKtctIY2nt8en5Qr8xNSORH
         CbV2Bk80OmBOMZ+UG2sJggDfKIMsAz+S52UtEmTBG7rQO3TOu+Ov8Sc+TVK0fDYwDx9u
         QGgal0w97o+Ln3oc2qepS23J75YM3y/Dwt4cq4bO+YUzmRNBHe7fo14HmAPdP2J5Q06p
         Rhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568715; x=1688160715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELrYSGf3rZcM0SKncNLanyoUH1rFlxcI1YjdtaAHWOM=;
        b=MI5V95QcSVBf3my7G31/UQH8EdOiG0/6FbFaKQ+viYNtL/vDKkyRBe2r7I1YROry+W
         S7dXTdE/hKh+UT7GpauGkDK4QnHxbukP7X0PtEC0os4QKFH752bGtV65nb7Uy6UosLCF
         OYvRWSUupvwv1mTtNju8II4PBOHjo04X38joBQ/AceBhkiCDLaspXvc5xyX54mPwuoT9
         hOGHIgw55SVfZM5N5RG7UcXtcxp5irQ5e+q5cKiG5gq0pw6G67qf1+1rTlBkoVegElWU
         JkaAcc7u86hV7Wkp463cgspVoOMLVk2PfaZv1hC+e0bhiTrd4vB4GvlALrZmf4JpysFc
         1FiQ==
X-Gm-Message-State: AC+VfDzU36VeMv4VzSvjb7+0FNwkL3pa2Gol8l9LDIgH5SQKTyzO66o8
	uSS2iJdKjGioyfBr778LW4I=
X-Google-Smtp-Source: ACHHUZ7KZYp2khjpsM/eLpOUxorXRdnAb+nMmuGE16o93fcYthDjjOgaXk5MabZ2W/EzUmWY8vgN2A==
X-Received: by 2002:a81:6f06:0:b0:565:cef7:92d2 with SMTP id k6-20020a816f06000000b00565cef792d2mr6456173ywc.21.1685568714840;
        Wed, 31 May 2023 14:31:54 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:54 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 23/34] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:21 -0700
Message-Id: <20230531213032.25338-24-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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


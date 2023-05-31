Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD211718D9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:56:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjkp3NNdz3g6k
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:56:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=R4JOyFF5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=R4JOyFF5;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjCC2j2mz3fPn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:32:07 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-565cfe4ece7so751557b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568725; x=1688160725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1x1J4vur13K6ienQiLVxExje9aLbKUsjVFvIhcqO10=;
        b=R4JOyFF5oGis8NxGU8pSpePc9JPXMsijgUHIihoBFDMX7vxfyfSgK9gS7L9vsvgMnj
         MoFYSUO2hucvt6EXtvpP7cclM0FlcdhnlFMXLdspy+TrRtUW4byNtMBbPaBMOtheTLzo
         JyXpw6dclXVn5TBmIUwO4ll+Dwj2sxioBm1tcLfW7tR6/lFa3tmkjwZ+b2UxBU9kd/xU
         9674/17mKjyw9zKVkY7JTqJdm8j6Ukk6MApKOQVf0MMoClbBMESl6AhiCYUKK1tGclZh
         a/IF0OWr+we0YPVHDLrOdoGrQ5ob2G14WJkmdrRtqm2pP0cB8C0ATsRWLlC+f5L22Z3U
         c7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568725; x=1688160725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1x1J4vur13K6ienQiLVxExje9aLbKUsjVFvIhcqO10=;
        b=cNh/M7KAuCVMaCq5+97KPekX+M50dewzUCPbxGYuNm45V685DFbtmXW/+8xLIcGROL
         5GYjVDZha36ifYpFkIq7hpDwAgyteF2E/b1ZOYoEL/ephvWOqLnmLifs+XFovEHgiUr+
         iX2slq+o1YMndeow6sPfQWzmesmvgEkRtWIrztIAmbrbEayjc644jzOGtSuyz0ROYjAW
         VG63AOGUjmKuoS5Vi00JT2w0qdcXvGfMqhPdLresZd82wTmSWLd+rCHRRlZNUuv3ndnF
         /ABwexxRFpRjKKn9mcRIC8P270T9NQDmV+g1FY/RgRCyav16E/tONZMTjLdR29FG+Bjj
         AjAQ==
X-Gm-Message-State: AC+VfDxgDgVOJg/TH7hjlZ+Ib4lZa3G9CpywHfFAKcyQVdxjmkJ7FtcO
	GCfUgfqOAQoFsGnS3ZPAxU4=
X-Google-Smtp-Source: ACHHUZ7OmIDubddXjmsfBoe/XagN9Nq+I2v1lq5kjayLp/xLt6wDO/g4P/XIV7x6OHxU5ctdplxcBg==
X-Received: by 2002:a81:d246:0:b0:565:9d27:c5e0 with SMTP id m6-20020a81d246000000b005659d27c5e0mr8010590ywl.2.1685568724694;
        Wed, 31 May 2023 14:32:04 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:32:04 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 28/34] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:26 -0700
Message-Id: <20230531213032.25338-29-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Jonas Bonn <jonas@southpole.se>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

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


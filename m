Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD36F387E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 21:52:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9DQW0wPVz3gFj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 05:52:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pbOgq641;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pbOgq641;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9CvK4gN1z3cLr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 05:29:17 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1aae46e62e9so14579955ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 12:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969355; x=1685561355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2PCFvKq9JWcIC4Exd9oDYO0v0PQOHyXRap+yEgbOb4=;
        b=pbOgq641Q1VbKkWYpSKEOBTaJbK7N+gn3tPQxAnQMHVxsbuYS7d6gCFZWWRyAoJPvd
         QWBoalX7ztTkXy1/S77S44wUsaYiw+c9l0pjoAvj83RwanS2FHVDTD9b5yLt3dvSiRkC
         Y6FbuRkXeTez8mU8JwqFdJ8q3udPbLVyCGPniHNdmE3Bvis2G1N5Cf54GBHK19m19dh2
         ECy1qDfhwNI4K2KlZeZKdUsb//pSuTNjtcr9BAZz+ZE7jjtZb0g8W7o+eLshkW2fWRhk
         rjbBHucvZ06kdc4e0Uijz1mCvV4V1RY1P7Hdmh8XbAUQYZvgzIuSpNmzClPaEZvw/eBL
         VKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969355; x=1685561355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2PCFvKq9JWcIC4Exd9oDYO0v0PQOHyXRap+yEgbOb4=;
        b=gwXPru1RKrufLdEW0ien4hsJNxPEM1TxfPu9zCOkqC0dSc7YOBP+meR4yyW2uRhCkC
         KnVj7VBBJLspFjMYXq56+jMugxMvBftbakBnhE/yZF3gXTr7VZyhUs6OxGAwzeiPqlVW
         4aKlZe2qYmrI74CcKNBtm4X66nYznnWfB0radam3PXUqldp74jullOnwa7XyGuMJYi5F
         rOl9SQrvIQ3VMaFRLJgDblF4Mi00OVefOIoowigQEK/hcYOxUX3UcicvMiQghHSigGTt
         7wOXi7PfqYow2cPQDJ2sjEvQan0K7WnGaLkf7yJOexCbWqADf/htfMsxQNlX5s455m+L
         b9IQ==
X-Gm-Message-State: AC+VfDwWK29AvVMFwOf/VQI0XlYyUYGSi30ieN2fXqnkNnYwERrlBZgR
	X9pht3/B77F8H3lkz5pzF5o=
X-Google-Smtp-Source: ACHHUZ5aUwQpmXFq62IOwkeTiJiFUSz6Wt9PaXTxNdRH/kylJwLUJvf08r71LifeGRMo3EYnyRIKBw==
X-Received: by 2002:a17:902:dacb:b0:1a8:d7a:9255 with SMTP id q11-20020a170902dacb00b001a80d7a9255mr17869996plx.54.1682969355424;
        Mon, 01 May 2023 12:29:15 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:15 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 28/34] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  1 May 2023 12:28:23 -0700
Message-Id: <20230501192829.17086-29-vishal.moola@gmail.com>
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
index b7b2b8d16fad..14e641686281 100644
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
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.39.2


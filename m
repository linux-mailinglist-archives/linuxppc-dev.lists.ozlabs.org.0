Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8885C7734AC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 01:11:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g0HQFm0I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKXBZ2Yrjz3dDJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:11:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g0HQFm0I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKX3Y3FFMz2xr6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:05:29 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-583c48a9aa1so52637807b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449526; x=1692054326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEHGQmND3TVCalts2Xn8ptU7qEA2BpyVbaRRrUVwgj4=;
        b=g0HQFm0Ih+ONj9bbGpN0SAoMFwZH1Hyy1LHhk9Yh2p6W+FyLdnCJ7RPABmEq6UvV+/
         I0mwYg/T2n8LaliwXnPTiC9GBqIvZu49Qi1V/N0MmNRCKbxincxnUS9jodhc4yydOwRP
         aDjCJ2ni1nNWMxe4NQznDsxKIox8DPgLSsmzUNzOiHFpehQua0QatbJlVlVObrSVTwwk
         ZCujc6+dVnog1ei5Zro9QqEP+ju61k33bEcuj8U0Qr32h8YYXwWu+8Jh8gouVCHVOaNS
         iYc6V/t51fkGJ7ybJ/9xFdZCGVtXquz95wk1/VRVK/X9HGuHOqtxoDT8S6kl5FuAfQB5
         VZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449526; x=1692054326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEHGQmND3TVCalts2Xn8ptU7qEA2BpyVbaRRrUVwgj4=;
        b=VIzHSllh5ahZqljj/uAm76t0ofZqIjgbkJ70G0I3K3RGCUsxubBnA1vCGdHgzffjC8
         fx9oI3HDuhW9q3+hELwqgFfkiHX486CtOOxd9DHWjR9nA+wP3MGIBno5qCfY08dEhCi7
         q9uYHnbusTlV9R66OfQdxwcKMM2VlKWF3/h53fYjX3P/C8ggWPDSZurt/8FBIn7OxS0g
         Uc087p0FuBYUK8K1LnXEvW7dwvoVHGvH/9LWMOiY1enqTcQ7EQ1MnGzlJwNtCor0K2f9
         miIBYMYvPxar5cLu0StSNGI1CIfj0J6d9ACrjwYBIEv/UBy+X6eiNMp3J+i5DPklQdxV
         Q3ug==
X-Gm-Message-State: AOJu0YzKWY7ijY0ItLYIVPy3QCr5DGREYNTM/+Bv53xvjKCG0LdT4KLK
	A8MRVqDnnTMefAUtvtDPHPI=
X-Google-Smtp-Source: AGHT+IE5Cb4oRalCjMZQpBv2Qvb3EAIojgwuAgurnfPzGGotvhmzGY7E65P/TqlBpHFwkOco7I+V2Q==
X-Received: by 2002:a25:d56:0:b0:c67:77be:9ad9 with SMTP id 83-20020a250d56000000b00c6777be9ad9mr8584839ybn.30.1691449526389;
        Mon, 07 Aug 2023 16:05:26 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:26 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v9 04/31] mm: Convert pmd_pgtable_page() callers to use pmd_ptdesc()
Date: Mon,  7 Aug 2023 16:04:46 -0700
Message-Id: <20230807230513.102486-5-vishal.moola@gmail.com>
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

Converts internal pmd_pgtable_page() callers to use pmd_ptdesc(). This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 54dc176b90ea..f6d14a5fe747 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2990,7 +2990,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -3009,7 +3009,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1


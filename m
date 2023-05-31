Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A2718D81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:50:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjcC09CBz3fL7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:50:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PfN/YuXq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PfN/YuXq;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjBz3NWfz3fNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:31:55 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5664b14966bso877017b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568713; x=1688160713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twP3X2a+WodLh3389MnIMBhN0jbH10mGEhh4PvePsM0=;
        b=PfN/YuXqEhOYfWlhCizTVYhB0yTtEnGBcp1Rf+NGxnIYb5NMfNjpOJp7si8Gqd9u2Z
         fVUf7A/NR+jmOjDUmFOcEU9lVtXwdNmW/KajF2dl5HDRHfmf/W944R+zyeedwYfvy537
         14PZNj7A3uugHcuLzifkUVqBMDywmdqymi8GehMXhWnbSeCktA8GuayP2Gw4BIeku+KV
         EWgr5cqL7Y75WorTm+eBQ331vxvi6DIr56AVXpyFUK5xmnNLyeer0KWpXh+3ggToS823
         Egfk0bra3X4pY1o6khSRW89GKMQyeeVJx3oX9CNStxK0FHLZpfrALdAzG2hgMTcdbX0M
         +9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568713; x=1688160713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twP3X2a+WodLh3389MnIMBhN0jbH10mGEhh4PvePsM0=;
        b=lcEWVL5t4z3SQ1TVc+8Fxv8vX85QVqgMvWU0p3z5whmhifns4fpVcXw/cfOpB+OJ2P
         7AccsN5hmXBFKa336NZyEQU+nXo16k1RqirybIEzaoM7v8NnB16risB5QWgHgXOjSJ1f
         DIv4lUV4TCRNJsxMsl56o5DbrpnLpAVmIGpzHdai+HLZ8CjGW28jDqga6FYfrLIeInBv
         SLdI6caSOOYM5JpQVAONESTPOlUdUF18SFDj7nhOuS1+jtvVudpw4w0BjLPXgxfwoHTK
         xpR6OGhBLkmvgeVyn3nN6laW+Zj3tA6SXHxzFhufnphKIDsoVLsi7ng52IzLAarO6RUy
         NzqA==
X-Gm-Message-State: AC+VfDyUXSoTmjb8c4QW62xtn2v5gSYhxlDhX1d/7BDYUOa35oCwgIr0
	jqkQ4ruJIknjOXRgCxsdvDI=
X-Google-Smtp-Source: ACHHUZ7FD6AVojP8YF17yPS22sW4VLLKSMzYdsUMVLL7wG9gS5evh1bJZ6trRixkrytBmJNTyQ8JCA==
X-Received: by 2002:a0d:d684:0:b0:566:386b:75fc with SMTP id y126-20020a0dd684000000b00566386b75fcmr7598602ywd.18.1685568712866;
        Wed, 31 May 2023 14:31:52 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:52 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 22/34] csky: Convert __pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:20 -0700
Message-Id: <20230531213032.25338-23-vishal.moola@gmail.com>
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
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..9c84c9012e53 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.40.1


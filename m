Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAEF77350A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 01:33:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=W+7e7ZXA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKXgJ1yPzz3cRg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:33:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=W+7e7ZXA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKX4L3XLfz30Kf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:06:10 +1000 (AEST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5862a6ae535so52792507b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449567; x=1692054367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ke0Z6VjA86Q0iJYCAtHmQzMGt2iXqJZdkl8QiQF9dCo=;
        b=W+7e7ZXA6pq6bkOdiU4kqXMdaRoaFiJYq1YjNheTen2BEAKrJsHyDCwylC8TwIaELf
         OoOeKnKEm2Bup1E3lQkfzBFhNx4UEQeZdbP6gFS8EtHNx1s6wSSR8pJNy131BEuCYsID
         5yHclRtlDqB0YUpxc8mp/j3duvqB/kcSwVKs7titgSAxTd3bahGpDvqB1s5BR/l1Q8b5
         JJTz17F1sukT0v2fD4c6TeVfoKxL+4R8ZKOAgjggAvDHXskwAwGz/9+hK5mkw3BMis+2
         8wcIPPvCrUvFi8Oxcy9SzYIpq7haNxXeYlICDRNRlufgVcr5TYo9K2btnO8SAcdlpPvp
         77sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449567; x=1692054367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ke0Z6VjA86Q0iJYCAtHmQzMGt2iXqJZdkl8QiQF9dCo=;
        b=mApw7fwc+MtB2SyG4aDIXOQV+Gqnuv/ksQc2lKR9bshYnmWplFXPhLfeyMGkrxhK+b
         OJ6qaYzSLz0zg9XB676Q98yjjx5+4ikkx4t7fcK99E9++S8Z3aOHwkwApu1CiVTEdKpD
         scHMENrpFPVJJBDyRnKXQ+Nm8Kv/iQqdpzUPhEFL+sqCSKeCQCMgRWq+f2OrUNk09a0H
         Z2QgBDK3uX0D6aEvC0zr/CeaBLMjjJ0IEh6TKFjLFl5S2efz0NWYK+YsDQaDJrFostlm
         8hPAY7/seMVHTQK8jlsuFe4nJIWHeT+BbdYi9XvL1V5iOtDJavVed0IlIPuUKGmRo53G
         JXEw==
X-Gm-Message-State: AOJu0Yx32w8jT5bHPseF1+DAQ6TbuCcpaAzWEWvqSHuaxgEn85kFjxsp
	r74uE4zJXH4aDnllcxIrWXg=
X-Google-Smtp-Source: AGHT+IEFwZzf7hWzCaDcJ0rf5o011LKpXcZZ+QgyAwbXtivToV2K1Z3qkIAZZunAX4r/XJQivv3Vpw==
X-Received: by 2002:a25:29c2:0:b0:d4c:f456:d562 with SMTP id p185-20020a2529c2000000b00d4cf456d562mr4842541ybp.1.1691449567341;
        Mon, 07 Aug 2023 16:06:07 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:06:07 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v9 24/31] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:06 -0700
Message-Id: <20230807230513.102486-25-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/nios2/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ecd1657bb2ce..ce6bb8e74271 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-	do {							\
-		pgtable_pte_page_dtor(pte);			\
-		tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)					\
+	do {								\
+		pagetable_pte_dtor(page_ptdesc(pte));			\
+		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
-- 
2.40.1


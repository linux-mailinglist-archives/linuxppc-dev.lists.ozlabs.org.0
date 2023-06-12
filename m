Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B97072D34B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:29:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qp0OZHJw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg4Zj1hPjz3cTt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:29:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qp0OZHJw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg43C0PJHz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:05:43 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-56d1ca11031so19157577b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603941; x=1689195941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=qp0OZHJwYJBDFbnZ3ou1P2Ehue21X+g8zcdgyQxIvQy+nDe0qfAi0dHJH17SnCCz1g
         tKKUvfmw/BkCu2VWGVC9FTcKBTfgeit8iCuiiB2iFwBx6PIhFHMGEsTNb4ySvFT/d3ft
         wztSHCS6L0P5NyGlzSq35fcEZtgvv+BauybZ4ibvcrCUVHnGp/kHvLFHDT0vMZoFlpUX
         ovC+Ec8QSOvfx2fBvS9GXwZis3S10LP+c5zNsCcscOq3kZyLxngh/87tdHFT9B3GKdNj
         CWUudKrbpvmp3qcd3NPPZgIOvQGRSzySt8ja54VpNcHj9wUPZRrXlqZutJQePE3+1Opa
         Ut9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603941; x=1689195941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=L2Ega3S6Xfuc8R3txQVQV5tJES9vgKuLNUfHZzTA+2wzilHAhVUX3oaiFdCw9VQc3B
         674widkI69MziqpKgAaukQ0xUYqaxzslBNnd4tf3N8zTzX3Gy1PPOj5D63NmEv3469Oj
         nwKDqYt55QmwDFnSTolcVpLUs+6ZYpUOV/8i+UCIHQhaslSGVEnxTH7OBSAC/yHCLivx
         3/KSyMb0Q+n2a7QRejc7sUdEAltsBFM2WTxakkcTHkiG8NDOBv3v5kjTHDL9NxecsDgy
         9FNT5Ar9UTWzYuVUQ/I6CQL+aiKiFuU/9gSKbFBfMNVg4G4eHWsvdLbn+j4/9woHfp0q
         ps+w==
X-Gm-Message-State: AC+VfDzGQsbpCjZ5welRh/YqjggIELEwLZAndlbJXCW/D5e8CbKM+rZM
	R2VuqlKvb0vpvmsPBGFZzE0=
X-Google-Smtp-Source: ACHHUZ6f4dQwcKAKk/nBaLFqSfud3ZdJTCw6E1GbyeLYv9ZLF94Eu4p9/l66ZpbQ0joORm5hDbfhlQ==
X-Received: by 2002:a81:9e53:0:b0:565:a081:a925 with SMTP id n19-20020a819e53000000b00565a081a925mr2763652ywj.29.1686603940939;
        Mon, 12 Jun 2023 14:05:40 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:40 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:16 -0700
Message-Id: <20230612210423.18611-28-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

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


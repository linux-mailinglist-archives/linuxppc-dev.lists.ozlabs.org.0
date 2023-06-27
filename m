Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C04E073F2E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 05:39:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=e60Y6sev;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqr6z4rsVz3dnQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 13:39:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=e60Y6sev;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qqqc70VTkz3bjw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:16:07 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5769e6a6818so30023077b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835765; x=1690427765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=e60Y6sevaT4oQ/L5KuHLcNtraCcaqymJSw0Pta6sshcpf6ZZ6QManSmR0ZQpDOB1TG
         Zv6Fux3N6RAGTYaqlaV6L/vXV7y5TNrp+A8hP8/1TroaBlBjnjU2829v3J+cnc+AhOb5
         JN+Np+61YaCNuusYO6cIWgMGGdhyo7H5wD/egNG2vy+zzD2dD0OPETzsjKXbKfq9Y/2e
         UqWfUGJ07+JZFMPC47CCL6nCuIIVod63+MvhTRgj6G4ml0xqLiHcn4xnMK5EG5kSpCpR
         IaKEXBQ7G4bgWt8P3QrMWU+dPATv19IcGEhHsTfe2EI7sEKEiwRzexwBCQnzrxDWjBM/
         K5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835765; x=1690427765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=Ne74/tVUkFi78FoRYdWHmEOWvGy403MFhJt0EHKzG0XIU5Krg+lvGanXdTWV67jb3+
         OHqhBF9x//roft72OU3hdSw1SekE5KqSu+lJgj6aGiWdRvcRjNa/q6jGfiylp70N5Z2Q
         F8JcDSVteLPBK2oJrEEmo8x9J3ecWLGpTdOXSwG1DEmubMhoAbNxbDQn+DOvUkc7CLiz
         GIw8QRvgv6AFobqP6D4R6+yhG5f5g0wU7p56apNrMiHo94r/i9tcaMGwPTSkXol4Jkua
         PnNYVeCsWyNwmhjVyxk62Gun7r7HRGGuNEHVn4Okn1m+73YKsJ/jr1fYytoDOKpW3WPx
         alyQ==
X-Gm-Message-State: AC+VfDxJ9/jP60zLArY1+DVol6CpzzCc7f/nhyzs2dDfKae8fh82wvoc
	FhIBHCmBvjLxcJtxGGLxsZU=
X-Google-Smtp-Source: ACHHUZ5DGQdkUnjmZtvUypsIHEbjelQEN0sIFmuzviWoifvHBxszYaVoeD06anXcP6T6X+bEflb+Ug==
X-Received: by 2002:a0d:fb86:0:b0:573:5071:2a12 with SMTP id l128-20020a0dfb86000000b0057350712a12mr24368068ywf.18.1687835764817;
        Mon, 26 Jun 2023 20:16:04 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:16:04 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v6 27/33] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:25 -0700
Message-Id: <20230627031431.29653-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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


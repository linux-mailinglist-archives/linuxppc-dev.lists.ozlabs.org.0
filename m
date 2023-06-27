Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 292FF73F2D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 05:34:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Z2y492L3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqr110QKqz3cQZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 13:34:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Z2y492L3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qqqbt3bhKz3bTr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:15:54 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5704fce0f23so42036347b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835752; x=1690427752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=Z2y492L3/D8WlJ5Hq0dqKp0BKJYUW7Eb9G7qdf3vIGRQ+O8SF6z7cY8de1pnrMmDqQ
         +a96x8kX3opEhwfyHnlNFTWX5OwZauzWBj6C4ouPJiZfrfA0EmnR4gOkOWCXT0Tt5rk7
         XHfLS6CI7/qHcQlfDrYckrQudKqfd53TugdHSOAC54JEXTOgwU9ogsxc/TSIilUUybaL
         /EAuzpcVE6dEZDr0iMV3l0ZL5CrHH5SQ2tSWsVIXTRE6S7JRWuiJGvbxR8kbv1x+D3dj
         SKo4oZP9xKp5iaeAAmMvP/qF+1bKjojF2HvsjQLLw57QGCxHLxvjF/rVFYkYGLWd7pTO
         F1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835752; x=1690427752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=llNQsFxlJpJKxATP8GmjAmwF6S7ulvE6WT7LtI1y2xxmzFnaz3VuK3ZNZ2GnO4U0T/
         GXDQxgyyYz30Rfe/US/sXmFSOixJTtch4r+Syy//1Fi6qYzHgR3pKLfTx5YvlM9tlOcG
         aFIK4oxgmmBZdAV5VPcq5kgUHBakEefibWNQXHTgQoR/oOfz5+HgIcWvIdFf5VNUdzuH
         OxtrIUXzc63BpJqCxJVGusrK+2nRMoQ7DdL83xQl+ncvdg2grDyWo2g4/wZTxO0Lrtzc
         3q1SHTB3o492FSpPsCyi4ndF5i5ESvvLoDFWrKVf1IQO7ScCdwwvqVePtQHezz1iOLbI
         MLFg==
X-Gm-Message-State: AC+VfDyqylXjlvZqP73KAb1DwNH6TdtoSsHem+R3ytBa7qDNjldEjsWn
	E3BR/vx6SxgrDyebXO/NBIQ=
X-Google-Smtp-Source: ACHHUZ5CQK8kRHJUPJM2uDCPFRj7p03JLp7keUZBkce6O+8d/iMl0gg4/oyJxvTRdTEHePf390CKKQ==
X-Received: by 2002:a81:4689:0:b0:573:9751:ad15 with SMTP id t131-20020a814689000000b005739751ad15mr18645821ywa.17.1687835752283;
        Mon, 26 Jun 2023 20:15:52 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:52 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v6 21/33] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:19 -0700
Message-Id: <20230627031431.29653-22-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Guo Ren <guoren@kernel.org>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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


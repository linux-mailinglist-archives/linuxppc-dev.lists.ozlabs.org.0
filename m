Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 885757608AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 06:38:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=isSLzJlV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R945l3D0Pz3f7J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 14:38:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=isSLzJlV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R93l16Bkqz3bd6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 14:21:49 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d066d72eb12so4536290276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 21:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258908; x=1690863708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=isSLzJlVCcu3DqkromZhEI/qWyA5zzmxG1x9IbP6194I1DKOByM/hDEPdxe0FV3MLw
         d6Rw+lHZ9WlgptdvBWiFzGMaM6KUoRlGp3xu2jda8iMy45KiL59BtGKHYho8dHuVUxG+
         hJLuMObqibUKBJwga6VwRPSAoh79vGoLNGxF2cxBKo1aHJdauK67/yOhDfLuLDKzblyJ
         F0wgtxLKGut1KlZ4xgsSxueuM+T0O4hKbp6cFWk4PiHYX5rGa1VxC3c5t+U93CbfreQA
         BhDLct+PPc5ibyvQ9RmPu/T+BvIQhbpSiLzGAmfokkxsUZTkKg3EAjaoANJECHoNxZLs
         xbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258908; x=1690863708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=T06lwygLVB9Az5GXJdE3iKGkfPd2ov239FVU1ZbCIj/+TG/EI0zpYiZhy8s97+pqfo
         qIO4JP70KRZ/7Ciu44qoIz53HLig3vD6ifKkjdEIfa/kIWdL9wym9In1x7rTt1E94y4n
         r/8fGFQoGUaKmGqUaaz+U9qJ0GNUlTG2RGdqyledYc4nRVOwSFRwu5D45M2CIKfOYyPh
         pHHhK5vAHOWyIbeVCKOo+PuxapgBJ4a7RQKqM+X96fLKc7gHGVihLUWUh60kVH76urwo
         9sElXdqlR9yovUnx1bCOC/8wYzmmt59tbWakyOhEngBsdqfXlE8ple+84OLbbz9E9Dqg
         F7Ng==
X-Gm-Message-State: ABy/qLbW/eF58eAefaBcCndDL15FCFd+BklRwnEZZzCSLTS2jTM5EJkI
	F1c99DxohDCgeP2JA+JPZM4=
X-Google-Smtp-Source: APBJJlE3eJKl34GJI9esPlRffLNepF5AyEOkc7MEH4MKJMttiyYPB1pXgCmUyzmySa6Xjpm5Cuhodw==
X-Received: by 2002:a25:b08a:0:b0:d07:1a89:2e73 with SMTP id f10-20020a25b08a000000b00d071a892e73mr1367996ybj.28.1690258907697;
        Mon, 24 Jul 2023 21:21:47 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:47 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v7 19/31] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:39 -0700
Message-Id: <20230725042051.36691-20-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
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


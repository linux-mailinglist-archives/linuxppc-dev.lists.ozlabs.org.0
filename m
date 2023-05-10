Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF436FD593
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 06:57:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGN7M5Yq8z3fNB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 14:57:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=r94LQDZt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=r94LQDZt;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGN6X3cwDz306l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 14:56:51 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-559f1819c5dso101858807b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 21:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694608; x=1686286608;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VvuiwGfmHxTbGTIrjZEu2Atjrxfj5l7d/xiFwRLchQg=;
        b=r94LQDZtq2Ahs+pJ02XRyENxJHGD3oe8r85F2aY3lvsikc/je1Po6VKiCqGzvG34y8
         kIuRE1yIIechhFDgP3aPNUwpsvddbLpTk1K5K+zsi9h4zTnxpk/JVyiDuMs9BN+OFeXh
         nh4AqDsTEXGceRxF3pEZTvbfDGAiIr5yaqLJ7E2ZoOdKC1Zkn5Abo0ezT8CCDEe5hzan
         c+lECJHpRVibRO6qY89AP62g051JuNBSBft2ut/t1eSbSZxO5Og6LOCNCOMTH+prHdN+
         QRgICMzswpXaaxM5lmYItFqDFDCHtHoD+lRFcRdM6eNSSTq3389JYb3eyyNp72I0hHaA
         zjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694608; x=1686286608;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvuiwGfmHxTbGTIrjZEu2Atjrxfj5l7d/xiFwRLchQg=;
        b=Cyb9SmGpMQL7REa3ub1gqNo3Fpyf0PS6Zcx9pcNWreNXgkWuFsSY23cU9jDIz9JvP8
         HoC2McCNjVlUZ0iGRu9HzvuURTPQm7okVvMVg0qyMOWClNanUpIQdAOkHzj3ik4nYgS7
         EqvsWis4jv3aR1mIuQjmb4O2hqXk+fDeW63F62sEMKQcTIV3Xvh99ZnFroE1YD1oMIJO
         I8rGYYWa/KT7OnQ6XHJSQ95vVOIdGpoYtCno5dhOoqnorJ9Algrrgrfk2LhnpGYl6ZGl
         ZQvOhUvmP7i/MuIFTd82f/w8DRt0oORxK32QZ6vySV/PH045z4YsXCdJd32c8rYhymYM
         vlXQ==
X-Gm-Message-State: AC+VfDxFE9JhpXCS7fqXMfjRHkvyIsMh9MKx3JDpF+ca5RoDUA+zAmI+
	8MHT6KCkcOJrz1wwLAxSVmDxqw==
X-Google-Smtp-Source: ACHHUZ7AyL+rmns/Ft/OH9KHX6GHbff2/XDcrKV9m3YxNF0ibK6GlQcG44pT8V6Ez5OWany7qS8Crw==
X-Received: by 2002:a0d:db49:0:b0:55a:314d:afdc with SMTP id d70-20020a0ddb49000000b0055a314dafdcmr18425257ywe.37.1683694608059;
        Tue, 09 May 2023 21:56:48 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id f206-20020a816ad7000000b00559fb950d9fsm3842735ywc.45.2023.05.09.21.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:56:47 -0700 (PDT)
Date: Tue, 9 May 2023 21:56:44 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 11/23] powerpc: kvmppc_unmap_free_pmd() pte_offset_kernel()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <8bc72262-3771-4fbf-8738-44d9a8a1ba6a@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <mons
 tr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvmppc_unmap_free_pmd() use pte_offset_kernel(), like everywhere else
in book3s_64_mmu_radix.c: instead of pte_offset_map(), which will come
to need a pte_unmap() to balance it.

But note that this is a more complex case than most: see those -EAGAINs
in kvmppc_create_pte(), which is coping with kvmppc races beween page
table and huge entry, of the kind which we are expecting to address
in pte_offset_map() - this might want to be revisited in future.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 461307b89c3a..572707858d65 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -509,7 +509,7 @@ static void kvmppc_unmap_free_pmd(struct kvm *kvm, pmd_t *pmd, bool full,
 		} else {
 			pte_t *pte;
 
-			pte = pte_offset_map(p, 0);
+			pte = pte_offset_kernel(p, 0);
 			kvmppc_unmap_free_pte(kvm, pte, full, lpid);
 			pmd_clear(p);
 		}
-- 
2.35.3


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8167288D6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:40:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcZLf1wNZz3fht
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:40:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=wrjU6S4E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=wrjU6S4E;
	dkim-atps=neutral
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcZHm6F57z3fG0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:37:56 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-56896c77434so8890457b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686253073; x=1688845073;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4B5saBu/vw3gaGnlmIPZ9pQkqfzbj7+JgYM5jpygjcc=;
        b=wrjU6S4EMiU3Ufcg2KZPT551Y8sNhg4QKjD2hAgSPlGh9yj39Rxf3Ke0FjcZO6VxtG
         ALh4CVjSqM9GtJPRdIfEgNIlV/EEkptkG6e4IMSsrcpQSqGrj44uojyylNmPW3FhQBzm
         h+3YVxQpJctPazelaypN7o1DBk1YFmyjCLOyVuE0ZSJNDZN1IWkDf39Bng35IMFfYc2S
         OuTO6+N3JH4bhYslynL29X9VjGEwK1A0ffza+fgs91l3oerVxPUep2x461PcKgDhp6i7
         yNPgK4idQjhQRO3vK4IICQL9mYykeSLt5G3Lqvr2ymPPunZsH8KwR6J1BbGlfhLHc47C
         HKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686253073; x=1688845073;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4B5saBu/vw3gaGnlmIPZ9pQkqfzbj7+JgYM5jpygjcc=;
        b=YV4GlLnSXX1IKCYaVOqwrJcOK1qo6hEAcECRP0YhPPB4kq4DM5q8eoAklK01Qv0LlY
         TVzUEUozSxUZpNyCNpTaz46mrYqohmR8ahi4rghnx+gUJLQ+v0C1lRE1oCeuEOHlLJJz
         DIZeCnXUFgOLOVugKdaLt1ktILhg5K+jQ4Y1gjSmKK0b+N8IojlFkINMbOzQPTVJxanp
         isPBI9C9/ayzoYq5vGmcz081NPrrGh7xaE7nlLnt8sorA4hOrqBKlY6eYAnepQx68Ex4
         27asO5iff44z8jdxyKNOi/FccjVykZwFWu/FNuxN80lpNclmcR424R+o+yg2nDntV9PJ
         gahA==
X-Gm-Message-State: AC+VfDytDlkRMaIJVjDp7nAGiSrqtI3KHIORnj7WYXlrLjn4nVRumdaQ
	GKDk5c434B2V9gnZCgHYRAOSWA==
X-Google-Smtp-Source: ACHHUZ7Ebli0p9041CLEfO4CyQQvBmxN41VJwJsuM0MQnf822wu8ZsrJRZ2ru1aILLAWUog5xqYpmw==
X-Received: by 2002:a81:72d4:0:b0:560:f6ae:a71b with SMTP id n203-20020a8172d4000000b00560f6aea71bmr508956ywc.48.1686253073290;
        Thu, 08 Jun 2023 12:37:53 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id i133-20020a816d8b000000b0056953ab06c5sm114950ywc.95.2023.06.08.12.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:37:52 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:37:48 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 23/23] xtensa: add pte_unmap() to balance
 pte_offset_map()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <ab2581eb-daa6-894e-4aa6-97c81de3b8c@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, C
 hris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To keep balance in future, remember to pte_unmap() after a successful
pte_offset_map().  And act as if get_pte_for_vaddr() really needs a map
there, to read the pteval before "unmapping", to be sure page table is
not removed.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/xtensa/mm/tlb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/xtensa/mm/tlb.c b/arch/xtensa/mm/tlb.c
index 27a477dae232..0a11fc5f185b 100644
--- a/arch/xtensa/mm/tlb.c
+++ b/arch/xtensa/mm/tlb.c
@@ -179,6 +179,7 @@ static unsigned get_pte_for_vaddr(unsigned vaddr)
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	unsigned int pteval;
 
 	if (!mm)
 		mm = task->active_mm;
@@ -197,7 +198,9 @@ static unsigned get_pte_for_vaddr(unsigned vaddr)
 	pte = pte_offset_map(pmd, vaddr);
 	if (!pte)
 		return 0;
-	return pte_val(*pte);
+	pteval = pte_val(*pte);
+	pte_unmap(pte);
+	return pteval;
 }
 
 enum {
-- 
2.35.3


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5BD6FD607
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 07:11:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGNRx02Skz3fLL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 15:11:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=2vB4gHPv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=2vB4gHPv;
	dkim-atps=neutral
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGNR26nTNz30hh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 15:11:10 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-55a5a830238so62499237b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 22:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683695467; x=1686287467;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5t5YV0zKgmgEyAUPKTSjojlBVWu7n9Z5EbrT7MCf/bI=;
        b=2vB4gHPvdrYwpepEfO1nF7s17T93hgvovaDeIEtq/j7tZEKBAX6MfSFdULN3s1RrSv
         XbcEaHE4RfnjNOR2bGTDUPbkUVKLAEh7Z60FKXcJrN5AB5F5sDrBlIYfucGi5YFq3CRE
         x2J76JMa1KrQtFzkek9dhFVhgpBZ4hkaFn0t/tEhn6Lp6XTc2qq6OFMsvbIv1u0qf83/
         DuPOrKKE39rYYW8ERQAhpQjY3kAUjmEo/2XpafFM5jSnKHS+15Ix6XCgfH0XnW/sjbs8
         PlPBuW0lMaTsO4yfeYWj+it6wzwQ+thFBn+MFXcJGic5E+ghFwv9VEoF4ainQyun9oWL
         kbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683695467; x=1686287467;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5t5YV0zKgmgEyAUPKTSjojlBVWu7n9Z5EbrT7MCf/bI=;
        b=JW3kBm2LDUFkmRBbjaBWmFLRfQJbqpiaB10rmwpfazvmqgBpJ7XDo74EqsrUa7SeV0
         1/5rn69sBsOg0GE7mjkCBysaEdivCAchJX58HyJ5iIV9OBUb8953us/SYYXJRRKh6BmA
         vS6P85DypceR0TctgkbPce/iJ0tKOO7HWxjZ8N/OcZVYtvUxPnm3HxqoFd08OCFS5lkE
         HaexcgYH9yUTxxeVPwMcN04HMqBxOGP3k3aFPEd749jvTeGA5SaRZFqs5vRPJZTJXDI7
         G54c8LVWr3myAPybljVU79nVlsdRYeAS7kz0xiNesuwfY4TbkCWcXsp6/GB1Wmwbc6F7
         n+eg==
X-Gm-Message-State: AC+VfDwpa/uENBYFlgUaI803LVVH1MwZyubWgiEiy1AS/2S1gEDO6WpH
	TEvtGuvfKwtK3NDgoL3t38jBuQ==
X-Google-Smtp-Source: ACHHUZ5S12uJTV3RgA8xdSJdxWq0jDZ0XleloV6/dK1s9NkYAdupH7Dq2nQz0anegdxAtAS1U2ZfRQ==
X-Received: by 2002:a0d:d4c3:0:b0:55a:9d84:2e4e with SMTP id w186-20020a0dd4c3000000b0055a9d842e4emr17689769ywd.18.1683695467357;
        Tue, 09 May 2023 22:11:07 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id l65-20020a0dfb44000000b005461671a79csm978797ywf.138.2023.05.09.22.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:11:07 -0700 (PDT)
Date: Tue, 9 May 2023 22:11:03 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 23/23] xtensa: add pte_unmap() to balance pte_offset_map()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <ff6b25c6-f537-6b5c-8743-c9fc2bd81f91@google.com>
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

To keep balance in future, remember to pte_unmap() after a successful
pte_offset_map().  And (might as well) pretend that get_pte_for_vaddr()
really needed a map there, to read the pteval before "unmapping".

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


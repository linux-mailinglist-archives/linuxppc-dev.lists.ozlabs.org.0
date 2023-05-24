Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6578570EB05
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 03:50:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQvJs2NGgz3fBg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 11:50:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=fL1Ko/Yz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=fL1Ko/Yz;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQvHx4CWhz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 11:49:32 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-ba8253f635cso661604276.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 18:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684892967; x=1687484967;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qRR20WPPG9GQ+bWld5KX4B7EuAV7QhoHIJ5BRRfzj5g=;
        b=fL1Ko/YzJ7ADR+5IhbndnTRBOzBniMKv2InrhlDBTKJ8NlYVC/WzojNZzRdjG8LqqI
         8LB9Z4sfpXm4DMnyfRFicnIehOON6Mw+FClbq6xhPa9tlrIuXm3Q/2idrYMx02+afzOp
         1VCSHU1xv+O9cTuzhmlxGQq1v0D4TgBrAS9dYOJLgo+SzeMAZ7rQLDPNPL9H5vsD1p44
         JTB4zFm6Ty/2t/Mm5CpAGXHuXSex52HKZD5bYmtrIhNvgrtjqZinsu17ACzjltY7KKk5
         TNaE7Q4HSc79RkqKOj+NGXTgrLKTP+KzqHxsfw06sf9yCgMnslxI0DnH5G6oL7bKwZgq
         fWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684892967; x=1687484967;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRR20WPPG9GQ+bWld5KX4B7EuAV7QhoHIJ5BRRfzj5g=;
        b=Ux04I/0A5KgiHw5Yo+3T+DiRMnWJXhsZ8n55xlaW7IbGzRNtxmiaqsHaqotNsaACrq
         9Ert4x20TK8aWXBti2uTqYchGf94Qil3OAAx82jAYuk62R0O8ugX8bZfkypd2MM4bezW
         JBzZJCl0AFuzSobZg/BFZ2So+gedQcibhKKQDQ7TR61IRok5cwiyZNuwKoQ8Hzy1exPp
         vIth1gpI3dcfCP5iuI/JRvyYJTMkzMOUtnQpdFeAcrx8UacPyQjM3E2wtDacUOzZx9B6
         sNMZ0F1JzlxZcr+UNsXG0p3dJWPiFviqa1QfLUFlQJ5wU4miU0V+jQOUl65CzpP90Mf3
         nnpw==
X-Gm-Message-State: AC+VfDyEUv502NQVj2ooplS5aLoNrZSCNlVyKW5nBnJ9C6WGQjYNjOK9
	vLk3ecCN9fcPeostvAhAqDpv+g==
X-Google-Smtp-Source: ACHHUZ7f0TOZQo7Cw+o/qEVNq4B1zvZdBbLM5VJM6QqwwtZu4t36Vxp5CkGSHrwBFYCBff4rw2Ddpw==
X-Received: by 2002:a25:385:0:b0:ba8:54c4:3136 with SMTP id 127-20020a250385000000b00ba854c43136mr19398918ybd.52.1684892966804;
        Tue, 23 May 2023 18:49:26 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id x7-20020a259a07000000b00b8f6ec5a955sm2395274ybn.49.2023.05.23.18.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 18:49:26 -0700 (PDT)
Date: Tue, 23 May 2023 18:49:14 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH 15/23] s390: allow pte_offset_map_lock() to fail
In-Reply-To: <20230523140056.55b664b1@p-imbrenda>
Message-ID: <b64cd153-18e8-81a6-b852-c04d8b1381d@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <94aec8fe-383f-892-dcbf-d4c14e460a7@google.com> <20230517123546.672fb9b0@p-imbrenda> <4a15dbaa-1614-ce-ce1f-f73959cef895@google.com> <20230523140056.55b664b1@p-imbrenda>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.
 eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 May 2023, Claudio Imbrenda wrote:
> 
> so if I understand the above correctly, pte_offset_map_lock will only
> fail if the whole page table has disappeared, and in that case, it will
> never reappear with zero pages, therefore we can safely skip (in that
> case just break). if we were to do a continue instead of a break, we
> would most likely fail again anyway.

Yes, that's the most likely; and you hold mmap_write_lock() there,
and VM_NOHUGEPAGE on all vmas, so I think it's the only foreseeable
possibility.

> 
> in that case I would still like a small change in your patch: please
> write a short (2~3 lines max) comment about why it's ok to do things
> that way

Sure.

But I now see that I've disobeyed you, and gone to 4 lines (but in the
comment above the function, so as not to distract from the code itself):
is this good wording to you?  I needed to research how they were stopped
from coming in afterwards, so wanted to put something greppable in there.

And, unless I'm misunderstanding, that "after THP was enabled" was
always supposed to say "after THP was disabled" (because splitting a
huge zero page pmd inserts a a page table full of little zero ptes).

Or would you prefer the comment in the commit message instead,
or down just above the pte_offset_map_lock() line?

It would much better if I could find one place at the mm end, to
enforce its end of the contract; but cannot think how to do that.

Hugh

--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -2537,7 +2537,12 @@ static inline void thp_split_mm(struct mm_struct *mm)
  * Remove all empty zero pages from the mapping for lazy refaulting
  * - This must be called after mm->context.has_pgste is set, to avoid
  *   future creation of zero pages
- * - This must be called after THP was enabled
+ * - This must be called after THP was disabled.
+ *
+ * mm contracts with s390, that even if mm were to remove a page table,
+ * racing with the loop below and so causing pte_offset_map_lock() to fail,
+ * it will never insert a page table containing empty zero pages once
+ * mm_forbids_zeropage(mm) i.e. mm->context.has_pgste is set.
  */
 static int __zap_zero_pages(pmd_t *pmd, unsigned long start,
 			   unsigned long end, struct mm_walk *walk)

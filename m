Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA49478310D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 21:49:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=O+l83h2L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV32y5zDPz3c24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 05:49:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=O+l83h2L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV3256B02z2ytX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 05:48:44 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d45caf42d73so3691688276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 12:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692647321; x=1693252121;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJzCfpxhVh8Bz41vGC0rk+kXrKf+GdQm6b6DEBJLp4Y=;
        b=O+l83h2LbZSW4NI8EbJgXLVItI++RMuU2J1wzOBcgSbKmzQuEPI9eXLtSoWmn6sq+J
         am9dOa1SFWGD7j5vN6h935pR1gM8rVAxXJEVaSWFJUrDFCRm4UId8TzMlS8g+nEJHA0L
         HVmidw/jdT5JEjucAIAVHt18vnuAYYelLXsgg/3kJuYSEB8p5NXviLWxA6djEjfHQuvd
         Tut8+np5BGIFwbD617Gj+qlh50yuNuK3sAB8TJC0oDpzrOvNE36+gxIvWggycyL1tEG0
         x92tpf/QJeruWhF9JQ1/ULRqj6tCPttInh9D1ON2tnwj/rA0zB3U4trgXTgmjiozXI6e
         zKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692647321; x=1693252121;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJzCfpxhVh8Bz41vGC0rk+kXrKf+GdQm6b6DEBJLp4Y=;
        b=RPcyO414PQrt+6irvZ8D45reIp0ozixu9nZBYoPEQZogIDaOec0e2SGSeyFDOpTR0y
         ihRXEjIgQXOvNxL4NUcGSaNwITu9E/oBqHg6yvNKYQaCmK69kciyc0cpulIOmGOzDDSn
         wsbdbINFHlhBGLR5SQXehKSb7y+JhRwfMveJF7SWZyXVeMCYWyDQnt1ZDjGrdfBMw1u+
         OMurFUgtcALfqMe7vp/PVkn7b+TVPqFG6+UF0jBcbhHAMbhIdoHn1vM4Nrfjf+1VaYSD
         45nLSEIF6T1zu1tmKa4tlX3qKxX+I5rbiNJFKRWzktMHk/MXM6kQvgG8N7ty2HpyPFWQ
         ghHQ==
X-Gm-Message-State: AOJu0YzFDAPtcF2A89f+L9jFjSrP3XhiEixwwaM7vlaY4rqV5PQZsxxi
	jMf1f4io5pkjSg02djQkdsdn+Q==
X-Google-Smtp-Source: AGHT+IGa6N7zVO856T4SuLkkv15XMUTmB6PRYCGx3mJYt/D6fAu3o2zmClsjUxquvXD3gtA1EwMqjA==
X-Received: by 2002:a25:157:0:b0:ced:974a:1aae with SMTP id 84-20020a250157000000b00ced974a1aaemr7593100ybb.58.1692647321154;
        Mon, 21 Aug 2023 12:48:41 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id z4-20020a259cc4000000b00d5c4c949349sm1335996ybo.13.2023.08.21.12.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 12:48:40 -0700 (PDT)
Date: Mon, 21 Aug 2023 12:48:29 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jann Horn <jannh@google.com>
Subject: Re: [BUG] Re: [PATCH v3 10/13] mm/khugepaged: collapse_pte_mapped_thp()
 with mmap_read_lock()
In-Reply-To: <CAG48ez0FxiRC4d3VTu_a9h=rg5FW-kYD5Rg5xo_RDBM0LTTqZQ@mail.gmail.com>
Message-ID: <e71190cf-c1e7-87d3-7a61-b4753c3932ed@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <b53be6a4-7715-51f9-aad-f1347dcb7c4@google.com> <CAG48ez0FxiRC4d3VTu_a9h=rg5FW-kYD5Rg5xo_RDBM0LTTqZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463760895-1083013748-1692647320=:5414"
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ib
 m.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Zach O'Keefe <zokeefe@google.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@or
 acle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463760895-1083013748-1692647320=:5414
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 14 Aug 2023, Jann Horn wrote:
> On Wed, Jul 12, 2023 at 6:42=E2=80=AFAM Hugh Dickins <hughd@google.com> w=
rote:
> > Bring collapse_and_free_pmd() back into collapse_pte_mapped_thp().
> > It does need mmap_read_lock(), but it does not need mmap_write_lock(),
> > nor vma_start_write() nor i_mmap lock nor anon_vma lock.  All racing
> > paths are relying on pte_offset_map_lock() and pmd_lock(), so use those=
=2E
>=20
> We can still have a racing userfaultfd operation at the "/* step 4:
> remove page table */" point that installs a new PTE before the page
> table is removed.

And you've been very polite not to remind me that this is exactly
what you warned me about, in connection with retract_page_tables(),
nearly three months ago:

https://lore.kernel.org/linux-mm/CAG48ez0aF1Rf1apSjn9YcnfyFQ4YqSd4GqB6f2wfh=
F7jMdi5Hg@mail.gmail.com/

>=20
> To reproduce, patch a delay into the kernel like this:
>=20
>=20
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 9a6e0d507759..27cc8dfbf3a7 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -20,6 +20,7 @@
>  #include <linux/swapops.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/ksm.h>
> +#include <linux/delay.h>
>=20
>  #include <asm/tlb.h>
>  #include <asm/pgalloc.h>
> @@ -1617,6 +1618,11 @@ int collapse_pte_mapped_thp(struct mm_struct
> *mm, unsigned long addr,
>         }
>=20
>         /* step 4: remove page table */
> +       if (strcmp(current->comm, "DELAYME") =3D=3D 0) {
> +               pr_warn("%s: BEGIN DELAY INJECTION\n", __func__);
> +               mdelay(5000);
> +               pr_warn("%s: END DELAY INJECTION\n", __func__);
> +       }
>=20
>         /* Huge page lock is still held, so page table must remain empty =
*/
>         pml =3D pmd_lock(mm, pmd);
>=20
>=20
> And then run the attached reproducer against mm/mm-everything. You
> should get this in dmesg:
>=20
> [  206.578096] BUG: Bad rss-counter state mm:000000000942ebea
> type:MM_ANONPAGES val:1

Very helpful, thank you Jann.

I got a bit distracted when I then found mm's recent addition of
UFFDIO_POISON: thought I needed to change both collapse_pte_mapped_thp()
and retract_page_tables() now to cope with mfill_atomic_pte_poison()
inserting into even a userfaultfd_armed shared VMA.

But eventually, on second thoughts, realized that's only inserting a pte
marker, invalid, so won't cause any actual trouble.  A little untidy,
to leave that behind in a supposedly empty page table about to be freed,
but not worth refactoring these functions to avoid a non-bug.

And though syzbot and JH may find some fun with it, I don't think any
real application would be insertng a PTE_MARKER_POISONED where a huge
page collapse is almost complete.

So I scaled back to a more proportionate fix, following.  Sorry, I've
slightly messed up applying the "DELAY INJECTION" patch above: not
intentional, honest!  (mdelay while holding the locks is still good.)

Hugh
---1463760895-1083013748-1692647320=:5414--

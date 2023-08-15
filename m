Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B0377C7DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 08:35:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=p9+S6hsr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ1j75tKwz3cLl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 16:35:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=p9+S6hsr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ1hD3Rhrz2ytk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 16:34:20 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-589c7801d1cso38926697b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 23:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692081257; x=1692686057;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CxAoE5eSsUJ3Vpa248rsUjBgcZlqW5zx3rfHtPXFetE=;
        b=p9+S6hsrqoi9/yc4fLyRQJ95h3qITRTFxdQEqhTJUhKaf0i0Jq2XhWghBIyPtmk/uJ
         4M5rigTywIy/m6/mqluMBYNqiUseBjkuhrD18FHdjGgYia3YM0ohXGUPvtYtuJbUMGeY
         KVH2ky0rlQ6+hENvUAmulC7cWSQSP/LKt+gOFFRQrWskd7A62t+qW5uDKWGsrqjzQyk+
         fLqCcbbNzqddLJlXUy8iNMraK1vN+/eGlLwEF2khEeWeMKnJ7UuQbpgWL7j/mRLCk4cz
         YpGbv7Zwl3yPNwj3AN+GR84frj8c9W+wGv9rPeefkMFN0+K0UD0PoEDwA3yJa5lDyBmb
         07KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692081257; x=1692686057;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxAoE5eSsUJ3Vpa248rsUjBgcZlqW5zx3rfHtPXFetE=;
        b=bf6kedO9iNZPumSlyBXkwhGmq3GID1yMCze6qcBkrn0ioCBgRqLgDMdkgOjTBg6cHM
         MGtSikKCbWHG1KT1O4zbDgnDRFAgDi3d5TmeiYioOrUQK81+8mHylzmb1vi0/xiAnItU
         OQ5snpcPYRYkmtxblXXmTtfE4m2ors6ZE8a2s6zTULu5mLeauqSK1ltcc+mAVENIabpJ
         ekk4Lh6Gj13Fs0PnTTg96pffHm58iSMHRjOlpv1/rtYJ6LAHUR5gkdSqurHpDklf3Bzz
         bVHxCaQrtyEhHok74274SkKbp/b1aBoqv4JzCjg1Wm/XyXmTtO+7TsZgg5Fb/bCEXGJT
         Ovfw==
X-Gm-Message-State: AOJu0YyQpD15N9mRBoSA918V0MvHD6a8y4vtHKf+Ydj0IpvrrZaM66zK
	WW/o8mccLJEwgcbLc13q23Y1JQ==
X-Google-Smtp-Source: AGHT+IH+fi/XU+DF2DJSdgQk63a8BNgNbEsx1w15WGuNkVMjLKqhEPN8ZgYcWj0XgH+EA3OAGhi3nA==
X-Received: by 2002:a81:a1cc:0:b0:58c:5463:85ec with SMTP id y195-20020a81a1cc000000b0058c546385ecmr1880290ywg.23.1692081257133;
        Mon, 14 Aug 2023 23:34:17 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id r30-20020a81441e000000b005836fc7df19sm3235677ywa.81.2023.08.14.23.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 23:34:16 -0700 (PDT)
Date: Mon, 14 Aug 2023 23:34:05 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jann Horn <jannh@google.com>
Subject: Re: [BUG] Re: [PATCH v3 10/13] mm/khugepaged: collapse_pte_mapped_thp()
 with mmap_read_lock()
In-Reply-To: <CAG48ez0FxiRC4d3VTu_a9h=rg5FW-kYD5Rg5xo_RDBM0LTTqZQ@mail.gmail.com>
Message-ID: <cacd4a19-386d-8bea-400-e99778dbc3b@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <b53be6a4-7715-51f9-aad-f1347dcb7c4@google.com> <CAG48ez0FxiRC4d3VTu_a9h=rg5FW-kYD5Rg5xo_RDBM0LTTqZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463760895-1382586557-1692081256=:4366"
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
 m.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463760895-1382586557-1692081256=:4366
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

Thanks a lot, Jann. I haven't thought about it at all yet; and just
tried to reproduce, but haven't yet got the "BUG: Bad rss-counter":
just see "Invalid argument" on the UFFDIO_COPY ioctl.
Will investigate tomorrow.

Hugh
---1463760895-1382586557-1692081256=:4366--

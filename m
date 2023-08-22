Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A1C784597
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 17:31:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1wJYwF/X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVYHC65WDz3c8r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 01:31:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1wJYwF/X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVYGJ3DCVz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 01:31:03 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fef56e85edso83595e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692718257; x=1693323057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7rvpiaBmdaWESCzJVCBdhucf56RoNv7C/zYiNdqugw=;
        b=1wJYwF/XUeBhFNuVLT9M6HxNx22zvWEOGkabOBprp3VPK7ecH6H8+WQb+PZ7C/NCpt
         Ck5ii8Mz711rRiDKPqlGnX/A/fC8hzKhoGaSLeXlK9RiTR3yPUlaVATQ4tR1Evqow1XZ
         6truoiONXUoJXKQRJm1T7EVAuC/tr7RAC8LolwaT4w6uct3C9G/LHCao8Kvcj06I7f8u
         eDaGKuBZhqGT8KibcEIVeVLhn5DZX6+OupQi/a1pu/hNrXF5HQ/UOn6EFCRqpqY64qup
         zJqW1TqWuAN5jMj9xCzbC8AwDj59mQbkBi01tS5+mEMcOpKjVh+FpJ1T1dOf9nzgWhxh
         QEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692718257; x=1693323057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7rvpiaBmdaWESCzJVCBdhucf56RoNv7C/zYiNdqugw=;
        b=OrH8K6PG/gc+js7ef47EucxQmyOOhdAzBm+ZqJPY7ilWoOw9KmUfPCBCVBX8lLOZIL
         flu54d3ZOztKhxKAdT1gmkyssnmb4xuRtSyBEIsyb1w+KMGak202nsxqZZ18nInK976y
         V2dvEFmFaNzFhPISVRCQfP3AhBqPwu+a3BJqbtpZHHQwREqMtTZf8dcPfaFzCwuklFeG
         zfng9hUKK9gECnA3TAC6seE+wdS7AkYV33UDqm3KNoHkeyCpu5jL4nqXhY3pvj7Ldrrs
         3Pws4HCoG9bqy1t+7z2wb0Jtevu4MHsjzx35bKVRM6JPtJORs/by7CXI4FQMl+rf5JKp
         xx3A==
X-Gm-Message-State: AOJu0Yw231odrxiXNP1EqwPhaqanjIcUaia9AqSuB8vpQt7eCJFVkDeX
	ba9GiiLw1Eipo3Cg4zGUbJpkq+s23hLkMV6qqzOaaQ==
X-Google-Smtp-Source: AGHT+IFyMgkMgYPE+lsjqN8nfI8yOuu8gDBvx8ZWd4M7BOWwoDnsNIcZ50kelsgmgyRcsCUSHPMH6DyCCbSZ5fwKiiA=
X-Received: by 2002:a05:600c:1716:b0:3fe:5228:b7a2 with SMTP id
 c22-20020a05600c171600b003fe5228b7a2mr96047wmn.5.1692718256744; Tue, 22 Aug
 2023 08:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com>
 <CAG48ez1XAePj5MUG8AUmnTjRLcxKre-NGYV82kB68-X8Rh6fxA@mail.gmail.com>
 <f2dc6d6b-c516-932-1598-a58e2afffe9a@google.com> <CAG48ez0S-RjAapaDiJ+oZXpn1vs9niWx54iqzusUScS-BYu0hw@mail.gmail.com>
 <ZOTSyv6fuC1pkt76@casper.infradead.org>
In-Reply-To: <ZOTSyv6fuC1pkt76@casper.infradead.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 22 Aug 2023 17:30:19 +0200
Message-ID: <CAG48ez2NrQjB5T5++uJSZ8-id5-H2mbSRX8c36gAJ5p_BMHOFw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable] mm/khugepaged: fix collapse_pte_mapped_thp()
 versus uffd
To: Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <tho
 mas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Peter Xu <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Zach O'Keefe <zokeefe@google.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 22, 2023 at 5:23=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
> On Tue, Aug 22, 2023 at 04:39:43PM +0200, Jann Horn wrote:
> > > Perhaps something else will want that same behaviour in future (it's
> > > tempting, but difficult to guarantee correctness); for now, it is jus=
t
> > > userfaultfd (but by saying "_armed" rather than "_missing", I'm half-
> > > expecting uffd to add more such exceptional modes in future).
> >
> > Hm, yeah, sounds okay. (I guess we'd also run into this if we ever
> > wanted to make it possible to reliably install PTE markers with
> > madvise() or something like that, which might be nice for allowing
> > userspace to create guard pages without unnecessary extra VMAs...)
>
> I don't know what a userspace API for this would look like, but I have
> a dream of creating guard VMAs which only live in the maple tree and
> don't require the allocation of a struct VMA.  Use some magic reserved
> pointer value like XA_ZERO_ENTRY to represent them ... seems more
> robust than putting a PTE marker in the page tables?

Chrome currently uses a lot of VMAs for its heap, which I think are
basically alternating PROT_NONE and PROT_READ|PROT_WRITE anonymous
VMAs. Like this:

[...]
3a10002cf000-3a10002d0000 ---p 00000000 00:00 0
3a10002d0000-3a10002e6000 rw-p 00000000 00:00 0
3a10002e6000-3a10002e8000 ---p 00000000 00:00 0
3a10002e8000-3a10002f2000 rw-p 00000000 00:00 0
3a10002f2000-3a10002f4000 ---p 00000000 00:00 0
3a10002f4000-3a10002fb000 rw-p 00000000 00:00 0
3a10002fb000-3a10002fc000 ---p 00000000 00:00 0
3a10002fc000-3a1000303000 rw-p 00000000 00:00 0
3a1000303000-3a1000304000 ---p 00000000 00:00 0
3a1000304000-3a100031b000 rw-p 00000000 00:00 0
3a100031b000-3a100031c000 ---p 00000000 00:00 0
3a100031c000-3a1000326000 rw-p 00000000 00:00 0
3a1000326000-3a1000328000 ---p 00000000 00:00 0
3a1000328000-3a100033a000 rw-p 00000000 00:00 0
3a100033a000-3a100033c000 ---p 00000000 00:00 0
3a100033c000-3a100038b000 rw-p 00000000 00:00 0
3a100038b000-3a100038c000 ---p 00000000 00:00 0
3a100038c000-3a100039b000 rw-p 00000000 00:00 0
3a100039b000-3a100039c000 ---p 00000000 00:00 0
3a100039c000-3a10003af000 rw-p 00000000 00:00 0
3a10003af000-3a10003b0000 ---p 00000000 00:00 0
3a10003b0000-3a10003e8000 rw-p 00000000 00:00 0
3a10003e8000-3a1000401000 ---p 00000000 00:00 0
3a1000401000-3a1000402000 rw-p 00000000 00:00 0
3a1000402000-3a100040c000 ---p 00000000 00:00 0
3a100040c000-3a100046f000 rw-p 00000000 00:00 0
3a100046f000-3a1000470000 ---p 00000000 00:00 0
3a1000470000-3a100047a000 rw-p 00000000 00:00 0
3a100047a000-3a100047c000 ---p 00000000 00:00 0
3a100047c000-3a1000492000 rw-p 00000000 00:00 0
3a1000492000-3a1000494000 ---p 00000000 00:00 0
3a1000494000-3a10004a2000 rw-p 00000000 00:00 0
3a10004a2000-3a10004a4000 ---p 00000000 00:00 0
3a10004a4000-3a10004b6000 rw-p 00000000 00:00 0
3a10004b6000-3a10004b8000 ---p 00000000 00:00 0
3a10004b8000-3a10004ea000 rw-p 00000000 00:00 0
3a10004ea000-3a10004ec000 ---p 00000000 00:00 0
3a10004ec000-3a10005f4000 rw-p 00000000 00:00 0
3a10005f4000-3a1000601000 ---p 00000000 00:00 0
3a1000601000-3a1000602000 rw-p 00000000 00:00 0
3a1000602000-3a1000604000 ---p 00000000 00:00 0
3a1000604000-3a100062b000 rw-p 00000000 00:00 0
3a100062b000-3a1000801000 ---p 00000000 00:00 0
[...]

I was thinking if you used PTE markers as guards, you could maybe turn
all that into more or less a single VMA?

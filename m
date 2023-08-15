Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0002177CF67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 17:42:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=v/t1rSu7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQFs75PVWz3cPj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 01:42:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=v/t1rSu7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQFrB64bHz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 01:42:02 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-586a3159588so78107927b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692114118; x=1692718918;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7TsLh4UpmerFxSf2LHp//sOCj39QtIaP8NhFu7Ity0=;
        b=v/t1rSu7IOqD7zsEvHxRPZ8PsCIFzAnrAyhA1GeAnqzR3gqcLYYTCisHr6LsT22vfP
         4laXof+eVPcmpLgSaUurUglySIUk5wTKrOXJIVrfFuzCfybCzb0/0AVfQMVJ0iJIRG4H
         0geKl/MMV99hPY+b1UkztXinVcOvwL2sVflQuURKZUXygILqXy0hylwT5O5AGgmvPpyb
         srYr1if/5tuZjeqAnbfWF3gwfEMlVFJI+jpZVbFzcg3JYBWEdRGg/oIVxBn0/AdWjomv
         dLXCkhljXHfLN7Qp8CgGrb1wPb2fkkHuSPRQ+VOFXR8Uhg34HjYmVoNDAYs3GRvk+rOp
         M2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692114118; x=1692718918;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7TsLh4UpmerFxSf2LHp//sOCj39QtIaP8NhFu7Ity0=;
        b=M+I1S9RvyG9yxTFSmuEjRLTXKcBfCE8VkaDNP4GAXoJoqtm3/dotBsgIcAlvwq2TNk
         vr4GeIlImCS7PCuwI0mfidt2cwSeNNPqN6lF+1SO7vxOMPUPZg+T3ZZHKcimObKipMpH
         K1zuMSL7/rVlU9g5fXp7bfXQ7TQgwFCVBuW3NucRvRrlyYjlNY2HIh3+leOVm2tgVXky
         BtFKJLI01G+8jJtoSC2fddjVbKq6GgBHSI3p44pauRXySRTzy+G94n5CGXIA5Fy9/VZL
         4xZEQ0xWW9gI8KJq0tY+TTZy5XoVLWvRVYf5TAxdFdbZ6sMHDzwQXbcXLeA+c3Y5dXMd
         4zZQ==
X-Gm-Message-State: AOJu0YwrN8jN+gaWDi/48a9aNl0EDtPaoaNqHRB6VP/63y+O8PD8eSra
	cf1QVIMZkZ06g1ZQY67lv80BIQ==
X-Google-Smtp-Source: AGHT+IFym1gqMNFckrS6y/rCULvNhW2b/lORvGgm0DCRSg/pwTXV+un25GqW0LvhUjQm8jbcdgknTw==
X-Received: by 2002:a0d:cc92:0:b0:589:a4c7:ee40 with SMTP id o140-20020a0dcc92000000b00589a4c7ee40mr2727997ywd.2.1692114117698;
        Tue, 15 Aug 2023 08:41:57 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id x206-20020a814ad7000000b005707fb5110bsm3475226ywa.58.2023.08.15.08.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 08:41:57 -0700 (PDT)
Date: Tue, 15 Aug 2023 08:41:45 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: David Hildenbrand <david@redhat.com>
Subject: Re: [BUG] Re: [PATCH v3 10/13] mm/khugepaged: collapse_pte_mapped_thp()
 with mmap_read_lock()
In-Reply-To: <76e6b2ad-4e1e-2ad3-95df-00b4d33ec9d2@redhat.com>
Message-ID: <35d52c74-9ba9-211e-a4f-ade6ed318e76@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <b53be6a4-7715-51f9-aad-f1347dcb7c4@google.com> <CAG48ez0FxiRC4d3VTu_a9h=rg5FW-kYD5Rg5xo_RDBM0LTTqZQ@mail.gmail.com> <cacd4a19-386d-8bea-400-e99778dbc3b@google.com>
 <76e6b2ad-4e1e-2ad3-95df-00b4d33ec9d2@redhat.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger
 @linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Jann Horn <jannh@google.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 15 Aug 2023, David Hildenbrand wrote:
> On 15.08.23 08:34, Hugh Dickins wrote:
> > On Mon, 14 Aug 2023, Jann Horn wrote:
> >>
> >>          /* step 4: remove page table */
> >> +       if (strcmp(current->comm, "DELAYME") == 0) {
> >> +               pr_warn("%s: BEGIN DELAY INJECTION\n", __func__);
> >> +               mdelay(5000);
> >> +               pr_warn("%s: END DELAY INJECTION\n", __func__);
> >> +       }
> >>
> >>          /* Huge page lock is still held, so page table must remain empty
> >>          */
> >>          pml = pmd_lock(mm, pmd);
> >>
> >>
> >> And then run the attached reproducer against mm/mm-everything. You
> >> should get this in dmesg:
> >>
> >> [  206.578096] BUG: Bad rss-counter state mm:000000000942ebea
> >> type:MM_ANONPAGES val:1
> > 
> > Thanks a lot, Jann. I haven't thought about it at all yet; and just
> > tried to reproduce, but haven't yet got the "BUG: Bad rss-counter":
> > just see "Invalid argument" on the UFFDIO_COPY ioctl.
> > Will investigate tomorrow.
> 
> Maybe you're missing a fixup:
> 
> https://lkml.kernel.org/r/20230810192128.1855570-1-axelrasmussen@google.com
> 
> When the src address is not page aligned, UFFDIO_COPY in mm-unstable would
> erroneously fail.

You got it, many thanks David: I had assumed that my next-20230808 tree
would be up-to-date enough, but it wasn't.  Reproduced now.

Hugh 

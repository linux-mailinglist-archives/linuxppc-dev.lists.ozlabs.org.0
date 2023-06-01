Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE9719F33
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 16:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX7J81yj9z3f0B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 00:07:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Ja7iIoia;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Ja7iIoia;
	dkim-atps=neutral
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX7HD5QbVz3bcF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 00:07:02 +1000 (AEST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-55825988b7bso307269eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1685628419; x=1688220419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Il8ad/JyLlNtEN0Gv4lgifY2JQdLnMbUxgSHsXnJD/E=;
        b=Ja7iIoiaBZS06nl+158TUHHbNfEj3dQZ/L62R0DW/ijsVPGlsZ2O32Ba4eQCHX0zAg
         LfHMRKbOsxI5fTkJegrENtOKGl9zwk0OJLur02SGJ6GIveUDBcVkr+UhIEaFUVcRjrKv
         I+lxCwssvsZK8CqLx1MBuX6uAdKjNETkdRqy7zXaIaDyhuZ4NBPXIc4oT4Kq9QPYL/wp
         rQLV8GNPnEEDqd/Ylc/L8oZa2HjL+J1vDLj4QFw7X1INT12js5HjHN0Joz+wUbJ02lUx
         KBCcn64/pwCReWJpNIW2B8GeaXRlQuUpK9rJC0snd+LGP1JbYm8YgxK8d5hCtKnpZFl1
         SjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685628419; x=1688220419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Il8ad/JyLlNtEN0Gv4lgifY2JQdLnMbUxgSHsXnJD/E=;
        b=BzAUfb2CqRzvuHeYnmBoxaBEFVVWHiCbuXyAfA8mvao1aQtLnjN4Z3/48ID4RYtnoe
         oTL/w7udg/ZMbV5c2uy8BbcEY9BcjsFdFwVqcA2pYc2zaPY6QPC07n7p09Mjzm61pRKU
         36Wj93ZRweRvaeigzgr0nbSvrRJ3ZTh2r6NV3G3WWwF9Pfo/2RqJIUXc4V2SonjedgwG
         sNHYITAeA+aIUwhn88SJBK8rQ1i1pyfylXh6tN9x/v1RUnss+tE4Y0QfTNW7ZmX/rx3I
         fGDzW3jfQNFRhzXSL4nekxJKeCri+4NsmE+rYQ77VAL/dPfP2M7L9fTDGtPd+G7DRHJl
         Sc0Q==
X-Gm-Message-State: AC+VfDyfnOGKEH71E11bMRbjjAOl3mjo4PLTUaycVnXlKiTChBIlDhVb
	fzpSe+1eOmfloNjIN7WpbxZ/bA==
X-Google-Smtp-Source: ACHHUZ4AEXih+LbcgXQJ3oJivdeKU2TDKI4u9IDJeO3/vV8DGscgFzmcnAdAr6rfYy2wFC0uefsS6g==
X-Received: by 2002:a05:6808:1494:b0:398:1186:88b9 with SMTP id e20-20020a056808149400b00398118688b9mr5790684oiw.30.1685628419236;
        Thu, 01 Jun 2023 07:06:59 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id es1-20020a056214192100b00626195bdbbdsm5454337qvb.132.2023.06.01.07.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 07:06:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q4ix7-001SP8-JZ;
	Thu, 01 Jun 2023 11:06:57 -0300
Date: Thu, 1 Jun 2023 11:06:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 09/12] mm/khugepaged: retract_page_tables() without mmap
 or vma lock
Message-ID: <ZHimAWRNDTg1JPOp@ziepe.ca>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <2e9996fa-d238-e7c-1194-834a2bd1f60@google.com>
 <CAG48ez0aF1Rf1apSjn9YcnfyFQ4YqSd4GqB6f2wfhF7jMdi5Hg@mail.gmail.com>
 <ZHe0A079X9B8jWlH@x1n>
 <CAG48ez1UNFfpTUph6ZMuN61CoTGne05NLAweL_=ijRfqj5evMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez1UNFfpTUph6ZMuN61CoTGne05NLAweL_=ijRfqj5evMg@mail.gmail.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshu
 man.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 01, 2023 at 12:18:43AM +0200, Jann Horn wrote:

> 3. We have to *serialize* with page table walks performed by the
> IOMMU. We're doing an RCU barrier to synchronize against page table
> walks from the MMU, but without an appropriate mmu_notifier call, we
> have nothing to ensure that we aren't yanking a page table out from
> under an IOMMU page table walker while it's in the middle of its walk.
> Sure, this isn't very likely in practice, the IOMMU page table walker
> is probably pretty fast, but still we need some kind of explicit
> synchronization to make this robust, I think.

There is another thread talking about this..

Broadly we are saying that we need to call mmu ops invalidate_range at
any time the normal CPU TLB would be invalidated.

invalidate_range will not return until the iommu HW is coherent with
the current state of the page table.

Jason

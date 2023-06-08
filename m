Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2D672752F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 04:47:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc7sr3JtBz3f0r
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 12:47:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=da3ktJDt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=da3ktJDt;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc7rx0cxqz3bnV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 12:46:40 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-568928af8f5so2663267b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 19:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686192397; x=1688784397;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ASVf02IlD8C2FBeHhgGmTxXuzubkx9rvqSR5YGjpQE=;
        b=da3ktJDtrHlXFJY7fBZV9rF65uZZhghhOV9dnWa/Fsa39j+kMpSSL6DALstHpQz61g
         K4YVYJos6+GGP6Xf9ot3Uk/1ZbuoyK1eEfBQh/bTNe/mDYJxX8S+fb9se2eckLKEuTOP
         UD7/4cfGR2T85Ke8Bc4ObLfx9a9FXmomkcXEFQInN+aLXpDDyqofJ4uF60Ko9gzt3x2L
         MGX9ZxFfnKfNnjs1tFSzEKj5NE78sfc+UDhIQev+RhydadRJR8BTDVk3Lch9IO5KK2Az
         N/YtKtrcGMeEnF2xteGjLRnISuA5d7eV63yxWyEhWp6zKk6kXjpoiTGJgfB7a9sG5sLf
         6M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686192397; x=1688784397;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ASVf02IlD8C2FBeHhgGmTxXuzubkx9rvqSR5YGjpQE=;
        b=as4F2Qq7PJQSkYN+G77qq4mmMUoJs6H/0LLWiL7P9jQvU1dAaCUoahwRtxUeXUbOnQ
         XY6fi6IXr/Xb0ns6xs3jIUidCwLjbw3GHVcENYd4FOdUrqJAU3Qdc0PacctTucJ82gvN
         3XtyQy44yoBLS+59KyPNodWBjyuB+O7d/4ctCaQK+bOa828yTmtvtCu6H8VFv3tDhj/N
         GBjsX8LTL1iBIH9RMC/+kt+XShavWrVmBi86rqWRJjTP82QledhdQc3K0rn4AJ8R72LQ
         +KVgJRkCmWMi+L8BIGhNDysxmUv3PoXRzoxn7uGW/V2fTZs4HhmJl04kU94UipuOpjTY
         UPAQ==
X-Gm-Message-State: AC+VfDwhuAu7zJAxV1r+vxne3U/xlTjwJqW/y9A/8OiqbJ5E8beZjdor
	7ZYEuPCj0aqB6o/urqjN2hwshQ==
X-Google-Smtp-Source: ACHHUZ4dFnfQCU4EFBdNXwNcj7Ir8z8QRqL+UH/A47UqaCSLxCcPaFmZ7Dypt65uEduAukIhZYJfeQ==
X-Received: by 2002:a81:5f06:0:b0:561:bbb8:2dc3 with SMTP id t6-20020a815f06000000b00561bbb82dc3mr981921ywb.21.1686192396777;
        Wed, 07 Jun 2023 19:46:36 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j7-20020a816e07000000b00568e7e21db7sm103768ywc.96.2023.06.07.19.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:46:36 -0700 (PDT)
Date: Wed, 7 Jun 2023 19:46:26 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 07/12] s390: add pte_free_defer(), with use of
 mmdrop_async()
In-Reply-To: <ZH99cLKeALvUCIH8@ziepe.ca>
Message-ID: <ed24b58f-ef9f-2427-7372-5c77378c5b40@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <6dd63b39-e71f-2e8b-7e0-83e02f3bcb39@google.com> <175ebec8-761-c3f-2d98-6c3bd87161c8@google.com> <ZH99cLKeALvUCIH8@ziepe.ca>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pas
 ha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 6 Jun 2023, Jason Gunthorpe wrote:
> On Mon, Jun 05, 2023 at 10:11:52PM -0700, Hugh Dickins wrote:
> 
> > "deposited" pagetable fragments, over in arch/s390/mm/pgtable.c: use
> > the first two longs of the page table itself for threading the list.
> 
> It is not RCU anymore if it writes to the page table itself before the
> grace period, so this change seems to break the RCU behavior of
> page_table_free_rcu().. The rcu sync is inside tlb_remove_table()
> called after the stores.

Yes indeed, thanks for pointing that out.

> 
> Maybe something like an xarray on the mm to hold the frags?

I think we can manage without that:
I'll say slightly more in reply to Gerald.

Hugh

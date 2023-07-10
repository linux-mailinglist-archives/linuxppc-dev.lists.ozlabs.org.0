Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA674DC43
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:22:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=IMsBYjy3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R09n442Xwz3c2f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:22:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=IMsBYjy3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R09lK5SG1z3bpC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:21:16 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-766fd5f9536so332767685a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 10:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1689009674; x=1691601674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vDKqe6h9VsjQuDpKI9KRg1N7kbgZMbKA4ecQ1xozFqs=;
        b=IMsBYjy3Toq+G3vBDgnvPIjgdoK/8dHggIY3Hs7qoUt25YkpzOmPBi/nHn//DrOYJB
         /Ua+/QBa5Use8IJESRSiFunKdkGqNHd+YUqoRuJfQ4kcz9FzGR8GIZXsQpoAByEtiRoW
         aHShM1l7QbL76OMNkc1lG2qoSZ//vH0KwhSWZJu3JAj2Jxo8XWZBsa1X0VxWF2oEWd2s
         Qu1lVdsr/969sUuC9+ClJLKaydssewFZiIszGWbW/S6Cjo7VrKDsSxZ7RPNvyFeMxk1W
         6TYZEng5dbEcOdn1U6fXy08kcBT33/DATCe+/VchSTeFDgqF+J/WUVPSVonRZqpbV4JY
         T2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689009674; x=1691601674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDKqe6h9VsjQuDpKI9KRg1N7kbgZMbKA4ecQ1xozFqs=;
        b=MkhNIWErYJILuElvZbBCIEy1OXPZnMUonIrg+U6RTjjkmSVrshu+7f98/2QXAydhC2
         O8z3z45POLEWLcFjalEGB7BAZqZnCl7QtP7aOy0JUZQuo3S964oUSe7gNDRVhllvK4f6
         Wxwi7zg2ysNbOJIGZFSCRZPYSXn0zHqJgnCjn/DtHsOzG3ZS3z9BnqANupIp7Kz14uQT
         dVVG3lzaqgxbDCqnoZGCcD9+5B35U8RtiXQoSOtfKi5xnYZYFVeKA6CkqLV/csMQXk7S
         WZUXu410xnIfds/jepdaJu1OZ6AeAxkO2UpBTE7VyO8ZYbUSe1yl4GRpGyFPenGvEU7o
         qoAg==
X-Gm-Message-State: ABy/qLbPgyW/nTbjZsFg6hEtCzdcxin8talfzI35neKVrlAQlI6TmxzL
	ltasLmhVhsh0ZFx+YN+bCqRYrA==
X-Google-Smtp-Source: APBJJlEZjgv87sGoqCoA2OyNTenIrI3xxoXPoRV2o/wxukY2mPE0POHCvXNINrLxikThI/IjdSHCSQ==
X-Received: by 2002:a05:620a:198f:b0:767:205b:7f4b with SMTP id bm15-20020a05620a198f00b00767205b7f4bmr13197531qkb.41.1689009673882;
        Mon, 10 Jul 2023 10:21:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id g6-20020ae9e106000000b00767dc4c539bsm61695qkm.44.2023.07.10.10.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 10:21:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qIuZT-0004Dq-J0;
	Mon, 10 Jul 2023 14:21:11 -0300
Date: Mon, 10 Jul 2023 14:21:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
Message-ID: <ZKw+BxRUrGC8LW5P@ziepe.ca>
References: <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
 <20230628211624.531cdc58@thinkpad-T15>
 <cd7c2851-1440-7220-6c53-16b343b1474@google.com>
 <ZJ2hsM5Tn+yUZ5ZV@ziepe.ca>
 <20230629175645.7654d0a8@thinkpad-T15>
 <edaa96f-80c1-1252-acbb-71c4f045b035@google.com>
 <7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com>
 <20230704171905.1263478f@thinkpad-T15>
 <e678affb-5eee-a055-7af1-1d29a965663b@google.com>
 <20230705145516.7d9d554d@thinkpad-T15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705145516.7d9d554d@thinkpad-T15>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@so
 leen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 05, 2023 at 02:55:16PM +0200, Gerald Schaefer wrote:

> Ah ok, I was aware of that "semi-RCU" fallback logic in tlb_remove_table(),
> but that is rather a generic issue, and not s390-specific. I thought you
> meant some s390-oddity here, of which we have a lot, unfortunately...
> Of course, we call tlb_remove_table() from our page_table_free_rcu(), so
> I guess you could say that page_table_free_rcu() cannot guarantee what
> tlb_remove_table() cannot guarantee.

The issue is the arches don't provide a reliable way to RCU free
things, so the core code creates an RCU situation using the MMU
batch. With the non-RCU compatible IPI fallback. So it isn't actually
RCU, it is IPI but optimized with RCU in some cases.

When Hugh introduces a reliable way to RCU free stuff we could fall
back to that in the TLB code instead of invoking the synchronize_rcu()

For lots of arches, S390 included after this series, this would be
pretty easy.

What I see now as the big trouble is that this series only addresses
PTE RCU'ness and making all the other levels RCUable would be much
harder on some arches like power.

In short we could create a CONFIG_ARCH_RCU_SAFE_PAGEWALK and it could
be done on alot of arches quite simply, but at least not power. Which
makes me wonder about the value, but maybe it could shame power into
doing something..

However, calling things 'page_table_free_rcu()' when it doesn't
actually always do RCU but IPI optimzed RCU is an unfortunate name :(
As long as you never assume it does RCU anywhere else, and don't use
rcu_read_lock(), it is fine :)

The corner case is narrow, you have to OOM the TLB batching before you
loose the RCU optimization of the IPI.  Then you can notice that
rcu_read_lock() doesn't actually protect against concurrent free.

Jason

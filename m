Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFF6736B61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 13:46:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=cnn8IRs9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QllGW08bNz30hY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 21:46:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=cnn8IRs9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QllFZ5cZSz30Xd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 21:45:52 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666edfc50deso2251710b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 04:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1687261549; x=1689853549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWdugmL7jiCCazRwRTiCxhXSGGIdZDMM/iY0UbvTdUM=;
        b=cnn8IRs9UEV2IyxM2/dyNE8Ybbqmsnj6tLoR8M1bmXQAVunFEwC20TKu6DUOVKG4AB
         L2Yp6/XPUf6F5Xy+nc7uJZfoC02InmQWSMblYoG/4uAdrA9GIFvL7kwUb/yEeNhYFGr1
         bkwG9DCJKJm7UPMDVOHOR7oHEfHhzz1mYZlMGy4Z2i7tBudfceWk0OsWq4cf8C2qfKpV
         w9kz4Q6fy8cbK1P9tLY7jnan9hyd8ZaBomTDWQJ4IaOPbEXOkOCCXRQOiThAn1UjmjTv
         PMpNa0lpCABevs0dIyQN5iH+zWSS9D1PjlkqlJwomy4rRdkHiQnPe7pPZunP1WQZBtR3
         zPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687261549; x=1689853549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWdugmL7jiCCazRwRTiCxhXSGGIdZDMM/iY0UbvTdUM=;
        b=PCdy0pDl+MxQco/UFHrIG+7iYvUN/3YVXNoe7j5U/VqGW7Ld0g1PP1t4RHR5PdUhbz
         6N4tZI3ySRxWp5n/0NORj1ur7lTruiJ8bniU+nsmjH+9PZoX4t38WVvkit4Y3jNsk7kV
         woZNBK3csfKkclJ20R1CiOwQhpRR0V2vyv5LlNs71GjUAEz4tUE87ASoMZ0kfd/xRBW+
         2jcVkxm/oio53eO/XIJdbqH3IBA8wWJxu/cqYkvaBq0bneU3ZKaPHCIGC5TI18drI2Ys
         XGeKskJCpZw7ymaReDvk/V+nMPR+e8PyUvECzSIKHp0PjEmyyGHoNrE8LzrHzdNKidz1
         Inmg==
X-Gm-Message-State: AC+VfDxdpMbhtoHJkyuj4bzZUgvP2OCaDBwRs/+G2zRBIpy0kuvrWiOU
	OJHcc44AexmHAQw0nC64oIWYTw==
X-Google-Smtp-Source: ACHHUZ4X6nDwRKfeDuMyEgMyTrD6VgfsYjM5cSKUHYx3cAu4vDqqHRc1ln2Pqg94YC+C6bvDGfs7/g==
X-Received: by 2002:a05:6a00:1820:b0:668:732d:7d9f with SMTP id y32-20020a056a00182000b00668732d7d9fmr10033336pfa.2.1687261549460;
        Tue, 20 Jun 2023 04:45:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id d17-20020aa78e51000000b0062d859a33d1sm1207199pfr.84.2023.06.20.04.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 04:45:48 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qBZnv-007KSY-BA;
	Tue, 20 Jun 2023 08:45:47 -0300
Date: Tue, 20 Jun 2023 08:45:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 05/12] powerpc: add pte_free_defer() for pgtables
 sharing page
Message-ID: <ZJGRa4zvsXfc43vB@ziepe.ca>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
 <5cd9f442-61da-4c3d-eca-b7f44d22aa5f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cd9f442-61da-4c3d-eca-b7f44d22aa5f@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David Sc. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 20, 2023 at 12:47:54AM -0700, Hugh Dickins wrote:
> Add powerpc-specific pte_free_defer(), to call pte_free() via call_rcu().
> pte_free_defer() will be called inside khugepaged's retract_page_tables()
> loop, where allocating extra memory cannot be relied upon.  This precedes
> the generic version to avoid build breakage from incompatible pgtable_t.
> 
> This is awkward because the struct page contains only one rcu_head, but
> that page may be shared between PTE_FRAG_NR pagetables, each wanting to
> use the rcu_head at the same time: account concurrent deferrals with a
> heightened refcount, only the first making use of the rcu_head, but
> re-deferring if more deferrals arrived during its grace period.

You didn't answer my question why we can't just move the rcu to the
actual free page?

Since PPC doesn't recycle the frags, we don't need to carefully RCU
free each frag, we just need to RCU free the entire page when it
becomes eventually free?

Jason

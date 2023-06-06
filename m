Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E07C4724B93
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 20:40:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbK6X52FQz3f8h
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 04:40:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=K/ZrDlF8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=K/ZrDlF8;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbK5g5CLFz3ch8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 04:39:49 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b026657a6fso56085785ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 11:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1686076787; x=1688668787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ipsTwHL47notmV/HGoey6MkAAn1uRiqZTtJAd3PLJL0=;
        b=K/ZrDlF8KMAnDS85fxZpm6YhX4Oph+uve2y/Y+MrmfyE2WE3XoTh1kngEqIpjeVuP4
         LYlM06s8Uw7AO+LzmDl6QeBr8o8xTQ7KHd5QRfYpgJLfaLmmaYC7+90/Qtagjikdbx65
         /aR2ImBqmnp+INz1P6qgonoJXcFcbcfyAyqaFe4FmJ6o+UJj8+nyeBNmhXxQJRYBU02N
         mr7S2Cz3HsMBapBOgAJWZ25UUc6Hza7XfixudL4IY/IY8VwHWaYmffzNpqaauIHjbZWC
         HkA175FUYWjYIoEjNPC+K1Df/J2BYZPiN+Y2bqFa66dNRJSl8SyRX9Hum7j9HK57QQUT
         7joA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686076787; x=1688668787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipsTwHL47notmV/HGoey6MkAAn1uRiqZTtJAd3PLJL0=;
        b=k40C/rjYtV5BVdbbExNdIwgSRCfWP/vGNYvfyK2pkS8bD6geBy6TnRQJ8I+1qsHUGW
         bzj8xooNsPpmLqkUpFpTe3xb1JcaRFx7zB6gtOLqQT6shG9LwN8v679X/+KaMTHxG/8B
         BuWJcT5/JUd62JQhcGPufXJOFKfqHQC1xPTaCqQqgP7+xLuLSM9GjFsHIYC06rX0wzgg
         ALaqh78/bLlIRYjjkXEkxkYbazUCtCL4/NFU49ineqcf9gF6/Z3tuS2wejNEiXoo6clR
         sdZ2K0mISWT2qbAA4WoBGD2Fjlu0dGj4T1SxCU2k42aiX5uSAiq/W4FKj1npdHJikLsC
         gU4Q==
X-Gm-Message-State: AC+VfDyU5QxWxeJiYjKWy8AfBZlHRtqZHT2GXSxjehHONEcLt/6JEaBs
	kh0gbJdrVqUqsGNJNJL8MXNapQ==
X-Google-Smtp-Source: ACHHUZ5Z8L5+gsuV0Vp/V1wMVAvDi3cyVCaZDXHr2VY8t2bgbdMDsnlE8QTZgIjlmziBgBimkE2xDQ==
X-Received: by 2002:a17:902:7605:b0:1b1:a9e7:5d4b with SMTP id k5-20020a170902760500b001b1a9e75d4bmr2874824pll.22.1686076787139;
        Tue, 06 Jun 2023 11:39:47 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id f3-20020a170902ce8300b001aaf2e7b06csm8839952plg.132.2023.06.06.11.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 11:39:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q6baq-0030jJ-Oc;
	Tue, 06 Jun 2023 15:39:44 -0300
Date: Tue, 6 Jun 2023 15:39:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 07/12] s390: add pte_free_defer(), with use of
 mmdrop_async()
Message-ID: <ZH99cLKeALvUCIH8@ziepe.ca>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <6dd63b39-e71f-2e8b-7e0-83e02f3bcb39@google.com>
 <175ebec8-761-c3f-2d98-6c3bd87161c8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175ebec8-761-c3f-2d98-6c3bd87161c8@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily G
 orbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 05, 2023 at 10:11:52PM -0700, Hugh Dickins wrote:

> "deposited" pagetable fragments, over in arch/s390/mm/pgtable.c: use
> the first two longs of the page table itself for threading the list.

It is not RCU anymore if it writes to the page table itself before the
grace period, so this change seems to break the RCU behavior of
page_table_free_rcu().. The rcu sync is inside tlb_remove_table()
called after the stores.

Maybe something like an xarray on the mm to hold the frags?

Jason

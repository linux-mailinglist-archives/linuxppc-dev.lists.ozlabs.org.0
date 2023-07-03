Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADF07464DE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 23:30:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ciMHCgEy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvzc92Nf6z3bkD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 07:30:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ciMHCgEy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvzbF6FMFz30dw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 07:29:43 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-26304be177fso2343795a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jul 2023 14:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1688419778; x=1691011778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dg0Gj8viEWfIWcxIZc6iyfyM+TCYwvws/9N3ezb+Z4=;
        b=ciMHCgEytyQpXiLlKqi3gz/v7Q2CHhYlXp9swK68CxESaRga14VO+v3ioFdBXsYDLs
         rcJstbloCFNhdyL8erhHWR7+k/2G2ZmekQkHOlLD+CHVeKnxlVQEAYi4thVU88jUmlqP
         j3AGFkPfvugYcv6dCmSAzMJAAyhg1ABHOGQ6MaLAdsnWWMIo4JB8NFzrMsH4cg3S6MEo
         u2Zcz5D9ARgll/H+oBV/djEHlDDqEHh/6LiwiUjnMih7ZCbaZjvFAg4+P4L6MdepK6me
         Bll7SIw/4ovRaQDEUVlzPsNcEFS/MXpYuVmlTSmCre5BrbjEKllFu+L2hZxsC8HgQV9B
         IGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688419778; x=1691011778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dg0Gj8viEWfIWcxIZc6iyfyM+TCYwvws/9N3ezb+Z4=;
        b=lmDAsP8Bnlg4PDVJL7bnHnId79v+ATyshCLIgcec1T1C7Uk2iwQobWepM9w4HHgwV3
         SBtqAHAX6ToOZtQ9zIFETf4gy/TC2upsGRq9RL1AI72wwQTxx/LJz7LH/hQYHm/gAx44
         Yt5U4yHfkH+vcR83FWrjyp6v6EKEAMbvltirsYYnSxKRMErmGI9Gnnga6J9hVJOr4dCC
         I62JAOutmY+dJmuQi6TWmAdmFFB81Fxlj25UICYmkfPby7F1JC+T1dxXxVilLRsDqug0
         YcokaQKTMxsBpDW8Iz61cT4OO2VdUyNOJYOt3Dr/rS0K63x1FMGn7bDFCpzKJLTlfboM
         /NxA==
X-Gm-Message-State: ABy/qLZniLQjca/Ino+zNnAQQ0aqp7+dZgOEvA0SzOjae17T0cRMAIC0
	KY+rFAAvkz/WntQVk3q2DGhbMg==
X-Google-Smtp-Source: APBJJlE0dK/ixgJCjZM8BVxtoBqxR3hYidUzDYcxy89uMsoxRbB7avUM4k+kl/Tzd5k23OlP0AX/hg==
X-Received: by 2002:a17:90a:1b02:b0:263:7d55:de2e with SMTP id q2-20020a17090a1b0200b002637d55de2emr9149088pjq.9.1688419778192;
        Mon, 03 Jul 2023 14:29:38 -0700 (PDT)
Received: from ziepe.ca (ip-216-194-73-131.syban.net. [216.194.73.131])
        by smtp.gmail.com with ESMTPSA id gz24-20020a17090b0ed800b00263c8b33bcfsm2234333pjb.14.2023.07.03.14.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 14:29:37 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qGR72-000BQ9-Bm;
	Mon, 03 Jul 2023 18:29:36 -0300
Date: Mon, 3 Jul 2023 18:29:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
Message-ID: <ZKM9wEKZZes4n4u0@ziepe.ca>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
 <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
 <20230630153852.31163592@p-imbrenda>
 <062b19-4cf1-261-a9bf-9cefd32382fc@google.com>
 <20230630182556.7727ef50@p-imbrenda>
 <7f6d399b-c47-1faa-f7f6-9932b9811f8c@google.com>
 <20230703130013.559217c9@p-imbrenda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703130013.559217c9@p-imbrenda>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatas
 hin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 03, 2023 at 01:00:13PM +0200, Claudio Imbrenda wrote:
> On Fri, 30 Jun 2023 12:22:43 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
> 
> [...]
> 
> > That's something I would have expected to be handled already via
> > mmu_notifiers, rather than buried inside the page table freeing.
> > 
> > If s390 is the only architecture to go that way, and could instead do
> > it via mmu_notifiers, then I think that will be more easily supported
> > in the long term.
> 
> I am very well aware of that, and in fact I've been working on
> exactly that for some time already. But it's a very complex minefield
> and therefore I'm proceeding *very* carefully. It will take quite some
> time before anything comes out.

Yes +1 on this please, creating your own arch cross connect with kvm
in the page table freers is really horrible..

Jason

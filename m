Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE37737571
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 21:55:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=GnK6zVkt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qly6k0HNpz3bYc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 05:55:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=GnK6zVkt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qly5l2y7dz30fd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 05:54:50 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-56ffd7d7fedso55387727b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 12:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687290887; x=1689882887;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IiBraH1gFEtLq0Kn5mTuDR7eletLpb8dAh5y2pzul9A=;
        b=GnK6zVktB4fTweKikYzUukoKZGCmVusKP/x6uUrsa1IZh7Lcf11VRj9767YwL28zyx
         J4JKcGvTfTr/LvFgYj5pm1tfEFEJ8PKkMTUvowkeEnkdtgmC9135h58fxQzErHTduUCX
         +m+UG/mn18iCUxOKOQQ3TboQqPdTC4trrhg3CdFjun1ZClZ8tNP63vy0pMK4T8o5rwHN
         Ev/CkGwjSSWdgG/b37eVTxoy7CA9K7VH5ECYT9iqlmvWSv+gngjFQijyE1bOMwoZXb/s
         MCqGmsFWL/xCVoRj8nY9T1uCu7dqqcS1sL95WKPUvtYF9Sc63RHc6WC/aK2yPQNdgDcy
         QIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687290887; x=1689882887;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IiBraH1gFEtLq0Kn5mTuDR7eletLpb8dAh5y2pzul9A=;
        b=kH+tJvgjf0Si8rCqnbPhtbl+PSI+JtxXv2ymKr9A0j0jTs13QUUvdSBOAsVL2jr8iI
         1s2dRWNSOy2tGlaNGciExcrnR6MzACHG3uT9HiSp8BtpY6y6FGnFPIHsoBLhLfmKraWL
         1hmXEpH/oVREASSmNfWbDdP1X7EaJlfmj3ooFwPQPgFtwQXOTqvCalVG3bDboGe8rx7u
         TWAD6yKAkstNvYS4K6CyiXfP83sF9zfXwhy551Qk0WkOoayAQDt9H0x4xSCQ6yljko6P
         4VCGc9PJWC+xuo8P3Vc5Bk8IWPsLkKPFX94oo3k4J2P1flbBTntAzVTJQc1esnZ1/ObD
         G8QA==
X-Gm-Message-State: AC+VfDy8s92hNYR1oMp7OTegcqZFugszwMPvnw6TKFqeSa1AtCLGUgR2
	fxP/k4Yar2Nwtmy028Y+xdI/3g==
X-Google-Smtp-Source: ACHHUZ5CjW+DD7ghkPvVJFGUBN1BQG+qQA/ISq9t6lWLEboPHQzho8N1caYYSPmYBruWUqH6Cq9/Mw==
X-Received: by 2002:a0d:d106:0:b0:56d:45ec:2e64 with SMTP id t6-20020a0dd106000000b0056d45ec2e64mr14660924ywd.43.1687290886830;
        Tue, 20 Jun 2023 12:54:46 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n20-20020a819e54000000b005705cbba0bcsm649525ywj.98.2023.06.20.12.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 12:54:45 -0700 (PDT)
Date: Tue, 20 Jun 2023 12:54:25 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 05/12] powerpc: add pte_free_defer() for pgtables
 sharing page
In-Reply-To: <ZJGRa4zvsXfc43vB@ziepe.ca>
Message-ID: <2ad8b6cf-692a-ff89-ecc-586c20c5e07f@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <5cd9f442-61da-4c3d-eca-b7f44d22aa5f@google.com> <ZJGRa4zvsXfc43vB@ziepe.ca>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David Sc. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Jun 2023, Jason Gunthorpe wrote:
> On Tue, Jun 20, 2023 at 12:47:54AM -0700, Hugh Dickins wrote:
> > Add powerpc-specific pte_free_defer(), to call pte_free() via call_rcu().
> > pte_free_defer() will be called inside khugepaged's retract_page_tables()
> > loop, where allocating extra memory cannot be relied upon.  This precedes
> > the generic version to avoid build breakage from incompatible pgtable_t.
> > 
> > This is awkward because the struct page contains only one rcu_head, but
> > that page may be shared between PTE_FRAG_NR pagetables, each wanting to
> > use the rcu_head at the same time: account concurrent deferrals with a
> > heightened refcount, only the first making use of the rcu_head, but
> > re-deferring if more deferrals arrived during its grace period.
> 
> You didn't answer my question why we can't just move the rcu to the
> actual free page?

I thought that I had answered it, perhaps not to your satisfaction:

https://lore.kernel.org/linux-mm/9130acb-193-6fdd-f8df-75766e663978@google.com/

My conclusion then was:
Not very good reasons: good enough, or can you supply a better patch?

Hugh

> 
> Since PPC doesn't recycle the frags, we don't need to carefully RCU
> free each frag, we just need to RCU free the entire page when it
> becomes eventually free?
> 
> Jason

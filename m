Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A79B720434
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 16:21:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXlY054r7z3f0k
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jun 2023 00:21:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YplxNmFB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YplxNmFB;
	dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXlX65szMz3dtX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jun 2023 00:20:20 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-39a3f2668bdso1822345b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jun 2023 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1685715617; x=1688307617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FqaYMxWoeNH3a7vv1yp0mvQMbR3V3EytnPDXxbqJ8VE=;
        b=YplxNmFBW9ljUSBNluudr9Q6wJ87klI3TZokg2k+vwOdVg3A1AJX0pByRXwDqo5MwQ
         alW49lR9XyUQRlk8vt7/xFfIsTB0flktCR+vD1xy2IwNrEoErUzHEn55bDAo5dNnYjOO
         hlmGmFRf+2Fm0iceBj47fAw1vRm2jD5BSmGtugnmJtfDezNH4aKScnhjDxWGb5LL7ypz
         fJzuxhuft9F1/d0AJw9yoXkpAePkuiZjqAB4ZmRDCE8ZLU0IAXmgmRwVUGE2hoENWDmB
         8POcecwSo0I1O94ydcJI8eaZYk6Zm4Sxyg2IRRnMyhcC0eiAebPLKM5kmkf/d3iZsQ9c
         DCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685715617; x=1688307617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqaYMxWoeNH3a7vv1yp0mvQMbR3V3EytnPDXxbqJ8VE=;
        b=fYVHVB0YaSVhcDrp1sehBFKUzjCCZ05ZTM3FFZYQlhxy8+sf2IUqHyZ12oqnl1sWuh
         KEykVH7vy39o9tk2dCx2Q1JD3WO3z2cMQKzJjYEsYJor4yiXDba3oqaNc4xgz1YMycwZ
         RkwnIzuVQLwPCQ+uaIEEpZWmaGfW1LKtMd4IMmoD77YIVJCpdeRPK5ivqoStksUQaIhJ
         GecUvU031+pR8H/yP9yPv13bvtDDdO8Q9TpbsoxG/bus0oPMIuwsXeim42g+oJN4srSx
         voptP4qfTiLxnhhmyMm8sfq0UNSbF2Y6ybdjtIbDHofxYwrNipcCLErLLGAA5FLhixCd
         6zKA==
X-Gm-Message-State: AC+VfDzixHw3k5jbSsqjgwPe++lrTjqz+yuMoOehy9Rg/F/m80FGu5TR
	ALp5BPkRfcszcrv2A9YwUd6qaQ==
X-Google-Smtp-Source: ACHHUZ6vbHMkZi+Yoc+B1yGbLmCswR8p6D4EKcqpOa7k2x/EYO9kFPQlCeZsh27NoZY4RaKVPkuoOA==
X-Received: by 2002:aca:1817:0:b0:398:282e:4c81 with SMTP id h23-20020aca1817000000b00398282e4c81mr140727oih.19.1685715617084;
        Fri, 02 Jun 2023 07:20:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id pz26-20020ad4551a000000b006263735a9adsm847340qvb.112.2023.06.02.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 07:20:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q55dX-001vaI-OV;
	Fri, 02 Jun 2023 11:20:15 -0300
Date: Fri, 2 Jun 2023 11:20:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 05/12] powerpc: add pte_free_defer() for pgtables sharing
 page
Message-ID: <ZHn6n5eVTsr4Wl8x@ziepe.ca>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <28eb289f-ea2c-8eb9-63bb-9f7d7b9ccc11@google.com>
 <ZHSwWgLWaEd+zi/g@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHSwWgLWaEd+zi/g@casper.infradead.org>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Peter Xu <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 29, 2023 at 03:02:02PM +0100, Matthew Wilcox wrote:
> On Sun, May 28, 2023 at 11:20:21PM -0700, Hugh Dickins wrote:
> > +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> > +{
> > +	struct page *page;
> > +
> > +	page = virt_to_page(pgtable);
> > +	call_rcu(&page->rcu_head, pte_free_now);
> > +}
> 
> This can't be safe (on ppc).  IIRC you might have up to 16x4k page
> tables sharing one 64kB page.  So if you have two page tables from the
> same page being defer-freed simultaneously, you'll reuse the rcu_head
> and I cannot imagine things go well from that point.
> 
> I have no idea how to solve this problem.

Maybe power and s390 should allocate a side structure, sort of a
pre-memdesc thing to store enough extra data?

If we can get enough bytes then something like this would let a single
rcu head be shared to manage the free bits.

struct 64k_page {
    u8 free_pages;
    u8 pending_rcu_free_pages;
    struct rcu_head head;
}

free_sub_page(sub_id)
    if (atomic_fetch_or(1 << sub_id, &64k_page->pending_rcu_free_pages))
         call_rcu(&64k_page->head)

rcu_func()
   64k_page->free_pages |= atomic_xchg(0, &64k_page->pending_rcu_free_pages)

   if (64k_pages->free_pages == all_ones)
      free_pgea(64k_page);

Jason

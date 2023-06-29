Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC8474296D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 17:23:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bQ+QaBv9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsMfJ1QFHz3brX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 01:23:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bQ+QaBv9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsMdM5KGWz3bTb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 01:22:30 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7659dc74da1so74193885a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1688052145; x=1690644145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=52QGPi56OcZzeoQSr1+Puoh9x/N7TMLxPpl1Fa9yAkI=;
        b=bQ+QaBv9kQgn0a/ZUWEzUp17QKK8mKbvu7OHRhiOucSgX3eSl924Wd32DWKpaETuWG
         AJZQFb8MZEkw10neO7Emyiwf0zs4rexcslIhj26xYbfhNY61Fs/S3zXUfnMd8nKlLHbq
         CU/gaxpgXz0Fcq+WROZl7v82TmZhyriMp8ghnPjAipqNQvOQZDcDHIDAAILg7qaaRj4g
         cROZVqbL1LvLpBfUtSNqoHdAU+QoeC+43TKUBXk9yEuGi9WwmY8edNie6xIXgtH/0lEz
         iYMbIENsQdCcb6GkheV3Ph/F1WPNpdDYyBYfX2SSNtzeR7J1HM4TRkmoUI53LbULfuQV
         wSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688052145; x=1690644145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52QGPi56OcZzeoQSr1+Puoh9x/N7TMLxPpl1Fa9yAkI=;
        b=hgs0UovXuq66sqF7nRPjkvRFefTT96ugREuHRLJmU+cmqxi6UlWxOkE69W3Zx+V6gs
         peIC3LWx6aeC3jEnisYYAsv+N/YLgphG5eBPnRtYw+Pnf6hrucMNaE1lK/4A0GANDhMa
         jwUa0ujx6gnB2eZFO1gtOYTO2Z4gqS0GBvDD54kd+xJxGMMwmwmvj+HAAnTjL1uCjYBE
         jz+A8poO57RhJ2FURG59/MG1RhLPkKQGhG9/VdSrPJpYLUd2F9FS94yNnlIpydi8heaR
         SZM0O/lBbKtortsQR5JuHBGWl1ejEjN82PShYinVnp+2zjayVBj6jTT1aZ8Irs2mYcaH
         vSmw==
X-Gm-Message-State: AC+VfDwROGD0SahieSOBFrNLlZABb2Wk7AGnxWajXm/H/J+Gk7+0A4ZG
	2numFoLux9bLw1X7Mg/9Fxm4ZA==
X-Google-Smtp-Source: ACHHUZ49j4zxCkMnm+oSSx+2qlaiByXDG1BTDACn1CIjXnwSTZE7XCbDUFEFLrSlPKTofnqYvOeuSg==
X-Received: by 2002:a05:620a:e92:b0:767:90a:ae9e with SMTP id w18-20020a05620a0e9200b00767090aae9emr8621873qkm.65.1688052145311;
        Thu, 29 Jun 2023 08:22:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id r15-20020a05620a03cf00b0074e0951c7e7sm6340805qkm.28.2023.06.29.08.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 08:22:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qEtTU-009snj-1H;
	Thu, 29 Jun 2023 12:22:24 -0300
Date: Thu, 29 Jun 2023 12:22:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
Message-ID: <ZJ2hsM5Tn+yUZ5ZV@ziepe.ca>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
 <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
 <20230628211624.531cdc58@thinkpad-T15>
 <cd7c2851-1440-7220-6c53-16b343b1474@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd7c2851-1440-7220-6c53-16b343b1474@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <p
 asha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 28, 2023 at 10:08:08PM -0700, Hugh Dickins wrote:
> On Wed, 28 Jun 2023, Gerald Schaefer wrote:
> > 
> > As discussed in the other thread, we would rather go with less complexity,
> > possibly switching to an approach w/o the list and fragment re-use in the
> > future. For now, as a first step in that direction, we can try with not
> > adding fragments back only for pte_free_defer(). Here is an adjusted
> > version of your patch, copying most of your pte_free_defer() logic and
> > also description, tested with LTP and all three of your patch series applied:
> 
> Thanks, Gerald: I don't mind abandoning my 13/12 SLAB_TYPESAFE_BY_RCU
> patch (posted with fewer Cc's to the s390 list last week), and switching
> to your simpler who-cares-if-we-sometimes-don't-make-maximal-use-of-page
> patch.
> 
> But I didn't get deep enough into it today to confirm it - and disappointed
> that you've found it necessary to play with pt_frag_refcount in addition to
> _refcount and HH bits.  No real problem with that, but my instinct says it
> should be simpler.

Is there any reason it should be any different at all from what PPC is
doing?

I still think the right thing to do here is make the PPC code common
(with Hugh's proposed RCU modification) and just use it in both
arches....

Jason

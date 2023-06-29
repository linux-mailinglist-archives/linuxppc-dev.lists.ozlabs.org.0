Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DBF741F87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 07:09:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=SH61IoWs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qs61h1Chmz30h1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 15:09:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=SH61IoWs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qs60m48lHz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 15:08:23 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-c2cf29195f8so273170276.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 22:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688015300; x=1690607300;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zFm7aP76Kl3qxn7n2tNVkuwpkcso4qVmefkLtKFqRbs=;
        b=SH61IoWshgo0/pKjl3ljDej2EI0+DSaPIoPH0EnGJIbXtfIIjKOXzIBV7zaurn/u2O
         NzEik2ic/sSNSVVbeZ/UgymQtK7K6oY5QRG/wzVH8poLJ32013nMh89etey0qcHiO54m
         9VJ8ecSgnyFVz892TYk34hIsLIVdE3C863sWe4PpKLL17z0rdk//QH8zHLezplf5zecn
         CMt8pQ6lO/N91/4KfIatcw4X88/dCSpVTpYW/IpvL+vwGOTzzDciFmwrt9muCsAvhi7d
         WOqlfS0Kym0VC+rHJLQVRUIX2a29Zo7bJvGsOEaU1uowBUKaMzsYZ9yHhLs0KJAe7PQ3
         Eu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688015300; x=1690607300;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFm7aP76Kl3qxn7n2tNVkuwpkcso4qVmefkLtKFqRbs=;
        b=VahVCPZLn0GuLPOUzDuNFjfpoSRXyVHJEfLgxKh3LJ8KJI+Pp20/Yd5FSS378AqwxX
         80k4niolF/Z5JG00o6+fT1kBcIjK3M9rgTXyhigR4an4eRuIJYTznaXMry0gPjN5binS
         LHPGShbRy94qMPCwYvc6qT/j53yP2Uk+5PhEyMDSsIXREqPkzm7xCdyjBmYsis+hDJBu
         wCTU2yYGjeuM26K4jr8B2EkkOdJib6sOunafUWOyzWwREa06pJ+djy3JpdY6v8x7oNB6
         j3XzHQiwahU8D7ABMYio6I7+G43YQ3q8GV6QunM+2uVmrn6JZhUpu/61moasWngB1KE1
         CyaQ==
X-Gm-Message-State: AC+VfDwuLYMYUksucxzY4JIgOuA8p15D0LlZVh42K7jdlHj/uozIrSkE
	1NSk8mehGXoF4g2cLD7YLQ+ONw==
X-Google-Smtp-Source: ACHHUZ7dmal1wUP2kBcbn8Y+5hPCsOTidCkpFmDgLcwfB+9Ewvv4+lKBVPvM/Ea71yfLSwxu543Ddg==
X-Received: by 2002:a25:bc86:0:b0:c25:3076:ffdc with SMTP id e6-20020a25bc86000000b00c253076ffdcmr9008572ybk.1.1688015299744;
        Wed, 28 Jun 2023 22:08:19 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 66-20020a251545000000b00bcc0f2e4f05sm2365847ybv.59.2023.06.28.22.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 22:08:19 -0700 (PDT)
Date: Wed, 28 Jun 2023 22:08:08 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <20230628211624.531cdc58@thinkpad-T15>
Message-ID: <cd7c2851-1440-7220-6c53-16b343b1474@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com> <20230628211624.531cdc58@thinkpad-T15>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, P
 asha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Jun 2023, Gerald Schaefer wrote:
> 
> As discussed in the other thread, we would rather go with less complexity,
> possibly switching to an approach w/o the list and fragment re-use in the
> future. For now, as a first step in that direction, we can try with not
> adding fragments back only for pte_free_defer(). Here is an adjusted
> version of your patch, copying most of your pte_free_defer() logic and
> also description, tested with LTP and all three of your patch series applied:

Thanks, Gerald: I don't mind abandoning my 13/12 SLAB_TYPESAFE_BY_RCU
patch (posted with fewer Cc's to the s390 list last week), and switching
to your simpler who-cares-if-we-sometimes-don't-make-maximal-use-of-page
patch.

But I didn't get deep enough into it today to confirm it - and disappointed
that you've found it necessary to play with pt_frag_refcount in addition to
_refcount and HH bits.  No real problem with that, but my instinct says it
should be simpler.

Tomorrow...
Hugh

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21384E2FF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:28:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMjm74tPBz3bTx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 05:28:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org;
 receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMjll07fGz3036
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 05:27:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F9D0614F9;
 Mon, 21 Mar 2022 18:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0287DC340E8;
 Mon, 21 Mar 2022 18:27:36 +0000 (UTC)
Date: Mon, 21 Mar 2022 18:27:33 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 4/7] arm64/pgtable: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Message-ID: <YjjDlajNUdHgOOWM@arm.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-5-david@redhat.com>
 <YjIr9f9qaz4xITVd@arm.com>
 <20220321143802.GC11145@willie-the-truck>
 <ea570f92-f896-7f9b-91c4-ad0a025bb340@redhat.com>
 <20220321174404.GA11389@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321174404.GA11389@willie-the-truck>
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Paul Mackerras <paulus@samba.org>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Jann Horn <jannh@google.com>,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>,
 David Rientjes <rientjes@google.com>, Pedro Gomes <pedrodemargomes@gmail.com>,
 Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>,
 Heiko Carstens <hca@linux.ibm.com>, Shakeel Butt <shakeelb@google.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Donald Dutile <ddutile@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 21, 2022 at 05:44:05PM +0000, Will Deacon wrote:
> On Mon, Mar 21, 2022 at 04:07:48PM +0100, David Hildenbrand wrote:
> > So the example you gave cannot possibly have that bit set. From what I
> > understand, it should be fine. But I have no real preference: I can also
> > just stick to the original patch, whatever you prefer.
> 
> I think I'd prefer to stay on the safe side and stick with bit 2 as you
> originally proposed. If we need to support crazy numbers of swapfiles
> in future then we can revisit the idea of allocating bit 1.

Sounds fine to me. David, feel free to keep my reviewed-by on the
original patch.

-- 
Catalin

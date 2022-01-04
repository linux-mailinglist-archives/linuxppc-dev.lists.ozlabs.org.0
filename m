Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E782A4845E9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 17:22:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSyYr69Q0z2yp5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 03:22:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSyYQ251rz2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jan 2022 03:21:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4796DB81732;
 Tue,  4 Jan 2022 16:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6DCC36AED;
 Tue,  4 Jan 2022 16:21:39 +0000 (UTC)
Date: Tue, 4 Jan 2022 16:21:36 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v6 04/14] mm, hugetlbfs: Allow for "high" userspace
 addresses
Message-ID: <YdR0EN2mdJuysugk@arm.com>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
 <db238c1ca2d46e33c57328f8d450f2563e92f8c2.1639736449.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db238c1ca2d46e33c57328f8d450f2563e92f8c2.1639736449.git.christophe.leroy@csgroup.eu>
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
Cc: "alex@ghiti.fr" <alex@ghiti.fr>, Steve Capper <steve.capper@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "will@kernel.org" <will@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 17, 2021 at 10:27:28AM +0000, Christophe Leroy wrote:
> This is a complement of f6795053dac8 ("mm: mmap: Allow for "high"
> userspace addresses") for hugetlb.
> 
> This patch adds support for "high" userspace addresses that are
> optionally supported on the system and have to be requested via a hint
> mechanism ("high" addr parameter to mmap).
> 
> Architectures such as powerpc and x86 achieve this by making changes to
> their architectural versions of hugetlb_get_unmapped_area() function.
> However, arm64 uses the generic version of that function.
> 
> So take into account arch_get_mmap_base() and arch_get_mmap_end() in
> hugetlb_get_unmapped_area(). To allow that, move those two macros
> out of mm/mmap.c into include/linux/sched/mm.h
> 
> If these macros are not defined in architectural code then they default
> to (TASK_SIZE) and (base) so should not introduce any behavioural
> changes to architectures that do not define them.
> 
> For the time being, only ARM64 is affected by this change.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Steve Capper <steve.capper@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> ---
>  fs/hugetlbfs/inode.c     | 9 +++++----
>  include/linux/sched/mm.h | 8 ++++++++
>  mm/mmap.c                | 8 --------
>  3 files changed, 13 insertions(+), 12 deletions(-)

This would be an ABI change but I'm fine with it. Basically with this
patch, getting hugetblfs addresses above 48-bit require explicit hint
passed to mmap().

I wonder whether we should add a fixes tag (or at least the cc stable):

Fixes: f6795053dac8 ("mm: mmap: Allow for "high" userspace addresses")
Cc: <stable@vger.kernel.org> # 5.0.x

I think the original commit should have changed
hugetlb_get_unmapped_area() to have the same behaviour as
arch_get_unmapped_area(). Steve, any thoughts?

FWIW,

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

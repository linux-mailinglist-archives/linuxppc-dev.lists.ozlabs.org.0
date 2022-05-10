Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F325227A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 01:29:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyZ4m2tvzz3cR7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 09:29:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=G7h1MqOd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=G7h1MqOd; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyZ461M3rz3bbB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 09:28:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5A6C61924;
 Tue, 10 May 2022 23:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1992FC385CE;
 Tue, 10 May 2022 23:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1652225329;
 bh=ikWDZ5omzUevzm24g0W0XI1vrgjTWyvleM5mOfiDXhA=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=G7h1MqOdJ0wz0GeWOIcl1IgA7Idfc1WJy/dr+bnPbypVuOylfTIuhfSwhxYNoIcco
 re9ll660lLwq06l+fkfI/HHBZ1dF/xdXKB3UWPFOu04Dy3Qeu0H7NJ1PPZMytK6lo4
 y0IeyvTgijDeS/AqzhBfHDPiC2DcolLkacyhm/xo=
Date: Tue, 10 May 2022 16:28:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, mike.kravetz@oracle.com,
 catalin.marinas@arm.com, will@kernel.org, songmuchun@bytedance.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 ysato@users.osdn.me, dalias@libc.org, davem@davemloft.net, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 2/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue
 when migration
Message-Id: <20220510162847.d9cf3c767e755a54699fb121@linux-foundation.org>
In-Reply-To: <20220510161739.fdea4d78dde8471033aab22b@linux-foundation.org>
References: <cover.1652147571.git.baolin.wang@linux.alibaba.com>
 <ea5abf529f0997b5430961012bfda6166c1efc8c.1652147571.git.baolin.wang@linux.alibaba.com>
 <20220510161739.fdea4d78dde8471033aab22b@linux-foundation.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 10 May 2022 16:17:39 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> > +
> > +static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> > +					  unsigned long addr, pte_t *ptep)
> > +{
> > +	return ptep_get(ptep);
> > +}
> > +
> > +static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> > +				   pte_t *ptep, pte_t pte)
> > +{
> > +}
> >  #endif	/* CONFIG_HUGETLB_PAGE */
> >  
> 
> This blows up nommu (arm allnoconfig):
> 
> In file included from fs/io_uring.c:71:
> ./include/linux/hugetlb.h: In function 'huge_ptep_clear_flush':
> ./include/linux/hugetlb.h:1100:16: error: implicit declaration of function 'ptep_get' [-Werror=implicit-function-declaration]
>  1100 |         return ptep_get(ptep);
>       |                ^~~~~~~~
> 
> 
> huge_ptep_clear_flush() is only used in CONFIG_NOMMU=n files, so I simply
> zapped this change.
> 

Well that wasn't a great success.  Doing this instead.  It's pretty
nasty - something nicer would be nicer please.

--- a/include/linux/hugetlb.h~mm-rmap-fix-cont-pte-pmd-size-hugetlb-issue-when-migration-fix
+++ a/include/linux/hugetlb.h
@@ -1094,6 +1094,7 @@ static inline void set_huge_swap_pte_at(
 {
 }
 
+#ifdef CONFIG_MMU
 static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 					  unsigned long addr, pte_t *ptep)
 {
@@ -1104,6 +1105,7 @@ static inline void set_huge_pte_at(struc
 				   pte_t *ptep, pte_t pte)
 {
 }
+#endif
 #endif	/* CONFIG_HUGETLB_PAGE */
 
 static inline spinlock_t *huge_pte_lock(struct hstate *h,
_


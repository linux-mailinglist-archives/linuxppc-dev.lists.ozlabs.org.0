Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7ED3AA8BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 03:43:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G54b24k3Vz3btB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 11:43:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=s6O005oO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=s6O005oO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G54Zd2n5Wz2yWs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 11:43:21 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B6266112D;
 Thu, 17 Jun 2021 01:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1623894197;
 bh=TfsTygI0gHSyYhqOTv8VBGgCJP8Jiua6aKYAwmvNJu4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s6O005oO2/PzdpyTrKmakB40bKNOrYWA2pCHsqCb/lj8RcTdEk/QdqeLLUNgiDETI
 vjXn+LONvLpOv6Xo43pBx7iyGYdlHgCKNZJlFJBohiUnfOqBDpyH7mfVn9+hqqa5Tu
 EVuFxR9mIN1BSLO3el+UC5XzlUDqB/NVQFu73k6c=
Date: Wed, 16 Jun 2021 18:43:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 6/6] mm/mremap: hold the rmap lock in write mode when
 moving page table entries.
Message-Id: <20210616184316.17229c71508fbd536afa3662@linux-foundation.org>
In-Reply-To: <20210616045239.370802-7-aneesh.kumar@linux.ibm.com>
References: <20210616045239.370802-1-aneesh.kumar@linux.ibm.com>
 <20210616045239.370802-7-aneesh.kumar@linux.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, npiggin@gmail.com, linux-mm@kvack.org,
 kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 16 Jun 2021 10:22:39 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> To avoid a race between rmap walk and mremap, mremap does take_rmap_locks().
> The lock was taken to ensure that rmap walk don't miss a page table entry due to
> PTE moves via move_pagetables(). The kernel does further optimization of
> this lock such that if we are going to find the newly added vma after the
> old vma, the rmap lock is not taken. This is because rmap walk would find the
> vmas in the same order and if we don't find the page table attached to
> older vma we would find it with the new vma which we would iterate later.
> 
> As explained in commit eb66ae030829 ("mremap: properly flush TLB before releasing the page")
> mremap is special in that it doesn't take ownership of the page. The
> optimized version for PUD/PMD aligned mremap also doesn't hold the ptl lock.
> This can result in stale TLB entries as show below.
> 
> ...
>
> Cc: stable@vger.kernel.org

Sneaking a -stable patch into the middle of all of this was ... sneaky :(

It doesn't actually apply to current mainline either.

I think I'll pretend I didn't notice.  Please sort this out with Greg
when he reports this back to you.

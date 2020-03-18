Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C75189518
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 06:04:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hycg4K5LzDqvT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 16:04:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=CyUKijUR; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hyb70D0wzDqnF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 16:02:41 +1100 (AEDT)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DC6920753;
 Wed, 18 Mar 2020 05:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584507759;
 bh=2ai/f+HExg/ApogpjE3zkT/L3aUSunYoWnzd+8Jg+RI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CyUKijURxIrw7Y5hqK8b4MyGIuvBKQqzc0ShkeQnzfNeUP+XVtWHVxC/N+AMH+Nn4
 GrLlIg00R1sq2wptyRayLS6n0qP5J/MrmjaDlNXo63NeqLC558t0oP3tzKGcAbGiYX
 kd4pXRH6BdsYja5CQLpelJmQ4875uf4js+qHEwBc=
Date: Tue, 17 Mar 2020 22:02:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] mm/hugetlb: Fix build failure with HUGETLB_PAGE but not
 HUGEBTLBFS
Message-Id: <20200317220238.8344f8423327c8ae178fc63a@linux-foundation.org>
In-Reply-To: <7e8c3a3c9a587b9cd8a2f146df32a421b961f3a2.1584432148.git.christophe.leroy@c-s.fr>
References: <7e8c3a3c9a587b9cd8a2f146df32a421b961f3a2.1584432148.git.christophe.leroy@c-s.fr>
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
Cc: Nick Piggin <npiggin@suse.de>, Andi Kleen <ak@suse.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Adam Litke <agl@us.ibm.com>,
 Nishanth Aravamudan <nacc@us.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 Mar 2020 08:04:14 +0000 (UTC) Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> When CONFIG_HUGETLB_PAGE is set but not CONFIG_HUGETLBFS, the
> following build failure is encoutered:
> 
> In file included from arch/powerpc/mm/fault.c:33:0:
> ./include/linux/hugetlb.h: In function 'hstate_inode':
> ./include/linux/hugetlb.h:477:9: error: implicit declaration of function 'HUGETLBFS_SB' [-Werror=implicit-function-declaration]
>   return HUGETLBFS_SB(i->i_sb)->hstate;
>          ^
> ./include/linux/hugetlb.h:477:30: error: invalid type argument of '->' (have 'int')
>   return HUGETLBFS_SB(i->i_sb)->hstate;
>                               ^
> 
> Gate hstate_inode() with CONFIG_HUGETLBFS instead of CONFIG_HUGETLB_PAGE.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Link: https://patchwork.ozlabs.org/patch/1255548/#2386036
> Fixes: a137e1cc6d6e ("hugetlbfs: per mount huge page sizes")

A 12 year old build error?  If accurate, that has to be a world record.

> Cc: stable@vger.kernel.org

I think I'll remove this.  Obviously nobody is suffering from this problem!



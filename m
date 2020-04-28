Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE761BD0C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 02:00:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BdvP1wBTzDqyX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 10:00:49 +1000 (AEST)
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
 header.s=default header.b=m65GDnRj; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bdsf4VcyzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 09:59:17 +1000 (AEST)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7162720737;
 Tue, 28 Apr 2020 23:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588118353;
 bh=u/ltYCv1p8OpW209IZjq1/zAWf9Lt/dtQuqXy6qlGD8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m65GDnRjsU0lHcSgWzFNtw5c3ZB/b0Jrw8m+ErHshFyk+jt70URJA1Wj66MWCmAAs
 BUfltVs8sxcuUAQ30NYBkBYwdViYHDF/yQMy1P5lTERcMZcl1h9es6FOYz3heDh0+O
 23pd1ZMGBIzaDM32UYjwEAqkFixws4d52KfH2cyI=
Date: Tue, 28 Apr 2020 16:59:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-Id: <20200428165912.ca1eadefbac56d740e6e8fd1@linux-foundation.org>
In-Reply-To: <20200428093836.27190-4-srikar@linux.vnet.ibm.com>
References: <20200428093836.27190-1-srikar@linux.vnet.ibm.com>
 <20200428093836.27190-4-srikar@linux.vnet.ibm.com>
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
Cc: Michal Hocko <mhocko@suse.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Apr 2020 15:08:36 +0530 Srikar Dronamraju <srikar@linux.vnet.ibm.com> wrote:

> Currently Linux kernel with CONFIG_NUMA on a system with multiple
> possible nodes, marks node 0 as online at boot.  However in practice,
> there are systems which have node 0 as memoryless and cpuless.
> 
> This can cause numa_balancing to be enabled on systems with only one node
> with memory and CPUs. The existence of this dummy node which is cpuless and
> memoryless node can confuse users/scripts looking at output of lscpu /
> numactl.
> 
> By marking, N_ONLINE as NODE_MASK_NONE, lets stop assuming that Node 0 is
> always online.
> 
> ...
>
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -116,8 +116,10 @@ EXPORT_SYMBOL(latent_entropy);
>   */
>  nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
>  	[N_POSSIBLE] = NODE_MASK_ALL,
> +#ifdef CONFIG_NUMA
> +	[N_ONLINE] = NODE_MASK_NONE,
> +#else
>  	[N_ONLINE] = { { [0] = 1UL } },
> -#ifndef CONFIG_NUMA
>  	[N_NORMAL_MEMORY] = { { [0] = 1UL } },
>  #ifdef CONFIG_HIGHMEM
>  	[N_HIGH_MEMORY] = { { [0] = 1UL } },

So on all other NUMA machines, when does node 0 get marked online?

This change means that for some time during boot, such machines will
now be running with node 0 marked as offline.  What are the
implications of this?  Will something break?

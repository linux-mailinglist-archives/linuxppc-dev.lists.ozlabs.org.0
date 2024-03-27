Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC8488E980
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:42:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dkFAoSvE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4WC910RSz3w57
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:42:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dkFAoSvE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4W9b4jsTz3vvp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:41:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6EC51615AD;
	Wed, 27 Mar 2024 15:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2D3C433C7;
	Wed, 27 Mar 2024 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711554081;
	bh=YkpXI8Y4E5O0pSnw1xlG7QH+gWTbFLfo1f7E5+HqAZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkFAoSvECyFOu4CWh7hFOPMthOkr2i/TebRy5IlzhK+g5sPwyAtlgNi0H4s/QuTWQ
	 p6mv6hTx4moEGi2CbURw76YIz/ZIklvZ2sAmsMbZ2YxnQwiR+VQvb1Xoti0mPvRTP+
	 Wtt/YX34R4BJzWV2fbhV0pcrYowD31U4eG0N/Mkmobhe7NrfK54W0B/lBcqQbZQBPn
	 pQSf5FjkUMtIptLuKVlNsq5LrZNQptBdoWxNXpO6W+QRfH7E5uhvXsJh4Xc+nvsCkz
	 EO0OiTf1wxEv7h6euXU/0Pi7zjLjfz2+3S2zhs/xQ52LYDpY9Pian1dnYPcxnRCv7i
	 8W3n4Jqw67LZg==
Date: Wed, 27 Mar 2024 17:40:38 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 4/6] mm/mm_init.c: remove meaningless calculation of
 zone->managed_pages in free_area_init_core()
Message-ID: <ZgQ99kf4D893Y7-Y@kernel.org>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-5-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325145646.1044760-5-bhe@redhat.com>
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 10:56:44PM +0800, Baoquan He wrote:
> Currently, in free_area_init_core(), when initialize zone's field, a
> rough value is set to zone->managed_pages. That value is calculated by
> (zone->present_pages - memmap_pages).
> 
> In the meantime, add the value to nr_all_pages and nr_kernel_pages which
> represent all free pages of system (only low memory or including HIGHMEM
> memory separately). Both of them are gonna be used in
> alloc_large_system_hash().
> 
> However, the rough calculation and setting of zone->managed_pages is
> meaningless because
>   a) memmap pages are allocated on units of node in sparse_init() or
>      alloc_node_mem_map(pgdat); The simple (zone->present_pages -
>      memmap_pages) is too rough to make sense for zone;
>   b) the set zone->managed_pages will be zeroed out and reset with
>      acutal value in mem_init() via memblock_free_all(). Before the
>      resetting, no buddy allocation request is issued.
> 
> Here, remove the meaningless and complicated calculation of
> (zone->present_pages - memmap_pages), initialize zone->managed_pages as 0
> which reflect its actual value because no any page is added into buddy
> system right now. It will be reset in mem_init().
> 
> And also remove the assignment of nr_all_pages and nr_kernel_pages in
> free_area_init_core(). Instead, call the newly added calc_nr_kernel_pages()
> to count up all free but not reserved memory in memblock and assign to
> nr_all_pages and nr_kernel_pages. The counting excludes memmap_pages,
> and other kernel used data, which is more accurate than old way and
> simpler, and can also cover the ppc required arch_reserved_kernel_pages()
> case.
> 
> And also clean up the outdated code comment above free_area_init_core().
> And free_area_init_core() is easy to understand now, no need to add
> words to explain.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  mm/mm_init.c | 46 +++++-----------------------------------------
>  1 file changed, 5 insertions(+), 41 deletions(-)

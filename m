Return-Path: <linuxppc-dev+bounces-12575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B999CB9E684
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Sep 2025 11:37:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXTBf5Mbwz30P3;
	Thu, 25 Sep 2025 19:36:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758793018;
	cv=none; b=EuBLZ82oKTTY0ga6mr6y8ZQgIyqDsMtU8CKZEAXHC6RzfMiBn8Yue50uC/hHXv1CBukkkz79HhKHld35VCUlHVKRU/9B3mi1QGT3dkUODXkoD7TZDdDqx3a9k935JIAXdIMr3/tnuJth489VSn03podec4IHOJGjPrKFB+PTBZDkg/yUIRA8alIpv12nG19TMi2uDG8kK+r4hjYJ/9qgfY221NcAeFcpGmIUUNqOGwt//Q+4CFA5Tq/gQL7c8/XIrwttWvqcuEfwsHrcYKsl0W7p3Oa6HDBoidnMeWi+tiiUZjdmHZ5ruvzdxZOWhzRuVpEr86oSrzKMp2rSPMvX8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758793018; c=relaxed/relaxed;
	bh=iU/8C3bgykcpIT0EMohp1A76R0smAaapZClkufQQk0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nC5SZlRhyUqRHre0DeXY9urn67bh6XXhGHogD+/+VsmcNNDDhqQwuCR6DxnyueqEqtPDCThi7z2zb0tIqXiFigxO2pv/vHoEfOHZ5w3IYXKM37z/zhHGpkKQlZy6l/yxYlFsQs/gUsTnVQ5SaXbWP0ggXW9tiDbj7HP0fzyQ38dSiDTHh9Qe/+2zXiASKzh14FFiMPnyxuVmh+KjARKdEeKXX8YTtE3leo/3/dPphxfL7IfdBCLSymnTD1oJR66ns5Do4VXs4yPYSBFPYPrzVfG4M+thUc8uJaTNf1ak+c0kpPMeUzuVOm5Nw16uxFCTmXWuzXnoH8FEjEGfd2FP9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KNS63t1Y; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KNS63t1Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXTBf1583z2yqR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 19:36:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCBCF44C97;
	Thu, 25 Sep 2025 09:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6028FC4CEF0;
	Thu, 25 Sep 2025 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758793015;
	bh=cs/L+0FILav66EYCnGQ2S40EG8qSxOGdJiC2KVHCzWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNS63t1YVh7qWaG9Mk5Zip6SaVXM184O6Qb2KV9EMskZBqPPNfZqUFaosPgubxI18
	 LsQkBDCtSVyx3pKh33fZtIqyy12Ylj1u4PkXwoZ13XS7W8A2O8hAbcQkgnLAOOWWDS
	 V50+hLErC1yQn0xrCei7L9bUlOtJLem7eOc27U/dgZNnkINcCBklSIByRyGkBDviIA
	 ZBORN1BW1GZhZAr2sA44EmknpdQE0QJSuQ7TMFjLIgo1/4NQlHPlgk+ipdL/JPGt0w
	 kBcA0MSKyXA3ud22LA7rGP5/i3c2K+dQuXuqtjkZ+VaTEL0JaJYwFLOzkEiTxeXDwl
	 gb7mZHKeW8Vow==
Date: Thu, 25 Sep 2025 12:36:46 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH 0/2] drivers/base/node: fold node register and unregister
 functions
Message-ID: <aNUNLlyy2Kj5VsGX@kernel.org>
References: <cover.1758736423.git.donettom@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1758736423.git.donettom@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 25, 2025 at 12:10:49AM +0530, Donet Tom wrote:
> This change came from the discussion in [1]. It consists of two patches:
> 
> The first patch merges register_one_node() and register_node(), leaving a
> single register_node() function.
> 
> The second patch merges unregister_one_node() and unregister_node(), leaving
> a single unregister_node() function.
> 
> There is no functional change in these patches.
> 
> [1] https://lore.kernel.org/all/5512b1b6-31f8-4322-8a5f-add8d1e9b22f@redhat.com/
> 
> Donet Tom (2):
>   drivers/base/node: merge register_one_node() and register_node() to a
>     single function.
>   drivers/base/node: merge unregister_one_node() and unregister_node()
>     to a single function.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  arch/powerpc/platforms/pseries/pci_dlpar.c |  2 +-
>  arch/x86/mm/numa.c                         |  4 +-
>  drivers/base/node.c                        | 89 +++++++++-------------
>  include/linux/node.h                       | 10 +--
>  mm/memory_hotplug.c                        |  8 +-
>  mm/mm_init.c                               |  2 +-
>  6 files changed, 49 insertions(+), 66 deletions(-)
> 
> -- 
> 2.51.0
> 

-- 
Sincerely yours,
Mike.


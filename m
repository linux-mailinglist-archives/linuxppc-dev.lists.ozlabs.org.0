Return-Path: <linuxppc-dev+bounces-12186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55242B56FEC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 07:52:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQDhT6Bqhz3d2g;
	Mon, 15 Sep 2025 15:52:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757915561;
	cv=none; b=ddbUN6Bdovx9HN8muUl4h8JvBY/NCSnj08sIYR44wCs9aJEwBLt3YATR8fgfZCStvopNWCN0a2mDh9jS7SlPUK8VD0aMmr4CQG7cVlnPtD4tmDSKrqVmAADrhICpZ5v+azgGOa1768lJF339pFIZFO2Rc8X9ULmSCYv8Iw21tS+e15InaqonFHXbIRc1YG+g91XN477ZOiUEyudjj/M26oDvTc4FjiLIT5hv6pVXGwaJUiVe7UIgY7k+ZL+2G4+LOYGP/GPMg/gII16+DBFXO4gKFCie+C2mc7yDaZMsOmJnNqC6IzNb1R5OL67Bnvr7WRmk5SQ++BQ3FavcTh7bwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757915561; c=relaxed/relaxed;
	bh=Fpmgojx4q43DInOuMee4dKSZEvOQciSeFTFHo0lna0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kg8r/8jpf7BNtd7VOCrhPrJo0zAlBVFRZh5GfDReRKdV4mUU4uhHUJz+8LteXrFMoteAupfw/vJKmX/yY04MWimp+oUaEpuv9KBeVLNrGQEBbVa5iifU6k4lfbO0RM2ueLlPhJdpb2G07Zbqt5pnz0QkIrLgK1h6dv2ChC7zasAu2AP8bhQa6YLsBS4jeutGKO15ITmzOQ9BO1Vy43Tq+nd4zLhEuPCCsh2fkhaCD8kUasZava9vywmN5q3c/SHQJQXDPWCnW4N3a8HlRe4y0iNydJrHfsLQXaIZryU76j+H5OQX5z7+duqTNnpCwGFGm9UI7Tyf5LWprm+T5F7rUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HKgQ34JA; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HKgQ34JA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQDhT1H8dz3cyc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 15:52:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C974A6014D;
	Mon, 15 Sep 2025 05:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3A5C4CEF1;
	Mon, 15 Sep 2025 05:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757915558;
	bh=yJ4G6gWCyHjvrSjk2ZSLA+uz7hH91T4w1eX4A3rCfAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKgQ34JAUlu71k2SZGcwbA654jSNxgYoE+aE97e/xNM7ErB5sqxs46nGARIjtRO8K
	 YOhvgRzrqom27m6SvB/doA5ozBQvRK+ZPcSfJyszdsHEjLkElqH44eJ4p4GXRJPDe/
	 cyrwOk+HJjkU9VH64Qo4eZC6q1eSyWfmnTY+fk+ifm32Jn6wsliLJvOSnKSxWQIjUw
	 VsE3TFs1lSKMloK512v0L8zVYPxs/8INBeeqmC5sLNLttu8UnK3ZDwLoSt72Y3vgq8
	 1qWYJWHx7nb6bC34OHMVvpT92zQYlD3/tapLWFZuTcUa5ok+MufWN72xU9ZlXzo0XY
	 D9eiF6O35r3gg==
Date: Mon, 15 Sep 2025 11:13:35 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, live-patching@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 0/3] powerpc/ftrace: Fix livepatch module OOL ftrace
 corruption
Message-ID: <zu74w6gtt4z6jqwkwjqamro4e3v5qwcotwwp76fgu7oghgwqla@bjhg53sknonx>
References: <20250912142740.3581368-1-joe.lawrence@redhat.com>
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
In-Reply-To: <20250912142740.3581368-1-joe.lawrence@redhat.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 12, 2025 at 10:27:37AM -0400, Joe Lawrence wrote:
> This patch series fixes a couple of bugs in the powerpc64 out-of-line
> (OOL) ftrace support for modules, and follows up with a patch to
> simplify the module .stubs allocation code. An analysis of the module
> stub area corruption that prompted this work can be found in the v1
> thread [1].
> 
> The first two patches fix bugs introduced by commit eec37961a56a
> ("powerpc64/ftrace: Move ftrace sequence out of line"). The first,
> suggested by Naveen, ensures that a NOP'd ftrace call site has its
> ftrace_ops record updated correctly. The second patch corrects a loop in
> setup_ftrace_ool_stubs() to ensure all required stubs are reserved, not
> just the first. Together, these bugs lead to potential corruption of the
> OOL ftrace stubs area for livepatch modules.
> 
> The final patch replaces the sentinel-based allocation in the module
> .stubs section with an explicit counter. This improves clarity and helps
> prevent similar problems in the future.
> 
> Changes since v1: https://lore.kernel.org/live-patching/df7taxdxpbo4qfn7lniggj5o4ili6kweg4nytyb2fwwwgmnyo4@halp5gf244nn/T/
> 
> - Split into parts: bug fix x2, code cleanup
> - Call ftrace_rec_set_nop_ops() from ftrace_init_nop() [Naveen]
> - Update commit msg on cleanup patch [Naveen]
> 
> Joe Lawrence (3):
>   powerpc/ftrace: ensure ftrace record ops are always set for NOPs
>   powerpc64/modules: correctly iterate over stubs in
>     setup_ftrace_ool_stubs
>   powerpc64/modules: replace stub allocation sentinel with an explicit
>     counter
> 
>  arch/powerpc/include/asm/module.h  |  1 +
>  arch/powerpc/kernel/module_64.c    | 26 ++++++++------------------
>  arch/powerpc/kernel/trace/ftrace.c | 10 ++++++++--
>  3 files changed, 17 insertions(+), 20 deletions(-)

Thanks for fixing this! For the series:
Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>


- Naveen



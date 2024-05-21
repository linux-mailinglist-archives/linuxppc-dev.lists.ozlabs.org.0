Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 27BFA8CA8F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 09:31:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tIQ5nB50;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vk5Xk4mvHz3gBy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 17:24:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tIQ5nB50;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vk5X02j4Kz3fps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 17:23:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAA666201F;
	Tue, 21 May 2024 07:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6168C2BD11;
	Tue, 21 May 2024 07:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716276222;
	bh=g5ad6h6fsS1VZMljbHFZQxtWXnD0wuSkOgJPO8o+IWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tIQ5nB50A9fzy5aGKXStqGdhlcNXWJDoGm3vdmlYmeIA0Exsw9AAftpoIq0V5PD7P
	 ojLOwe2a0aIn3HYTZAuur0MT4qKOMLOcd6jotkYJ0sQSqEYpAqlDmyr+SvVgkd5VhH
	 rm/o95/zodJ0qYY9z3yHKKhiWK3ASNm4xAF+A1AlLnqSdMK+6s43pbz4z5SvtTkcu0
	 h8T3JC1arzq5w1Mdp03m4Tm+hSzqdcmo78juAHHutycjkQPjPjIQVhXQA+XzfoVfax
	 b+eNncCUyc5BnkclrrbRVUmS6V6egan9JUCPSrp9exOdPg5hKAsKFbcqZbvrwBLfX4
	 s74zLa4/EuRKg==
Date: Tue, 21 May 2024 10:21:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [Patch v2] mm/memblock: discard .text/.data if
 CONFIG_ARCH_KEEP_MEMBLOCK not set
Message-ID: <ZkxLkK7vgzzaEvyw@kernel.org>
References: <20240510020422.8038-1-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510020422.8038-1-richard.weiyang@gmail.com>
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, anshuman.khandual@arm.com, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, linux-mm@kvack.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, May 10, 2024 at 02:04:22AM +0000, Wei Yang wrote:
> When CONFIG_ARCH_KEEP_MEMBLOCK not set, we expect to discard related
> code and data. But it doesn't until CONFIG_MEMORY_HOTPLUG not set
> neither.
> 
> This patch puts memblock's .text/.data into its own section, so that it
> only depends on CONFIG_ARCH_KEEP_MEMBLOCK to discard related code and
> data.
> 
> After this, from the log message in mem_init_print_info(), init size
> increase from 2420K to 2432K on arch x86.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> 
> ---
> v2: fix orphan section for powerpc
> ---
>  arch/powerpc/kernel/vmlinux.lds.S |  1 +
>  include/asm-generic/vmlinux.lds.h | 14 +++++++++++++-
>  include/linux/memblock.h          |  8 ++++----
>  3 files changed, 18 insertions(+), 5 deletions(-)
>  
> +#define __init_memblock        __section(".mbinit.text") __cold notrace \
> +						  __latent_entropy
> +#define __initdata_memblock    __section(".mbinit.data")
> +

The new .mbinit.* sections should be added to scripts/mod/modpost.c
alongside .meminit.* sections and then I expect modpost to report a bunch
of section mismatches because many memblock functions are called on memory
hotplug even on architectures that don't select ARCH_KEEP_MEMBLOCK.

>  #ifndef CONFIG_ARCH_KEEP_MEMBLOCK
> -#define __init_memblock __meminit
> -#define __initdata_memblock __meminitdata
>  void memblock_discard(void);
>  #else
> -#define __init_memblock
> -#define __initdata_memblock
>  static inline void memblock_discard(void) {}
>  #endif
>  
> -- 
> 2.34.1
> 
> 

-- 
Sincerely yours,
Mike.

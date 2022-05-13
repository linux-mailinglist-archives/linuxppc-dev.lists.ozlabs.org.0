Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED83526D08
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 00:44:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0Nxb6q40z3cMK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 08:44:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ObSfTv7W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ObSfTv7W; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0Nww3h7Yz2xsm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 08:44:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72A2D60F6E;
 Fri, 13 May 2022 22:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9F9C34100;
 Fri, 13 May 2022 22:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652481836;
 bh=CijBO6wAUnPaCFQTl2hJH05BXYHWLo9sWJxBUdgdKoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ObSfTv7WKs96jZfkU1xpZM/cHsUgFN9XhcihtZr+JLZs2bE7cJWtRdFiOLCuEELBV
 BFPwv/vgXbiEqNviB7tWKSWcYi32cpJvRhAFzN9aC7g3VZZ4mPzm4OG/u+fMdKX9ch
 MRI5bkl3B/oc+bYOwqSo8zYN+jRjxc0b87h8AAO85VslQHPD+x/RF8d1kW9dcvPU+Z
 em5k2gFi5Vwp32LQEmTvX+8VHZW7cjKURGA1McGbgJA2RZn1v4HcWjt40VGFjYdFG9
 sSPqpEcq2btfkN+YJ1zmujV2kPKUje0nsGDTK1jPwS4iHLjD0c8kMLCXnOLjoxLF/z
 yu8L9P+aJhbwg==
Received: by pali.im (Postfix)
 id C9DA22B90; Sat, 14 May 2022 00:43:53 +0200 (CEST)
Date: Sat, 14 May 2022 00:43:53 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Ash Logan <ash@heyquark.com>
Subject: Re: [PATCH 11/12] powerpc: wiiu: don't enforce flat memory
Message-ID: <20220513224353.n56qg5fhstbaqhfz@pali>
References: <20220302044406.63401-1-ash@heyquark.com>
 <20220302044406.63401-12-ash@heyquark.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302044406.63401-12-ash@heyquark.com>
User-Agent: NeoMutt/20180716
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
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday 02 March 2022 15:44:05 Ash Logan wrote:
> pgtable_32.c:mapin_ram loops over each valid memory range, which means
> non-contiguous memory just works.

Hello! Does it mean that non-contiguous memory works for any 32-bit
powerpc platform, and not only for wiiu? If yes, should not be
non-contiguous memory support enabled for all 32-bit ppc boards then?

> Signed-off-by: Ash Logan <ash@heyquark.com>
> ---
>  arch/powerpc/mm/init_32.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
> index 3d690be48e84..59a84629d9a0 100644
> --- a/arch/powerpc/mm/init_32.c
> +++ b/arch/powerpc/mm/init_32.c
> @@ -125,10 +125,10 @@ void __init MMU_init(void)
>  	 * lowmem_end_addr is initialized below.
>  	 */
>  	if (memblock.memory.cnt > 1) {
> -#ifndef CONFIG_WII
> +#if !defined(CONFIG_WII) && !defined(CONFIG_WIIU)
>  		memblock_enforce_memory_limit(memblock.memory.regions[0].size);
>  		pr_warn("Only using first contiguous memory region\n");
> -#else
> +#elif defined(CONFIG_WII)
>  		wii_memory_fixups();
>  #endif
>  	}
> -- 
> 2.35.1
> 

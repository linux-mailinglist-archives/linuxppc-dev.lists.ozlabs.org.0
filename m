Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 915AF6527B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 21:16:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nc7CF2q2Vz3fG8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 07:16:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VnKVkdRE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VnKVkdRE;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nc79G2vy5z3cdt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 07:15:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E7856156F;
	Tue, 20 Dec 2022 20:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BFAC433EF;
	Tue, 20 Dec 2022 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671567311;
	bh=ipegR7OSSzbYG38ubO9ej+f9FSMXHFS82T2UsjxnDTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VnKVkdREKqO0LeOi5L4aB5nfeZ+o6FKV8d3PRnb/YP/8NWsf+SwVOiGKOG6ICeIXd
	 gvBtJpth3KJI5umL0phNQMtoduk+doj8TtJD/LLYL5BtUqqjXp+ipvOaISv8tH18ky
	 NEA2LGpGmGN2JYSr0PDsNV3+8NEVCPNhVicwMeCMPe6lX9i9fKEL84uWdWBAZDffRm
	 Sg5idBWVGVwPxSxMmNluR0CaqZEGA1OqtHQyFGmaxx6frsyo+TJMEoiGsNtLuW0MTo
	 4xIwLARZNQE9iVxaXqnwF7iLPpSP2Khig8Ob/W9o+hhtqxS8GWAcYl4Jtk8VTQBICM
	 5wkWgikENnjpg==
Received: by pali.im (Postfix)
	id 8002D963; Tue, 20 Dec 2022 21:15:08 +0100 (CET)
Date: Tue, 20 Dec 2022 21:15:08 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 3/5] powerpc/64: Replace -mcpu=e500mc64 by -mcpu=e5500
Message-ID: <20221220201508.b47rg5ii2p6wkrkq@pali>
References: <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
 <fa71ed20d22c156225436374f0ab847daac893bc.1671475543.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa71ed20d22c156225436374f0ab847daac893bc.1671475543.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, jbglaw@lug-owl.de, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 19 December 2022 19:45:58 Christophe Leroy wrote:
> E500MC64 is a processor pre-dating E5500 that has never been
> commercialised. Use -mcpu=e5500 for E5500 core.
> 
> More details at https://gcc.gnu.org/PR108149
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  arch/powerpc/platforms/Kconfig.cputype | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 31cea2eeb59e..29d6be033576 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -249,7 +249,7 @@ config TARGET_CPU
>  	default "power8" if POWER8_CPU
>  	default "power9" if POWER9_CPU
>  	default "power10" if POWER10_CPU
> -	default "e500mc64" if E5500_CPU
> +	default "e5500" if E5500_CPU
>  	default "e6500" if E6500_CPU
>  	default "power4" if POWERPC64_CPU && !CPU_LITTLE_ENDIAN
>  	default "power8" if POWERPC64_CPU && CPU_LITTLE_ENDIAN
> -- 
> 2.38.1
> 

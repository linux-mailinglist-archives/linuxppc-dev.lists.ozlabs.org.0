Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BA56F23DA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 11:28:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7kfv37wwz3cgT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 19:28:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xw8o4gM3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xw8o4gM3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7kdz6Gmsz3bY0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Apr 2023 19:27:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 290186023C;
	Sat, 29 Apr 2023 09:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660B1C433EF;
	Sat, 29 Apr 2023 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682760452;
	bh=C7dMA9Z/iKBRGFbjoyJ2bomBnZC1VqbWRGo6yQ1QK1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xw8o4gM3slKEVPD0DLEt33s9B70AcPKChr00qgQtKpr/PZKiMrxklFOy7baTp3231
	 oHk//apL5S1GCTw9iqrVsPUGFWR56Fr2lgTUT9IMdD+ILga/uhLYMfK121jPrtjUYk
	 WUuYacFZVScLrSVVzzpmNRGO5G1qjahKsJguMlcPWQxRSHE8/BQT+i/goWA6AACf41
	 nd+hqL8bjS4+FE+EvxrL7TqNtmPMqx14CWIQCR7x+reMgk2jATlwiHgK+WRsyl4PsW
	 1Sa0HhBuoOezZy4H+Wf7yW1mVXZ2itHXsOxMRmcpWlHuBfgIoE8ZBZSK4OPqJr19bv
	 EAY1D4nr046fA==
Received: by pali.im (Postfix)
	id 3821D7AC; Sat, 29 Apr 2023 11:27:29 +0200 (CEST)
Date: Sat, 29 Apr 2023 11:27:29 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH -next?] powerpc/fsl_uli1575: fix kconfig warnings and
 build errors
Message-ID: <20230429092729.znfdx7tlcpz7ce63@pali>
References: <20230429043519.19807-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230429043519.19807-1-rdunlap@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 28 April 2023 21:35:19 Randy Dunlap wrote:
> Neither FSL_SOC_BOOKE nor PPC_86xx enables CONFIG_PCI by
> default, so it may be unset in some randconfigs.
> When that happens, FSL_ULI1575 may be set when it should not be
> since it is a PCI driver. When it is set, there are 3 kconfig
> warnings and a slew of build errors
> 
> WARNING: unmet direct dependencies detected for PCI_QUIRKS
>   Depends on [n]: PCI [=n]
>   Selected by [y]:
>   - FSL_PCI [=y]
> 
> WARNING: unmet direct dependencies detected for GENERIC_ISA_DMA
>   Depends on [n]: ISA_DMA_API [=n]
>   Selected by [y]:
>   - FSL_ULI1575 [=y] && (FSL_SOC_BOOKE [=n] || PPC_86xx [=y])
> 
> WARNING: unmet direct dependencies detected for PPC_INDIRECT_PCI
>   Depends on [n]: PCI [=n]
>   Selected by [y]:
>   - FSL_PCI [=y]
> 
> and 30+ build errors.
> 
> Fixes: 22fdf79171e8 ("powerpc/fsl_uli1575: Allow to disable FSL_ULI1575 support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Pali Rohár <pali@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/platforms/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff -- a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
> --- a/arch/powerpc/platforms/Kconfig
> +++ b/arch/powerpc/platforms/Kconfig
> @@ -265,6 +265,7 @@ config CPM2
>  config FSL_ULI1575
>  	bool "ULI1575 PCIe south bridge support"
>  	depends on FSL_SOC_BOOKE || PPC_86xx
> +	depends on PCI
>  	select FSL_PCI
>  	select GENERIC_ISA_DMA
>  	help

Ok, looks like a reasonable solution for this issue.

These kind of cleanups (as done in uli1575 patch series) are always
problematic as they can break some unusual configuration...

Reviewed-by: Pali Rohár <pali@kernel.org>

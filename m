Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 497815F8ACF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 13:09:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlfSJ1H3Zz3dqm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 22:09:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wmu0c5pJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wmu0c5pJ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlfRN2q4Mz3000
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 22:08:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8EAF5B80C03;
	Sun,  9 Oct 2022 11:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC68C433C1;
	Sun,  9 Oct 2022 11:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665313691;
	bh=16d6kv40ojI7bColT0X9A2Alxf9DIIOwFKAPNQvY80Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wmu0c5pJbWT6qRl7oiu2V7ydwDJK5uZhRlACcvjtqsXDFR+GFMltU1BPxv13PvRDa
	 ThSGoLrGODMDsGgeCytuKWDdSnVfO1fFSKoNQ74vU1FyDXiXez7zdYGYu/IipyHs8x
	 jtZ9lFG2uoiMGyd86VnaNsryDIQEv9q7EEGqdt/cUiLimSsJK6BHYri+0m8D8xtZmo
	 to7GSNJ0y2gNHRp3V7R1CEv6a5jl3OZgFdTzicEVaZs+U1raeFi2urJGzo5eCQGOVj
	 FxnIKeaJDOJH7PqN6mymbsvn3H4YSs8RNPOsjmDAgiHD0EQ3Hr1jtmCvvqpIHu3lxO
	 Vu3ZShQlW/nHw==
Received: by pali.im (Postfix)
	id 60DEB7C1; Sun,  9 Oct 2022 13:08:08 +0200 (CEST)
Date: Sun, 9 Oct 2022 13:08:08 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/fsl-pci: Choose PCI host bridge with alias pci0
 as the primary
Message-ID: <20221009110808.agfixtgneshui47o@pali>
References: <20220820123327.20551-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220820123327.20551-1-pali@kernel.org>
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

Hello! Any opinion on this patch?

On Saturday 20 August 2022 14:33:27 Pali Rohár wrote:
> If there's no PCI host bridge with ISA then check for PCI host bridge with
> alias "pci0" (first PCI host bridge) and if it exists then choose it as the
> primary PCI host bridge.
> 
> This makes choice of primary PCI host bridge more stable across boots and
> updates as the last fallback candidate for primary PCI host bridge (if
> there is no choice) is selected arbitrary.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  arch/powerpc/sysdev/fsl_pci.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
> index 1011cfea2e32..e4b703943dd3 100644
> --- a/arch/powerpc/sysdev/fsl_pci.c
> +++ b/arch/powerpc/sysdev/fsl_pci.c
> @@ -1125,6 +1125,19 @@ void __init fsl_pci_assign_primary(void)
>  			return;
>  	}
>  
> +	/*
> +	 * If there's no PCI host bridge with ISA then check for
> +	 * PCI host bridge with alias "pci0" (first PCI host bridge).
> +	 */
> +	np = of_find_node_by_path("pci0");
> +	if (np && of_match_node(pci_ids, np) && of_device_is_available(np)) {
> +		fsl_pci_primary = np;
> +		of_node_put(np);
> +		return;
> +	}
> +	if (np)
> +		of_node_put(np);
> +
>  	/*
>  	 * If there's no PCI host bridge with ISA, arbitrarily
>  	 * designate one as primary.  This can go away once
> -- 
> 2.20.1
> 

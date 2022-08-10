Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FCE58F09B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 18:44:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2wkn4g01z3bk4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 02:44:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qzJbdgDe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qzJbdgDe;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2wk53mtLz2xHr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 02:43:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8865861286;
	Wed, 10 Aug 2022 16:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2997C433C1;
	Wed, 10 Aug 2022 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660149817;
	bh=oaHDCKmep8dN+8/hO9HR/EbTj8E7+7obmhxANTTMBXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qzJbdgDejI+ssgG9fRM249kMyO6Zj8RM8O7837baTMJw4yxaXfQN6x6a6kF2qvfxV
	 //5255GfiZ4B+iI1JKjsMAFuQ6iXwJVTdSLqdwoc4Om3b3Ps/cUvyfuOKmwdIQF1Tj
	 SoXeotCNrUL+Vv4KZs1uzu9R7H4nQZGxXEV3OPx/NY+1nKL8WSfLxC/F9DTxHCuCr1
	 og0/p4X3XjpP+PXS64ni23SLNIvvRpBOwd6d970dHT2aoyBMAx56Pu3DeYHgvNgbz+
	 TomCyT273nEacM6E7JA3XgPDwdZmCrF/84Q0wt2nr8msgcmEu2M3sEgGDXauHGobB8
	 E49Ccqu9lnRBA==
Date: Wed, 10 Aug 2022 09:43:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Russell Currey <ruscur@russell.cc>
Subject: Re: [PATCH v2] powerpc/kexec: Fix build failure from uninitialised
 variable
Message-ID: <YvPgNsl1RalFdPH+@dev-arch.thelio-3990X>
References: <20220810054331.373761-1-ruscur@russell.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810054331.373761-1-ruscur@russell.cc>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 10, 2022 at 03:43:31PM +1000, Russell Currey wrote:
> clang 14 won't build because ret is uninitialised and can be returned if
> both prop and fdtprop are NULL.  Drop the ret variable and return an
> error in that failure case.
> 
> Fixes: b1fc44eaa9ba ("pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window")
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Russell Currey <ruscur@russell.cc>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!

> ---
> v2: adopt Christophe's suggestion, which is better
> 
>  arch/powerpc/kexec/file_load_64.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 683462e4556b..349a781cea0b 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -1043,17 +1043,17 @@ static int copy_property(void *fdt, int node_offset, const struct device_node *d
>  			 const char *propname)
>  {
>  	const void *prop, *fdtprop;
> -	int len = 0, fdtlen = 0, ret;
> +	int len = 0, fdtlen = 0;
>  
>  	prop = of_get_property(dn, propname, &len);
>  	fdtprop = fdt_getprop(fdt, node_offset, propname, &fdtlen);
>  
>  	if (fdtprop && !prop)
> -		ret = fdt_delprop(fdt, node_offset, propname);
> +		return fdt_delprop(fdt, node_offset, propname);
>  	else if (prop)
> -		ret = fdt_setprop(fdt, node_offset, propname, prop, len);
> -
> -	return ret;
> +		return fdt_setprop(fdt, node_offset, propname, prop, len);
> +	else
> +		return -FDT_ERR_NOTFOUND;
>  }
>  
>  static int update_pci_dma_nodes(void *fdt, const char *dmapropname)
> -- 
> 2.37.1
> 

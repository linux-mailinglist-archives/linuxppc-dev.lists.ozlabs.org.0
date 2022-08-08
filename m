Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89258CC5F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 18:49:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1hxr6t5Zz3byL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 02:49:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZQ65wkIv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZQ65wkIv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1hxF33sDz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 02:49:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3A9D61126;
	Mon,  8 Aug 2022 16:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008A5C433D6;
	Mon,  8 Aug 2022 16:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659977337;
	bh=QjoMGwvAumk6F/NuMDuub06x8V9Bz2KMBhW0pT5XZv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQ65wkIv2A4c1xdbtA05EyB3ZDyq4d5h9PtfC1eX5yL9l1sxQDr5jeT+FFh6Ab8yr
	 +wrzmsOmV61BQNSkhRn1GIqHvWBP6LnLrF+ppFBa6S7zBOnpmAeN2JK0opxbFOnRok
	 Y5WizNIyINRsaFgrpMsYXkJ//jiO4ik8ZWPLK7rhiX+/Q9TPpWkUWppK5E/Ha9olra
	 FjhonN0BYQ3IBKgioD5PZyUpGIldL4MHnBbVOfA/EqtwrasJoolhadWoiMQjDo1+8O
	 cLGa1eaCjoxKbWkod3/t8uQ0dpKjU32xpYhaHt/DNAncLKhgDvek92RAt2QaZgj5IG
	 AG9nL2nuToaDA==
Date: Mon, 8 Aug 2022 09:48:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2] pseries/iommu/ddw: Fix kdump to work in
 absence of ibm,dma-window
Message-ID: <YvE+d7xcB77GODjc@dev-arch.thelio-3990X>
References: <20220629060614.1680476-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629060614.1680476-1-aik@ozlabs.ru>
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Andrew Donnellan <ajd@linux.ibm.com>, llvm@lists.linux.dev, Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alexey,

This change is now in mainline as commit b1fc44eaa9ba
("pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window").

> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index b4981b651d9a..5d2c22aa34fb 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -1038,6 +1038,48 @@ static int update_cpus_node(void *fdt)
>  	return ret;
>  }
>  
> +static int copy_property(void *fdt, int node_offset, const struct device_node *dn,
> +			 const char *propname)
> +{
> +	const void *prop, *fdtprop;
> +	int len = 0, fdtlen = 0, ret;
> +
> +	prop = of_get_property(dn, propname, &len);
> +	fdtprop = fdt_getprop(fdt, node_offset, propname, &fdtlen);
> +
> +	if (fdtprop && !prop)
> +		ret = fdt_delprop(fdt, node_offset, propname);
> +	else if (prop)
> +		ret = fdt_setprop(fdt, node_offset, propname, prop, len);
> +
> +	return ret;
> +}

clang now warns/errors:

  arch/powerpc/kexec/file_load_64.c:1053:11: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
          else if (prop)
                  ^~~~
  arch/powerpc/kexec/file_load_64.c:1056:9: note: uninitialized use occurs here
          return ret;
                ^~~
  arch/powerpc/kexec/file_load_64.c:1053:7: note: remove the 'if' if its condition is always true
          else if (prop)
              ^~~~~~~~~
  arch/powerpc/kexec/file_load_64.c:1046:30: note: initialize the variable 'ret' to silence this warning
          int len = 0, fdtlen = 0, ret;
                                      ^
                                      = 0
  1 error generated.

Is !fdtprop && !prop a concern? What should a sensible default for ret
be?

Cheers,
Nathan

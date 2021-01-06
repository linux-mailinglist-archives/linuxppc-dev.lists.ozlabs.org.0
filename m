Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 194962EC3B1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 20:08:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9zRm3F1rzDqbW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jan 2021 06:08:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jZKdCjGy; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9zQ60NfbzDqXK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jan 2021 06:07:26 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69DBD23124;
 Wed,  6 Jan 2021 19:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609960043;
 bh=BsN8s/16kWkFD8YBx8OwhZSebR3UbS4QlfACeBPH2H0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=jZKdCjGyE4RMGVRtWRkpRmaEmTMXq81y934ves6MgGNnu4uk77/fL/zW0Z/x56PRW
 XUWsLlkNRlH/l6nQV1tw3GjUtOcKHrDR9wSjp/P9gWPXlxGidwbHmAWAVZs75mUY7B
 T9gOD1kM11Bar3geBAEgFphUQErkN7e1Z+aatl80CzTRZU2EMMYFVtgSvXmXMt9BG/
 39OskIyG4givxvX54ukUJJ2AVJ4v1MTU2+rudeqQRd2fi1vY33au7gOg5EFlm67NhJ
 s2PTy59k1riQjeedINJSB2bKGEz7Ka/LEETU93R5cCs/WKOSNANWTGkNf4sjR7Cmfd
 140l04DjOordw==
Date: Wed, 6 Jan 2021 13:07:22 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] pci/controller/dwc: convert comma to semicolon
Message-ID: <20210106190722.GA1327553@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216131944.14990-1-zhengyongjun3@huawei.com>
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
Cc: robh@kernel.org, roy.zang@nxp.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 16, 2020 at 09:19:44PM +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.

Looks like a good fix, but read this about the changelog title:

https://lore.kernel.org/r/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com

> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 84206f265e54..917ba8d254fc 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -178,7 +178,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	pci->dev = dev;
>  	pci->ops = pcie->drvdata->dw_pcie_ops;
>  
> -	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4),
> +	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4);
>  
>  	pcie->pci = pci;
>  	pcie->ls_epc = ls_epc;
> -- 
> 2.22.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

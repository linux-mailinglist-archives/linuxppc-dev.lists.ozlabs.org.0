Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFF6436BEE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 22:20:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZzPb3zyTz3cD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 07:20:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XbjTRlbg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XbjTRlbg; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZscF0VBmz2xsg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 02:59:24 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92059611F2;
 Thu, 21 Oct 2021 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634831960;
 bh=KPsjXWIvxRCwuDpa6Tvl31WU0C1Lqvs1IzWAmvt1LIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XbjTRlbgoq1kwcCmsdjF6aOe2HMQK3qhZn4f6pwey2aCZwN/CceqGeZEd1NVVct/O
 kAtaIu0D2RzfDizb0fIaGV7yHSP7jJbkgt55srwlnfMkB82DUjcz0CJqbBsQUy4uWY
 IBoamL9aWl4OH1LwOg86ZcJBhBfrYJAu2hgznF4gLGRNWK5xVQ5rD6BityDTdeNgwS
 cRnb8Wpu7DVARlwxGUaTouRT4DDc4QAdUViv1b/jQiIFIHaDQG/uaFhrUhuqvsqihO
 mh/P73eh7rmz07vr2UZwwLI5zkWoGq4S3mbrF3PmKMvhKpfCLTXNCiUnOpogyL0ERX
 wqANqVprTGV4Q==
Received: by pali.im (Postfix)
 id 6EFCD85E; Thu, 21 Oct 2021 17:59:18 +0200 (CEST)
Date: Thu, 21 Oct 2021 17:59:18 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v3 02/25] PCI: Set error response in config access
 defines when ops->read() fails
Message-ID: <20211021155918.kigwwylvdmsuyd3z@pali>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
 <56642edd0d6bf8a8e3d20b5fcc088fd6389b827f.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56642edd0d6bf8a8e3d20b5fcc088fd6389b827f.1634825082.git.naveennaidu479@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Fri, 22 Oct 2021 07:20:04 +1100
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Amey Narkhede <ameynarkhede03@gmail.com>, Oliver O'Halloran <oohall@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Toan Le <toan@os.amperecomputing.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joyce Ooi <joyce.ooi@intel.com>, Dexuan Cui <decui@microsoft.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, linux-rockchip@lists.infradead.org,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Robert Richter <rric@kernel.org>, Sean V Kelley <sean.v.kelley@intel.com>,
 Ray Jui <rjui@broadcom.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 skhan@linuxfoundation.org, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Marc Zyngier <maz@kernel.org>,
 Shawn Guo <shawn.guo@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 21 October 2021 20:37:27 Naveen Naidu wrote:
> Make PCI_OP_READ and PCI_USER_READ_CONFIG set the data value with error
> response (~0), when the PCI device read by a host controller fails.
> 
> This ensures that the controller drivers no longer need to fabricate
> (~0) value when they detect error. It also  gurantees that the error
> response (~0) is always set when the controller drivers fails to read a
> config register from a device.
> 
> This makes error response fabrication consistent and helps in removal of
> a lot of repeated code.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>

Reviewed-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/pci/access.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> index 46935695cfb9..0f732ba2f71a 100644
> --- a/drivers/pci/access.c
> +++ b/drivers/pci/access.c
> @@ -42,7 +42,10 @@ int noinline pci_bus_read_config_##size \
>  	if (PCI_##size##_BAD) return PCIBIOS_BAD_REGISTER_NUMBER;	\
>  	pci_lock_config(flags);						\
>  	res = bus->ops->read(bus, devfn, pos, len, &data);		\
> -	*value = (type)data;						\
> +	if (res)							\
> +		SET_PCI_ERROR_RESPONSE(value);				\
> +	else								\
> +		*value = (type)data;					\
>  	pci_unlock_config(flags);					\
>  	return res;							\
>  }
> @@ -228,7 +231,10 @@ int pci_user_read_config_##size						\
>  	ret = dev->bus->ops->read(dev->bus, dev->devfn,			\
>  					pos, sizeof(type), &data);	\
>  	raw_spin_unlock_irq(&pci_lock);				\
> -	*val = (type)data;						\
> +	if (ret)							\
> +		SET_PCI_ERROR_RESPONSE(val);				\
> +	else								\
> +		*val = (type)data;					\
>  	return pcibios_err_to_errno(ret);				\
>  }									\
>  EXPORT_SYMBOL_GPL(pci_user_read_config_##size);
> -- 
> 2.25.1
> 

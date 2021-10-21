Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FAB436BF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 22:21:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZzQK21Wwz3c7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 07:21:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XWhJ08GG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XWhJ08GG; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZsq00tl8z2yp8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 03:08:44 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AEFD611CB;
 Thu, 21 Oct 2021 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634832521;
 bh=3wcwNbtDNknQedZoy24cZfK1CiOqshIYIk3e2c4B9Rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWhJ08GGIqTZw+TvT/nMCDAy7quf2FJv33jj0Ily06vxkI8rUxTQELDkeHb0u+NFl
 MD0Lx9+x7lhMM3GIAZfA1T2u0eNmQAG1bqpXTvz67evSI6p28cRymuvwfzx0MmCdPZ
 Eu9kyx0IRx+BQHrjfg6pUkXIBKHVfUT3rJ6PyHjkKsGXSiMQ2s0MWrlq5f/6WPUXfA
 12KC4ZTUvETH0cKn32kcKsPv7RGUIftWATLF8XYn+cHxWi3nvl7PC2jb98L+8EJMFN
 xtCzC0AmpDoL2r37xWXDC3EUt/EyyEmL8iLEASXb2kkCdjx5XS/xqqOzJAGW3sGtIs
 FzUF2rqmMe78Q==
Received: by pali.im (Postfix)
 id D8DB085E; Thu, 21 Oct 2021 18:08:38 +0200 (CEST)
Date: Thu, 21 Oct 2021 18:08:38 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v3 01/25] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Message-ID: <20211021160838.r7t7fmmeseaecfac@pali>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
 <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
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

On Thursday 21 October 2021 20:37:26 Naveen Naidu wrote:
> An MMIO read from a PCI device that doesn't exist or doesn't respond
> causes a PCI error.  There's no real data to return to satisfy the
> CPU read, so most hardware fabricates ~0 data.
> 
> Add a PCI_ERROR_RESPONSE definition for that and use it where
> appropriate to make these checks consistent and easier to find.
> 
> Also add helper definitions SET_PCI_ERROR_RESPONSE and
> RESPONSE_IS_PCI_ERROR to make the code more readable.
> 
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>

Reviewed-by: Pali Rohár <pali@kernel.org>

> ---
>  include/linux/pci.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index cd8aa6fce204..689c8277c584 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -154,6 +154,15 @@ enum pci_interrupt_pin {
>  /* The number of legacy PCI INTx interrupts */
>  #define PCI_NUM_INTX	4
>  
> +/*
> + * Reading from a device that doesn't respond typically returns ~0.  A
> + * successful read from a device may also return ~0, so you need additional
> + * information to reliably identify errors.
> + */
> +#define PCI_ERROR_RESPONSE     (~0ULL)
> +#define SET_PCI_ERROR_RESPONSE(val)    (*(val) = ((typeof(*(val))) PCI_ERROR_RESPONSE))
> +#define RESPONSE_IS_PCI_ERROR(val) ((val) == ((typeof(val)) PCI_ERROR_RESPONSE))
> +
>  /*
>   * pci_power_t values must match the bits in the Capabilities PME_Support
>   * and Control/Status PowerState fields in the Power Management capability.
> -- 
> 2.25.1
> 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE456455161
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 00:58:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hvfyx5bCrz30GN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 10:58:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lyKjNjZh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lyKjNjZh; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvfyK2QQfz2yJM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 10:58:17 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8D5A61AD2;
 Wed, 17 Nov 2021 23:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637193494;
 bh=jt1bptChpIJAfJm7hhcvnL0z6T39eDJjHsyLzG8zD1Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=lyKjNjZh0qOCqIMVIpeRoNDwhdUJ/tL20BWpiwNwGttOe0RfGC7KJ4PhUovOify8k
 CPIwK9uSUQMg7VMxx+ystTmi5eBYFIkTtVD4sE8ulLOvbgkfTXGOpyI5/5ntrQgvl0
 CfZ1WfNlECodqxIGcyQGBzURqYPwL89BjB4irtfrZDGz99G0bGiOvyoqAHp04d3fBv
 aBxC568xp2R7kzM9biPqbt5SZcYkGOgkMTsagR6oWZfjlJq8OfZ4tIYBwT1Dm+Bjb+
 xfWKIqeKqVbpwaZ3tBQdETriNpArC0Ads/tlo1ukjZbgXjypi2+h68mtdIpt5Dhoxd
 4UKc+KstDfPQQ==
Date: Wed, 17 Nov 2021 17:58:12 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v3 01/25] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Message-ID: <20211117235812.GA1786428@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
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
 Ryder Lee <ryder.lee@mediatek.com>, Oliver O'Halloran <oohall@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, linux-rockchip@lists.infradead.org,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robert Richter <rric@kernel.org>,
 Sean V Kelley <sean.v.kelley@intel.com>, Ray Jui <rjui@broadcom.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Joyce Ooi <joyce.ooi@intel.com>,
 Shawn Guo <shawn.guo@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 21, 2021 at 08:37:26PM +0530, Naveen Naidu wrote:
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

Beautiful!  I really like this.

I would prefer the macros to start with "PCI_", e.g.,
PCI_SET_ERROR_RESPONSE().

I think "RESPONSE_IS_PCI_ERROR()" is too strong because (as the
comment says), ~0 *may* indicate an error.  Or it may be a successful
read of a register that happens to contain ~0.

Possibilities to convey the idea that this isn't definitive:

  PCI_POSSIBLE_ERROR_RESPONSE(val)  # a little long
  PCI_LIKELY_ERROR(val)             # we really have no idea whether
  PCI_PROBABLE_ERROR(val)           #   likely or probable
  PCI_POSSIBLE_ERROR(val)           # promising?

Can you rebase to my "main" branch (v5.16-rc1), tweak the above, and
collect up the acks/reviews?

We should also browse drivers outside drivers/pci for places we could
use these.  Not necessarily as part of this series, although if
authors there object, it would be good to learn that earlier than
later.

Drivers that implement pci_error_handlers might be a fruitful place to
start.  But you've done a great job finding users of ~0 and 0xffff...
in drivers/pci/, too.

> +
>  /*
>   * pci_power_t values must match the bits in the Capabilities PME_Support
>   * and Control/Status PowerState fields in the Power Management capability.
> -- 
> 2.25.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

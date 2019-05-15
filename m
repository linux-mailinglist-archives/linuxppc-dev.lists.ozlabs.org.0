Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDF01E9CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 10:06:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453nFm0pkjzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 18:06:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.193; helo=mail-qk1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453nDM3HvBzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 18:05:38 +1000 (AEST)
Received: by mail-qk1-f193.google.com with SMTP id q197so130288qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 01:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q+ccq2l1YBXRacKh6NL0gv9RFQ3XL6hLCYeRFYOlzPA=;
 b=gkfTbJ9n9Updr5oRPlRgJFLp4DvmcWBGUy32IJ8C+fjjZmFEI/VzpLSc629F1UmrMw
 8ud6fIdx2ZGNAUJxNfc8p8XZ6xHIqBIjSDJf+h4C2dzHQwt9QDAOJ00q7YGctc0T8yT9
 W8Uxc+sy2S5Y8dMnpGieLItL+3HL4T8XVC5FKZEa/KGbJiUsr6lhlUBYyNTTdBKUQUkh
 Du1GZ4dAVqcp+QDnmdNcEAYw4/hYIlJ67XKWIJdqEoN6PSPu//cg5k8FFWZlnh3XBIiS
 VQ0CxpzelKRryHjaC0MQvpGlTt3BH+dEC7HfDaVTdfmRp84zlSNo/0fD9UZzCvP7P6Uu
 d75w==
X-Gm-Message-State: APjAAAWWhYY2CBLpdlQ51x5YfGW0XOGQHlUMy0y5iL+Qu52DUf2u7Y0V
 SImjbIitHzZEsyFKR4ASX3A2KaX6cYto76O4F7A=
X-Google-Smtp-Source: APXvYqyIH5XViMS1a+4nEhLjKpZlbMQT/F6wM51bbNHL491ybxO9CDxjXoTFt4avIv9Jz3PVxDBDwzIn6dZ25APRqtI=
X-Received: by 2002:a37:c441:: with SMTP id h1mr5276612qkm.291.1557907536423; 
 Wed, 15 May 2019 01:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190515072747.39941-1-xiaowei.bao@nxp.com>
 <20190515072747.39941-2-xiaowei.bao@nxp.com>
In-Reply-To: <20190515072747.39941-2-xiaowei.bao@nxp.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 May 2019 10:05:19 +0200
Message-ID: <CAK8P3a3AXRp_v_7hkoJA28tUCiSh1eYzbk4Q4h29OqL6y-KL8A@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 DTML <devicetree@vger.kernel.org>, gregkh <gregkh@linuxfoundation.org>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kishon <kishon@ti.com>, "M.h. Lian" <minghuan.Lian@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Leo Li <leoyang.li@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2019 at 9:36 AM Xiaowei Bao <xiaowei.bao@nxp.com> wrote:
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   52 ++++++++++++++++++++++++
>  1 files changed, 52 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index b045812..50b579b 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -398,6 +398,58 @@
>                         status = "disabled";
>                 };
>
> +               pcie@3400000 {
> +                       compatible = "fsl,ls1028a-pcie";
> +                       reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
> +                              0x80 0x00000000 0x0 0x00002000>; /* configuration space */
> +                       reg-names = "regs", "config";
> +                       interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
> +                                    <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>; /* aer interrupt */
> +                       interrupt-names = "pme", "aer";
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       device_type = "pci";
> +                       dma-coherent;
> +                       num-lanes = <4>;
> +                       bus-range = <0x0 0xff>;
> +                       ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000   /* downstream I/O */
> +                                 0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */

Are you sure there is no support for 64-bit BARs or prefetchable memory?

Is this a hardware bug, or something that can be fixed in firmware?

       Arnd

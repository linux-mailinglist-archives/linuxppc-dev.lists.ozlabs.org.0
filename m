Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FF4264C2E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 20:04:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnRby5QGCzDqnW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 04:04:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.65; helo=mail-io1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnRSh1GqbzDrRC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 03:58:11 +1000 (AEST)
Received: by mail-io1-f65.google.com with SMTP id j2so8089850ioj.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 10:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VxfApMJ0EUmdYdIgNKbi7UhLfWBEbGugyTzK4PjTtv0=;
 b=iZ/UQ5mlIHKGannihzNDC6+IkkT5w8eS9vq4p+CjEzuT+a9+DeeXv/weFpU8bphHsx
 MurIqpgWxJFWBg4p0lvi1+Iv+bgOkTEQD+4yngdz8ecsl5GOJb6utEoGRMbtGuYO0/ca
 FBTG77+obBNbFYV0NBlww0AuGJp5XFF7sJtalTwylMW1T/HwESbuCeXDSwuvsnr9MIzI
 cRm+3Vzy6FxAuydcEH6eU2XaZoH2pL7ElXEQQdsorV0w0q+ixlF9Gbs58kuCQdKMuPEU
 +2ykvDlYfiawGqGVep0aeBgjmtCcugqO0AtDeCqxYpWEVKgsWe/soaNc3GNyfm4vB3Hk
 n2wg==
X-Gm-Message-State: AOAM531Ef3d9FyAxkgNLXllrKmtr+abjHuuDHzlQ4b1kj3tgVSBVTAU4
 O6XW4OUcEgSfcVJ/NY6slw==
X-Google-Smtp-Source: ABdhPJzHuaedQqz87WQhJT7BVc3Tmt6QFnyUykz+EZLkaJGLKC8fc3S8Bjou486WTPNTEl6SJdSQVg==
X-Received: by 2002:a05:6638:2a6:: with SMTP id
 d6mr9888898jaq.132.1599760686431; 
 Thu, 10 Sep 2020 10:58:06 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id h15sm3376285ils.74.2020.09.10.10.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 10:58:05 -0700 (PDT)
Received: (nullmailer pid 595458 invoked by uid 1000);
 Thu, 10 Sep 2020 17:58:04 -0000
Date: Thu, 10 Sep 2020 11:58:04 -0600
From: Rob Herring <robh@kernel.org>
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Subject: Re: [PATCHv7 02/12] PCI: designware-ep: Add the doorbell mode of
 MSI-X in EP mode
Message-ID: <20200910175804.GA592152@bogus>
References: <20200811095441.7636-1-Zhiqiang.Hou@nxp.com>
 <20200811095441.7636-3-Zhiqiang.Hou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811095441.7636-3-Zhiqiang.Hou@nxp.com>
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
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com,
 Xiaowei Bao <xiaowei.bao@nxp.com>, roy.zang@nxp.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, minghuan.Lian@nxp.com,
 jingoohan1@gmail.com, andrew.murray@arm.com, mingkai.hu@nxp.com,
 gustavo.pimentel@synopsys.com, bhelgaas@google.com, shawnguo@kernel.org,
 kishon@ti.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 11, 2020 at 05:54:31PM +0800, Zhiqiang Hou wrote:
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
> 
> Add the doorbell mode of MSI-X in DWC EP driver.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V7:
>  - Rebase the patch without functionality change.
> 
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 14 ++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h    | 12 ++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index e5bd3a5ef380..e76b504ed465 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -471,6 +471,20 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>  
> +int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,

return void. It never has an error.

It could also just be an inline function.

> +				       u16 interrupt_num)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 msg_data;
> +
> +	msg_data = (func_no << PCIE_MSIX_DOORBELL_PF_SHIFT) |
> +		   (interrupt_num - 1);
> +
> +	dw_pcie_writel_dbi(pci, PCIE_MSIX_DOORBELL, msg_data);
> +
> +	return 0;
> +}
> +
>  int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			      u16 interrupt_num)
>  {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 89f8271ec5ee..745b4938225a 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -97,6 +97,9 @@
>  #define PCIE_MISC_CONTROL_1_OFF		0x8BC
>  #define PCIE_DBI_RO_WR_EN		BIT(0)
>  
> +#define PCIE_MSIX_DOORBELL		0x948
> +#define PCIE_MSIX_DOORBELL_PF_SHIFT	24
> +
>  #define PCIE_PL_CHK_REG_CONTROL_STATUS			0xB20
>  #define PCIE_PL_CHK_REG_CHK_REG_START			BIT(0)
>  #define PCIE_PL_CHK_REG_CHK_REG_CONTINUOUS		BIT(1)
> @@ -434,6 +437,8 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			     u8 interrupt_num);
>  int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			     u16 interrupt_num);
> +int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
> +				       u16 interrupt_num);
>  void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar);
>  #else
>  static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> @@ -475,6 +480,13 @@ static inline int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>  
> +static inline int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep,
> +						     u8 func_no,
> +						     u16 interrupt_num)
> +{
> +	return 0;
> +}
> +
>  static inline void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  {
>  }
> -- 
> 2.17.1
> 

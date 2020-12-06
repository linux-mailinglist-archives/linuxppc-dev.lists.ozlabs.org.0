Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AC72D0718
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 21:18:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpySk66KvzDqcH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 07:18:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.67; helo=mail-pj1-f67.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpyQg3tKkzDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 07:16:58 +1100 (AEDT)
Received: by mail-pj1-f67.google.com with SMTP id m5so6235142pjv.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Dec 2020 12:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R+rjdl/kMmpfvATyyiBKTTDC7/ADOrYG2LQ26ycg4ts=;
 b=Su7cM/3urukGqddNXHBA11U1w+BlIzUM7pAj2iLrJGhBrlz5O8SeTkhNJ3JVjZ2HM4
 A+PQwj6VBs5cWk+gK6Im4PNzYbORvzPo/Dph3XixlMpT1o3n+TfQnSp9auJdyINjZ1RV
 GExQEmyqr0m0RhZWREXIrr2DqXGysVfG5X+D7GEo5iD9oDoz+STd63oIiUVkplAiI8PX
 la3Yd5HByqcOLmEe2WVZEBXCb8ZdE20KDgrGrDNZvuZmQo4J+onYa115gSVIwhqBu4l4
 rFLhzBFbkeN/g8Stzi4DMuG+iuyTxcwcdnxP+TGplg5FDv1vQG/VgaKdIJr/CX0rRpJF
 YdNA==
X-Gm-Message-State: AOAM531FLKCWRPPrFMSCo1fTwm/0AjIMGD3ZWxK1Vd+T2O8dv1Bv4XJA
 AxktGS27rXq0tAeJEHhAEG8=
X-Google-Smtp-Source: ABdhPJxpA9QCLH2CckDZiO4WQ7tusbQz3TsQfr9LJIt6xF7N6IQbRIyD2evK2VHZgjLCDBw3mAerWw==
X-Received: by 2002:a17:90a:990a:: with SMTP id
 b10mr2206383pjp.87.1607285815024; 
 Sun, 06 Dec 2020 12:16:55 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id w11sm12784288pfi.162.2020.12.06.12.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 12:16:54 -0800 (PST)
Date: Sun, 6 Dec 2020 21:16:36 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 1/5] PCI: Unify ECAM constants in native PCI Express
 drivers
Message-ID: <X808JJGeIREwqIjb@rocinante>
References: <20201129230743.3006978-1-kw@linux.com>
 <20201129230743.3006978-2-kw@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201129230743.3006978-2-kw@linux.com>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Jonathan Derrick <jonathan.derrick@intel.com>, linux-pci@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Robert Richter <rrichter@marvell.com>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nicolas, Florian and Florian,

[...]
> -/* Configuration space read/write support */
> -static inline int brcm_pcie_cfg_index(int busnr, int devfn, int reg)
> -{
> -	return ((PCI_SLOT(devfn) & 0x1f) << PCIE_EXT_SLOT_SHIFT)
> -		| ((PCI_FUNC(devfn) & 0x07) << PCIE_EXT_FUNC_SHIFT)
> -		| (busnr << PCIE_EXT_BUSNUM_SHIFT)
> -		| (reg & ~3);
> -}
> -
>  static void __iomem *brcm_pcie_map_conf(struct pci_bus *bus, unsigned int devfn,
>  					int where)
>  {
> @@ -716,7 +704,7 @@ static void __iomem *brcm_pcie_map_conf(struct pci_bus *bus, unsigned int devfn,
>  		return PCI_SLOT(devfn) ? NULL : base + where;
>  
>  	/* For devices, write to the config space index register */
> -	idx = brcm_pcie_cfg_index(bus->number, devfn, 0);
> +	idx = PCIE_ECAM_OFFSET(bus->number, devfn, 0);
>  	writel(idx, pcie->base + PCIE_EXT_CFG_INDEX);
>  	return base + PCIE_EXT_CFG_DATA + where;
>  }
[...]

Passing the hard-coded 0 as the "reg" argument here never actually did
anything, thus the 32 bit alignment was never correctly enforced.

My question would be: should this be 32 bit aligned?  It seems like the
intention was to perhaps make the alignment?  I am sadly not intimately
familiar with his hardware, so I am not sure if there is something to
fix here or not.

Also, I wonder whether it would be safe to pass the offset (the "where"
variable) rather than hard-coded 0?

Thank you for help in advance!

Bjorn also asked the same question:
  https://lore.kernel.org/linux-pci/20201120203428.GA272511@bjorn-Precision-5520/

Krzysztof

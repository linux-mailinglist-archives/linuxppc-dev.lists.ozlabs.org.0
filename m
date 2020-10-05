Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2E3282EF8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Oct 2020 04:54:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4QDh1lHKzDqGk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Oct 2020 13:54:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=psYh+c5O; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4QBy53SXzDqFJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Oct 2020 13:53:11 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id u24so5059218pgi.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Oct 2020 19:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HHMTKnBxL0N7bXcNK+GerHSHtiDck53Y2/0CunSw/j4=;
 b=psYh+c5OvwhMBJLg5EuPKeRmIBKGCwEgwqb40xvWojEXm8dpRAY47wVW+8BouFoi9b
 yTQToj8e3jTE5/68dGYGhvS5Ac7dIh6DlK/Qbo5z+SbfqYepDej8ua1vGsq9xVt5nXBp
 vaEqZZ/P2Lsj3Zb/7uxjTsGCn0wIR+n6kwjcYQ82RTmVTIOoDxaN8EzFwDMD5qaFWSVt
 jrsagswwg6WaIk7fS+GHbGEGpCMbOoxtm2yfwmSI4mU77YJwpMfJ+L85nIbuSWfzGWdR
 vzXwWwDLa/0xSfPswGgxi0VtwSJfeReA6V5szkE0CZgyA9CLOtby8HGN+p4Vn9UT55AP
 ZKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HHMTKnBxL0N7bXcNK+GerHSHtiDck53Y2/0CunSw/j4=;
 b=pfnWx4BRFzzsWb/slltPpiffNXkCckc/0n9pqdNsFC8qoy/PJAgqXdTHFDtmw0GWjw
 kJEWQGMPo0rdh8lBum/MQfV4j79pEaVl7857cp+w21E6cJF16XBLYvdEN4cN9rVjpE7I
 CluHgUkKpstJU3BH+k/A/xJJ8Ugni9gFgo8cIftlWaWaK/vZkhCjsPdBnFypD7+vevmK
 JcpuFyaFL0IbYd3WcUB97LXkMY9uOZRkWbiMP5TWM6hP/RLIo2RQ3fd2pCXpVp0JOeQj
 RUay6BvxvVg0UK1aTWRO58PT+vnsM379A6CSSm3nvamMLOEgSdxjA9+tg1H64hORDoWM
 635A==
X-Gm-Message-State: AOAM532kwYLFl2nRfqe/YEsJ9WFg84VVos52v0Jk16pFotWG62mKN4Rg
 HvNrqCWMtdBqOjy3t413omc=
X-Google-Smtp-Source: ABdhPJw3dGTnpgAGQ4msGFDJmgnKlpAKJK8vgVUn8Vr7RE+6KO5inwYtl/zAiU1GYZUbGZnYjoCD6A==
X-Received: by 2002:a63:4457:: with SMTP id t23mr12196361pgk.108.1601866389332; 
 Sun, 04 Oct 2020 19:53:09 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id
 j1sm4317047pfj.202.2020.10.04.19.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Oct 2020 19:53:08 -0700 (PDT)
To: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20201005003805.465057-1-kw@linux.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4] PCI: Unify ECAM constants in native PCI Express drivers
Message-ID: <429099a8-5186-40c3-f5c0-f219b3e79f01@gmail.com>
Date: Sun, 4 Oct 2020 19:53:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201005003805.465057-1-kw@linux.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Ray Jui <rjui@broadcom.com>, linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Robert Richter <rrichter@marvell.com>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/4/2020 5:38 PM, Krzysztof Wilczyński wrote:
> Unify ECAM-related constants into a single set of standard constants
> defining memory address shift values for the byte-level address that can
> be used when accessing the PCI Express Configuration Space, and then
> move native PCI Express controller drivers to use newly introduced
> definitions retiring any driver-specific ones.
> 
> The ECAM ("Enhanced Configuration Access Mechanism") is defined by the
> PCI Express specification (see PCI Express Base Specification, Revision
> 5.0, Version 1.0, Section 7.2.2, p. 676), thus most hardware should
> implement it the same way.  Most of the native PCI Express controller
> drivers define their ECAM-related constants, many of these could be
> shared, or use open-coded values when setting the .bus_shift field of
> the struct pci_ecam_ops.
> 
> All of the newly added constants should remove ambiguity and reduce the
> number of open-coded values, and also correlate more strongly with the
> descriptions in the aforementioned specification (see Table 7-1
> "Enhanced Configuration Address Mapping", p. 677).
> 
> There is no change to functionality.
> 
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
> ---

[snip]

>   
> -/* Configuration space read/write support */
> -static inline int brcm_pcie_cfg_index(int busnr, int devfn, int reg)
> -{
> -	return ((PCI_SLOT(devfn) & 0x1f) << PCIE_EXT_SLOT_SHIFT)
> -		| ((PCI_FUNC(devfn) & 0x07) << PCIE_EXT_FUNC_SHIFT)
> -		| (busnr << PCIE_EXT_BUSNUM_SHIFT)
> -		| (reg & ~3);
> -}
> -
>   static void __iomem *brcm_pcie_map_conf(struct pci_bus *bus, unsigned int devfn,
>   					int where)
>   {
> @@ -590,7 +578,7 @@ static void __iomem *brcm_pcie_map_conf(struct pci_bus *bus, unsigned int devfn,
>   		return PCI_SLOT(devfn) ? NULL : base + where;
>   
>   	/* For devices, write to the config space index register */
> -	idx = brcm_pcie_cfg_index(bus->number, devfn, 0);
> +	idx = PCIE_ECAM_BUS(bus->number) | PCIE_ECAM_DEVFN(devfn);

This appears to be correct, so:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

however, I would have defined a couple of additional helper macros and do:

	idx = PCIE_ECAM_BUS(bus->number) | PCIE_ECAM_DEV(devfn) | 
PCIE_ECAM_FUN(devfn);

for clarity.

[snip]

> +/*
> + * Memory address shift values for the byte-level address that
> + * can be used when accessing the PCI Express Configuration Space.
> + */
> +
> +/*
> + * Enhanced Configuration Access Mechanism (ECAM)
> + *
> + * See PCI Express Base Specification, Revision 5.0, Version 1.0,
> + * Section 7.2.2, Table 7-1, p. 677.
> + */
> +#define PCIE_ECAM_BUS_SHIFT	20 /* Bus Number */
> +#define PCIE_ECAM_DEV_SHIFT	15 /* Device Number */
> +#define PCIE_ECAM_FUN_SHIFT	12 /* Function Number */
> +
> +#define PCIE_ECAM_BUS(x)	(((x) & 0xff) << PCIE_ECAM_BUS_SHIFT)
> +#define PCIE_ECAM_DEVFN(x)	(((x) & 0xff) << PCIE_ECAM_FUN_SHIFT)

For instance, adding these two:

#define PCIE_ECAM_DEV(x)		(((x) & 0x1f) << PCIE_ECAM_DEV_SHIFT)
#define PCIE_ECAM_FUN(x)		(((x) & 0x7) << PCIE_ECAM_FUN_SHIFT)

may be clearer for use in drivers like pcie-brcmstb.c that used to treat 
the device function in terms of device and function (though it was 
called slot there).
-- 
Florian

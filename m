Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CBA2D095D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 04:27:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cq7yt4wbgzDqKN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 14:27:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pzZKsSd8; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cq7ww2CvKzDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 14:25:14 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id t205so13901546oib.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Dec 2020 19:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C2Ix5oeKbqJKBSFQum17pYUeNiQgWG4qBDaCP6pF+9E=;
 b=pzZKsSd8MbNoUDnMdPCVc5u6LHTCjTVi1zdUIqAWpWGrKhn2SS+tAQeQc1vQfqA/M1
 uo8emwG4ei0ap7lYcKus+vFJPiNL9SkPX5E4aXMBBvKSXAMv+GrpZrRpXHAngVWkMhZd
 klK8iivt8DWyHnAvHGkqeKM1A5/ecGxXpIvop6wwC85CtjCZLEoGJz1YariaxwQOd4Zm
 uqNOHPLKB8eFtTXr1BHAUBlQr03aC+bJPtTF9wkNuDxCLJUuwzK8mgvxbRXeo+ieU7Zu
 dGmAKaT/2GABKN60dHgCOR2thZ66V1CUcFOY5jb1kZDWWyVqgLj/rGwqLg55Mz3hUZyh
 iFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C2Ix5oeKbqJKBSFQum17pYUeNiQgWG4qBDaCP6pF+9E=;
 b=pn55N+JoAdTbCZLw0d0QS2XJ0cAL6TX7onTFYvCuFkuC5PtSPrJwA8GHF8WBP0IDkL
 oePlJ6YdMMqQ8EApUs0u2dmL3cKeB9jZlXg8e0JNlPqeRLPpmrCZEqJW2LTmheaoR8S3
 kUc4G5cZQtf/tYzGi7ktZsQZeG5Ffw1InnVaS/fWwQC2hlq0gSkawWXC+D08eF+bHBE/
 CWBzEOYJCOpA2vgzQgUQOmqBwZzQ/VrOXWuyM/VKhpoCgxz8G+E/m7Ijb/YI3/ktTWKQ
 2FL/kuMf+OIF2dMS9pvemtPiTXJH2mypVmTXBwUzeV0M8txCFCSk+RoW8Hv6SMdXfE4b
 ha7w==
X-Gm-Message-State: AOAM532ueqnzLGRZL0ozhVtcZWvstS5tO7Um50ZSmU7nqlRj3pHucehz
 108BVWkHNcSX6SIVIAMSnMU=
X-Google-Smtp-Source: ABdhPJzczOydwnK1CTI9pP9bxm9+oAl7Jgo4Mw8k7GQ6HD6zylEV81DWrC05uDG06SC4srcr560HGA==
X-Received: by 2002:aca:3d0b:: with SMTP id k11mr11306704oia.122.1607311511211; 
 Sun, 06 Dec 2020 19:25:11 -0800 (PST)
Received: from ?IPv6:2600:1700:dfe0:49f0:98c0:b1b6:3436:9662?
 ([2600:1700:dfe0:49f0:98c0:b1b6:3436:9662])
 by smtp.gmail.com with ESMTPSA id k5sm2350693oot.30.2020.12.06.19.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 19:25:10 -0800 (PST)
Subject: Re: [PATCH v6 1/5] PCI: Unify ECAM constants in native PCI Express
 drivers
To: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jim Quinlan <james.quinlan@broadcom.com>
References: <20201129230743.3006978-1-kw@linux.com>
 <20201129230743.3006978-2-kw@linux.com> <X808JJGeIREwqIjb@rocinante>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <094b314f-7f61-d0fd-fd63-c9c4da9e84a8@gmail.com>
Date: Sun, 6 Dec 2020 19:25:06 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X808JJGeIREwqIjb@rocinante>
Content-Type: text/plain; charset=utf-8
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

+JimQ,

On 12/6/2020 12:16 PM, Krzysztof Wilczyński wrote:
> Hello Nicolas, Florian and Florian,
> 
> [...]
>> -/* Configuration space read/write support */
>> -static inline int brcm_pcie_cfg_index(int busnr, int devfn, int reg)
>> -{
>> -	return ((PCI_SLOT(devfn) & 0x1f) << PCIE_EXT_SLOT_SHIFT)
>> -		| ((PCI_FUNC(devfn) & 0x07) << PCIE_EXT_FUNC_SHIFT)
>> -		| (busnr << PCIE_EXT_BUSNUM_SHIFT)
>> -		| (reg & ~3);
>> -}
>> -
>>  static void __iomem *brcm_pcie_map_conf(struct pci_bus *bus, unsigned int devfn,
>>  					int where)
>>  {
>> @@ -716,7 +704,7 @@ static void __iomem *brcm_pcie_map_conf(struct pci_bus *bus, unsigned int devfn,
>>  		return PCI_SLOT(devfn) ? NULL : base + where;
>>  
>>  	/* For devices, write to the config space index register */
>> -	idx = brcm_pcie_cfg_index(bus->number, devfn, 0);
>> +	idx = PCIE_ECAM_OFFSET(bus->number, devfn, 0);
>>  	writel(idx, pcie->base + PCIE_EXT_CFG_INDEX);
>>  	return base + PCIE_EXT_CFG_DATA + where;
>>  }
> [...]
> 
> Passing the hard-coded 0 as the "reg" argument here never actually did
> anything, thus the 32 bit alignment was never correctly enforced.
> 
> My question would be: should this be 32 bit aligned?  It seems like the
> intention was to perhaps make the alignment?  I am sadly not intimately
> familiar with his hardware, so I am not sure if there is something to
> fix here or not.
> 
> Also, I wonder whether it would be safe to pass the offset (the "where"
> variable) rather than hard-coded 0?
> 
> Thank you for help in advance!
> 
> Bjorn also asked the same question:
>   https://lore.kernel.org/linux-pci/20201120203428.GA272511@bjorn-Precision-5520/
> 
> Krzysztof
> 

-- 
Florian

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 194AA2B32A6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Nov 2020 06:52:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CYhDn3MHJzDqSN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Nov 2020 16:52:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.66; helo=mail-wr1-f66.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CYhCK2XKvzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Nov 2020 16:51:03 +1100 (AEDT)
Received: by mail-wr1-f66.google.com with SMTP id r17so14794574wrw.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Nov 2020 21:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Ar1HS0TIigbtEbbtbsrbeVh6VW06RBSYq0BlrEFWlQ=;
 b=rDWNq6vVekcFXxtHcmvfQeu5EtDPf34JOtLb3AoEmtNTwSljIcgEtxoilOlIzi90bT
 teUs7P3yRgs2ERV/OmhRQBC5OOdO8TMr/YjY7c6cAeurpYrOZRD6iQ39hi+uvEMxj0fw
 H4Cw+tZw/aqY95kSpkg5oiWlUCSq6heEFIdIhb4eCpBiEYmwAEF7zdbZWdsfmmv0HpFK
 LoOXyt+74WVRaMPR+6KaN51NDSAKJZ7ehhC/CeQz4RAkT3Wz4PEuvoV7PCI34QdCCzel
 Z9Hlcz840Dm+7tCZkNpkVQDLCHHz1ObDVLcIh9K9jsB2RR7isAlZICnk/XT7MhkQv8zT
 Ii8g==
X-Gm-Message-State: AOAM5321z7ePvT7Obpq3JPVlZ3zRZjDzmKbQ2CHSF4NBVHpKnPbx5Sr1
 4VNWPois+1RQotWE46RKyug=
X-Google-Smtp-Source: ABdhPJyyWlqOi881rwwar8nssPXB4LzlZhjcTUAVcp2Ix24BVuoPkzt7VIFoWPh+xOxI1NRrikiLUw==
X-Received: by 2002:a05:6000:345:: with SMTP id
 e5mr12059182wre.333.1605419460016; 
 Sat, 14 Nov 2020 21:51:00 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id g11sm17547121wrq.7.2020.11.14.21.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 21:50:59 -0800 (PST)
Date: Sun, 15 Nov 2020 06:50:57 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4] PCI: Unify ECAM constants in native PCI Express drivers
Message-ID: <X7DBwZ5cJrbQspM+@rocinante>
References: <20201005003805.465057-1-kw@linux.com>
 <429099a8-5186-40c3-f5c0-f219b3e79f01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <429099a8-5186-40c3-f5c0-f219b3e79f01@gmail.com>
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
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 Robert Richter <rrichter@marvell.com>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20-10-04 19:53:06, Florian Fainelli wrote:

Hi Florian,

Sorry for taking a long time to get back to you.

[...]
> This appears to be correct, so:
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Thank you!
 
> however, I would have defined a couple of additional helper macros and do:
> 
> 	idx = PCIE_ECAM_BUS(bus->number) | PCIE_ECAM_DEV(devfn) |
> PCIE_ECAM_FUN(devfn);
> 
> for clarity.
> 
[...]
> For instance, adding these two:
> 
> #define PCIE_ECAM_DEV(x)		(((x) & 0x1f) << PCIE_ECAM_DEV_SHIFT)
> #define PCIE_ECAM_FUN(x)		(((x) & 0x7) << PCIE_ECAM_FUN_SHIFT)
> 
> may be clearer for use in drivers like pcie-brcmstb.c that used to treat the
> device function in terms of device and function (though it was called slot
> there).

Regarding the suggestion above - it has been like that initially, albeit
Bjorn suggested that there is no need to reply on the macros that use
PCI_SLOT() and PCI_FUNC() macros, see:

https://lore.kernel.org/linux-pci/20200922232715.GA2238688@bjorn-Precision-5520/

I would be happy to put the macros back if there is a value in having
the extra macros added - perhaps for clarify, as you suggest.

Krzysztof

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D86BD549F98
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 22:40:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMNjv2pGzz3cfM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 06:40:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.43; helo=mail-io1-f43.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMNjR1ZB7z3blj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 06:39:54 +1000 (AEST)
Received: by mail-io1-f43.google.com with SMTP id p69so7408087iod.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 13:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jfed8WHo8TWNvxCiSvI5rcyrYQLVvZOkDmByiHpwcb4=;
        b=4uCjqj5xl0ofAe33UzLsnaZoVYgW++NA74dhb4TYEboNkpZ7bT9w88ktKS2XFJZ1Ug
         Fv2CjMAhVUwQnId3Huell5wK7clQXdh0n1wln17dLlcUexxck1pz7qTYFpf3gIUg8y/s
         y3tsIdgITahMJGRc9bqpDcRfZhzbTaMlYOLVv+ekWj6H7s1WxK/WcqAnA9eJOVCszFyg
         zroBIiriEiQzMwccf0BREymId2Oif2wQuXYgGH/er99u4aEqD80x44+Ms2TqpCCAKBFj
         iqYU8ANJ1WI2Pdat03dsEgdnpVxa/+PvTsf0i4RqG8GA8XblTTshMp08ZekJ9oKsU5xO
         R8UA==
X-Gm-Message-State: AOAM531cfs8MQWlTj0xrPA5zunQxftURvQYOpwFqWMi8iMd9AauBmOd0
	A+SdgA82d/QD4t2VhpLPSA==
X-Google-Smtp-Source: ABdhPJx7nR5T7M0L4hzZ6y5vQUaF5sNik9SF5ruUtWjDfNKqK4EuWnDm5nKY2r7qbgu01ui2ucAQoQ==
X-Received: by 2002:a6b:6003:0:b0:668:160b:db94 with SMTP id r3-20020a6b6003000000b00668160bdb94mr769352iog.204.1655152790868;
        Mon, 13 Jun 2022 13:39:50 -0700 (PDT)
Received: from robh.at.kernel.org ([69.39.28.171])
        by smtp.gmail.com with ESMTPSA id c9-20020a023f49000000b0033156d6016asm3939471jaf.91.2022.06.13.13.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 13:39:50 -0700 (PDT)
Received: (nullmailer pid 42858 invoked by uid 1000);
	Mon, 13 Jun 2022 20:39:49 -0000
Date: Mon, 13 Jun 2022 14:39:49 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v4 13/18] PCI: dwc: Add start_link/stop_link inliners
Message-ID: <20220613203949.GB28636-robh@kernel.org>
References: <20220610082535.12802-1-Sergey.Semin@baikalelectronics.ru>
 <20220610082535.12802-14-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610082535.12802-14-Sergey.Semin@baikalelectronics.ru>
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
Cc: linux-arm-kernel@lists.infradead.org, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Roy Zang <roy.zang@nxp.com>, linux-pci@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>, Minghuan Lian <minghuan.Lian@nxp.com>, Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 10, 2022 at 11:25:29AM +0300, Serge Semin wrote:
> There are several places in the generic DW PCIe code where the
> platform-specific PCIe link start/stop methods are called after making
> sure the ops handler and the callbacks are specified. Instead of repeating
> the same pattern over and over let's define the static-inline methods in
> the DW PCIe header file and use them in the relevant parts of the driver.
> 
> Note returning a negative error from the EP link start procedure if the
> start_link pointer isn't specified doesn't really make much sense since it
> perfectly normal to have such platform. Moreover even pci_epc_start()
> doesn't fail if no epc->ops->start callback is spotted. As a side-effect
> of this modification we can set the generic DW PCIe and Layerscape EP
> platform drivers free from the empty start_link callbacks and as such
> entirely dummy dw_pcie_ops instances.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v4:
> - This is a new patch created on the v4 lap of the series.
> ---
>  drivers/pci/controller/dwc/pci-layerscape-ep.c    | 12 ------------
>  drivers/pci/controller/dwc/pcie-designware-ep.c   |  8 ++------
>  drivers/pci/controller/dwc/pcie-designware-host.c | 10 ++++------
>  drivers/pci/controller/dwc/pcie-designware-plat.c | 10 ----------
>  drivers/pci/controller/dwc/pcie-designware.h      | 14 ++++++++++++++
>  5 files changed, 20 insertions(+), 34 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

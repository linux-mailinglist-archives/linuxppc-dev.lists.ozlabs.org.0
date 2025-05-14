Return-Path: <linuxppc-dev+bounces-8583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCEBAB7170
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 18:33:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyJmx5jC5z2yxN;
	Thu, 15 May 2025 02:33:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747240401;
	cv=none; b=G35OvhA/D6/aityThLdyuucciu2SWvZzms8rFxcro84WHDeC+yUEOYBHMG4V8OSp8KoUWEMHZ9THW10NvGQmNeqO14c65QQ7viGNE42z/qP+8wXLPPqlaoa9+k2WuqpZck1Op929uZB2VO1TYjmCcUpNgbOGrLrdhy9ZXRC3X2YKzs5EPauV0ILHoILvnZRiJLPMzbR9drZdNKWoiLRFuRe0tngv8OTeLn7WWq+l25HuRj0VVzAmcNi9v5E/d+UMRMxmA8QauGbPk5flyS5VHwHzselqskMqx9L8tFTpX4o23nyYKsnqnGfcm+dYhHoLmqQ5oIhqjZErRF2Lq+kz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747240401; c=relaxed/relaxed;
	bh=fkj+eXJWD3zKSY4LtYDXeZfa8DE+DGWzE6g5lQpJzPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIiNRBu2L+Nb5E2uZLSiTqsEWuDi4rLQ+u20XQQW/qXfJd5oGVG8HBhe/ad7xUKJeja1vXHnbKBXyj1S6AF5IoPkKEWv6WffjAR1ok2nTv2Hd4k5AUtZSOlSgGpXoxrRp/A7aIkdNnHfvxPyDpseNsroSZE0UKGaZTi0FiFPGnduP7ngTuxr8sw2Oyhfk32Vyh5v+FEmA3+kbN33vlBhuKY8XZDJ2WsoWvy4xPWPFQEz8B8T3IQm8YT55gqa9SgpjO1B1TknqSB8bkkI/8r28JMYF598IttHTKZkzwPp5CaW6Kw6XT5KIpWufWQfdiMjS92xMAwfhC0Fx/dXePfAhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p850RJDl; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p850RJDl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyJmw5sCDz2yr6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 02:33:20 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so93005e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 09:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240398; x=1747845198; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkj+eXJWD3zKSY4LtYDXeZfa8DE+DGWzE6g5lQpJzPc=;
        b=p850RJDlb4ejgb0aI+mQk1tWSI5a1GhOSaa9Xa1twPn5p3eZ4QhxEDbLmiNapVIQck
         Y7741gSiY5yrvBkfU/80ulKVboKNKcCD9pJy4vXh7qNc6eDZwDoZtAaxOWlWiMBoHBoN
         AxVeZx3+i73D6cOH9/kCXGsU91TnZ6fnUy/PsUqi5gn3Vh63GcUcpi2gOIGtxKpoIgpi
         StjrVEuG301Cik0yq/OlwTNuIsV1YaEiA4RSEQD48Q2NWOUaY3C8/56nytnYjWRj+lzZ
         jGgynnxkPcPglvnqv02gZ8DIoN4D/W66mSfW2D6QUCbX/XygUhrNaF9nfdz8kiS0Xabr
         e67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240398; x=1747845198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkj+eXJWD3zKSY4LtYDXeZfa8DE+DGWzE6g5lQpJzPc=;
        b=YSGq1d1E1s7fhXjrcgrBdJXNNV280fK5/g6sXAxVhi2Fic1DLeXHNzW8TDvyVpP0v5
         2Y3GHRfHyG+8dmhybhb517Q/zq9UPkfN5bY9nEs1xZ8CBT69CpP/uDAQNv16DTgvutXO
         aSDSiJ5JqYsa/0/c01XeKu9B2LRRWHL0D3cWYkdj0jQLB8WzUxG6n/pT0n9mhzmA/ECx
         agcGEvXh/QJtOdm4iMVQRpNN9OmHgERuxepqp7SDdJrrHUCXTOs+8K1RTwNqDXTwBjY0
         CPYaunz31eeuh4lZG+eUhW4ywTq+pl1KmupvFSH/ogkdNgsHgYmDQZbWRRWIJR3pApid
         uKeA==
X-Forwarded-Encrypted: i=1; AJvYcCXRsSFeq9+av5xV+4oRZfkLt9NB4Na7vDInr69rwIbG2fxVi+0Lr0PTBSr4u96ymirG1j3Ym+Z0ZvNdMSA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDSukau5dd/D5JTmVMqpYRg+4FqG77HwKc7JD3J0swzaZdlDyw
	Q6cDmHLSV3IKF/TtBLte9Lc9hf5UIMgszwsH2KBX7yh4IqKh0G975GZ438oe6Q==
X-Gm-Gg: ASbGncsEIA7o2K5WgkxY51MjOcrml89LRbPHLExe17iOe/CoCqE4zHFVRBl6mz0uu++
	zqrBuzFVLAvc8BCE09PlJPmGQeByPDCYm8dAMy+wblr8lSIR70R4ZscTCsTG8IR4IvJdNMO3Zi/
	Tsca/l2RYIjw/6PtOEeaOf4kPqzw7wMJUIkgQc5gh0m3N8zuXL/svEpG/QR9OeFvTKQ/fCEQsPZ
	iJ6IeToG/9mpUw2fbZMYhhVPuHyXLJjA5r186xDCirptTxru85qub31DpAk5GPCMtlgfP6FzVqK
	7spo6tR6oh5qpS7KqTss4m6KyfhCUquWq3iepb1w76ipgCr+zGGfAkYPXhT9C0dFKJ4wHjZ0e43
	vvAkn0+G1Iy+/0Q==
X-Google-Smtp-Source: AGHT+IFPC9mL+DlWLaHagO2PQibPE5IAsRnVspZO3QJiVtK+BzyLXCvkMi6qfUPBM+PpkrIO8X/e5g==
X-Received: by 2002:a05:600c:b8c:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-442f4c8fe71mr33161715e9.16.1747240397611;
        Wed, 14 May 2025 09:33:17 -0700 (PDT)
Received: from thinkpad (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951b57sm37447745e9.21.2025.05.14.09.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:33:17 -0700 (PDT)
Date: Wed, 14 May 2025 17:33:15 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <dglc4iqxxrjnbpqazi2xuzdblpcszcdb7q5nlz2ezzzyeujpvc@672myo6djcji>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
 <8006a0ae-b45d-d22f-65a9-20a65f3224b0@oss.qualcomm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8006a0ae-b45d-d22f-65a9-20a65f3224b0@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 14, 2025 at 12:00:11PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 5/8/2025 12:40 PM, Manivannan Sadhasivam wrote:
> > The PCI link, when down, needs to be recovered to bring it back. But that
> > cannot be done in a generic way as link recovery procedure is specific to
> > host bridges. So add a new API pci_host_handle_link_down() that could be
> > called by the host bridge drivers when the link goes down.
> > 
> > The API will iterate through all the slots and calls the pcie_do_recovery()
> > function with 'pci_channel_io_frozen' as the state. This will result in the
> > execution of the AER Fatal error handling code. Since the link down
> > recovery is pretty much the same as AER Fatal error handling,
> > pcie_do_recovery() helper is reused here. First the AER error_detected
> > callback will be triggered for the bridge and the downstream devices. Then,
> > pci_host_reset_slot() will be called for the slot, which will reset the
> > slot using 'reset_slot' callback to recover the link. Once that's done,
> > resume message will be broadcasted to the bridge and the downstream devices
> > indicating successful link recovery.
> > 
> > In case if the AER support is not enabled in the kernel, only
> > pci_bus_error_reset() will be called for each slots as there is no way we
> > could inform the drivers about link recovery.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/pci/controller/pci-host-common.c | 58 ++++++++++++++++++++++++++++++++
> >   drivers/pci/controller/pci-host-common.h |  1 +
> >   drivers/pci/pci.c                        |  1 +
> >   drivers/pci/pcie/err.c                   |  1 +
> >   4 files changed, 61 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> > index f93bc7034e697250711833a5151f7ef177cd62a0..f916f0a874a61ddfbfd99f96975c00fb66dd224c 100644
> > --- a/drivers/pci/controller/pci-host-common.c
> > +++ b/drivers/pci/controller/pci-host-common.c
> > @@ -12,9 +12,11 @@
> >   #include <linux/of.h>
> >   #include <linux/of_address.h>
> >   #include <linux/of_pci.h>
> > +#include <linux/pci.h>
> >   #include <linux/pci-ecam.h>
> >   #include <linux/platform_device.h>
> > +#include "../pci.h"
> >   #include "pci-host-common.h"
> >   static void gen_pci_unmap_cfg(void *ptr)
> > @@ -96,5 +98,61 @@ void pci_host_common_remove(struct platform_device *pdev)
> >   }
> >   EXPORT_SYMBOL_GPL(pci_host_common_remove);
> > +#if IS_ENABLED(CONFIG_PCIEAER)
> > +static pci_ers_result_t pci_host_reset_slot(struct pci_dev *dev)
> > +{
> > +	int ret;
> > +
> > +	ret = pci_bus_error_reset(dev);
> > +	if (ret) {
> > +		pci_err(dev, "Failed to reset slot: %d\n", ret);
> > +		return PCI_ERS_RESULT_DISCONNECT;
> > +	}
> > +
> > +	pci_info(dev, "Slot has been reset\n");
> > +
> > +	return PCI_ERS_RESULT_RECOVERED;
> > +}
> > +
> > +static void pci_host_recover_slots(struct pci_host_bridge *host)
> > +{
> > +	struct pci_bus *bus = host->bus;
> > +	struct pci_dev *dev;
> > +
> > +	for_each_pci_bridge(dev, bus) {
> > +		if (!pci_is_root_bus(bus))
> bus here is always constant here, we may need to have check
> for dev here like if (!pci_is_root_bus(dev->bus))

Good catch! Ammended it while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


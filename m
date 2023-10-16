Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF247CB007
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 18:41:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=j3TPYKUB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8NDN5W8Cz3cCx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 03:41:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=j3TPYKUB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8NCV2Rn5z3c4y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 03:40:52 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-66d09b6d007so31974406d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697474446; x=1698079246; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QMErPVjbDQWKUZJi0yx3PHwgd44uCsmqExmEKyoGenQ=;
        b=j3TPYKUB9FLUhJ2B7W0vT8SulJOgKuBE5A8uj7Z5lEbOwdEfZ/Bd15x/a8NxVvFgmy
         nyVMM3O35k8rdka7/YLEi93WYmUkj3J2teU+mFn3Kt+RWg7xHgDO3dgY7jNbldh7av8H
         TbKc6e+VvSYRI3xW376Vdncl2+ZaAZ1g3TocS1DPOUMs2g8cw9HLRremX9+bDi1JTK9m
         WYZlaLT+msYk4sBsFmtm5UWtDnlkRTUJiCRrOsALPOGLygPhRIoJ/Rf4mQDqGiS+vQG5
         PHN/21a+mxWqYJnSGf67uxskhxYSOxLdS5rfVvF02hp/qRg4X/ordH7eYUqNR/UQvp4A
         5ynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697474446; x=1698079246;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMErPVjbDQWKUZJi0yx3PHwgd44uCsmqExmEKyoGenQ=;
        b=COpLCuURznd5L0GsU9+ZcZ60ws6zIiHlJ/pyhhuxf2wJyhJ+zbudjzjcJeQmJMptJj
         5DKqtmSmwNkJj5HV7oHAJPwMOUf6EX+WJ7sS/eq02EtebAvz2vF9xFAhmSlR45ptnDWl
         fO1Vpea5aA19G3s8PxjcHRtizQ0trAmdnZC7XCJIbtS5uMa4jd/+z3zrvl7mjydkUi2H
         uHL+HJqWSI2KEYfT2kvGEmd/yMBtTK2PiH2VyoeZmvH6ne6skIB8bZlBhzHwe8d2k3rD
         /hkFnxBxbMsVQMKXpVWtnZEJHBL2Qin1Ujbw12aZFBZsBrc+feJM96rDKHopQA7j7OWd
         oaJA==
X-Gm-Message-State: AOJu0YyxTesGlwapSoGOwol62AAMWRSv/Tkr1RzKmIcrvXVPYvpnlbSx
	M+PIK0Cb4gZPF6tdk8efJrdW
X-Google-Smtp-Source: AGHT+IEJrtLsab3W/titRBbEr+F6cON9aYDks19MkUWPWxcQNbAkkCh7gLRrSjOouWXUxCmZiVJgZQ==
X-Received: by 2002:a05:6214:cae:b0:66d:28a5:d153 with SMTP id s14-20020a0562140cae00b0066d28a5d153mr11497866qvs.47.1697474445956;
        Mon, 16 Oct 2023 09:40:45 -0700 (PDT)
Received: from thinkpad ([117.207.31.199])
        by smtp.gmail.com with ESMTPSA id dn8-20020a056214094800b0065b0e724f83sm3548177qvb.6.2023.10.16.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:40:45 -0700 (PDT)
Date: Mon, 16 Oct 2023 22:10:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/3] PCI: layerscape: add function pointer for
 exit_from_l2()
Message-ID: <20231016164036.GE39962@thinkpad>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230915184306.2374670-1-Frank.Li@nxp.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, imx@lists.linux.dev, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 15, 2023 at 02:43:04PM -0400, Frank Li wrote:
> Difference layerscape chip have not difference exit_from_l2() method.
> Using function pointer for ls1028. It prepare for other layerscape
> suspend/resume support.
> 

How about:

Since difference SoCs require different sequence for exiting L2, let's add a
separate "exit_from_l2()" callback. This callback can be used to execute SoC
specific sequence.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-layerscape.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index b931d597656f6..20c48c06e2248 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -39,6 +39,8 @@
>  
>  struct ls_pcie_drvdata {
>  	const u32 pf_off;
> +	const struct dw_pcie_host_ops *ops;

Where is this ops used? If this is added as a preparatory for next patches, I'd
suggest you to move it to the respective one instead to avoid confusion.

> +	void (*exit_from_l2)(struct dw_pcie_rp *pp);
>  	bool pm_support;
>  };
>  
> @@ -180,6 +182,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
>  	.pf_off = 0xc0000,
>  	.pm_support = true,
> +	.exit_from_l2 = ls_pcie_exit_from_l2,
>  };
>  
>  static const struct of_device_id ls_pcie_of_match[] = {
> @@ -213,7 +216,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  	pcie->drvdata = of_device_get_match_data(dev);
>  
>  	pci->dev = dev;
> -	pci->pp.ops = &ls_pcie_host_ops;
> +	pci->pp.ops = pcie->drvdata->ops ? pcie->drvdata->ops : &ls_pcie_host_ops;

This one also.

>  
>  	pcie->pci = pci;
>  
> @@ -251,7 +254,7 @@ static int ls_pcie_resume_noirq(struct device *dev)
>  	if (!pcie->drvdata->pm_support)
>  		return 0;
>  
> -	ls_pcie_exit_from_l2(&pcie->pci->pp);
> +	pcie->drvdata->exit_from_l2(&pcie->pci->pp);

You should always check for the existence of the callback first before invoking
it.

- Mani

>  
>  	return dw_pcie_resume_noirq(pcie->pci);
>  }
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

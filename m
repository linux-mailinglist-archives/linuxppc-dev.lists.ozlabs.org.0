Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2447DF831
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 17:59:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TncAICxe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLqpl1tM0z3ckc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 03:59:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TncAICxe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLqnr1mJQz3cVr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 03:58:21 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3b5714439b3so649707b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 09:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698944299; x=1699549099; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DfyS21pSAaN9Ul5DPXfGOsxbkU+EJCrhzTnYRsGJibU=;
        b=TncAICxeuz4KO+ZiuEFXTDGmDtEg9Go5hq20plVja9WJIRWVTMC0jBBhvDHebaO9fA
         qgsSOfOVBjJUnUzt/sOc0zS0hC6V/tZ44gUHdB5wXhPpNDafdEl7x3Coqjj8jxKEa8RB
         rd62o8eGN+mzOcPSNDPkUyKJwdWK1nm+lr8qiUaXMvcqSFYl86f0xTThv7t1F+52TIyS
         PmSaDMXdN26Pldeitbx1Zb44FpryQJs/SmdjD6DlmZb15jTsbXBaqI/UKpTEPK64Ut1f
         0he1GmrjMrG49I+ou/DJuS+YO/BvG5lnQhyO3hi1azPwrACXA+eBs6TqfwQCScBQVgxc
         q9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698944299; x=1699549099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfyS21pSAaN9Ul5DPXfGOsxbkU+EJCrhzTnYRsGJibU=;
        b=FHPWSmLRy2JvA8U9oRb/HFnXr9OX0E3072u9fY0E1qsVBhT5kW1TikqTVQaEl1gxr+
         0aVgGg5cBQAeX/ndm6cGb2fAVPcUnNKk36GcKka8rinbWP+nXXmhmXG3Z6Mr2p6KTeZD
         x3tjacULwB4nyyJg4iTgNgFtYoWDT2iydTZGVtddl1SmUIveVieKrjhMDKz1F1/TaarJ
         5vCB0YtTzetUSZ+oFSTN21L3jiP2hsZUBbJ6ESqEvTFMhEbPwVeUzaS7p9Tvvvkj3tsI
         mt++qDLTxMrdNxN2Do/vq1kZwW6XhLEivHRPKK6BPnUOF96JZlG3TIfE9HVZH3kzA7UZ
         4x2g==
X-Gm-Message-State: AOJu0YyAsVYdF93uXHOK9KvUrLcxYARA0ucu+eyEKZMx51d5iv0AFtIJ
	07IbsBgk4OYXXIG5pBrQcY0S
X-Google-Smtp-Source: AGHT+IGcPZMPmb6P3crHIYT6MoFFJH19w/pybMCanZfpyJq0eFqq7TsGozYLDzAec+P33O2PTiZXzg==
X-Received: by 2002:a05:6808:209f:b0:3ad:fe8d:dfae with SMTP id s31-20020a056808209f00b003adfe8ddfaemr20056494oiw.57.1698944298897;
        Thu, 02 Nov 2023 09:58:18 -0700 (PDT)
Received: from thinkpad ([117.217.189.228])
        by smtp.gmail.com with ESMTPSA id z26-20020a05620a08da00b0077263636a95sm89742qkz.93.2023.11.02.09.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 09:58:18 -0700 (PDT)
Date: Thu, 2 Nov 2023 22:28:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/4] PCI: layerscape: Add function pointer for
 exit_from_l2()
Message-ID: <20231102165808.GC20943@thinkpad>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
 <20231017193145.3198380-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017193145.3198380-2-Frank.Li@nxp.com>
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 17, 2023 at 03:31:42PM -0400, Frank Li wrote:
> Since difference SoCs require different sequence for exiting L2, let's add
> a separate "exit_from_l2()" callback. This callback can be used to execute
> SoC specific sequence.
> 

I missed the fact that this patch honors the return value of the callback (which
was ignored previously). So this should be added to the description as well.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>

With that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Notes:
>     Change from v2 to v3
>     - fixed according to mani's feedback
>       1. update commit message
>       2. move dw_pcie_host_ops to next patch
>       3. check return value from exit_from_l2()
>     Change from v1 to v2
>     - change subject 'a' to 'A'
>     
>     Change from v1 to v2
>     - change subject 'a' to 'A'
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 37956e09c65bd..aea89926bcc4f 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -39,6 +39,7 @@
>  
>  struct ls_pcie_drvdata {
>  	const u32 pf_off;
> +	int (*exit_from_l2)(struct dw_pcie_rp *pp);
>  	bool pm_support;
>  };
>  
> @@ -125,7 +126,7 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
>  		dev_err(pcie->pci->dev, "PME_Turn_off timeout\n");
>  }
>  
> -static void ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  	struct ls_pcie *pcie = to_ls_pcie(pci);
> @@ -150,6 +151,8 @@ static void ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
>  				 10000);
>  	if (ret)
>  		dev_err(pcie->pci->dev, "L2 exit timeout\n");
> +
> +	return ret;
>  }
>  
>  static int ls_pcie_host_init(struct dw_pcie_rp *pp)
> @@ -180,6 +183,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
>  	.pf_off = 0xc0000,
>  	.pm_support = true,
> +	.exit_from_l2 = ls_pcie_exit_from_l2,
>  };
>  
>  static const struct of_device_id ls_pcie_of_match[] = {
> @@ -247,11 +251,14 @@ static int ls_pcie_suspend_noirq(struct device *dev)
>  static int ls_pcie_resume_noirq(struct device *dev)
>  {
>  	struct ls_pcie *pcie = dev_get_drvdata(dev);
> +	int ret;
>  
>  	if (!pcie->drvdata->pm_support)
>  		return 0;
>  
> -	ls_pcie_exit_from_l2(&pcie->pci->pp);
> +	ret = pcie->drvdata->exit_from_l2(&pcie->pci->pp);
> +	if (ret)
> +		return ret;
>  
>  	return dw_pcie_resume_noirq(pcie->pci);
>  }
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

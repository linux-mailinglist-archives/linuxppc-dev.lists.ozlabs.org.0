Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 328417DF8E3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 18:40:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CEErf7JI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLrjv0M2kz3cW1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 04:40:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CEErf7JI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLrhz1Gx2z3cVr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 04:39:14 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7789577b53fso66239585a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 10:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698946751; x=1699551551; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yE6hYq/1M2NiVA4RY0gsdXB7HPtKFRVy440CKIJ1q9I=;
        b=CEErf7JIV0JXuMUuxlBQ/KeBUYMVscuJC9SRvev3zLZDyY95zrYNp5HMAFEh5AhVxY
         SoxR7vX3oOFjwK7VtB7DELyDmPw1WdtfH+486+bZ3DPTHAXqUgAIwtx/2spZRQLoFHVW
         1f4EB8HuBnyETumyzQDG1yStmwgQB/9nnsv0yQclCDQxSu77V4PNM10/gd5RosZmYN5w
         4h3jkMovNhGURTUZ+o81IWoiuTQbIujXLeyOfMg+sHeE5p4LjWbv2sGEKkTVlu/nYSHE
         DCWOGISIbLH/guzRwd0mvTMJzCn8jTtWzaHe+G7ylbNQ4G8SqzY6q45EL+jerf2RH0i+
         fKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698946751; x=1699551551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yE6hYq/1M2NiVA4RY0gsdXB7HPtKFRVy440CKIJ1q9I=;
        b=ka4+d3w2uxnOV5EZkvVUjLBYaXI8vGl0Nld+m5iehn5BNyXda8z0eVYOGAYe+0OpSW
         iXsm/zGUnXhMKIVYjwyKq+kzCpgVO09+LaKKHiIDRTMnw91HNa1ytgbKGVfr0l2ddkRW
         aLCVDnxTPW0wt5HQS3fj4pPYwG2IHqOiBHNwVcwAYda/453bL0dsoYnckkx0ugqk8Ivs
         DXJQC4ZS7Edzknm0DuCsRysQ2a6BpbC/NJe+sxnITGr3VFhjpRCKxxQEglRqa08yHoHF
         sNNKlR/i85vla4HqdBe0XB9IzwJDQld5p9bkkcPzbw5KsFOF+2xbRovtdqUhr5LgAUfS
         hKgQ==
X-Gm-Message-State: AOJu0YwBBA4QRaG7Pqz3KLYsxX03XHsVZfULul4+fcHzSTpKoPCSbtix
	exrrtNj0gDkGzhTV3Bge0HT4
X-Google-Smtp-Source: AGHT+IGJE7PRlsHRJBiWTBzJ7qskCfmYJqaSK0LlSGhhJCTuiYGeWOKAeIpbrsnv82Z6K6JfC4NtgA==
X-Received: by 2002:a05:620a:2045:b0:779:d143:c1a7 with SMTP id d5-20020a05620a204500b00779d143c1a7mr18609776qka.26.1698946750692;
        Thu, 02 Nov 2023 10:39:10 -0700 (PDT)
Received: from thinkpad ([117.217.189.228])
        by smtp.gmail.com with ESMTPSA id bk2-20020a05620a1a0200b0076e672f535asm127918qkb.57.2023.11.02.10.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 10:39:10 -0700 (PDT)
Date: Thu, 2 Nov 2023 23:09:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 4/4] PCI: layerscape: Add suspend/resume for ls1043a
Message-ID: <20231102173900.GF20943@thinkpad>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
 <20231017193145.3198380-5-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017193145.3198380-5-Frank.Li@nxp.com>
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

On Tue, Oct 17, 2023 at 03:31:45PM -0400, Frank Li wrote:
> ls1043a add suspend/resume support.
> Implement ls1043a_pcie_send_turnoff_msg() to send PME_Turn_Off message.
> Implement ls1043a_pcie_exit_from_l2() to exit from L2 state.
> 

Please use the suggestion I gave in patch 2/4.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v2 to v3
>     - Remove ls_pcie_lut_readl(writel) function
>     
>     Change from v1 to v2
>     - Update subject 'a' to 'A'
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 86 ++++++++++++++++++++-
>  1 file changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 4b663b20d8612..9656224960b0c 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -41,6 +41,15 @@
>  #define SCFG_PEXSFTRSTCR	0x190
>  #define PEXSR(idx)		BIT(idx)
>  
> +/* LS1043A PEX PME control register */
> +#define SCFG_PEXPMECR		0x144
> +#define PEXPME(idx)		BIT(31 - (idx) * 4)
> +
> +/* LS1043A PEX LUT debug register */
> +#define LS_PCIE_LDBG	0x7fc
> +#define LDBG_SR		BIT(30)
> +#define LDBG_WE		BIT(31)
> +
>  #define PCIE_IATU_NUM		6
>  
>  #define LS_PCIE_DRV_SCFG	BIT(0)
> @@ -227,6 +236,68 @@ static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	if (!pcie->scfg) {
> +		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
> +		return;
> +	}

Why scfg is optional for this SoC and not for the other one added in patch 2/4?

> +
> +	/* Send Turn_off message */
> +	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);
> +	val |= PEXPME(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
> +

In my previous review, I asked you to use a common function and just pass the
offsets, as the sequence is same for both the SoCs. But you ignored it :/

> +	/*
> +	 * There is no specific register to check for PME_To_Ack from endpoint.
> +	 * So on the safe side, wait for PCIE_PME_TO_L2_TIMEOUT_US.
> +	 */
> +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> +
> +	/*
> +	 * Layerscape hardware reference manual recommends clearing the PMXMTTURNOFF bit
> +	 * to complete the PME_Turn_Off handshake.
> +	 */
> +	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);
> +	val &= ~PEXPME(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
> +}
> +
> +static int ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	/*
> +	 * Only way let PEX module exit L2 is do a software reset.

Same comment applies as patch 2/4.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

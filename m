Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3844B800221
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 04:31:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gEiIdmJx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShJWS4jjWz3ckk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 14:31:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gEiIdmJx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShJVf3jNyz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 14:30:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 309FDCE118B;
	Fri,  1 Dec 2023 03:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C257C433C8;
	Fri,  1 Dec 2023 03:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701401443;
	bh=jwirEr5+4F46Zwbe3mG+0Zko/WcIUe6i503ufifelCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gEiIdmJx6RpA3BgACWuH5mjB1eR6z1TE5ZvGWVgUfWCu5Cv/1bI41+d3lG1zndu0y
	 tp3wUkGLIhwRyl1f8LDjlvIRDNB355AUK3MTrphTYbiVdzjcdk9wvQ2my895PufIK9
	 vNdr0+SY0XUWDzzxMLbW3fFyUz5dAGidrJmeHvdGN2fnnscUdVrbKJuufnQKEa9+ki
	 JoFMbXRXjF+MfPUwhp4y0ZtKpOZ20cMWGvYz7l9B5NurX9Wh93pX9lVnt3+oolra7+
	 EykL0gJEEaRgPCB3d/IsGJLnlLfLzgggDJmJiU/+ZVMJ2YSo7oUNMKxcqTLOtahqxj
	 qqK6rzmN4I5Wg==
Date: Fri, 1 Dec 2023 09:00:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v4 4/4] PCI: layerscape: Add suspend/resume for ls1043a
Message-ID: <20231201033028.GB2898@thinkpad>
References: <20231129214412.327633-1-Frank.Li@nxp.com>
 <20231129214412.327633-5-Frank.Li@nxp.com>
 <20231130165100.GV3043@thinkpad>
 <ZWjt412xtyZWVjdL@lizhi-Precision-Tower-5810>
 <ZWju9s/HBS7jNTYX@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWju9s/HBS7jNTYX@lizhi-Precision-Tower-5810>
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, bhelgaas@google.com, roy.zang@nxp.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 30, 2023 at 03:22:14PM -0500, Frank Li wrote:
> On Thu, Nov 30, 2023 at 03:17:39PM -0500, Frank Li wrote:
> > On Thu, Nov 30, 2023 at 10:21:00PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Nov 29, 2023 at 04:44:12PM -0500, Frank Li wrote:
> > > > In the suspend path, PME_Turn_Off message is sent to the endpoint to
> > > > transition the link to L2/L3_Ready state. In this SoC, there is no way to
> > > > check if the controller has received the PME_To_Ack from the endpoint or
> > > > not. So to be on the safer side, the driver just waits for
> > > > PCIE_PME_TO_L2_TIMEOUT_US before asserting the SoC specific PMXMTTURNOFF
> > > > bit to complete the PME_Turn_Off handshake. This link would then enter
> > > > L2/L3 state depending on the VAUX supply.
> > > > 
> > > > In the resume path, the link is brought back from L2 to L0 by doing a
> > > > software reset.
> > > > 
> > > 
> > > Same comment on the patch description as on patch 2/4.
> > > 
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > 
> > > > Notes:
> > > >     Change from v3 to v4
> > > >     - Call scfg_pcie_send_turnoff_msg() shared with ls1021a
> > > >     - update commit message
> > > >     
> > > >     Change from v2 to v3
> > > >     - Remove ls_pcie_lut_readl(writel) function
> > > >     
> > > >     Change from v1 to v2
> > > >     - Update subject 'a' to 'A'
> > > > 
> > > >  drivers/pci/controller/dwc/pci-layerscape.c | 63 ++++++++++++++++++++-
> > > >  1 file changed, 62 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > > > index 590e07bb27002..d39700b3afaaa 100644
> > > > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > > > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > > > @@ -41,6 +41,15 @@
> > > >  #define SCFG_PEXSFTRSTCR	0x190
> > > >  #define PEXSR(idx)		BIT(idx)
> > > >  
> > > > +/* LS1043A PEX PME control register */
> > > > +#define SCFG_PEXPMECR		0x144
> > > > +#define PEXPME(idx)		BIT(31 - (idx) * 4)
> > > > +
> > > > +/* LS1043A PEX LUT debug register */
> > > > +#define LS_PCIE_LDBG	0x7fc
> > > > +#define LDBG_SR		BIT(30)
> > > > +#define LDBG_WE		BIT(31)
> > > > +
> > > >  #define PCIE_IATU_NUM		6
> > > >  
> > > >  struct ls_pcie_drvdata {
> > > > @@ -225,6 +234,45 @@ static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> > > >  	return scfg_pcie_exit_from_l2(pcie->scfg, SCFG_PEXSFTRSTCR, PEXSR(pcie->index));
> > > >  }
> > > >  
> > > > +static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> > > > +{
> > > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > > > +
> > > > +	scfg_pcie_send_turnoff_msg(pcie->scfg, SCFG_PEXPMECR, PEXPME(pcie->index));
> > > > +}
> > > > +
> > > > +static int ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> > > > +{
> > > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > > > +	u32 val;
> > > > +
> > > > +	/*
> > > > +	 * Only way let PEX module exit L2 is do a software reset.
> > > 
> > > Can you expand PEX? What is it used for?
> > > 
> > > Also if the reset is only for the PEX module, please use the same comment in
> > > both patches 2 and 4. Patch 2 doesn't mention PEX in the comment.
> > 
> > After read spec again, I think PEX is pci express. So it should software
> > reset controller. I don't know what exactly did in the chip. But without
> > below code, PCIe can't exit L2/L3.
> > 
> > Any harmful if dwc controller reset? Anyway these code works well with
> > intel network card.
> 
> Sorry, sent too quick. It is PCIe express wrapper
> 
> Copy from spec: 
> 
> "PEXLDBG[SR]. Once set the
> PEXLDBG[SR] will enable the soft reset to the PEX wrapper."
> 

Okay. Please use the below comment in both patches 2 and 4:

/* Reset the PEX wrapper to bring the link out of L2 */

- Mani

> Frank
> 
> > 
> > Frank
> > 
> > > 
> > > - Mani
> > > 
> > > > +	 * LDBG_WE: allows the user to have write access to the PEXDBG[SR] for both setting and
> > > > +	 *	    clearing the soft reset on the PEX module.
> > > > +	 * LDBG_SR: When SR is set to 1, the PEX module enters soft reset.
> > > > +	 */
> > > > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > > > +	val |= LDBG_WE;
> > > > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > > > +
> > > > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > > > +	val |= LDBG_SR;
> > > > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > > > +
> > > > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > > > +	val &= ~LDBG_SR;
> > > > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > > > +
> > > > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
> > > > +	val &= ~LDBG_WE;
> > > > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
> > > >  	.host_init = ls_pcie_host_init,
> > > >  	.pme_turn_off = ls_pcie_send_turnoff_msg,
> > > > @@ -242,6 +290,19 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
> > > >  	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
> > > >  };
> > > >  
> > > > +static const struct dw_pcie_host_ops ls1043a_pcie_host_ops = {
> > > > +	.host_init = ls_pcie_host_init,
> > > > +	.pme_turn_off = ls1043a_pcie_send_turnoff_msg,
> > > > +};
> > > > +
> > > > +static const struct ls_pcie_drvdata ls1043a_drvdata = {
> > > > +	.pf_lut_off = 0x10000,
> > > > +	.pm_support = true,
> > > > +	.scfg_support = true,
> > > > +	.ops = &ls1043a_pcie_host_ops,
> > > > +	.exit_from_l2 = ls1043a_pcie_exit_from_l2,
> > > > +};
> > > > +
> > > >  static const struct ls_pcie_drvdata layerscape_drvdata = {
> > > >  	.pf_lut_off = 0xc0000,
> > > >  	.pm_support = true,
> > > > @@ -252,7 +313,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
> > > >  	{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
> > > >  	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
> > > >  	{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
> > > > -	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1021a_drvdata },
> > > > +	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
> > > >  	{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
> > > >  	{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
> > > >  	{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

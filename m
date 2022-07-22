Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9957E798
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 21:43:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LqKbt0YGkz3c6y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 05:43:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rFv0h19M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rFv0h19M;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LqKbD3mvSz2xmr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jul 2022 05:42:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 89B24B827C3;
	Fri, 22 Jul 2022 19:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147FFC341C7;
	Fri, 22 Jul 2022 19:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658518948;
	bh=Fi3NukUa0s7paqp1AppHpb7xH6EkFSvBVVmsZhvKYTk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rFv0h19MGL224aUJD6l6QxUs1iMM8NJAKMFxa+00aGnmLJYSgh6FtethmrthvMVPw
	 wxGbICw6AbhrNccaZqQfSsDZhZM7VlGHfsNWQtIsJE05cjur50XXxk+rJcm1hFkayj
	 i3jlA+LhD/FYT12xHKUWrFuXHTdmR0y+6E0/2huC+/Xh/O5brtkNAviQO8T6U6G2PN
	 RC4PK5HD5iPfMQY5AMXPVln+etO7eiBgag2H+CJfeW6LhLKgjdxD6oByFrR2MYKkUn
	 SV8YbXGLDXefMS60dgecc/W73x79Yg13KuDUWmxpX4ZmZRLL1KJ5SWeUMuCWqZeKWI
	 JRps0I6Yh342A==
Date: Fri, 22 Jul 2022 14:42:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH] powerpc/fsl-pci: Fix Class Code of PCIe Root Port
Message-ID: <20220722194226.GA1927257@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220706101043.4867-1-pali@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 06, 2022 at 12:10:43PM +0200, Pali Rohár wrote:
> By default old pre-3.0 Freescale PCIe controllers reports invalid PCI Class
> Code 0x0b20 for PCIe Root Port. It can be seen by lspci -b output on P2020
> board which has this pre-3.0 controller:
> 
>   $ lspci -bvnn
>   00:00.0 Power PC [0b20]: Freescale Semiconductor Inc P2020E [1957:0070] (rev 21)
>           !!! Invalid class 0b20 for header type 01
>           Capabilities: [4c] Express Root Port (Slot-), MSI 00
> 
> Fix this issue by programming correct PCI Class Code 0x0604 for PCIe Root
> Port to the Freescale specific PCIe register 0x474.
> 
> With this change lspci -b output is:
> 
>   $ lspci -bvnn
>   00:00.0 PCI bridge [0604]: Freescale Semiconductor Inc P2020E [1957:0070] (rev 21) (prog-if 00 [Normal decode])
>           Capabilities: [4c] Express Root Port (Slot-), MSI 00
> 
> Without any "Invalid class" error. So class code was properly reflected
> into standard (read-only) PCI register 0x08.
> 
> Same fix is already implemented in U-Boot pcie_fsl.c driver in commit:
> http://source.denx.de/u-boot/u-boot/-/commit/d18d06ac35229345a0af80977a408cfbe1d1015b
> 
> Fix activated by U-Boot stay active also after booting Linux kernel.
> But boards which use older U-Boot version without that fix are affected and
> still require this fix.
> 
> So implement this class code fix also in kernel fsl_pci.c driver.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Pali Rohár <pali@kernel.org>

I assume the powerpc folks will take care of this.

> ---
>  arch/powerpc/sysdev/fsl_pci.c | 8 ++++++++
>  arch/powerpc/sysdev/fsl_pci.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
> index 1011cfea2e32..bfbb8c8fc9aa 100644
> --- a/arch/powerpc/sysdev/fsl_pci.c
> +++ b/arch/powerpc/sysdev/fsl_pci.c
> @@ -521,6 +521,7 @@ int fsl_add_bridge(struct platform_device *pdev, int is_primary)
>  	struct resource rsrc;
>  	const int *bus_range;
>  	u8 hdr_type, progif;
> +	u32 class_code;
>  	struct device_node *dev;
>  	struct ccsr_pci __iomem *pci;
>  	u16 temp;
> @@ -594,6 +595,13 @@ int fsl_add_bridge(struct platform_device *pdev, int is_primary)
>  			PPC_INDIRECT_TYPE_SURPRESS_PRIMARY_BUS;
>  		if (fsl_pcie_check_link(hose))
>  			hose->indirect_type |= PPC_INDIRECT_TYPE_NO_PCIE_LINK;
> +		/* Fix Class Code to PCI_CLASS_BRIDGE_PCI_NORMAL for pre-3.0 controller */
> +		if (in_be32(&pci->block_rev1) < PCIE_IP_REV_3_0) {
> +			early_read_config_dword(hose, 0, 0, PCIE_FSL_CSR_CLASSCODE, &class_code);
> +			class_code &= 0xff;
> +			class_code |= PCI_CLASS_BRIDGE_PCI_NORMAL << 8;
> +			early_write_config_dword(hose, 0, 0, PCIE_FSL_CSR_CLASSCODE, class_code);
> +		}
>  	} else {
>  		/*
>  		 * Set PBFR(PCI Bus Function Register)[10] = 1 to
> diff --git a/arch/powerpc/sysdev/fsl_pci.h b/arch/powerpc/sysdev/fsl_pci.h
> index cdbde2e0c96e..093a875d7d1e 100644
> --- a/arch/powerpc/sysdev/fsl_pci.h
> +++ b/arch/powerpc/sysdev/fsl_pci.h
> @@ -18,6 +18,7 @@ struct platform_device;
>  
>  #define PCIE_LTSSM	0x0404		/* PCIE Link Training and Status */
>  #define PCIE_LTSSM_L0	0x16		/* L0 state */
> +#define PCIE_FSL_CSR_CLASSCODE	0x474	/* FSL GPEX CSR */
>  #define PCIE_IP_REV_2_2		0x02080202 /* PCIE IP block version Rev2.2 */
>  #define PCIE_IP_REV_3_0		0x02080300 /* PCIE IP block version Rev3.0 */
>  #define PIWAR_EN		0x80000000	/* Enable */
> -- 
> 2.20.1
> 

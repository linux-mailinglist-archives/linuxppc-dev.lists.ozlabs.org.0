Return-Path: <linuxppc-dev+bounces-13908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC71EC3E26C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 02:44:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2hgY1BFgz3bpS;
	Fri,  7 Nov 2025 12:44:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.129.254.108
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762478565;
	cv=none; b=STcfYFSuN5RZl72+cX65XSEtgavREwRDftqbuhF1HtK+hk3z+c8GuRMbAvu7zw+o4ucvHwBnfEnEtUCmPU549t4ciYDYQW8BlwzbWQTu4P34rYRARXFoA20ihNeUwG0bKmLd1X1pQOLeiQcYQLilvwfBnrxXkPq3pFQGzVbznxY65Hn+P5pT3cxy9AEaE6JjtAiz6BnZXrAq16OrlOqqjS8BnU6gaYWdE2T20mbGVt5I9zmkD7VD2oGTf4xAoDDr9eyUNN6oLMmp8mMfaWAksHoS5WcbsQk3dAWdC0OAhBqYqiyMmgxooo4KjfXksdsElRHa7bC8t4ZjLX6iPIe+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762478565; c=relaxed/relaxed;
	bh=8A8ep8E7n+X0a0DoZXauywoLgJblhWU8FJQL9oudYFA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PyS9eqcXvxbKhH7HyoWwE7UavxPxLwwfFPydXMmQ7Sn8dxmK7tXVoQmZZvk/qkkHHswGav954Q9d8iZmntw0bgsK11kmmEBb8R0F4Czg3iVRLdzoJ7IWjBFdMoLloeOnXWE87DSNoEyt4ayV4riZ3vYg/utmL3EmnudSWTh7s/tNuNS62XGeF7sGhcfWIE9jd1q20cpdG9IhWAn2SRc0ofSyS5wJiXw5xaf4VaIs8fVnEJqycn24w3lkao4sFUi3WlHqNbsx8f4WTNix+0crewaBWKN0Tr2gtLrKYM84nfFHT6LhgkY4taLyCRbXKpyZGbR3Nk3atY7lsdFycky9cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=KUVjRVOL; dkim-atps=neutral; spf=pass (client-ip=103.129.254.108; helo=mail-m254108.xmail.ntesmail.com; envelope-from=shawn.lin@rock-chips.com; receiver=lists.ozlabs.org) smtp.mailfrom=rock-chips.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=KUVjRVOL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rock-chips.com (client-ip=103.129.254.108; helo=mail-m254108.xmail.ntesmail.com; envelope-from=shawn.lin@rock-chips.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 321 seconds by postgrey-1.37 at boromir; Fri, 07 Nov 2025 12:22:42 AEDT
Received: from mail-m254108.xmail.ntesmail.com (mail-m254108.xmail.ntesmail.com [103.129.254.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2hBV51Zbz3054
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 12:22:42 +1100 (AEDT)
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 28b3cfc71;
	Fri, 7 Nov 2025 09:17:12 +0800 (GMT+08:00)
Message-ID: <944388a9-1f5d-41e4-8270-ac1fb6cf73e1@rock-chips.com>
Date: Fri, 7 Nov 2025 09:17:09 +0800
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
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Christian Zigotzky <chzigotzky@xenosoft.de>,
 Manivannan Sadhasivam <mani@kernel.org>, mad skateman
 <madskateman@gmail.com>, "R . T . Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lukas Wunner <lukas@wunner.de>, luigi burdo <intermediadc@hotmail.com>,
 Al <al@datazap.net>, Roland <rol7and@gmx.com>,
 Hongxing Zhu <hongxing.zhu@nxp.com>, hypexed@yahoo.com.au,
 linuxppc-dev@lists.ozlabs.org, debian-powerpc@lists.debian.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 1/2] PCI/ASPM: Cache Link Capabilities so quirks can
 override them
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
References: <20251106183643.1963801-1-helgaas@kernel.org>
 <20251106183643.1963801-2-helgaas@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251106183643.1963801-2-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a5be3937d09cckunm278ad679f3d099
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRlPSlZNQkxCSR1CSRpITE5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KUVjRVOLWb2Zc2k0OqE57rreRSmBqvPrNCKecdqaFO1iTsECLdy+wcEDUNh0/g+L+6rD48qRlqZP5E4/NulV8GR/0iU04Vy06CMLfSFp20Vw/MlvxQ3WvnV3uBzXeb860jIeY1fVQxMq0HedO9hTORC9gw/KOZz6OFG415smeI4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=8A8ep8E7n+X0a0DoZXauywoLgJblhWU8FJQL9oudYFA=;
	h=date:mime-version:subject:message-id:from;
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

在 2025/11/07 星期五 2:36, Bjorn Helgaas 写道:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Cache the PCIe Link Capabilities register in struct pci_dev so quirks can
> remove features to avoid hardware defects.  The idea is:
> 
>    - set_pcie_port_type() reads PCIe Link Capabilities and caches it in
>      dev->lnkcap
> 
>    - HEADER quirks can update the cached dev->lnkcap to remove advertised
>      features that don't work correctly
> 
>    - pcie_aspm_cap_init() relies on dev->lnkcap and ignores any features not
>      advertised there
> 

Quick test with a NVMe shows it works.

Before this patch,  lspci -vvv dumps:

  LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
          ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
  LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommClk+


Capabilities: [21c v1] L1 PM Substates
          L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ 
L1_PM_Substates+
                    PortCommonModeRestoreTime=10us PortTPowerOnTime=10us
          L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
                     T_CommonMode=0us LTR1.2_Threshold=26016ns

After this patch + a local quirk patch like your patch 2, it shows:

  LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
          ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
  LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk-

Capabilities: [21c v1] L1 PM Substates
           L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ 
L1_PM_Substates+
                     PortCommonModeRestoreTime=10us PortTPowerOnTime=10us
           L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                      T_CommonMode=0us LTR1.2_Threshold=0ns



One things I noticed is CommClk in LnkCtl is changed. Per the spec,

"A value of 0b indicates that this component and the component at the
opposite end of this Link are operating with asynchronous reference
clock.

Components utilize this Common Clock Configuration information to report
the correct L0s and L1 Exit Latencies. After changing the value in this
bit in both components on a Link, software must trigger the Link to
retrain by writing a 1b to the Retrain Link bit of the Downstream Port."

Obviously my NVMe and RC are operating with common reference clk. So
CommClk- looks wrong to me. And should we also perform Retrain Link if
we really wants to change it?


> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>   drivers/pci/pcie/aspm.c | 42 ++++++++++++++++++++---------------------
>   drivers/pci/probe.c     |  5 ++---
>   include/linux/pci.h     |  1 +
>   3 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 7cc8281e7011..07536891f1f6 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -391,15 +391,13 @@ static void pcie_clkpm_override_default_link_state(struct pcie_link_state *link,
>   static void pcie_clkpm_cap_init(struct pcie_link_state *link, int blacklist)
>   {
>   	int capable = 1, enabled = 1;
> -	u32 reg32;
>   	u16 reg16;
>   	struct pci_dev *child;
>   	struct pci_bus *linkbus = link->pdev->subordinate;
>   
>   	/* All functions should have the same cap and state, take the worst */
>   	list_for_each_entry(child, &linkbus->devices, bus_list) {
> -		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &reg32);
> -		if (!(reg32 & PCI_EXP_LNKCAP_CLKPM)) {
> +		if (!(child->lnkcap & PCI_EXP_LNKCAP_CLKPM)) {
>   			capable = 0;
>   			enabled = 0;
>   			break;
> @@ -581,7 +579,7 @@ static void encode_l12_threshold(u32 threshold_us, u32 *scale, u32 *value)
>   
>   static void pcie_aspm_check_latency(struct pci_dev *endpoint)
>   {
> -	u32 latency, encoding, lnkcap_up, lnkcap_dw;
> +	u32 latency, encoding;
>   	u32 l1_switch_latency = 0, latency_up_l0s;
>   	u32 latency_up_l1, latency_dw_l0s, latency_dw_l1;
>   	u32 acceptable_l0s, acceptable_l1;
> @@ -606,14 +604,10 @@ static void pcie_aspm_check_latency(struct pci_dev *endpoint)
>   		struct pci_dev *dev = pci_function_0(link->pdev->subordinate);
>   
>   		/* Read direction exit latencies */
> -		pcie_capability_read_dword(link->pdev, PCI_EXP_LNKCAP,
> -					   &lnkcap_up);
> -		pcie_capability_read_dword(dev, PCI_EXP_LNKCAP,
> -					   &lnkcap_dw);
> -		latency_up_l0s = calc_l0s_latency(lnkcap_up);
> -		latency_up_l1 = calc_l1_latency(lnkcap_up);
> -		latency_dw_l0s = calc_l0s_latency(lnkcap_dw);
> -		latency_dw_l1 = calc_l1_latency(lnkcap_dw);
> +		latency_up_l0s = calc_l0s_latency(link->pdev->lnkcap);
> +		latency_up_l1 = calc_l1_latency(link->pdev->lnkcap);
> +		latency_dw_l0s = calc_l0s_latency(dev->lnkcap);
> +		latency_dw_l1 = calc_l1_latency(dev->lnkcap);
>   
>   		/* Check upstream direction L0s latency */
>   		if ((link->aspm_capable & PCIE_LINK_STATE_L0S_UP) &&
> @@ -830,7 +824,7 @@ static void pcie_aspm_override_default_link_state(struct pcie_link_state *link)
>   static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
>   {
>   	struct pci_dev *child = link->downstream, *parent = link->pdev;
> -	u32 parent_lnkcap, child_lnkcap;
> +	u32 lnkcap;
>   	u16 parent_lnkctl, child_lnkctl;
>   	struct pci_bus *linkbus = parent->subordinate;
>   
> @@ -845,9 +839,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
>   	 * If ASPM not supported, don't mess with the clocks and link,
>   	 * bail out now.
>   	 */
> -	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
> -	pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
> -	if (!(parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPMS))
> +	if (!(parent->lnkcap & child->lnkcap & PCI_EXP_LNKCAP_ASPMS))
>   		return;
>   
>   	/* Configure common clock before checking latencies */
> @@ -857,10 +849,18 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
>   	 * Re-read upstream/downstream components' register state after
>   	 * clock configuration.  L0s & L1 exit latencies in the otherwise
>   	 * read-only Link Capabilities may change depending on common clock
> -	 * configuration (PCIe r5.0, sec 7.5.3.6).
> +	 * configuration (PCIe r5.0, sec 7.5.3.6).  Update only the exit
> +	 * latencies in the cached dev->lnkcap because quirks may have
> +	 * removed broken features advertised by the device.
>   	 */
> -	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
> -	pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
> +	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &lnkcap);
> +	parent->lnkcap &= ~(PCI_EXP_LNKCAP_L0SEL | PCI_EXP_LNKCAP_L1EL);
> +	parent->lnkcap |= lnkcap & (PCI_EXP_LNKCAP_L0SEL | PCI_EXP_LNKCAP_L1EL);
> +
> +	pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &lnkcap);
> +	child->lnkcap &= ~(PCI_EXP_LNKCAP_L0SEL | PCI_EXP_LNKCAP_L1EL);
> +	child->lnkcap |= lnkcap & (PCI_EXP_LNKCAP_L0SEL | PCI_EXP_LNKCAP_L1EL);
> +
>   	pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &parent_lnkctl);
>   	pcie_capability_read_word(child, PCI_EXP_LNKCTL, &child_lnkctl);
>   
> @@ -880,7 +880,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
>   	 * given link unless components on both sides of the link each
>   	 * support L0s.
>   	 */
> -	if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
> +	if (parent->lnkcap & child->lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
>   		link->aspm_support |= PCIE_LINK_STATE_L0S;
>   
>   	if (child_lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
> @@ -889,7 +889,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
>   		link->aspm_enabled |= PCIE_LINK_STATE_L0S_DW;
>   
>   	/* Setup L1 state */
> -	if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
> +	if (parent->lnkcap & child->lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
>   		link->aspm_support |= PCIE_LINK_STATE_L1;
>   
>   	if (parent_lnkctl & child_lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index c83e75a0ec12..db4635b1ec47 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -1640,7 +1640,6 @@ void set_pcie_port_type(struct pci_dev *pdev)
>   {
>   	int pos;
>   	u16 reg16;
> -	u32 reg32;
>   	int type;
>   	struct pci_dev *parent;
>   
> @@ -1659,8 +1658,8 @@ void set_pcie_port_type(struct pci_dev *pdev)
>   	pci_read_config_dword(pdev, pos + PCI_EXP_DEVCAP, &pdev->devcap);
>   	pdev->pcie_mpss = FIELD_GET(PCI_EXP_DEVCAP_PAYLOAD, pdev->devcap);
>   
> -	pcie_capability_read_dword(pdev, PCI_EXP_LNKCAP, &reg32);
> -	if (reg32 & PCI_EXP_LNKCAP_DLLLARC)
> +	pcie_capability_read_dword(pdev, PCI_EXP_LNKCAP, &pdev->lnkcap);
> +	if (pdev->lnkcap & PCI_EXP_LNKCAP_DLLLARC)
>   		pdev->link_active_reporting = 1;
>   
>   	parent = pci_upstream_bridge(pdev);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index d1fdf81fbe1e..ec4133ae9cae 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -361,6 +361,7 @@ struct pci_dev {
>   	struct pci_dev  *rcec;          /* Associated RCEC device */
>   #endif
>   	u32		devcap;		/* PCIe Device Capabilities */
> +	u32		lnkcap;		/* PCIe Link Capabilities */
>   	u16		rebar_cap;	/* Resizable BAR capability offset */
>   	u8		pcie_cap;	/* PCIe capability offset */
>   	u8		msi_cap;	/* MSI capability offset */



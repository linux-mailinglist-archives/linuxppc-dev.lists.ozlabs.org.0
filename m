Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9518287C1FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 18:16:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bLCoITag;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwYvp2NpRz3vYP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 04:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bLCoITag;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwYv46fRyz3020
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 04:16:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0B278CE1E18;
	Thu, 14 Mar 2024 17:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C6BC433F1;
	Thu, 14 Mar 2024 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710436573;
	bh=L79tdLUwzaaRgRXL97CbprC3UX8xdukYNWJfNJ9rn8Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bLCoITag/SuEtTrsO/sMEjHd4BnWeVtJvXB6210xjO0cdkxYMA8vA1JIb6pEd2Kfy
	 Id8hEuP4GShaNC+PpogaxARWBhxMId5O2Cie8lL7/14MzwoABw+v7vAtpZtvsqvwVm
	 j+7ReyKeR/gEjByLQxpMlRsVYXDEGyGeHFdCK6t+sjpJtjaZP9s/5wAN9lzVmWJr7r
	 pLa+CQidixlNP3GHezj2k/ubGEQYBhmB8PMTnGZbFPbhqQ4aFXAmuJp6RUqrSv3XnA
	 050p8/o022AJfkYOdhHhi7dvoS2VTcsuMhDFAH55Xucdvzdz4Rqw4PKJtaUCOfiv+R
	 zUf5Dv5K5Grxg==
Date: Thu, 14 Mar 2024 12:16:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 2/4] PCI: Generalize TLP Header Log reading
Message-ID: <20240314171611.GA958323@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240206135717.8565-3-ilpo.jarvinen@linux.intel.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, Tony Luck <tony.luck@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-pci@vger.kernel.org, Greg Rose <gvrose8192@gmail.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, linux-efi@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>, Jeff Kirsher <tarbal@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Greg, Jeff -- ancient history, I know, sorry!]

On Tue, Feb 06, 2024 at 03:57:15PM +0200, Ilpo Järvinen wrote:
> Both AER and DPC RP PIO provide TLP Header Log registers (PCIe r6.1
> secs 7.8.4 & 7.9.14) to convey error diagnostics but the struct is
> named after AER as the struct aer_header_log_regs. Also, not all places
> that handle TLP Header Log use the struct and the struct members are
> named individually.
> 
> Generalize the struct name and members, and use it consistently where
> TLP Header Log is being handled so that a pcie_read_tlp_log() helper
> can be easily added.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

> diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> index bd541527c8c7..5fdf37968b2d 100644
> --- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> +++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Copyright(c) 1999 - 2018 Intel Corporation. */
>  
> +#include <linux/aer.h>
>  #include <linux/types.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> @@ -391,22 +392,6 @@ u16 ixgbe_read_pci_cfg_word(struct ixgbe_hw *hw, u32 reg)
>  	return value;
>  }
>  
> -#ifdef CONFIG_PCI_IOV
> -static u32 ixgbe_read_pci_cfg_dword(struct ixgbe_hw *hw, u32 reg)
> -{
> -	struct ixgbe_adapter *adapter = hw->back;
> -	u32 value;
> -
> -	if (ixgbe_removed(hw->hw_addr))
> -		return IXGBE_FAILED_READ_CFG_DWORD;
> -	pci_read_config_dword(adapter->pdev, reg, &value);
> -	if (value == IXGBE_FAILED_READ_CFG_DWORD &&
> -	    ixgbe_check_cfg_remove(hw, adapter->pdev))
> -		return IXGBE_FAILED_READ_CFG_DWORD;
> -	return value;
> -}
> -#endif /* CONFIG_PCI_IOV */
> -
>  void ixgbe_write_pci_cfg_word(struct ixgbe_hw *hw, u32 reg, u16 value)
>  {
>  	struct ixgbe_adapter *adapter = hw->back;
> @@ -11332,8 +11317,8 @@ static pci_ers_result_t ixgbe_io_error_detected(struct pci_dev *pdev,
>  #ifdef CONFIG_PCI_IOV
>  	struct ixgbe_hw *hw = &adapter->hw;
>  	struct pci_dev *bdev, *vfdev;
> -	u32 dw0, dw1, dw2, dw3;
> -	int vf, pos;
> +	struct pcie_tlp_log tlp_log;
> +	int vf, pos, ret;
>  	u16 req_id, pf_func;
>  
>  	if (adapter->hw.mac.type == ixgbe_mac_82598EB ||
> @@ -11351,14 +11336,13 @@ static pci_ers_result_t ixgbe_io_error_detected(struct pci_dev *pdev,
>  	if (!pos)
>  		goto skip_bad_vf_detection;
>  
> -	dw0 = ixgbe_read_pci_cfg_dword(hw, pos + PCI_ERR_HEADER_LOG);
> -	dw1 = ixgbe_read_pci_cfg_dword(hw, pos + PCI_ERR_HEADER_LOG + 4);
> -	dw2 = ixgbe_read_pci_cfg_dword(hw, pos + PCI_ERR_HEADER_LOG + 8);
> -	dw3 = ixgbe_read_pci_cfg_dword(hw, pos + PCI_ERR_HEADER_LOG + 12);
> -	if (ixgbe_removed(hw->hw_addr))
> +	ret = pcie_read_tlp_log(pdev, pos + PCI_ERR_HEADER_LOG, &tlp_log);
> +	if (ret < 0) {
> +		ixgbe_check_cfg_remove(hw, pdev);
>  		goto skip_bad_vf_detection;
> +	}
>  
> -	req_id = dw1 >> 16;
> +	req_id = tlp_log.dw[1] >> 16;
>  	/* On the 82599 if bit 7 of the requestor ID is set then it's a VF */
>  	if (!(req_id & 0x0080))
>  		goto skip_bad_vf_detection;
> @@ -11369,9 +11353,8 @@ static pci_ers_result_t ixgbe_io_error_detected(struct pci_dev *pdev,
>  
>  		vf = FIELD_GET(0x7F, req_id);
>  		e_dev_err("VF %d has caused a PCIe error\n", vf);
> -		e_dev_err("TLP: dw0: %8.8x\tdw1: %8.8x\tdw2: "
> -				"%8.8x\tdw3: %8.8x\n",
> -		dw0, dw1, dw2, dw3);
> +		e_dev_err("TLP: dw0: %8.8x\tdw1: %8.8x\tdw2: %8.8x\tdw3: %8.8x\n",
> +			  tlp_log.dw[0], tlp_log.dw[1], tlp_log.dw[2], tlp_log.dw[3]);
>  		switch (adapter->hw.mac.type) {
>  		case ixgbe_mac_82599EB:
>  			device_id = IXGBE_82599_VF_DEVICE_ID;

The rest of this patch is headed for v6.10, but I dropped this ixgbe
change for now.

These TLP Log registers are generic, not device-specific, and if
there's something lacking in the PCI core that leads to ixgbe reading
and dumping them itself, I'd rather improve the PCI core so all
drivers will benefit without having to add code like this.

83c61fa97a7d ("ixgbe: Add protection from VF invalid target DMA") [1]
added the ixgbe TLP Log dumping way back in v3.2 (2012).  It does do
some device-specific VF checking and so on, but even back then, it
looks like the PCI core would have dumped the log itself [2], so I
don't know why we needed the extra dumping in ixgbe.

So what I'd really like is to remove the TLP Log reading and printing
from ixgbe completely, but keep the VF checking.

Bjorn

[1] https://git.kernel.org/linus/83c61fa97a7d
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/pcie/aer/aerdrv_errprint.c?id=83c61fa97a7d#n181

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 373408873F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 20:30:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GI4W6i26;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1XVj6nnVz3vxW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 06:30:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GI4W6i26;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1XV149ZXz3vZh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 06:30:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EF8261491;
	Fri, 22 Mar 2024 19:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D41C433F1;
	Fri, 22 Mar 2024 19:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711135813;
	bh=9R6ki8LkQLAWyMMmV+81/0KXBdxdkaUt91oUyJxHRXQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GI4W6i26GH4YKoxcLI7lQ8yf1CYz3gnsVS5q/50obT5c+RAjHWdIx+1+1fcYFuMSK
	 z7tq2Hy8gsByyk1C6HLUmIdEjEMjPlAEd5SPyoRNSsS1HUrAS8NtMtMQaTjVj8XtIP
	 GfI5wwIhfK2ZdvFH8yfESIP4RXcrOtJGRVvTmGJafpDdRsj5RvAbXWu2XtvMvItr/Z
	 Zoq9QazCmln///YbTsHQqQmawt8pLZ8s+57149iivVTAWIDAH/W5Cm1wZubwMH+tEE
	 0i08O00EIoJelk5Ubc024aZSDXEmpIUnVRa35wSfyaEC/x0wB3d6Rabg6Z8TigwMBO
	 GVbz6krwT5hCg==
Date: Fri, 22 Mar 2024 14:30:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 3/4] PCI: Add TLP Prefix reading into pcie_read_tlp_log()
Message-ID: <20240322193011.GA701027@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240206135717.8565-4-ilpo.jarvinen@linux.intel.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linux-efi@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Ard Biesheuvel <ardb@kernel.org>, linux-pci@vger.kernel.org, Jesse Brandeburg <jesse.brandeburg@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>, Jakub Kicinski <kuba@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, intel-wired-lan@lists.osuosl.org, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 06, 2024 at 03:57:16PM +0200, Ilpo Järvinen wrote:
> pcie_read_tlp_log() handles only 4 TLP Header Log DWORDs but TLP Prefix
> Log (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.

s/TLP Header Log/Header Log/ to match spec terminology (also below)

> Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
> TLP Prefix Log. The layout of relevant registers in AER and DPC
> Capability is not identical but the offsets of TLP Header Log and TLP
> Prefix Log vary so the callers must pass the offsets to
> pcie_read_tlp_log().

s/is not identical but/is identical, but/ ?

The spec is a little obtuse about Header Log Size.

> Convert eetlp_prefix_path into integer called eetlp_prefix_max and
> make is available also when CONFIG_PCI_PASID is not configured to
> be able to determine the number of E-E Prefixes.

I think this eetlp_prefix_path piece is right, but would be nice in a
separate patch since it's a little bit different piece to review.

> +++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> @@ -11336,7 +11336,9 @@ static pci_ers_result_t ixgbe_io_error_detected(struct pci_dev *pdev,
>  	if (!pos)
>  		goto skip_bad_vf_detection;
>  
> -	ret = pcie_read_tlp_log(pdev, pos + PCI_ERR_HEADER_LOG, &tlp_log);
> +	ret = pcie_read_tlp_log(pdev, pos + PCI_ERR_HEADER_LOG,
> +				pos + PCI_ERR_PREFIX_LOG,
> +				aer_tlp_log_len(pdev), &tlp_log);
>  	if (ret < 0) {
>  		ixgbe_check_cfg_remove(hw, pdev);
>  		goto skip_bad_vf_detection;

We applied the patch to export pcie_read_tlp_log(), but I'm having
second thoughts about it.   I don't think drivers really have any
business here, and I'd rather not expose either pcie_read_tlp_log() or
aer_tlp_log_len().

This part of ixgbe_io_error_detected() was added by 83c61fa97a7d
("ixgbe: Add protection from VF invalid target DMA"), and to me it
looks like debug code that probably doesn't need to be there as long
as the PCI core does the appropriate logging.

Bjorn

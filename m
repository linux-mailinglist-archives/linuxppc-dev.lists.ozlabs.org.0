Return-Path: <linuxppc-dev+bounces-11587-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 849A1B3E983
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 17:20:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFsyT1Y3Bz2yyd;
	Tue,  2 Sep 2025 01:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756740049;
	cv=none; b=WM+rYSPz9gepIOyBELfOjOQG28LCczz8/vpq47+OdQRad3HXrUg5wd2uEf2TvdUkDP1Nio8n4KvseLlyvB+Fqe2gR7mnAIPQl/twiMoJFg4smuFGXU1mC8CJsqz0Fr6KEbKCBTbPOA29hkcN+/AsaI+F5GQxSEploM3yMEsE+74Qaz6PFDLDhQHvI2HkdZtha8kvVB3Wu2vV1Qd9kr1+K2icmc9V/RfftUPtkkrAw2wiwMzMXP32y/MMZ+ZIlck0eJp1KP2AjgH+dqFq6DJ7scCqyGeDlaKljHBEuA5AQcdiyk6GI2PI2mVMnBVPcGqDTekuIAl4ix94mxhKRmVHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756740049; c=relaxed/relaxed;
	bh=2LqjPAB7Ku8Lk+IULWjS6Lm6Ja7JN/J4MPMuUDVR0dY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=S70mCfAXMbNh25P16gC6z9IH735k7rnnh9tdcbEcCFyEl2G1Q6VRvqv3+UCjFz0UhJqNfrwS3PxJIVEhiJ6PSCgYOsBeiIO7VfBdWGLkyaw7PIg5jKK68RQyyKnlkO5TnfwlTO3tD2SmzoRGyankGPTf06kdBr3/feiUKMtaowpylms/fKDZNMIkU/U4NUJsAtcv8x6D2AU00E2CkS0MXJqd89TmMC5UuzcXKKkTV41bX9JrRWa5o4KrgemIuJj43BijTSJcdt+UT5kboiXkx2k9u1Jq92S8l+7Y2ph/JDcup92uMYnqKFIq4J0/j2lJwY+yX6A9HYyKkGFAKMD6Mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CGIvI9AR; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CGIvI9AR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFsyS31yFz2yxN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 01:20:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1BCE60010;
	Mon,  1 Sep 2025 15:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660E4C4CEF0;
	Mon,  1 Sep 2025 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756740045;
	bh=mel0sP1S1UZU3Xkn/7UnF8o+gUk0oxpwGtXR4J6IJ+g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=CGIvI9ARWQzSHMZs2628PIHsARqcZ9TczW4GcSf5zDL6rEtTv0g4j6awo17XMxCj1
	 iT1xMU9XmJooZfUaxeCb+vOZYlqWVzvzIrEVIOoTc+ygUNxgKJ/B/hqxWsyK9VLo8h
	 fyeslylBNNzUag6aXyfLRwQriWt2lMJ6bzbTGEGLI9uPIVrT4cdVhtOrK65HDGo3fs
	 E7TIEeshmA1iShgtkpHVJbGS9SrDzVpx/zn/0OzsvWor5814LHYUjRisOljUK2M6rh
	 Hf4QL0bP5G3b0RDnOLXnU9aims+hwKKYSrUHap4pwocxBTDY1U3VlVHbrNGyiKGl1P
	 SvDVUWDensJ3w==
Date: Mon, 1 Sep 2025 10:20:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI/AER: Print TLP Log for errors introduced since PCIe
 r1.1
Message-ID: <20250901152044.GA1114640@bhelgaas>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f707caf1260bd8f15012bb032f7da9a9b898aba.1756712066.git.lukas@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 01, 2025 at 09:44:52AM +0200, Lukas Wunner wrote:
> When reporting an error, the AER driver prints the TLP Header / Prefix Log
> only for errors enumerated in the AER_LOG_TLP_MASKS macro.
> 
> The macro was never amended since its introduction in 2006 with commit
> 6c2b374d7485 ("PCI-Express AER implemetation: AER core and aerdriver").
> At the time, PCIe r1.1 was the latest spec revision.
> 
> Amend the macro with errors defined since then to avoid omitting the TLP
> Header / Prefix Log for newer errors.
> 
> The order of the errors in AER_LOG_TLP_MASKS follows PCIe r1.1 sec 6.2.7
> rather than 7.10.2, because only the former documents for which errors a
> TLP Header / Prefix is logged.  Retain this order.  The section number is
> still 6.2.7 in today's PCIe r7.0.
> 
> For Completion Timeouts, the TLP Header / Prefix is only logged if the
> Completion Timeout Prefix / Header Log Capable bit is set in the AER
> Capabilities and Control register.  Introduce a tlp_header_logged() helper
> to check whether the TLP Header / Prefix Log is populated and use it in
> the two places which currently match against AER_LOG_TLP_MASKS directly.
> 
> For Uncorrectable Internal Errors, logging of the TLP Header / Prefix is
> optional per PCIe r7.0 sec 6.2.7.  If needed, drivers could indicate
> through a flag whether devices are capable and tlp_header_logged() could
> then check that flag.
> 
> pcitools introduced macros for newer errors with commit 144b0911cc0b
> ("ls-ecaps: extend decode support for more fields for AER CE and UE
> status"):
>   https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/commit/?id=144b0911cc0b
> 
> Unfortunately some of those macros are overly long:
>   PCI_ERR_UNC_POISONED_TLP_EGRESS
>   PCI_ERR_UNC_DMWR_REQ_EGRESS_BLOCKED
>   PCI_ERR_UNC_IDE_CHECK
>   PCI_ERR_UNC_MISR_IDE_TLP
>   PCI_ERR_UNC_PCRC_CHECK
>   PCI_ERR_UNC_TLP_XLAT_EGRESS_BLOCKED
> 
> This seems unsuitable for <linux/pci_regs.h>, so shorten to:
>   PCI_ERR_UNC_POISON_BLK
>   PCI_ERR_UNC_DMWR_BLK
>   PCI_ERR_UNC_IDE_CHECK
>   PCI_ERR_UNC_MISR_IDE
>   PCI_ERR_UNC_PCRC_CHECK
>   PCI_ERR_UNC_XLAT_BLK
> 
> Note that some of the existing macros in <linux/pci_regs.h> do not match
> exactly with pcitools (e.g. PCI_ERR_UNC_SDES versus PCI_ERR_UNC_SURPDN),
> so it does not seem mandatory for them to be identical.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Applied to pci/aer for v6.18, thanks, Lukas!

> ---
>  drivers/pci/pcie/aer.c        | 30 +++++++++++++++++++++++++++---
>  include/uapi/linux/pci_regs.h |  8 ++++++++
>  2 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 15ed541..62c74b5 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -96,11 +96,21 @@ struct aer_info {
>  };
>  
>  #define AER_LOG_TLP_MASKS		(PCI_ERR_UNC_POISON_TLP|	\
> +					PCI_ERR_UNC_POISON_BLK |	\
>  					PCI_ERR_UNC_ECRC|		\
>  					PCI_ERR_UNC_UNSUP|		\
>  					PCI_ERR_UNC_COMP_ABORT|		\
>  					PCI_ERR_UNC_UNX_COMP|		\
> -					PCI_ERR_UNC_MALF_TLP)
> +					PCI_ERR_UNC_ACSV |		\
> +					PCI_ERR_UNC_MCBTLP |		\
> +					PCI_ERR_UNC_ATOMEG |		\
> +					PCI_ERR_UNC_DMWR_BLK |		\
> +					PCI_ERR_UNC_XLAT_BLK |		\
> +					PCI_ERR_UNC_TLPPRE |		\
> +					PCI_ERR_UNC_MALF_TLP |		\
> +					PCI_ERR_UNC_IDE_CHECK |		\
> +					PCI_ERR_UNC_MISR_IDE |		\
> +					PCI_ERR_UNC_PCRC_CHECK)
>  
>  #define SYSTEM_ERROR_INTR_ON_MESG_MASK	(PCI_EXP_RTCTL_SECEE|	\
>  					PCI_EXP_RTCTL_SENFEE|	\
> @@ -796,6 +806,20 @@ static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
>  	}
>  }
>  
> +static bool tlp_header_logged(u32 status, u32 capctl)
> +{
> +	/* Errors for which a header is always logged (PCIe r7.0 sec 6.2.7) */
> +	if (status & AER_LOG_TLP_MASKS)
> +		return true;
> +
> +	/* Completion Timeout header is only logged on capable devices */
> +	if (status & PCI_ERR_UNC_COMP_TIME &&
> +	    capctl & PCI_ERR_CAP_COMP_TIME_LOG)
> +		return true;
> +
> +	return false;
> +}
> +
>  static void __aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  {
>  	const char **strings;
> @@ -910,7 +934,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
>  		status = aer->uncor_status;
>  		mask = aer->uncor_mask;
>  		info.level = KERN_ERR;
> -		tlp_header_valid = status & AER_LOG_TLP_MASKS;
> +		tlp_header_valid = tlp_header_logged(status, aer->cap_control);
>  	}
>  
>  	info.status = status;
> @@ -1401,7 +1425,7 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
>  		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &aercc);
>  		info->first_error = PCI_ERR_CAP_FEP(aercc);
>  
> -		if (info->status & AER_LOG_TLP_MASKS) {
> +		if (tlp_header_logged(info->status, aercc)) {
>  			info->tlp_header_valid = 1;
>  			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
>  					  aer + PCI_ERR_PREFIX_LOG,
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index f5b1774..d2e1bbb 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -776,6 +776,13 @@
>  #define  PCI_ERR_UNC_MCBTLP	0x00800000	/* MC blocked TLP */
>  #define  PCI_ERR_UNC_ATOMEG	0x01000000	/* Atomic egress blocked */
>  #define  PCI_ERR_UNC_TLPPRE	0x02000000	/* TLP prefix blocked */
> +#define  PCI_ERR_UNC_POISON_BLK	0x04000000	/* Poisoned TLP Egress Blocked */
> +#define  PCI_ERR_UNC_DMWR_BLK	0x08000000	/* DMWr Request Egress Blocked */
> +#define  PCI_ERR_UNC_IDE_CHECK	0x10000000	/* IDE Check Failed */
> +#define  PCI_ERR_UNC_MISR_IDE	0x20000000	/* Misrouted IDE TLP */
> +#define  PCI_ERR_UNC_PCRC_CHECK	0x40000000	/* PCRC Check Failed */
> +#define  PCI_ERR_UNC_XLAT_BLK	0x80000000	/* TLP Translation Egress Blocked */
> +
>  #define PCI_ERR_UNCOR_MASK	0x08	/* Uncorrectable Error Mask */
>  	/* Same bits as above */
>  #define PCI_ERR_UNCOR_SEVER	0x0c	/* Uncorrectable Error Severity */
> @@ -798,6 +805,7 @@
>  #define  PCI_ERR_CAP_ECRC_CHKC		0x00000080 /* ECRC Check Capable */
>  #define  PCI_ERR_CAP_ECRC_CHKE		0x00000100 /* ECRC Check Enable */
>  #define  PCI_ERR_CAP_PREFIX_LOG_PRESENT	0x00000800 /* TLP Prefix Log Present */
> +#define  PCI_ERR_CAP_COMP_TIME_LOG	0x00001000 /* Completion Timeout Prefix/Header Log Capable */
>  #define  PCI_ERR_CAP_TLP_LOG_FLIT	0x00040000 /* TLP was logged in Flit Mode */
>  #define  PCI_ERR_CAP_TLP_LOG_SIZE	0x00f80000 /* Logged TLP Size (only in Flit mode) */
>  #define PCI_ERR_HEADER_LOG	0x1c	/* Header Log Register (16 bytes) */
> -- 
> 2.50.1
> 


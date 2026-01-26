Return-Path: <linuxppc-dev+bounces-16293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FIILIq1d2nKkQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 19:42:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D155E8C2A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 19:42:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0HT32K5Pz2yGM;
	Tue, 27 Jan 2026 05:42:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769452935;
	cv=none; b=f/jpDQ+E7lR50K8UK7sU/sgivFBEvJ+xzueX4NwaxdByoEBVYAGuEm83ZXE0wxBlEyARZAY9WCCq0PDw7FD3QQAVwgnA+vXxzGY+IRj9xO6bM1u+T8Fi3HUOWM7PMe/TCxyPH8q8XFlQqnAYDHlFcUSkO/zNTt2wJ2APV/qdno7NJoH8OGc3MabG/w+TQcQHqfALUSdvOYZHrgbaIavaS1CyFmg9rIbel71jHmschNqH2Bbe1mRfk6+sqqjOZO0PUe/mWLWAwPHVz9um6cfKz+yhmZmC+ylf21aeaZTUmhR/LB3P8f7LdWJgs2NwaW3O8CNgvFVcdAHuMlqg67XWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769452935; c=relaxed/relaxed;
	bh=BcHNaZ/Gy2W5nM2nKDGDrxezkK9bTYkxrKOHRplgu8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTnNlzswTFfZWnCrfu4325buNdiisdDs/htXqwg2E1xN1iVhHuU4ksPqfGNvuxTzVoIAOBZeLnLJNKa3CR5fCTcv6NsDaaiIM685Tpsb+gLfjGPyj3dNC6zjNKPsw5C46B+Zm0hgZPf0EWu3F5D/jVMYtmkSNpHkVRu7LecMTPxIpdSshR1pbshGw/D5yzbQXf+XnMKILJKkaJmOxFrLZeNe+ytA83xQl/5dU1rnlLTSi/1tDz3gqnMR9U1lwU24kHQU9CRx/Ag/sS0o7M015+kGf+3lZbGxBgt+7PV3n+EAbRIovIwz/A46aS+mYhPJ1cNNkpqB7ntcUDUlgJWjsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A270OO1L; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A270OO1L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0HT025wbz2xqD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 05:42:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769452933; x=1800988933;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aS9CbmgY+AE+YomBTccWVmA0YpzUUIeFUkHHsdJIMz0=;
  b=A270OO1LCxuBhKpuahGOQ0D69CSx3WjP/82S7TPd6soD9tV0HMPfoe7h
   KAFalz2zH8gv0IHm07uO0j4rb7Ich9vDlBGaESFt2uIzj7d7L7CIj3BpX
   mdv6aj40X8pand968htK6o7rtYTniwIGsHFH5NuPeIfG2q7c7/TrAWQrT
   bXUyqpi0/BONF9nF1HRqMRtyaJ1ZSFodepzEWA1+S+z3pTQCqgD7Ucjsp
   EQ0pGGEnbLcZVpQ15Df6qNN/01JyB0keCrC3sIZPQnJae3FK3daM9A7KF
   dXnAukrGGiNmDbIn3xricYicb4iKNYk+LnQidlBHXgEvmgqtnfj6zoIUP
   g==;
X-CSE-ConnectionGUID: Ad46UQvRRnSeopoMlSrigg==
X-CSE-MsgGUID: 1iXLM6sDTISQZr6vfklmbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70351469"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70351469"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 10:42:08 -0800
X-CSE-ConnectionGUID: EFde78KTRz6/CeyOU2w2Pg==
X-CSE-MsgGUID: v60C9EKQQLG3CEucScpJSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207629537"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.81.126]) ([10.24.81.126])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 10:42:07 -0800
Message-ID: <06fcb922-458c-473c-999a-1dd8518976f1@linux.intel.com>
Date: Mon, 26 Jan 2026 10:42:06 -0800
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
Subject: Re: [PATCH] PCI/AER: Clear stale errors on reporting agents upon
 probe
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Terry Bowman <terry.bowman@amd.com>, linux-pci@vger.kernel.org,
 Shuai Xue <xueshuai@linux.alibaba.com>, tianruidong@linux.alibaba.com,
 Keith Busch <kbusch@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <3011c2ed30c11f858e35e29939add754adea7478.1769332702.git.lukas@wunner.de>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <3011c2ed30c11f858e35e29939add754adea7478.1769332702.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16293-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:helgaas@kernel.org,m:terry.bowman@amd.com,m:linux-pci@vger.kernel.org,m:xueshuai@linux.alibaba.com,m:tianruidong@linux.alibaba.com,m:kbusch@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sathyanarayanan.kuppuswamy@linux.intel.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,vger.kernel.org,linux.alibaba.com,kernel.org,linux.ibm.com,gmail.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sathyanarayanan.kuppuswamy@linux.intel.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,wunner.de:email,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: D155E8C2A3
X-Rspamd-Action: no action



On 1/25/2026 1:25 AM, Lukas Wunner wrote:
> Correctable and Uncorrectable Error Status Registers on reporting agents
> are cleared upon PCI device enumeration in pci_aer_init() to flush past
> events.  They're cleared again when an error is handled by the AER driver.
> 
> If an agent reports a new error after pci_aer_init() and before the AER
> driver has probed on the corresponding Root Port or Root Complex Event
> Collector, that error is not handled by the AER driver:  It clears the
> Root Error Status Register on probe, but neglects to re-clear the
> Correctable and Uncorrectable Error Status Registers on reporting agents.
> 
> The error will eventually be reported when another error occurs.  Which
> is irritating because to an end user it appears as if the earlier error
> has just happened.
> 
> Amend the AER driver to clear stale errors on reporting agents upon probe.
> 
> Skip reporting agents which have not invoked pci_aer_init() yet to avoid
> using an uninitialized pdev->aer_cap.  They're recognizable by the error
> bits in the Device Control register still being clear.
> 
> Reporting agents may execute pci_aer_init() after the AER driver has
> probed, particularly when devices are hotplugged or removed/rescanned via
> sysfs.  For this reason, it continues to be necessary that pci_aer_init()
> clears Correctable and Uncorrectable Error Status Registers.
> 

Can you include details about where and in what configuration you observed 
this issue?

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>


> Reported-by: Lucas Van <lucas.van@intel.com> # off-list
> Tested-by: Lucas Van <lucas.van@intel.com>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  drivers/pci/pcie/aer.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e0bcaa8..4299c55 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1608,6 +1608,20 @@ static void aer_disable_irq(struct pci_dev *pdev)
>  	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
>  }
>  
> +static int clear_status_iter(struct pci_dev *dev, void *data)
> +{
> +	u16 devctl;
> +
> +	/* Skip if pci_enable_pcie_error_reporting() hasn't been called yet */
> +	pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &devctl);
> +	if (!(devctl & PCI_EXP_AER_FLAGS))
> +		return 0;
> +
> +	pci_aer_clear_status(dev);
> +	pcie_clear_device_status(dev);

Should pci_aer_init() also clear device status along with uncor/cor error status?

> +	return 0;
> +}
> +
>  /**
>   * aer_enable_rootport - enable Root Port's interrupts when receiving messages
>   * @rpc: pointer to a Root Port data structure
> @@ -1629,9 +1643,19 @@ static void aer_enable_rootport(struct aer_rpc *rpc)
>  	pcie_capability_clear_word(pdev, PCI_EXP_RTCTL,
>  				   SYSTEM_ERROR_INTR_ON_MESG_MASK);
>  
> -	/* Clear error status */
> +	/* Clear error status of this Root Port or RCEC */
>  	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
>  	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, reg32);
> +
> +	/* Clear error status of agents reporting to this Root Port or RCEC */
> +	if (reg32 & AER_ERR_STATUS_MASK) {
> +		if (pci_pcie_type(pdev) == PCI_EXP_TYPE_RC_EC)
> +			pcie_walk_rcec(pdev, clear_status_iter, NULL);
> +		else if (pdev->subordinate)
> +			pci_walk_bus(pdev->subordinate, clear_status_iter,
> +				     NULL);
> +	}
> +
>  	pci_read_config_dword(pdev, aer + PCI_ERR_COR_STATUS, &reg32);
>  	pci_write_config_dword(pdev, aer + PCI_ERR_COR_STATUS, reg32);
>  	pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer



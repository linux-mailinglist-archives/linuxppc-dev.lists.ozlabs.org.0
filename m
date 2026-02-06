Return-Path: <linuxppc-dev+bounces-16704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAL/KBNqhmnwMwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 23:24:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4861B103C07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 23:24:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f77t32N5zz2xqf;
	Sat, 07 Feb 2026 09:24:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770416651;
	cv=none; b=Q7W3mNBql1oEa1X7AbG1J1YUoqJORmy/ICDoTyWvLaZM1J7b0GBQXj9A0DOclh0LAanQZ7MjJGl8WkJQtoOTd6ELncelHersbp1s0xEgW1C8wvv7epiGzBnNOLCpAmWb2KLxfmK5KytroOH7ibrb/+g+UL5FMV/9rcspsQ/llZq+D/rY4Rv8N3o9s9Fz+s20lEBKSESBehexs2Ph6/mg/+AkFwxRbvq9keAVfEOEG3Lz9J17qKTLRyO1LOPPQBXgrknWvqedJtsgYYBzXXbPx+nJJhTk1BPilpzduS/focDx8YzQstMqeTpm16YNnXmvM5LRWrvMeFjI27YWSJ18ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770416651; c=relaxed/relaxed;
	bh=Iw5vGzhjZSuChncBaA1r5YNJTlJTBDAligt9ZVwNebc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HHyC/as6Wu2jCy+nOr/Arho2OBM57KFTYHwbz5WhgnL72OVrZTE3AsykSrBN2+Ox/YgGHJZrlei6O83AUnMRNHbMlCYwjPudhzkmJFtI7xNB4Aa3XEchvqNFN9kI3DLWsP7f88jLy+W56cCv9CjkUvx441laPB56+inww8C1CQ0Zqi9bsS/RBs8HF9Ejj7k2qWcsAt5DPd4iypFjd/8LtWeTy1KAbh6FrMjyKZM7EYMYUwduaq+fOXIwrvp3zKiIa88PcGPAlMB5saFEpJ75q+WaAJf6uq4AztbO1MdYWaomKcCZpGtAnfO4qgx525TmPrjTC0yAQSXKfaaH6aQklA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cyEp62e5; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cyEp62e5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f77t15rcMz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 09:24:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3196D600CB;
	Fri,  6 Feb 2026 22:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0B3C16AAE;
	Fri,  6 Feb 2026 22:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770416641;
	bh=/gcXJR6AGzVHtK/vHkRsCaXAoRL9J1/Jv1DLWpmo6Zk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cyEp62e5q0g0Raus/8z18xP8eTHaoq2UEaQesBdrKTQBUxBDo+W3CZqJzrxvbrLao
	 C+MQFng7GvYzae42lr21tU0pIij01SYZSiJxbWCQVC7/ETfQgjcsvsxq9YILZADDLx
	 e7nqkrlfScVdBlKyb8iBetaUDeKLZoEFhLTpzRtcMCD/8k2LLAPu8bms4bizJr7ELw
	 PLZa1khrY8KadxmvrpFAgcqSWpVv9ketLLCMBo7egfDSOJs5owIVqPYPYYZbplLF2h
	 +5lfArFAMr7yA8yd+O1v9IGihIj94/VHAap8srxpb4JVvUErJXkxlu9LHPIqlVoStz
	 cn02/W89SkP+A==
Date: Fri, 6 Feb 2026 16:24:00 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Terry Bowman <terry.bowman@amd.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-pci@vger.kernel.org, Shuai Xue <xueshuai@linux.alibaba.com>,
	tianruidong@linux.alibaba.com, Keith Busch <kbusch@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] PCI/AER: Clear stale errors on reporting agents upon
 probe
Message-ID: <20260206222400.GA98495@bhelgaas>
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
In-Reply-To: <3011c2ed30c11f858e35e29939add754adea7478.1769332702.git.lukas@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16704-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:terry.bowman@amd.com,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:linux-pci@vger.kernel.org,m:xueshuai@linux.alibaba.com,m:tianruidong@linux.alibaba.com,m:kbusch@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,linux.intel.com,vger.kernel.org,linux.alibaba.com,kernel.org,linux.ibm.com,gmail.com,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4861B103C07
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 10:25:51AM +0100, Lukas Wunner wrote:
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
> Reported-by: Lucas Van <lucas.van@intel.com> # off-list
> Tested-by: Lucas Van <lucas.van@intel.com>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Applied to pci/aer for v6.20, thanks!

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
> -- 
> 2.51.0
> 


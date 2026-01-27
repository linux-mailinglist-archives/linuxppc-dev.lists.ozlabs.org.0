Return-Path: <linuxppc-dev+bounces-16308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPA6K1GSeGmxrAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 11:24:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676D92BE3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 11:24:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0hMx3BBHz309N;
	Tue, 27 Jan 2026 21:24:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769509453;
	cv=none; b=O8Tc+U4E0HutoDfOdvT9viwB4DaYGHgA/70H/xG/aRdu1oUnBq5XO96NLXvi4zCVP1lN1t6IGo5TcoqJMLkhv41yvSfjz/x9zyFWPmS0og7YF8jMBVqqtSulNT2TjG12EnUvPZkeJY86Ve7tJsqul3TH8aLvZ9jkab/7jK/sqHSt5nUD2d753aP90k31gi5IS6tC0P1hWI73Its28nDgOqrtCeUucpWMUVMl/uePyJH1EHMyh7SpPNUjfIs/XcrpwP1F9sOtn4kYELkFePllwi1VYHMCtDu/SAnar3xkOmPjH2nz5I3Vo8ZjzSNjc2tpI1eYThejkjkH2C2pmS1/lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769509453; c=relaxed/relaxed;
	bh=v4I3ZUxmKR167h9fBaJPRxK4bqvZ45uvMb93ITr7N3E=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g6BTaJHKH5HGIhJd6EH0P7/szBjkP70Qvgk/VU6lEzkXUK0T7vkLegIilZeyUEIoVxUds+CUzswyjmb4NUVGEYPVhlS7xTXtZwNmeY+8R/9ZLE71ncZtfjgWESEypN2krUEetLh9Gl9zeq7gVgb7RvLHw/9o20ltnpz88/cO04Z7HQ16aBiBv910w4uR6NHKs+Yg7kuNz/dG5QIR4GM/xEthAZHjUtu8jo91Z6t7gatHdCKeqrXCPEs4GP3JOg0FcVXChfQJvtmeCYVL+2992Qffz4AO9vCiaulffs6skiE8gh2dI/+ol0UYeoqe+eBL1MbgY8p3L2H52uXpC/54Cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0hMw0X5Sz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 21:24:09 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0hLv5gfQzHnH6v;
	Tue, 27 Jan 2026 18:23:19 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 290C940569;
	Tue, 27 Jan 2026 18:24:05 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 10:24:04 +0000
Date: Tue, 27 Jan 2026 10:24:02 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <bhelgaas@google.com>, <kbusch@kernel.org>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <mahesh@linux.ibm.com>,
	<oohall@gmail.com>, <terry.bowman@amd.com>, <tianruidong@linux.alibaba.com>,
	<lukas@wunner.de>
Subject: Re: [PATCH v7 2/5] PCI/DPC: Run recovery on device that detected
 the error
Message-ID: <20260127102402.00004da2@huawei.com>
In-Reply-To: <20260124074557.73961-3-xueshuai@linux.alibaba.com>
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
	<20260124074557.73961-3-xueshuai@linux.alibaba.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16308-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,google.com,kernel.org,linux.intel.com,linux.ibm.com,gmail.com,amd.com,linux.alibaba.com,wunner.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xueshuai@linux.alibaba.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:lukas@wunner.de,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jonathan.cameron@huawei.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cameron@huawei.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alibaba.com:email,intel.com:email,huawei.com:mid]
X-Rspamd-Queue-Id: 2676D92BE3
X-Rspamd-Action: no action

On Sat, 24 Jan 2026 15:45:54 +0800
Shuai Xue <xueshuai@linux.alibaba.com> wrote:

> The current implementation of pcie_do_recovery() assumes that the
> recovery process is executed for the device that detected the error.
> However, the DPC driver currently passes the error port that experienced
> the DPC event to pcie_do_recovery().
> 
> Use the SOURCE ID register to correctly identify the device that
> detected the error. When passing the error device, the
> pcie_do_recovery() will find the upstream bridge and walk bridges
> potentially AER affected. And subsequent commits will be able to
> accurately access AER status of the error device.
> 
> Should not observe any functional changes.
> 
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>  drivers/pci/pci.h      |  2 +-
>  drivers/pci/pcie/dpc.c | 25 +++++++++++++++++++++----
>  drivers/pci/pcie/edr.c |  7 ++++---
>  3 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 0e67014aa001..58640e656897 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -771,7 +771,7 @@ struct rcec_ea {
>  void pci_save_dpc_state(struct pci_dev *dev);
>  void pci_restore_dpc_state(struct pci_dev *dev);
>  void pci_dpc_init(struct pci_dev *pdev);
> -void dpc_process_error(struct pci_dev *pdev);
> +struct pci_dev *dpc_process_error(struct pci_dev *pdev);
>  pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
>  bool pci_dpc_recovered(struct pci_dev *pdev);
>  unsigned int dpc_tlp_log_len(struct pci_dev *dev);
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index bff29726c6a5..f6069f621683 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -260,10 +260,20 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>  	return 1;
>  }
>  
> -void dpc_process_error(struct pci_dev *pdev)
> +/**
> + * dpc_process_error - handle the DPC error status
> + * @pdev: the port that experienced the containment event
> + *
> + * Return: the device that detected the error.
> + *
> + * NOTE: The device reference count is increased, the caller must decrement
> + * the reference count by calling pci_dev_put().
> + */
> +struct pci_dev *dpc_process_error(struct pci_dev *pdev)

Maybe it makes sense to carry the err_port naming for the pci_dev
in here as well?  Seems stronger than just relying on people
reading the documentation you've added.
 
>  {
>  	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
>  	struct aer_err_info info = {};
> +	struct pci_dev *err_dev;
>  
>  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>  
> @@ -279,6 +289,7 @@ void dpc_process_error(struct pci_dev *pdev)
>  			pci_aer_clear_nonfatal_status(pdev);
>  			pci_aer_clear_fatal_status(pdev);
>  		}
> +		err_dev = pci_dev_get(pdev);
>  		break;
>  	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE:
>  	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE:
> @@ -290,6 +301,8 @@ void dpc_process_error(struct pci_dev *pdev)
>  				"ERR_FATAL" : "ERR_NONFATAL",
>  			 pci_domain_nr(pdev->bus), PCI_BUS_NUM(source),
>  			 PCI_SLOT(source), PCI_FUNC(source));
> +		err_dev = pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
> +					    PCI_BUS_NUM(source), source & 0xff);

Bunch of replication in her with the pci_warn(). Maybe some local variables?
Maybe even rebuild the final parameter from PCI_DEVFN(slot, func) just to make the
association with the print really obvious?

Is there any chance that this might return NULL?   Feels like maybe that's
only a possibility on a broken setup, but I'm not sure of all the wonderful
races around hotplug and DPC occurring before the OS has caught up.

>  		break;
>  	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT:
>  		ext_reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
> @@ -304,8 +317,11 @@ void dpc_process_error(struct pci_dev *pdev)
>  		if (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO &&
>  		    pdev->dpc_rp_extensions)
>  			dpc_process_rp_pio_error(pdev);
> +		err_dev = pci_dev_get(pdev);
>  		break;
>  	}
> +
> +	return err_dev;
>  }

> diff --git a/drivers/pci/pcie/edr.c b/drivers/pci/pcie/edr.c
> index 521fca2f40cb..b6e9d652297e 100644
> --- a/drivers/pci/pcie/edr.c
> +++ b/drivers/pci/pcie/edr.c
> @@ -150,7 +150,7 @@ static int acpi_send_edr_status(struct pci_dev *pdev, struct pci_dev *edev,
>  
>  static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>  {
> -	struct pci_dev *pdev = data, *err_port;
> +	struct pci_dev *pdev = data, *err_port, *err_dev;
>  	pci_ers_result_t estate = PCI_ERS_RESULT_DISCONNECT;
>  	u16 status;
>  
> @@ -190,7 +190,7 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>  		goto send_ost;
>  	}
>  
> -	dpc_process_error(err_port);
> +	err_dev = dpc_process_error(err_port);
>  	pci_aer_raw_clear_status(err_port);
>  
>  	/*
> @@ -198,7 +198,8 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>  	 * or ERR_NONFATAL, since the link is already down, use the FATAL
>  	 * error recovery path for both cases.
>  	 */
> -	estate = pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
> +	estate = pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
> +	pci_dev_put(err_dev);
>  
>  send_ost:
>  



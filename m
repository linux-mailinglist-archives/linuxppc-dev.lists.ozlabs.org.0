Return-Path: <linuxppc-dev+bounces-16310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKurLEeVeGnmrAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 11:36:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5792E3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 11:36:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0hfX2Y1cz2yGM;
	Tue, 27 Jan 2026 21:36:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769510212;
	cv=none; b=nYHlB02ooiPqMkHYbbr1HFNGQTTkK0VCRmSoc9Ydj9Sd3JlT10cV7jy1JgZirwzWDsGE8aeNG6RnMDRU+8uZ5oI66WzEjErnvb/qshWNHq45N/Xr/Y+8Neg77vcjqgZkdeVwQLfQAT9uXpv6rjy78R472phTwH3lKCWWJ/46lsZsH3H8ItF7vr6nX0zCtFy6YMoz57VUkWtxWeL+7g7aJgdIRzd63XxvhuMKK7zChymE7ur+gFhLl7mwavtoFFK/aGsEgikD7e4UUOSFpvInCYLMOW2F6g9mJe2nJNrGvGcwSkE/3ib4jU5YOp1nkmQOLyW0PoPtqwIwSQq1bxg08g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769510212; c=relaxed/relaxed;
	bh=0lmtBEk+2q1v7eJutTPiUdX5VJu4gpuTKj6EgQzBuWY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtPTl1zbX4C8NrOEEJMfX2DZq8FzdlUO3tmMMLd0NFmCOMfGS15BONXzhtQp3AZJ7pN3DA8o136M5KsazWx5/5egtyWVPs5h0yDcRquMEpFJFedEcyEjWwEMA87cZbLWYW6jaIDYLYLpNJhb2Jq5zwuJyvJdZTEZPiwq+Vy6bWeX7WdV5Vdhk8ArOhWvO0n9ZpQBfVMzdBA34vO709vR+LLFL8Socz1zYn235twQh8PeRf2t8HebnlCa6pghoCMaLXgZ2jI23vQdHt8QjBYAW6zgux8uzrMnkLJSB/7oGixLNKvvF26oUuENy1oeCBtP7ZTAJymRsxX7RsOu34ErMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0hfW0tdBz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 21:36:50 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0hdX38ZCzHnGck;
	Tue, 27 Jan 2026 18:36:00 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id CA3CE4056A;
	Tue, 27 Jan 2026 18:36:45 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 10:36:45 +0000
Date: Tue, 27 Jan 2026 10:36:43 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <bhelgaas@google.com>, <kbusch@kernel.org>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <mahesh@linux.ibm.com>,
	<oohall@gmail.com>, <terry.bowman@amd.com>, <tianruidong@linux.alibaba.com>,
	<lukas@wunner.de>
Subject: Re: [PATCH v7 3/5] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
Message-ID: <20260127103643.00007991@huawei.com>
In-Reply-To: <20260124074557.73961-4-xueshuai@linux.alibaba.com>
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
	<20260124074557.73961-4-xueshuai@linux.alibaba.com>
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
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16310-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:email,alibaba.com:email]
X-Rspamd-Queue-Id: C1F5792E3B
X-Rspamd-Action: no action

On Sat, 24 Jan 2026 15:45:55 +0800
Shuai Xue <xueshuai@linux.alibaba.com> wrote:

> The AER driver has historically avoided reading the configuration space of
> an endpoint or RCiEP that reported a fatal error, considering the link to
> that device unreliable. Consequently, when a fatal error occurs, the AER
> and DPC drivers do not report specific error types, resulting in logs like:
> 
>   pcieport 0015:00:00.0: EDR: EDR event received
>   pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
>   pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
>   pcieport 0015:00:00.0: AER: broadcast error_detected message
>   pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
>   pcieport 0015:00:00.0: AER: broadcast resume message
>   pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
>   pcieport 0015:00:00.0: AER: device recovery successful
>   pcieport 0015:00:00.0: EDR: DPC port successfully recovered
>   pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80
> 
> AER status registers are sticky and Write-1-to-clear. If the link recovered
> after hot reset, we can still safely access AER status and TLP header of the
> error device. In such case, report fatal errors which helps to figure out the
> error root case.
> 
> After this patch, the logs like:
> 
>   pcieport 0015:00:00.0: EDR: EDR event received
>   pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
>   pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
>   pcieport 0015:00:00.0: AER: broadcast error_detected message
> + vfio-pci 0015:01:00.0: AER: Errors reported prior to reset
> + vfio-pci 0015:01:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Transaction Layer, (Receiver ID)
> + vfio-pci 0015:01:00.0:   device [144d:a80a] error status/mask=00001000/00400000
> + vfio-pci 0015:01:00.0:    [12] TLP                    (First)
> + vfio-pci 0015:01:00.0: AER:   TLP Header: 0x4a004010 0x00000040 0x01000000 0xffffffff
>   pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
>   pcieport 0015:00:00.0: AER: broadcast resume message
>   pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
>   pcieport 0015:00:00.0: AER: device recovery successful
>   pcieport 0015:00:00.0: EDR: DPC port successfully recovered
>   pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80
> 
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
Hi Shuai,

With the structure zeroed below (just to make this easier to review, not because
there is a bug as far as I can see)
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e0bcaa896803..4c0a2bbe9197 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c

> @@ -1447,17 +1450,38 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
>  	return 1;
>  }
>  
> +void aer_report_frozen_error(struct pci_dev *dev)
> +{
> +	struct aer_err_info info;
> +	int type = pci_pcie_type(dev);
> +
> +	if (type != PCI_EXP_TYPE_ENDPOINT && type != PCI_EXP_TYPE_RC_END)
> +		return;
> +

struct aer_err_info has a bunch of fields. I'd just make sure it's zeroed
to avoid us having to check that they are all filled in. = {};
or do it with the initial values being assigned.

	info = (struct aer_err_info) {
		.err_dev_num = 0,
		.severity = AER_FATAL,
		.level = KERN_ERR,
	};
	add_error_device(&info, dev);


> +	info.error_dev_num = 0;
> +	info.severity = AER_FATAL;
> +	info.level = KERN_ERR;
> +	add_error_device(&info, dev);
> +
> +	if (aer_get_device_error_info(&info, 0, true)) {
> +		pci_err(dev, "Errors reported prior to reset\n");
> +		aer_print_error(&info, 0);
> +	}
> +
> +	pci_dev_put(dev); /* pairs with pci_dev_get() in add_error_device() */
> +}



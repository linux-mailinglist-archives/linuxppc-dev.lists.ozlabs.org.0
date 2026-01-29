Return-Path: <linuxppc-dev+bounces-16396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAgjANJIe2kdDQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 12:47:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC635AFC8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 12:47:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1y722WNKz2ydj;
	Thu, 29 Jan 2026 22:47:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769687246;
	cv=none; b=nyDQ5Dh+frnX+Y5g5c93CX86oBvYlnc84Vez2sA19to/TxPG0OvcOr6NFCKpp+G9Kc5gof4wHFBpmbWg0lCOajBuTxgNHSBI2/Ar/IwH7l1vcF5ut0dWej8lzYZ5z2F/t9Ya3H8g54JgyU1KzWGcJKviUqORnPqwWvDa1PG5HbSMs2UIo7x2RhogT25tSMwiJy42W0wH65gx8jEj/4oOhXV/h7rB7QUwX+lMhKBktxVtH99HQLrsnrLFfHiYs6SyqQc9YwFuYJEI9OyqFLGlsz9d6j617FOxa+GTWANhMq5i4ovMyfT1ln9S+qbGQZpc1pMnqFWMAFdaI9IcAOoLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769687246; c=relaxed/relaxed;
	bh=xoQHr7NMHWmLiI+caU4Qq7zJzoLpzolUIRhPXmvde78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hqwLkftDwNra0JcQXaIrSBHyv4Fzz19D7eaOp+dclD1IriDAmhvyR80Wr2WzUikqoOpcVc9msPp8AnIwTOJEefzZGq+X1xS3ZLYiYGSfVgu/vM3Nk6U46viD9jTg6DqfoD1jQgBmVEPvZGfoczRK1AKaGC9h5HeV89LXUbzOAWkKf/PK+7MU5TpB+cJ0JRWlBJrXLc/ti0NulpyK2Lsn6HTkPOeEiIrOX0rsDn8Zrbcmg80EWC+ecbG/jaHyMNtKyfXsAap30Qh2miQ0mAORUnTuaJBpvvt4xFazXBhR6IjfU3mF8TLcEQhiUCO3+hvJZKoQfZHgseCbSf2Ty6oymA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Qij/mbpW; dkim-atps=neutral; spf=pass (client-ip=115.124.30.100; helo=out30-100.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Qij/mbpW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.100; helo=out30-100.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1y6y4nLhz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 22:47:20 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769687234; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=xoQHr7NMHWmLiI+caU4Qq7zJzoLpzolUIRhPXmvde78=;
	b=Qij/mbpWVmU8XL6Th95q9APZ/Lh68emuUrRSlMyq/zdDKACTmtAzsLs1eqovKOlfk23QYBfmS9imxwVDNjus9Rjqw0PI10y8RiiSaC1h6805l7i5q2U+k5IG8FL6uSR/OwILbEeliZlSjl7EdtWdEFQdB/KMaqo9BzJX7Ov1gQc=
Received: from 30.246.162.115(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Wy7GsJw_1769687232 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Jan 2026 19:47:13 +0800
Message-ID: <dba60a1d-5de8-4c71-be5f-d23565f6f183@linux.alibaba.com>
Date: Thu, 29 Jan 2026 19:46:31 +0800
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
Subject: Re: [PATCH v7 3/5] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com, lukas@wunner.de
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
 <20260124074557.73961-4-xueshuai@linux.alibaba.com>
 <7cf3c13f-1cef-429b-a9f6-0404bbe721d3@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <7cf3c13f-1cef-429b-a9f6-0404bbe721d3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-9.21 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16396-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sathyanarayanan.kuppuswamy@linux.intel.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:lukas@wunner.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmail.com,huawei.com,amd.com,linux.alibaba.com,wunner.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,alibaba.com:email,linux.alibaba.com:mid,linux.alibaba.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: CC635AFC8E
X-Rspamd-Action: no action

Hi, Kuppuswamy,

On 1/29/26 12:50 AM, Kuppuswamy Sathyanarayanan wrote:
> Hi,
> 
> On 1/23/2026 11:45 PM, Shuai Xue wrote:
>> The AER driver has historically avoided reading the configuration space of
>> an endpoint or RCiEP that reported a fatal error, considering the link to
>> that device unreliable. Consequently, when a fatal error occurs, the AER
>> and DPC drivers do not report specific error types, resulting in logs like:
>>
>>    pcieport 0015:00:00.0: EDR: EDR event received
>>    pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
>>    pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
>>    pcieport 0015:00:00.0: AER: broadcast error_detected message
>>    pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
>>    pcieport 0015:00:00.0: AER: broadcast resume message
>>    pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
>>    pcieport 0015:00:00.0: AER: device recovery successful
>>    pcieport 0015:00:00.0: EDR: DPC port successfully recovered
>>    pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80
>>
>> AER status registers are sticky and Write-1-to-clear. If the link recovered
>> after hot reset, we can still safely access AER status and TLP header of the
>> error device. In such case, report fatal errors which helps to figure out the
>> error root case.
>>
>> After this patch, the logs like:
>>
>>    pcieport 0015:00:00.0: EDR: EDR event received
>>    pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
>>    pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
>>    pcieport 0015:00:00.0: AER: broadcast error_detected message
>> + vfio-pci 0015:01:00.0: AER: Errors reported prior to reset
>> + vfio-pci 0015:01:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Transaction Layer, (Receiver ID)
>> + vfio-pci 0015:01:00.0:   device [144d:a80a] error status/mask=00001000/00400000
>> + vfio-pci 0015:01:00.0:    [12] TLP                    (First)
>> + vfio-pci 0015:01:00.0: AER:   TLP Header: 0x4a004010 0x00000040 0x01000000 0xffffffff
>>    pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
>>    pcieport 0015:00:00.0: AER: broadcast resume message
>>    pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
>>    pcieport 0015:00:00.0: AER: device recovery successful
>>    pcieport 0015:00:00.0: EDR: DPC port successfully recovered
>>    pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
> 
> LGTM. Few suggestions inline.
> 
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Thank you for the thorough review and the Reviewed-by tag!

> 
> 
>>   drivers/pci/pci.h      |  4 +++-
>>   drivers/pci/pcie/aer.c | 32 ++++++++++++++++++++++++++++----
>>   drivers/pci/pcie/dpc.c |  2 +-
>>   drivers/pci/pcie/err.c |  5 +++++
>>   4 files changed, 37 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 58640e656897..bd020ba0cef0 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -746,8 +746,10 @@ struct aer_err_info {
>>   	struct pcie_tlp_log tlp;	/* TLP Header */
>>   };
>>   
>> -int aer_get_device_error_info(struct aer_err_info *info, int i);
>> +int aer_get_device_error_info(struct aer_err_info *info, int i,
>> +			      bool link_healthy);
>>   void aer_print_error(struct aer_err_info *info, int i);
>> +void aer_report_frozen_error(struct pci_dev *dev);
>>   
>>   int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
>>   		      unsigned int tlp_len, bool flit,
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index e0bcaa896803..4c0a2bbe9197 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -1384,12 +1384,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
>>    * aer_get_device_error_info - read error status from dev and store it to info
>>    * @info: pointer to structure to store the error record
>>    * @i: index into info->dev[]
>> + * @link_healthy: link is healthy or not
>>    *
>>    * Return: 1 on success, 0 on error.
>>    *
>>    * Note that @info is reused among all error devices. Clear fields properly.
>>    */
>> -int aer_get_device_error_info(struct aer_err_info *info, int i)
>> +int aer_get_device_error_info(struct aer_err_info *info, int i,
>> +			      bool link_healthy)
>>   {
>>   	struct pci_dev *dev;
>>   	int type, aer;
>> @@ -1420,7 +1422,8 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
>>   	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
>>   		   type == PCI_EXP_TYPE_RC_EC ||
>>   		   type == PCI_EXP_TYPE_DOWNSTREAM ||
>> -		   info->severity == AER_NONFATAL) {
>> +		   info->severity == AER_NONFATAL ||
>> +		   (info->severity == AER_FATAL && link_healthy)) {
>>   
>>   		/* Link is still healthy for IO reads */
>>   		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
>> @@ -1447,17 +1450,38 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
>>   	return 1;
>>   }
>>   
>> +void aer_report_frozen_error(struct pci_dev *dev)
> 
> Since this function focuses specifically on printing fatal error details, would
> aer_print_fatal_error() be a more descriptive name?

Good point. aer_print_fatal_error() is indeed more descriptive and aligns
better with the existing aer_print_error() naming convention. I'll rename
it in next version.

> 
>> +{
>> +	struct aer_err_info info;
>> +	int type = pci_pcie_type(dev);
>> +
>> +	if (type != PCI_EXP_TYPE_ENDPOINT && type != PCI_EXP_TYPE_RC_END)
>> +		return;
>> +
>> +	info.error_dev_num = 0;
>> +	info.severity = AER_FATAL;
>> +	info.level = KERN_ERR;
>> +	add_error_device(&info, dev);
>> +
>> +	if (aer_get_device_error_info(&info, 0, true)) {
>> +		pci_err(dev, "Errors reported prior to reset\n");
> 
> The 'prior to reset' context depends on where this is called. I'd suggest moving
> this log to the caller or removing it entirely to keep this helper generic.

Agreed. Moving the log message to the caller makes the function more
generic and reusable. I'll move it to pcie_do_recovery() in next version.

> 
>> +		aer_print_error(&info, 0);
>> +	}
>> +
>> +	pci_dev_put(dev); /* pairs with pci_dev_get() in add_error_device() */
>> +}
>> +
>>   static inline void aer_process_err_devices(struct aer_err_info *e_info)
>>   {
>>   	int i;
>>   
>>   	/* Report all before handling them, to not lose records by reset etc. */
>>   	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
>> -		if (aer_get_device_error_info(e_info, i))
>> +		if (aer_get_device_error_info(e_info, i, false))
>>   			aer_print_error(e_info, i);
>>   	}
>>   	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
>> -		if (aer_get_device_error_info(e_info, i))
>> +		if (aer_get_device_error_info(e_info, i, false))
>>   			handle_error_source(e_info->dev[i], e_info);
>>   	}
>>   }
>> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
>> index f6069f621683..21c4e8371279 100644
>> --- a/drivers/pci/pcie/dpc.c
>> +++ b/drivers/pci/pcie/dpc.c
>> @@ -284,7 +284,7 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>>   		pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
>>   			 status);
>>   		if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
>> -		    aer_get_device_error_info(&info, 0)) {
>> +		    aer_get_device_error_info(&info, 0, false)) {
>>   			aer_print_error(&info, 0);
>>   			pci_aer_clear_nonfatal_status(pdev);
>>   			pci_aer_clear_fatal_status(pdev);
>> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
>> index bebe4bc111d7..0780ea09478b 100644
>> --- a/drivers/pci/pcie/err.c
>> +++ b/drivers/pci/pcie/err.c
>> @@ -253,6 +253,11 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>   			pci_warn(bridge, "subordinate device reset failed\n");
>>   			goto failed;
>>   		}
>> +
>> +		/* Link recovered, report fatal errors of RCiEP or EP */
>> +		if (state == pci_channel_io_frozen)
> 
> To align with your comment regarding RCiEPs and EPs, should we explicitly
> validate the device type here before calling the report function?
> 
>> +			aer_report_frozen_error(dev);

I prefer to keep the type validation inside aer_print_fatal_error() to
make the function self-contained and safe. This way, if it's called from
other places in the future, we don't need to duplicate the type checking
logic.


Thanks again for the valuable feedback. I'll send next version with these
improvements.

Best regards,
Shuai




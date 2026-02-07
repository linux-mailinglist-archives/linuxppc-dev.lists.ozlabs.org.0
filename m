Return-Path: <linuxppc-dev+bounces-16709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kL08OWP5hml3SgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16709-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Feb 2026 09:35:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 831451053D6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Feb 2026 09:35:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f7PRg3Hwbz2ydq;
	Sat, 07 Feb 2026 19:35:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770453343;
	cv=none; b=TaYPFC+J22g7I51fhK5kVjJ63kus3eqh5oKpayS28j9LNiGUQrTt1qnN8kvsYSzxntkCO6RXxKixr7sInHPmrEoKrPUO+nCvsRDXRsBZU+P62muDtd78WP+yaTaDHis4bfiJq863gNgWbJQwzhMPG+jRODU0Af1cINBLSY7xR+NQbInZQa1WGupJLV7aJPYf1fKyYd9WSbRCTyPKtl/PwHmPtd7RY/uo4PcaxDu/OBj1fxghfgBUY5QD3CIwGWuN7w6YAa/otriBcsD21OiDMa+WXkbMZlybt0+E/MjBX08EczyhFEyFfY6Lrh42re+MSwjCUtomKNX0zPOtl661zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770453343; c=relaxed/relaxed;
	bh=NdAVUBsBt+q9ht9jChQ+fU7/bdKbU4jceYqVa9txGzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bz2z20OmUGq7CzdJmA4ij+RxXqIm9ipM/YLIob7LLq465qDtMxuKe7D9OpJjMJnis4BBA47RoXNSJVJGhlkOWJHvblunhsGWe8sCgNHDCSJdMiyXnJ5S+w3/y0tPI5ZKse4cuYqASU8COPDQ37UzajQVy/NnE+OUPF+bkL9pecgiw7Ayq44qAfrz8v4tXfdv9cv8fwZECfcD3EjfVWeZ3y5kQasRLUHGssNPGgoaDiPYdFFXk/KbnRC5uCwihlJxkfdYEAv/V0EE7ygnxL4JHW62ts2M4SfTJKUuq3T5pX1qi79WOcbBTkkp10/KzLDjhaEB08esEdvcx7BqTVyNvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CM4oQQE1; dkim-atps=neutral; spf=pass (client-ip=115.124.30.113; helo=out30-113.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CM4oQQE1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.113; helo=out30-113.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f7PRd22Lgz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 19:35:39 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770453335; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=NdAVUBsBt+q9ht9jChQ+fU7/bdKbU4jceYqVa9txGzY=;
	b=CM4oQQE17iGnlLhDv5F4te2WbgEM6Aw4ZLJjuBoH5qfFE6DHIB9Zebt3uuSdRE31Dqj8KVzWGrgLvWXlF6i8igIMe4vwQXBzJNuu3t0w48RTXW8tUuR0PqSVHjWclqvT/oEmpdNj3CfdEznYwgLEAAQLVbeahCOs9BdGLakqtc8=
Received: from 30.246.162.188(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WyhXHoT_1770453333 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Feb 2026 16:35:34 +0800
Message-ID: <de195f39-8197-494e-8451-2cf8fde064ea@linux.alibaba.com>
Date: Sat, 7 Feb 2026 16:34:23 +0800
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
Subject: Re: [PATCH v7 4/5] PCI/AER: Clear both AER fatal and non-fatal status
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, mahesh@linux.ibm.com,
 oohall@gmail.com, Jonathan.Cameron@huawei.com, terry.bowman@amd.com,
 tianruidong@linux.alibaba.com
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
 <20260124074557.73961-5-xueshuai@linux.alibaba.com>
 <aYGsmgyVwvbj83YI@wunner.de>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aYGsmgyVwvbj83YI@wunner.de>
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
	TAGGED_FROM(0.00)[bounces-16709-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,google.com,kernel.org,linux.intel.com,linux.ibm.com,gmail.com,huawei.com,amd.com,linux.alibaba.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.alibaba.com:mid,linux.alibaba.com:dkim]
X-Rspamd-Queue-Id: 831451053D6
X-Rspamd-Action: no action



On 2/3/26 4:06 PM, Lukas Wunner wrote:
> On Sat, Jan 24, 2026 at 03:45:56PM +0800, Shuai Xue wrote:
>> The DPC driver clears AER fatal status for the port that reported the
>> error, but not for the downstream device that deteced the error.  The
>> current recovery code only clears non-fatal AER status, leaving fatal
>> status bits set in the error device.
> 
> That's not quite accurate:
> 
> The error device has undergone a Hot Reset as a result of the Link Down
> event.  To be able to use it again, pci_restore_state() is invoked by
> the driver's ->slot_reset() callback.  And pci_restore_state() does
> clear fatal status bits.
> 
> pci_restore_state()
>    pci_aer_clear_status()
>      pci_aer_raw_clear_status()
> 
>> Use pci_aer_raw_clear_status() to clear both fatal and non-fatal error
>> status in the error device, ensuring all AER status bits are properly
>> cleared after recovery.
> 
> Well, pci_restore_state() already clears all AER status bits so why
> is this patch necessary?

You're right that many drivers call pci_restore_state() in their
->slot_reset() callback, which clears all AER status bits.  However,
since ->slot_reset() is driver-defined and not all drivers invoke
pci_restore_state(), there could be cases where fatal AER status bits
remain set after the frozen recovery completes.

> 
>> +++ b/drivers/pci/pcie/err.c
>> @@ -285,7 +285,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>   	 */
>>   	if (host->native_aer || pcie_ports_native) {
>>   		pcie_clear_device_status(dev);
>> -		pci_aer_clear_nonfatal_status(dev);
>> +		pci_aer_raw_clear_status(dev);
>>   	}
> 
> This code path is for the case when pcie_do_recovery() is called
> with state=pci_channel_io_normal, i.e. in the nonfatal case.
> That's why only the nonfatal bits need to be cleared here.
> 
> In the fatal case clearing of the error bits is done by
> pci_restore_state().
> 
> I understand that this is subtle and should probably be changed
> to improve clarity, but this patch doesn't look like a step
> in that direction.
> 

I notice that pcie_clear_device_status()
(called just before pci_aer_clear_nonfatal_status()) already clears
*all* error bits in the Device Status register (CED, NFED, FED, URD),
including the Fatal Error Detected (FED) bit, regardless of whether
we're in a fatal or nonfatal recovery path.

So there's an inconsistency in the current design:
- pcie_clear_device_status() clears all error bits (including FED)
- pci_aer_clear_nonfatal_status() only clears nonfatal AER status

This means that even in the nonfatal case, the FED bit in Device
Status is cleared, even though we preserve the fatal bits in the AER
Uncorrectable Error Status register.

Would you prefer that I:
1. Make both pcie_clear_device_status() and the AER clearing
    conditional on the 'state' parameter, so that nonfatal recovery
    truly preserves fatal bits in both registers, or
2. Drop this patch and instead move the AER-specific clearing logic
    out of pcie_do_recovery() entirely (as you suggested earlier), so
    that each caller can handle the status clearing explicitly for the
    appropriate error sources and severity?

Thanks,
Shuai



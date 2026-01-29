Return-Path: <linuxppc-dev+bounces-16397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPVhClxOe2n9DgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 13:11:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD896AFEDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 13:10:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1yf70w2kz2ydj;
	Thu, 29 Jan 2026 23:10:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769688654;
	cv=none; b=XSYKLHtkOhDrBayse1VwNdxNv8+hxe0KViP5nXs6+bZf/4zi3aE9ikyXQx2TiR1GXFDJUIQPbkCvcCs7Y3vmH9qc0E7v56yf8Kw8+F8T6FBl0HlWcljZMMfbmaOLE05Shn2GkwpjDISrCeniYdsE3ZH1Vuj3ALKxcjU4XLNYCC8bJl+SWVFwmR6h1pMDCVudzNo7voyPXA5ZtUTT4MoBnD6CpXV5VxOJLGfTEv+sUy630BXVUAdZLLmfVRJfSQjDLxUJZMRP0T9/pCjyEL1Qu+TOogzoloaGygMyZnrcJHR2AmKKeE8kbDnlflHvpvW4ee5OqIH4dwkYw0kar8yn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769688654; c=relaxed/relaxed;
	bh=tCSReYBhehaf4SQSg9qzdK6jY/HB57uEHPOEgOMpYJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9/SE4kNxRW+OZYDlQBAqKIjnYE2uLYyKWR634yKSGpEr7fB5DduDeXyCLXRHWJMI/Cm6z4wtJnRGciwzulyTeK9HQklwHWOfRZE/3oTSndKJJ4eusXlj5g4ovsLahbQwGpiilzYNkc19SLbBee1ATI85xTUOz8TrWRFgPMwjNxqLaZFMtGjjkkTm3bHjywjyk37Cl/yxIZXNwMmx36N9+hG9LyNNPOdKFWG+W/di3Eoe7ZrdYwU+i+QNEMaH3371I5n2GPtbmJfRfMh1ARMAk8VLkRyOq40e7qcENhM6bPphCObfzpnU8uXoDyo38oBwHlczKTm7KJMXRRAXJjSsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=pWCE7q8T; dkim-atps=neutral; spf=pass (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=pWCE7q8T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1yf42VCvz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 23:10:50 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769688642; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=tCSReYBhehaf4SQSg9qzdK6jY/HB57uEHPOEgOMpYJg=;
	b=pWCE7q8TDXONWBovFaN0kpqU9CNfvgxkFUITQ1udtqJ69Q8ZcJ2Ryh1D0YhGxa+Dwf1H5Pw/LQr/JKODVwgwxDomtL/6VtJBb/cyilbe92Fal0skQLyJZvlAjzKcTPCSU83q/W6dSXsAxBYxOp6YcoQ55MbrM4sDnglG1QFB9SM=
Received: from 30.246.162.115(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Wy7NtdK_1769688638 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Jan 2026 20:10:39 +0800
Message-ID: <4d1e770b-d430-452a-ab21-6eff676f87ae@linux.alibaba.com>
Date: Thu, 29 Jan 2026 20:09:57 +0800
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
Subject: Re: [PATCH v7 5/5] PCI/AER: Only clear error bits in
 pcie_clear_device_status()
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com, lukas@wunner.de
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
 <20260124074557.73961-6-xueshuai@linux.alibaba.com>
 <acf0a082-93b3-49a6-a02c-a0b82b83391a@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <acf0a082-93b3-49a6-a02c-a0b82b83391a@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16397-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sathyanarayanan.kuppuswamy@linux.intel.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:lukas@wunner.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	ASN_FAIL(0.00)[117.38.213.112.asn.rspamd.com:query timed out];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmail.com,huawei.com,amd.com,linux.alibaba.com,wunner.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[xueshuai.linux.alibaba.com:server fail,lukas.wunner.de:server fail,stable.vger.kernel.org:server fail];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CD896AFEDF
X-Rspamd-Action: no action



On 1/29/26 1:01 AM, Kuppuswamy Sathyanarayanan wrote:
> 
> 
> On 1/23/2026 11:45 PM, Shuai Xue wrote:
>> Currently, pcie_clear_device_status() clears the entire PCIe Device
>> Status register (PCI_EXP_DEVSTA), which includes both error status bits
>> and other status bits such as AUX Power Detected (AUXPD) and
>> Transactions Pending (TRPND).
>>
>> Clearing non-error status bits can interfere with other drivers or
>> subsystems that may rely on these bits. To fix it, only clear the error
>> bits (0xf) while preserving other status bits.
>>
>> Fixes: ec752f5d54d7 ("PCI/AER: Clear device status bits during ERR_FATAL and ERR_NONFATAL")
>> Cc: stable@vger.kernel.org
>> Suggested-by: Lukas Wunner <lukas@wunner.de>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
> 
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> 
>>   drivers/pci/pci.c             | 2 +-
>>   include/uapi/linux/pci_regs.h | 1 +
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index 13dbb405dc31..0b947f90c333 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -2246,7 +2246,7 @@ void pcie_clear_device_status(struct pci_dev *dev)
>>   	u16 sta;
>>   
>>   	pcie_capability_read_word(dev, PCI_EXP_DEVSTA, &sta);
>> -	pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta);
>> +	pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta & PCI_EXP_DEVSTA_ERR);
>>   }
>>   #endif
>>   
>> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
>> index 3add74ae2594..f4b68203bc4e 100644
>> --- a/include/uapi/linux/pci_regs.h
>> +++ b/include/uapi/linux/pci_regs.h
>> @@ -534,6 +534,7 @@
>>   #define  PCI_EXP_DEVSTA_NFED	0x0002	/* Non-Fatal Error Detected */
>>   #define  PCI_EXP_DEVSTA_FED	0x0004	/* Fatal Error Detected */
>>   #define  PCI_EXP_DEVSTA_URD	0x0008	/* Unsupported Request Detected */
>> +#define  PCI_EXP_DEVSTA_ERR	0xf	/* Error bits */
> 
> To align with other macros, use 0x000F?
> 
Sure, will fix it.

Thanks.

Best Regards,
Shuai


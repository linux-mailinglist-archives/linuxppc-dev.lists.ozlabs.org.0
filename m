Return-Path: <linuxppc-dev+bounces-2946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DB19BFB6F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 02:27:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkPZ72ZlXz3bgf;
	Thu,  7 Nov 2024 12:27:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730942831;
	cv=none; b=GmTsSyo7SkjdSEpsMRun9lsBa75AMG9DoCMUrWJa52xtpKsfw3oRF3Axhg3sB2d04RNFDoL+ZKGQtv0RagFO+WbUuWa84CnFyBm7zZ5ot8Nq2sVrRc7ar/rR1nrt5MhTy8z5Qg99jdftYSSRU14EXVtELP0o5BYn2O0KSElX45RMtgl9dIq/Ah4j9pr7lsmzRJ+F3Wafw+DSUijx2QD1LlHXuaohP29QRMTW6qKRUrVQM0vSwoHTbEWviolVSWzBOwgZHmaA75+/7a/KGMOvsWMOZxXbe3AruX2UbApGVJxfxV+sbWyqQ/abiHNJT5dBXqlj5Gd4j2WLT3wJ4RsoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730942831; c=relaxed/relaxed;
	bh=7QNN7aZqhxMw37PStTVFSWANIXY78tjXFWsam9auhZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N45TVHVR/a2HOAWEtZ+D34X/RXlnrR85Rq2u0ovcYFPJUUte9CPEIFPG8bre1khVCnt1KCpuAErtK9zO47FhoPRuQNPnso1MB9f82aJ6cx2cSXyUkxMiegh6LCcPWg/i8YD4OoAi+CdTDB71D6y9pRHnOaLnFXVm5XJ5dBKZRigSxxX6PAMwgQtGcccJFHtfaKDO5R7byPJE54UoStCaFLTyvmybg9Ss8QPbA22VGosbol4ohm0udYb1ReTXa+hdm5ArHM0amLlARfdM4XDu3ws1F+VuIVgH0fkGhkhC1RTvIB7u5E5Llvc4ooMLHjcsH43kuwuta8mc5AR+rk4jeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=b8WRgGEr; dkim-atps=neutral; spf=pass (client-ip=115.124.30.119; helo=out30-119.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=b8WRgGEr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.119; helo=out30-119.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkPZ612vVz2ygy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 12:27:09 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730942825; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=7QNN7aZqhxMw37PStTVFSWANIXY78tjXFWsam9auhZE=;
	b=b8WRgGEr9MyYiiJgr6XzsX2WWQmRTMmZLTs0PF1vgH2QsLmJ5lTIUN4IGBf7zX0TRFz5ijXgwgDmvYQkjKnntVc22JCahNNylEmmZDweWQabb7sFSsHT4xCIAfu6Q4CGI+OQxYGGHhekHjPv9dKj5xuTI+VVbNURk3NkF6WXlf4=
Received: from 30.246.162.170(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WIthnFt_1730942823 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 07 Nov 2024 09:27:04 +0800
Message-ID: <736d94be-fad9-445e-acce-81cae1a05d46@linux.alibaba.com>
Date: Thu, 7 Nov 2024 09:27:02 +0800
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 2/2] PCI/AER: report fatal errors of RCiEP and EP
 if link recoverd
To: Keith Busch <kbusch@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, mahesh@linux.ibm.com,
 oohall@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com
References: <20241106090339.24920-1-xueshuai@linux.alibaba.com>
 <20241106090339.24920-3-xueshuai@linux.alibaba.com>
 <ZyubxGBL7TvchZI_@kbusch-mbp>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <ZyubxGBL7TvchZI_@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2024/11/7 00:39, Keith Busch 写道:
> On Wed, Nov 06, 2024 at 05:03:39PM +0800, Shuai Xue wrote:
>> +int aer_get_device_fatal_error_info(struct pci_dev *dev, struct aer_err_info *info)
>> +{
>> +	int type = pci_pcie_type(dev);
>> +	int aer = dev->aer_cap;
>> +	u32 aercc;
>> +
>> +	pci_info(dev, "type :%d\n", type);
>> +
>> +	/* Must reset in this function */
>> +	info->status = 0;
>> +	info->tlp_header_valid = 0;
>> +	info->severity = AER_FATAL;
>> +
>> +	/* The device might not support AER */
>> +	if (!aer)
>> +		return 0;
>> +
>> +
>> +	if (type == PCI_EXP_TYPE_ENDPOINT || type == PCI_EXP_TYPE_RC_END) {
>> +		/* Link is healthy for IO reads now */
>> +		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
>> +			&info->status);
>> +		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
>> +			&info->mask);
>> +		if (!(info->status & ~info->mask))
>> +			return 0;
>> +
>> +		/* Get First Error Pointer */
>> +		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &aercc);
>> +		info->first_error = PCI_ERR_CAP_FEP(aercc);
>> +
>> +		if (info->status & AER_LOG_TLP_MASKS) {
>> +			info->tlp_header_valid = 1;
>> +			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG, &info->tlp);
>> +		}
> 
> This matches the uncorrectable handling in aer_get_device_error_info, so
> perhaps a helper to reduce duplication.

Yes, will do.

> 
>> +	}
>> +
>> +	return 1;
>> +}
> 
> Returning '1' even if type is root or downstream port?
> 
>>   static inline void aer_process_err_devices(struct aer_err_info *e_info)
>>   {
>>   	int i;
>> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
>> index 31090770fffc..a74ae6a55064 100644
>> --- a/drivers/pci/pcie/err.c
>> +++ b/drivers/pci/pcie/err.c
>> @@ -196,6 +196,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>   	struct pci_dev *bridge;
>>   	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
>>   	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
>> +	struct aer_err_info info;
>>   
>>   	/*
>>   	 * If the error was detected by a Root Port, Downstream Port, RCEC,
>> @@ -223,6 +224,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>   			pci_warn(bridge, "subordinate device reset failed\n");
>>   			goto failed;
>>   		}
>> +
>> +		/* Link recovered, report fatal errors on RCiEP or EP */
>> +		if (aer_get_device_fatal_error_info(dev, &info))
>> +			aer_print_error(dev, &info);
> 
> This will always print the error info even for root and downstream
> ports, but you initialize "info" status and mask only if it's an EP or
> RCiEP.

Got it. Will fix it.

Thank you for valuable comments.

Best Regards,
Shuai



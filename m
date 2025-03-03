Return-Path: <linuxppc-dev+bounces-6609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2133DA4B72A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 05:34:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5mDL3Z9nz300g;
	Mon,  3 Mar 2025 15:34:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740976450;
	cv=none; b=GRaWLwLGZYkIqj0OPh+sfyJ1VORsWkGkA11HCFPQIH1+Xoq4NkLCpDGRbFJFpQH4lKglf03KNhsaGdncVzopop64aBmu9aZpVy60zDFDrgmdOXr7FeukJzKYpHICkT6ZpGG8crD3/EKGlwqPAdz1lRmEXEvCKlyYNJSymCJSCHD9w/tD15kJcaJ+UgC+8u0KBEDApkMLdYOCMQTcUFKn5NuRYS37m5IabiyGrGtY9mWq4kYp3HsTpRegnPiIgzzXEgMACb2jIP9YeWgi5kV8R1X4aYWXUOoM3mvaCj3tOtLiF5d/mi3ZoLzbPPfC3mZ+UHb/awUYnHvS0GjtPmKnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740976450; c=relaxed/relaxed;
	bh=gFgZL4SK+vTz1A6HMCuB3ry9mqMa97WAbrHPo05jn3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jnSks69k2l+OHjoZZnwx4msRpHFk7fEVIal+ALpYZrG4Uabmse900VjcODMy7DFSZzFZ3+XxsADZo3iR9yNMPtSCCfNzaxAosQWZFLi0AFJp9/P5ZaOdJlft1uzF+7fRF9XqKnZxGiEAwoHNxt8MCOrExIU4eobNuOtTxAl3Rzq/T4ahQHqCPASAzxyFhtWUM4Clj5BRUBb6mFjvkDCbPYStm5EbR0FCMpvYbi7RstqWzFE3afJgckrxVkH4+iGpLC3YgzRspTA9yD82AsdmAxiRO7Y24yVIzBRrlAFBDKlTKBTbEjWc5KSYb3GJlaUuZuAzSeiVbdLVvPcir74FqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=QxXF0unV; dkim-atps=neutral; spf=pass (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=QxXF0unV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5mDJ1ch4z2ynR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 15:34:06 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1740976442; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=gFgZL4SK+vTz1A6HMCuB3ry9mqMa97WAbrHPo05jn3k=;
	b=QxXF0unVVg1Q/J/gEdqsitkZIUT3DkBcP307aZoa9ndwL4odHyrhM6kchsnTJu9t+WqV+z9PbysMKWEEwQdzkNfej4nmNVDpn83Zb+wHWgRHZf79rd4w+yk3swLUVUn5+X2sRyABgPvYzjSJRjQNzEXcHtSwqfxRMRgTu1lnEqg=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WQYHNkC_1740976439 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 03 Mar 2025 12:34:00 +0800
Message-ID: <1dea64ef-3c9f-4bff-820f-34d8f3a6a1d4@linux.alibaba.com>
Date: Mon, 3 Mar 2025 12:33:59 +0800
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
Subject: Re: [PATCH v4 3/3] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com
References: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
 <20250217024218.1681-4-xueshuai@linux.alibaba.com>
 <8a833aaf-53aa-4e56-a560-2b84a6e9c28c@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <8a833aaf-53aa-4e56-a560-2b84a6e9c28c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/3/3 11:43, Sathyanarayanan Kuppuswamy 写道:
> 
> On 2/16/25 6:42 PM, Shuai Xue wrote:
>> The AER driver has historically avoided reading the configuration space of
>> an endpoint or RCiEP that reported a fatal error, considering the link to
>> that device unreliable. Consequently, when a fatal error occurs, the AER
>> and DPC drivers do not report specific error types, resulting in logs like:
>>
>>    pcieport 0000:30:03.0: EDR: EDR event received
>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>    nvme nvme0: frozen state error detected, reset controller
>>    nvme 0000:34:00.0: ready 0ms after DPC
>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>
>> AER status registers are sticky and Write-1-to-clear. If the link recovered
>> after hot reset, we can still safely access AER status of the error device.
>> In such case, report fatal errors which helps to figure out the error root
>> case.
>>
>> After this patch, the logs like:
>>
>>    pcieport 0000:30:03.0: EDR: EDR event received
>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>    nvme nvme0: frozen state error detected, reset controller
>>    pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>>    nvme 0000:34:00.0: ready 0ms after DPC
>>    nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>>    nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>>    nvme 0000:34:00.0:    [ 4] DLP                    (First)
>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
> 
> IMO, above info about device error details is more of a debug info. Since the
> main use of this info use to understand more details about the recovered
> DPC error. So I think is better to print with debug tag. Lets see what others
> think.
> 
> Code wise, looks fine to me.

thanks, looking forward to more feedback.
> 
> 
> 
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
>>   drivers/pci/pci.h      |  3 ++-
>>   drivers/pci/pcie/aer.c | 11 +++++++----
>>   drivers/pci/pcie/dpc.c |  2 +-
>>   drivers/pci/pcie/err.c |  9 +++++++++
>>   4 files changed, 19 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 870d2fbd6ff2..e852fa58b250 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -549,7 +549,8 @@ struct aer_err_info {
>>       struct pcie_tlp_log tlp;    /* TLP Header */
>>   };
>> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
>> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
>> +                  bool link_healthy);
>>   void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
>>   int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index 508474e17183..bfb67db074f0 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -1197,12 +1197,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
>>    * aer_get_device_error_info - read error status from dev and store it to info
>>    * @dev: pointer to the device expected to have a error record
>>    * @info: pointer to structure to store the error record
>> + * @link_healthy: link is healthy or not
>>    *
>>    * Return 1 on success, 0 on error.
>>    *
>>    * Note that @info is reused among all error devices. Clear fields properly.
>>    */
>> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
>> +                  bool link_healthy)
>>   {
>>       int type = pci_pcie_type(dev);
>>       int aer = dev->aer_cap;
>> @@ -1226,7 +1228,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>>       } else if (type == PCI_EXP_TYPE_ROOT_PORT ||
>>              type == PCI_EXP_TYPE_RC_EC ||
>>              type == PCI_EXP_TYPE_DOWNSTREAM ||
>> -           info->severity == AER_NONFATAL) {
>> +           info->severity == AER_NONFATAL ||
>> +           (info->severity == AER_FATAL && link_healthy)) {
>>           /* Link is still healthy for IO reads */
>>           pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
>> @@ -1258,11 +1261,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>>       /* Report all before handle them, not to lost records by reset etc. */
>>       for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
>> -        if (aer_get_device_error_info(e_info->dev[i], e_info))
>> +        if (aer_get_device_error_info(e_info->dev[i], e_info, false))
>>               aer_print_error(e_info->dev[i], e_info);
>>       }
>>       for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
>> -        if (aer_get_device_error_info(e_info->dev[i], e_info))
>> +        if (aer_get_device_error_info(e_info->dev[i], e_info, false))
>>               handle_error_source(e_info->dev[i], e_info);
>>       }
>>   }
>> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
>> index ea3ea989afa7..2d3dd831b755 100644
>> --- a/drivers/pci/pcie/dpc.c
>> +++ b/drivers/pci/pcie/dpc.c
>> @@ -303,7 +303,7 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>>           dpc_process_rp_pio_error(pdev);
>>       else if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR &&
>>            dpc_get_aer_uncorrect_severity(pdev, &info) &&
>> -         aer_get_device_error_info(pdev, &info)) {
>> +         aer_get_device_error_info(pdev, &info, false)) {
>>           aer_print_error(pdev, &info);
>>           pci_aer_clear_nonfatal_status(pdev);
>>           pci_aer_clear_fatal_status(pdev);
>> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
>> index 31090770fffc..462577b8d75a 100644
>> --- a/drivers/pci/pcie/err.c
>> +++ b/drivers/pci/pcie/err.c
>> @@ -196,6 +196,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>       struct pci_dev *bridge;
>>       pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
>>       struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
>> +    struct aer_err_info info;
>>       /*
>>        * If the error was detected by a Root Port, Downstream Port, RCEC,
>> @@ -223,6 +224,13 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>               pci_warn(bridge, "subordinate device reset failed\n");
>>               goto failed;
>>           }
>> +
>> +        info.severity = AER_FATAL;
>> +        /* Link recovered, report fatal errors of RCiEP or EP */
>> +        if ((type == PCI_EXP_TYPE_ENDPOINT ||
>> +             type == PCI_EXP_TYPE_RC_END) &&
>> +            aer_get_device_error_info(dev, &info, true))
>> +            aer_print_error(dev, &info);
>>       } else {
>>           pci_walk_bridge(bridge, report_normal_detected, &status);
>>       }
>> @@ -259,6 +267,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>       if (host->native_aer || pcie_ports_native) {
>>           pcie_clear_device_status(dev);
>>           pci_aer_clear_nonfatal_status(dev);
>> +        pci_aer_clear_fatal_status(dev);
> 
> Add some info about above change in the commit log.

Will do.

Thanks.
Shuai


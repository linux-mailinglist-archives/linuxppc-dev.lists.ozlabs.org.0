Return-Path: <linuxppc-dev+bounces-5537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED45A1AE44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 02:45:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfLH43yBVz2yVT;
	Fri, 24 Jan 2025 12:45:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737683120;
	cv=none; b=MH+ve156HLkwjkR+OCgWbpxor6quW1pyfzgncJofrIj1wpkJnFy4M4FnUUV89V3971I5EOfaKOZ1wVFOeRz78dlwHcIZoE+0tlYnb3n1vF6s5tKPAAmvSyghMbW/NOmUlhrHecw14DYnh1J0cEfTtlo313Hh+zkXCZZqBpFk5IzLg7s5FCRWemWeeQpzTT0FqOOpArta1URFuSuAlvDuMmF0KgSWMIBtDs4ZSN1aRsDefp9qqoV1AVCdFT2/BrANM2GXjYz/j56GgoLO9fo2XvidkdNdWNTgv2M4xYBUcSIFV1NB5SZz/lgFOBTp+ntxjjnwSlsqsgxhfQUSL8eiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737683120; c=relaxed/relaxed;
	bh=HefF1VgobYNw/buVdtIHwLUtKr4Okxq/b4dWX4SMuHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wgo90bZuB+j6D4DafPrQPDXD0B221u0fU8/jqpV/MvWeinuEp+wWEBwn3hHgeSrWeUsNICS8JFIrwVBEXJIzDaYneGPnclPZWvNV95gFAHQxGezKdkQm32bbozceBYNb+GV1t6FAJGZr97+DgK5O1f1CNy/20q5HQLDF9VtzXXl2HK89A5Gx4Z9UvzrRbRdQRo9Vafb+hjwSyml8ySULxZpUPBGnPWGDCKR5NAdLM4cG9CE13RAOrB5KwqGrTWCyD5Y9PP+61yzu45M7+p5yeSWAvUPgZnlBO+DBRY1Lf5ETPjCd36lJmsXPmpKBZvrKb+CpAszP5/omCi2CCczrmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=S95lrsda; dkim-atps=neutral; spf=pass (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=S95lrsda;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfLH250bCz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 12:45:17 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1737683111; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=HefF1VgobYNw/buVdtIHwLUtKr4Okxq/b4dWX4SMuHU=;
	b=S95lrsda3c6kBNwA4Yg7QCi5EGuYhKNO4/znNbdOjmisxp/7kBiWo3u5JaSKxitSIMNzQEpbxafc6YGlP+kW2eGL0SxO2imrL2ut5LAIoeoBZoyB4u7tSC/4xpJPwmStykIOxHUwJY51X7rpZKiMraCHXekdLFMRPZeQc93iHDk=
Received: from 30.246.161.230(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WOCwDqx_1737683109 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Jan 2025 09:45:10 +0800
Message-ID: <9f8653ef-81e3-4ce9-9c11-78d694f2a52b@linux.alibaba.com>
Date: Fri, 24 Jan 2025 09:45:08 +0800
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
Subject: Re: [PATCH v2 2/2] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com
References: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
 <20241112135419.59491-3-xueshuai@linux.alibaba.com>
 <4b5230a1-26fd-4594-9daf-5df314c6b4c6@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <4b5230a1-26fd-4594-9daf-5df314c6b4c6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/1/24 04:10, Sathyanarayanan Kuppuswamy 写道:
> Hi,
> 
> On 11/12/24 5:54 AM, Shuai Xue wrote:
>> The AER driver has historically avoided reading the configuration space of
>> an endpoint or RCiEP that reported a fatal error, considering the link to
>> that device unreliable. Consequently, when a fatal error occurs, the AER
>> and DPC drivers do not report specific error types, resulting in logs like:
>>
>>    pcieport 0000:30:03.0: EDR: EDR event received
>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>    nvme nvme0: frozen state error detected, reset controller
>>    nvme 0000:34:00.0: ready 0ms after DPC
>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>
>> AER status registers are sticky and Write-1-to-clear. If the link recovered
>> after hot reset, we can still safely access AER status of the error device.
>> In such case, report fatal errors which helps to figure out the error root
>> case.
>>
>> After this patch, the logs like:
>>
>>    pcieport 0000:30:03.0: EDR: EDR event received
>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>    nvme nvme0: frozen state error detected, reset controller
>>    pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>>    nvme 0000:34:00.0: ready 0ms after DPC
>>    nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>>    nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>>    nvme 0000:34:00.0:    [ 4] DLP                    (First)
>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
>>   drivers/pci/pci.h      |  3 ++-
>>   drivers/pci/pcie/aer.c | 11 +++++++----
>>   drivers/pci/pcie/dpc.c |  2 +-
>>   drivers/pci/pcie/err.c |  9 +++++++++
>>   4 files changed, 19 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 0866f79aec54..6f827c313639 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -504,7 +504,8 @@ struct aer_err_info {
>>       struct pcie_tlp_log tlp;    /* TLP Header */
>>   };
>> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
>> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
>> +                  bool link_healthy);
>>   void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
>>   #endif    /* CONFIG_PCIEAER */
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index 13b8586924ea..97ec1c17b6f4 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -1200,12 +1200,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
>>    * aer_get_device_error_info - read error status from dev and store it to info
>>    * @dev: pointer to the device expected to have a error record
>>    * @info: pointer to structure to store the error record
>> + * @link_healthy: link is healthy or not
>>    *
>>    * Return 1 on success, 0 on error.
>>    *
>>    * Note that @info is reused among all error devices. Clear fields properly.
>>    */
>> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
>> +                  bool link_healthy)
>>   {
>>       int type = pci_pcie_type(dev);
>>       int aer = dev->aer_cap;
>> @@ -1229,7 +1231,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>>       } else if (type == PCI_EXP_TYPE_ROOT_PORT ||
>>              type == PCI_EXP_TYPE_RC_EC ||
>>              type == PCI_EXP_TYPE_DOWNSTREAM ||
>> -           info->severity == AER_NONFATAL) {
>> +           info->severity == AER_NONFATAL ||
>> +           (info->severity == AER_FATAL && link_healthy)) {
>>           /* Link is still healthy for IO reads */
>>           pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
>> @@ -1258,11 +1261,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>>       /* Report all before handle them, not to lost records by reset etc. */
>>       for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
>> -        if (aer_get_device_error_info(e_info->dev[i], e_info))
>> +        if (aer_get_device_error_info(e_info->dev[i], e_info, false))
>>               aer_print_error(e_info->dev[i], e_info);
>>       }
>>       for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
>> -        if (aer_get_device_error_info(e_info->dev[i], e_info))
>> +        if (aer_get_device_error_info(e_info->dev[i], e_info, false))
>>               handle_error_source(e_info->dev[i], e_info);
>>       }
>>   }
>> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
>> index 62a68cde4364..b3f157a00405 100644
>> --- a/drivers/pci/pcie/dpc.c
>> +++ b/drivers/pci/pcie/dpc.c
>> @@ -304,7 +304,7 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>>           dpc_process_rp_pio_error(pdev);
>>       else if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR &&
>>            dpc_get_aer_uncorrect_severity(pdev, &info) &&
>> -         aer_get_device_error_info(pdev, &info)) {
>> +         aer_get_device_error_info(pdev, &info, false)) {
>>           aer_print_error(pdev, &info);
>>           pci_aer_clear_nonfatal_status(pdev);
>>           pci_aer_clear_fatal_status(pdev);
>> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
>> index 31090770fffc..462577b8d75a 100644
>> --- a/drivers/pci/pcie/err.c
>> +++ b/drivers/pci/pcie/err.c
>> @@ -196,6 +196,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>       struct pci_dev *bridge;
>>       pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
>>       struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
>> +    struct aer_err_info info;
>>       /*
>>        * If the error was detected by a Root Port, Downstream Port, RCEC,
>> @@ -223,6 +224,13 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>               pci_warn(bridge, "subordinate device reset failed\n");
>>               goto failed;
>>           }
>> +
>> +        info.severity = AER_FATAL;
>> +        /* Link recovered, report fatal errors of RCiEP or EP */
>> +        if ((type == PCI_EXP_TYPE_ENDPOINT ||
>> +             type == PCI_EXP_TYPE_RC_END) &&
>> +            aer_get_device_error_info(dev, &info, true))
>> +            aer_print_error(dev, &info);
> 
> IMO, error device information is more like a debug info. Can we change
> the print level of this info to debug?

Yes, but error device information is quite important for user to figure out the
device status and should not been ignored. We need it in production to analysis
server healthy.

> 
>>       } else {
>>           pci_walk_bridge(bridge, report_normal_detected, &status);
>>       }
>> @@ -259,6 +267,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>       if (host->native_aer || pcie_ports_native) {
>>           pcie_clear_device_status(dev);
>>           pci_aer_clear_nonfatal_status(dev);
>> +        pci_aer_clear_fatal_status(dev);
> 
> I think we clear fatal status in DPC driver, why do it again?

DPC driver only clear fatal status for the err_port, but not the err_dev.
err_dev and err_port are indeed easy to confuse, so I have differentiated them
again in patch1.

> 
>>       }
>>       pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
> 


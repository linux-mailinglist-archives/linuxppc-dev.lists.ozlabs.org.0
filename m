Return-Path: <linuxppc-dev+bounces-2945-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F239BFB5A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 02:24:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkPW91NN0z3bLS;
	Thu,  7 Nov 2024 12:24:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730942677;
	cv=none; b=WaV8w0X5g1A7GfnsR3FSVBGdawRZpP4F6wHAbPiUYhSwbT3CXa2WHxhcXOvmbR+Z5qU66DsoAb+yteQ+zqKudm9C5x+GIEyK6aLCvPRgjkMOKgdKK8NiMhI1HB7Kje1yuG55KxSWDMqPz71nexvnojeOtWlm7JraMlgLACrnGt/WqZlHnWYWC9YUTn/RhdYoOlzKdhvuX6FIVDcR1Yis/xwz6rDa41EbdL9kn8D08OkosNKrPnkPm1kJ8Ici31YC0CyF5IIpXDzqFQUi6JY+Mvkn3rFcVCmv5wxMKY0Z/nLj/VB2Yyw/jFFPcOKoH/C9aJ5I36mVjXIVwt8D1wangQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730942677; c=relaxed/relaxed;
	bh=Itk8OfYSM9GTNcP70yeJZDtysL1LQL3shaXCUP4B5XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOmv2W7RBAr8YgzZb1pXbCgMCz6iKP3SAYMhrUQiupCDCjdI9H9+aPy7IpodMKitQA649lbbq0jpTXdlDp1D0eEwjef4jXV3fDfiuhyZZ6h69Mh2YqsOLHTWo637HDJuDy9yz15QscVI5B4WrSbL6X7+utvp4JqKC5EI0oHLU9fATin+sYnntPz2AAEjh87C79iDv5O8e1PGyUuD2JGgCcyGPNjYErpKlOs1dXWCFsUC2XwgxqYypKKenmOaguUxS43VxQAqA3aUX0CipIMGXU02HGhEjn/2wN9c7gzpXplQNuBrkb47P6WBiG7NGYNNi/msBjrFh9vJiHwm888Onw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=n14sA7f8; dkim-atps=neutral; spf=pass (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=n14sA7f8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkPW4245Fz2ygy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 12:24:29 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730942664; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Itk8OfYSM9GTNcP70yeJZDtysL1LQL3shaXCUP4B5XU=;
	b=n14sA7f81ezfBQgavsVUOX9yB8yAbtCyI5wAJbiJ2BwVgA7L7ewazq32Wq1Nx2S5h8dDg+xd0IYgUPcX2YW7KqpoK4FKyfOKoQoouR8dVf2vRuiZ2tFsRad6io5+r/PrcxQOIil/AqsbgeDgQyo+1U2OvkF9nMddblUCdMXuafE=
Received: from 30.246.162.170(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WIthmGp_1730942661 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 07 Nov 2024 09:24:22 +0800
Message-ID: <3460223b-a57b-4ca4-9d34-2b520cfa1f42@linux.alibaba.com>
Date: Thu, 7 Nov 2024 09:24:20 +0800
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
To: Bjorn Helgaas <helgaas@kernel.org>, kbusch@kernel.org
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, mahesh@linux.ibm.com,
 oohall@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com
References: <20241106160238.GA1526691@bhelgaas>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20241106160238.GA1526691@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2024/11/7 00:02, Bjorn Helgaas 写道:
> On Wed, Nov 06, 2024 at 05:03:39PM +0800, Shuai Xue wrote:
>> The AER driver has historically avoided reading the configuration space of an
>> endpoint or RCiEP that reported a fatal error, considering the link to that
>> device unreliable. Consequently, when a fatal error occurs, the AER and DPC
>> drivers do not report specific error types, resulting in logs like:
>>
>> [  245.281980] pcieport 0000:30:03.0: EDR: EDR event received
>> [  245.287466] pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>> [  245.295372] pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>> [  245.300849] pcieport 0000:30:03.0: AER: broadcast error_detected message
>> [  245.307540] nvme nvme0: frozen state error detected, reset controller
>> [  245.722582] nvme 0000:34:00.0: ready 0ms after DPC
>> [  245.727365] pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>
>> But, if the link recovered after hot reset, we can safely access AER status of
>> the error device. In such case, report fatal error which helps to figure out the
>> error root case.
> 
> Explain why we can access these registers after reset.  I think it's
> important that these registers are sticky ("RW1CS" per spec).

Yes, AER error status registers are Sticky and Write-1-to-clear. If we 
does not read them after reset_subordinates, the registers will be 
cleared in pci_error_handlers, e.g. nvme_err_handler

   slot_reset() => nvme_slot_reset()
     pci_restore_state()
       pci_aer_clear_status()

Will add the reason in commit log.

> 
>> After this patch, the logs like:
>>
>> [  414.356755] pcieport 0000:30:03.0: EDR: EDR event received
>> [  414.362240] pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>> [  414.370148] pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>> [  414.375642] pcieport 0000:30:03.0: AER: broadcast error_detected message
>> [  414.382335] nvme nvme0: frozen state error detected, reset controller
>> [  414.645413] pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>> [  414.788016] nvme 0000:34:00.0: ready 0ms after DPC
>> [  414.796975] nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>> [  414.807312] nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>> [  414.815305] nvme 0000:34:00.0:    [ 4] DLP                    (First)
>> [  414.821768] pcieport 0000:30:03.0: AER: broadcast slot_reset message
> 
> Capitalize subject lines to match history (use "git log --oneline
> drivers/pci/pcie/aer.c" to see it).
> 
> Remove timestamps since they don't help understand the problem.
> 
> Indent the quoted material two spaces.
> 
> Wrap commit log to fit in 75 columns (except the quoted material;
> don't insert line breaks there).

Will do.

> 
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
>>   drivers/pci/pci.h      |  1 +
>>   drivers/pci/pcie/aer.c | 50 ++++++++++++++++++++++++++++++++++++++++++
>>   drivers/pci/pcie/err.c |  6 +++++
>>   3 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 0866f79aec54..143f960a813d 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -505,6 +505,7 @@ struct aer_err_info {
>>   };
>>   
>>   int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
>> +int aer_get_device_fatal_error_info(struct pci_dev *dev, struct aer_err_info *info);
>>   void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
>>   #endif	/* CONFIG_PCIEAER */
>>   
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index 13b8586924ea..0c1e382ce117 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -1252,6 +1252,56 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>>   	return 1;
>>   }
>>   
>> +/**
>> + * aer_get_device_fatal_error_info - read fatal error status from EP or RCiEP
>> + * and store it to info
>> + * @dev: pointer to the device expected to have a error record
>> + * @info: pointer to structure to store the error record
>> + *
>> + * Return 1 on success, 0 on error.
> 
> Backwards from the usual return value convention.

Yes. As @Keith pointed, aer_get_device_fatal_error_info() is copied from 
  aer_get_device_error_info(), I will try to add a helper to reduce 
duplication.

> 
>> + * Note that @info is reused among all error devices. Clear fields properly.
>> + */
>> +int aer_get_device_fatal_error_info(struct pci_dev *dev, struct aer_err_info *info)
>> +{
>> +	int type = pci_pcie_type(dev);
>> +	int aer = dev->aer_cap;
>> +	u32 aercc;
>> +
>> +	pci_info(dev, "type :%d\n", type);
> 
> I don't see this line in the sample output in the commit log.  Is this
> debug that you intended to remove?


Sorry, I missed this line, will remove it.

> 
>> +	/* Must reset in this function */
>> +	info->status = 0;
>> +	info->tlp_header_valid = 0;
>> +	info->severity = AER_FATAL;
>> +
>> +	/* The device might not support AER */
> 
> Unnecessary comment.

Will remove it.

Thank you for valuable comments.

Best Regards,
Shuai




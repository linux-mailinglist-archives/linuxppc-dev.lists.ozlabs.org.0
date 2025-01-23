Return-Path: <linuxppc-dev+bounces-5490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F924A19EAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 08:03:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdsNN73S7z300C;
	Thu, 23 Jan 2025 18:03:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737615796;
	cv=none; b=XEezdV3hUTxnePlu5XAROeO8JNXe/9HAIlvByNiuAjE3xqwZTxy/Sw13dkhxF8Wz0O7Sd7sVbPux9mYkSpW0CLaBDzFw6rmc9tYLsLHdW1RpaYLUkwei3aiQoRDXfxdtaJ5jI31onq5209E7OYoPau0NCWVMlcTm/vIyow/jpfLVz/RvMQLWMtzAT2q0M0cC0BpTz795II6Q+pxXNGKz9y8x2CdldBIDUc3FSoTHGaR3GjNwwOqagOpG3tGVVGRK6P+Xc414FAuajsyIL87lc242ip+6KfM8OqmBvYXBTqsDAyQIyxA69UKEpTEruC8SCiMvIcGZGzZKzkXx+0AsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737615796; c=relaxed/relaxed;
	bh=5C8aHaYEcDBY6Hou9Ze7bldqFBZdSLiEfzvyyxIGjzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5TOrrF8e/ElM+PDWCmtYrx9DfBWdyJLAG1cx5b6rIHRFXzmY16gxNQyIfSKKis0MaF53O/QIUhmxuJrFTZJgKpKHi3Y0sygAAXnJWEbFNRzzOxTZFK6Z/PvBENs0PrWG4JUK2pRpEB3eIkpMMDAMon0kAY0vEJOsjNsBOGiNrIawaZhE++l7JV5PuwcNKanHx+MzncJmgFyG1M/g7kO3sG0lp2W6lQcRJ8cJinuAaNVy9shaEvMArgKvrfsA2/aTDvLZWX+wGqTa2ERRb9sZIg9r6G3G1s45LX9GmwXKPLdjnwCw82l3dMZC2qF+d5bFgb4pckPOrYgS0kvqdMLeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EfKB9CtA; dkim-atps=neutral; spf=pass (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EfKB9CtA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdsNM1LfCz2yxP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 18:03:13 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1737615789; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5C8aHaYEcDBY6Hou9Ze7bldqFBZdSLiEfzvyyxIGjzc=;
	b=EfKB9CtAJHZTrv9pspt/Mun9M93XBmPLOwhf+QEoWi6LId+QNL9E7Al2QhKQHNqT+L4WBBpgd4ks1Jdj96RJ7z3HJ/B1wtBorh4SNpOsWu7kb1ypwWFYXbfn2vr8N5D/9oVMDDL8rXS1O2QhO8gf7UGWNLwvHUc9SIcmpuKoxRQ=
Received: from 30.246.161.230(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WOAkbLF_1737615785 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 23 Jan 2025 15:03:05 +0800
Message-ID: <3199a681-a31c-40c9-8a05-89cf38cd6eb8@linux.alibaba.com>
Date: Thu, 23 Jan 2025 15:03:03 +0800
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
Subject: Re: [PATCH v2 1/2] PCI/DPC: Run recovery on device that detected the
 error
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com
References: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
 <20241112135419.59491-2-xueshuai@linux.alibaba.com>
 <b109aca6-1eb2-43d2-b9c9-fb014d00bf7d@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <b109aca6-1eb2-43d2-b9c9-fb014d00bf7d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/1/23 12:53, Sathyanarayanan Kuppuswamy 写道:
> 
> On 11/12/24 5:54 AM, Shuai Xue wrote:
>> The current implementation of pcie_do_recovery() assumes that the
>> recovery process is executed on the device that detected the error.
>> However, the DPC driver currently passes the error port that experienced
>> the DPC event to pcie_do_recovery().
>>
>> Use the SOURCE ID register to correctly identify the device that detected the
>> error. By passing this error device to pcie_do_recovery(), subsequent
>> patches will be able to accurately access AER status of the error device.
> 
> When passing the error device, I assume pcie_do_recovery() will find the
> upstream bride and run the recovery logic .
> 

Yes, the pcie_do_recovery() will find the upstream bridge and walk bridges
potentially AER affected.

>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
> 
> IMO, moving the "err_port" rename to a separate patch will make this change
> more clear.  But it is up to you.

I see, I will add a separate patch.

> 
>>   drivers/pci/pci.h      |  2 +-
>>   drivers/pci/pcie/dpc.c | 30 ++++++++++++++++++++++++------
>>   drivers/pci/pcie/edr.c | 35 ++++++++++++++++++-----------------
>>   3 files changed, 43 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 14d00ce45bfa..0866f79aec54 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -521,7 +521,7 @@ struct rcec_ea {
>>   void pci_save_dpc_state(struct pci_dev *dev);
>>   void pci_restore_dpc_state(struct pci_dev *dev);
>>   void pci_dpc_init(struct pci_dev *pdev);
>> -void dpc_process_error(struct pci_dev *pdev);
>> +struct pci_dev *dpc_process_error(struct pci_dev *pdev);
>>   pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
>>   bool pci_dpc_recovered(struct pci_dev *pdev);
>>   #else
>> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
>> index 2b6ef7efa3c1..62a68cde4364 100644
>> --- a/drivers/pci/pcie/dpc.c
>> +++ b/drivers/pci/pcie/dpc.c
>> @@ -257,10 +257,17 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>>       return 1;
>>   }
>> -void dpc_process_error(struct pci_dev *pdev)
>> +/**
>> + * dpc_process_error - handle the DPC error status
> 
> Handling the DPC error status has nothing to do with finding
> the error source. Why not add a new helper function?

As PCIe Spec,

     DPC Error Source ID - When the DPC Trigger Reason field indicates that DPC
     was triggered due to the reception of an ERR_NONFATAL or ERR_FATAL, this
     register contains the Requester ID of the received Message. Otherwise, the
     value of this register is undefined.

To find the error source, we need to

   - check the error reason from PCI_EXP_DPC_STATUS,
   - Identify the error device by PCI_EXP_DPC_SOURCE_ID for ERR_NONFATAL and
     ERR_FATAL reason.

The code will duplicate with dpc_process_error. Therefore, I directly reused
dpc_process_error.

> 
>> + * @pdev: the port that experienced the containment event
>> + *
>> + * Return the device that experienced the error.
> detected the error?

Will change it.

>> + */
>> +struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>>   {
>>       u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
>>       struct aer_err_info info;
>> +    struct pci_dev *err_dev = NULL;
> 
> I don't think you need NULL initialization here.

Will remove it.

> 
>>       pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>>       pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
>> @@ -283,6 +290,13 @@ void dpc_process_error(struct pci_dev *pdev)
>>            "software trigger" :
>>            "reserved error");
>> +    if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE ||
>> +        reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE)
>> +        err_dev = pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
>> +                        PCI_BUS_NUM(source), source & 0xff);
>> +    else
>> +        err_dev = pci_dev_get(pdev);
>> +
>>       /* show RP PIO error detail information */
>>       if (pdev->dpc_rp_extensions &&
>>           reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT &&
>> @@ -295,6 +309,8 @@ void dpc_process_error(struct pci_dev *pdev)
>>           pci_aer_clear_nonfatal_status(pdev);
>>           pci_aer_clear_fatal_status(pdev);
>>       }
>> +
>> +    return err_dev;
>>   }
>>   static void pci_clear_surpdn_errors(struct pci_dev *pdev)
>> @@ -350,21 +366,23 @@ static bool dpc_is_surprise_removal(struct pci_dev *pdev)
>>   static irqreturn_t dpc_handler(int irq, void *context)
>>   {
>> -    struct pci_dev *pdev = context;
>> +    struct pci_dev *err_port = context, *err_dev = NULL;
> 
> NULL initialization is not needed.

Will remove it.

Thanks for valuable comments.

Best Regards,
Shuai


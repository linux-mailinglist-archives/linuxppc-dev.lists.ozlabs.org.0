Return-Path: <linuxppc-dev+bounces-9520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E7ADFDA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 08:29:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bN9fy6Wwlz2xjN;
	Thu, 19 Jun 2025 16:28:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750314538;
	cv=none; b=Z4vNi/ng6mOcBaJk26+yE4ygE7WiqyrQ+R9j8xMU7QHdCLvPcLjTMOwfnYx9/V6G2puR3slgAqf2jEdvgWkuqfJ5p4+c+T3nUXQhg6DvIqxo1anSAqM0/s6EkTy3+LHmmU/s0IG/n4u52E2OgNvQx1Pl8gK+egy+xtGTSmCrFX21G9SFRCDleqbC3W+6GwE8SKk4Yh15lcGYp7IAq9NQgBHBJSP6cEMi+/smC6np8RxnwrgXFlXeAIM9eKszY8ouKaVnRaWms2oEg3Qhq1Xs1pL1OTgyQgSiMATCRslWyUnyEUH+G1dhYn94UXr/yZAshMioKN3oDb9dDC2VtKS1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750314538; c=relaxed/relaxed;
	bh=LrUxquuV08mTQNkniPuw6NWVbLTKkOod1+c0DYOXFIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MbVrUDqsBDmbz5kY2a0r+hzqB29tl10e9DdVhQ3cJDu2aEKxwSssPJ9E1gdG+R/7DfegNS5pewmJfphhOq2twEubCf5BsbVCBagRXWKipPDks0Tb7tIwqMeHRISKvMJ/XyrYum7j1/3eE3DzGKT2uOVcmap7ghXIUUKoMddjVGriSyqmMk9bDd782Rw8Un52U+1JYni7+OdFknvOUg6sc1lK7inAi5oZaaLOI5r6jJC7eX09IZJID1Mu/o/sCEYXe3qVDTBqZr1Rvjfp3hiX5ktkOlvUtkJRrQA4BhJORTyNig24suNkFDwqVdE9B0tTtTaPMRgySLQYNkxd+4L02Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ByPksnNK; dkim-atps=neutral; spf=pass (client-ip=115.124.30.97; helo=out30-97.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ByPksnNK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.97; helo=out30-97.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bN9fw52h5z2xck
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 16:28:55 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750314530; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=LrUxquuV08mTQNkniPuw6NWVbLTKkOod1+c0DYOXFIE=;
	b=ByPksnNKd6iTAFhrqMX6Cezz5QFgLtnTiUNkj9SbzdDMYrzL0GBbvHLoeD3fg+tKnaVvK5mEn+x0BJ8Jkk5WZgvXAW57Qi/BFGkxq4Wrd+zjfp47y4F1cn/pZXMa5SfyfWSBIV+MtMXBkeNSiJNJ6L8kkikeUB75BrYWunbC1qY=
Received: from 30.221.131.111(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WeGLlC3_1750314527 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Jun 2025 14:28:48 +0800
Message-ID: <7d8bd8d5-63bc-4a52-afa1-b6e3738a188e@linux.alibaba.com>
Date: Thu, 19 Jun 2025 14:28:47 +0800
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
Subject: Re: [PATCH v4 2/3] PCI/DPC: Run recovery on device that detected the
 error
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, mahesh@linux.ibm.com,
 oohall@gmail.com, Jonathan.Cameron@huawei.com, terry.bowman@amd.com,
 tianruidong@linux.alibaba.com
References: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
 <20250217024218.1681-3-xueshuai@linux.alibaba.com>
 <qqixmrgqnba6hlt4fritlknfnbe6zm63qgxhoep4oriinbozyt@f6tzmjpyaf6d>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <qqixmrgqnba6hlt4fritlknfnbe6zm63qgxhoep4oriinbozyt@f6tzmjpyaf6d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/6/12 18:31, Manivannan Sadhasivam 写道:
> On Mon, Feb 17, 2025 at 10:42:17AM +0800, Shuai Xue wrote:
>> The current implementation of pcie_do_recovery() assumes that the
>> recovery process is executed on the device that detected the error.
> 
> s/on/for
> 
>> However, the DPC driver currently passes the error port that experienced
>> the DPC event to pcie_do_recovery().
>>
>> Use the SOURCE ID register to correctly identify the device that
>> detected the error. When passing the error device, the
>> pcie_do_recovery() will find the upstream bridge and walk bridges
>> potentially AER affected. And subsequent patches will be able to
> 
> s/patches/commits

Will fix the typos.
> 
>> accurately access AER status of the error device.
>>
>> Should not observe any functional changes.
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
>>   drivers/pci/pci.h      |  2 +-
>>   drivers/pci/pcie/dpc.c | 28 ++++++++++++++++++++++++----
>>   drivers/pci/pcie/edr.c |  7 ++++---
>>   3 files changed, 29 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 01e51db8d285..870d2fbd6ff2 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -572,7 +572,7 @@ struct rcec_ea {
>>   void pci_save_dpc_state(struct pci_dev *dev);
>>   void pci_restore_dpc_state(struct pci_dev *dev);
>>   void pci_dpc_init(struct pci_dev *pdev);
>> -void dpc_process_error(struct pci_dev *pdev);
>> +struct pci_dev *dpc_process_error(struct pci_dev *pdev);
>>   pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
>>   bool pci_dpc_recovered(struct pci_dev *pdev);
>>   unsigned int dpc_tlp_log_len(struct pci_dev *dev);
>> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
>> index 1a54a0b657ae..ea3ea989afa7 100644
>> --- a/drivers/pci/pcie/dpc.c
>> +++ b/drivers/pci/pcie/dpc.c
>> @@ -253,10 +253,20 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>>   	return 1;
>>   }
>>   
>> -void dpc_process_error(struct pci_dev *pdev)
>> +/**
>> + * dpc_process_error - handle the DPC error status
>> + * @pdev: the port that experienced the containment event
>> + *
>> + * Return the device that detected the error.
> 
> s/Return/Return:
> 
>> + *
>> + * NOTE: The device reference count is increased, the caller must decrement
>> + * the reference count by calling pci_dev_put().
>> + */
>> +struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>>   {
>>   	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
>>   	struct aer_err_info info;
>> +	struct pci_dev *err_dev;
>>   
>>   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>>   	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
>> @@ -279,6 +289,13 @@ void dpc_process_error(struct pci_dev *pdev)
>>   		 "software trigger" :
>>   		 "reserved error");
>>   
>> +	if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE ||
>> +	    reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE)
>> +		err_dev = pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
>> +					    PCI_BUS_NUM(source), source & 0xff);
>> +	else
>> +		err_dev = pci_dev_get(pdev);
>> +
>>   	/* show RP PIO error detail information */
>>   	if (pdev->dpc_rp_extensions &&
>>   	    reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT &&
>> @@ -291,6 +308,8 @@ void dpc_process_error(struct pci_dev *pdev)
>>   		pci_aer_clear_nonfatal_status(pdev);
>>   		pci_aer_clear_fatal_status(pdev);
>>   	}
>> +
>> +	return err_dev;
>>   }
>>   
>>   static void pci_clear_surpdn_errors(struct pci_dev *pdev)
>> @@ -346,7 +365,7 @@ static bool dpc_is_surprise_removal(struct pci_dev *pdev)
>>   
>>   static irqreturn_t dpc_handler(int irq, void *context)
>>   {
>> -	struct pci_dev *err_port = context;
>> +	struct pci_dev *err_port = context, *err_dev;
>>   
>>   	/*
>>   	 * According to PCIe r6.0 sec 6.7.6, errors are an expected side effect
>> @@ -357,10 +376,11 @@ static irqreturn_t dpc_handler(int irq, void *context)
>>   		return IRQ_HANDLED;
>>   	}
>>   
>> -	dpc_process_error(err_port);
>> +	err_dev = dpc_process_error(err_port);
>>   
>>   	/* We configure DPC so it only triggers on ERR_FATAL */
>> -	pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
>> +	pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
>> +	pci_dev_put(err_dev);
>>   
>>   	return IRQ_HANDLED;
>>   }
>> diff --git a/drivers/pci/pcie/edr.c b/drivers/pci/pcie/edr.c
>> index 521fca2f40cb..088f3e188f54 100644
>> --- a/drivers/pci/pcie/edr.c
>> +++ b/drivers/pci/pcie/edr.c
>> @@ -150,7 +150,7 @@ static int acpi_send_edr_status(struct pci_dev *pdev, struct pci_dev *edev,
>>   
>>   static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>>   {
>> -	struct pci_dev *pdev = data, *err_port;
>> +	struct pci_dev *pdev = data, *err_port, *err_dev;
>>   	pci_ers_result_t estate = PCI_ERS_RESULT_DISCONNECT;
>>   	u16 status;
>>   
>> @@ -190,7 +190,7 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>>   		goto send_ost;
>>   	}
>>   
>> -	dpc_process_error(err_port);
>> +	err_dev = dpc_process_error(err_port);
>>   	pci_aer_raw_clear_status(err_port);
>>   
>>   	/*
>> @@ -198,7 +198,7 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>>   	 * or ERR_NONFATAL, since the link is already down, use the FATAL
>>   	 * error recovery path for both cases.
>>   	 */
>> -	estate = pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
>> +	estate = pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
>>   
>>   send_ost:
>>   
>> @@ -216,6 +216,7 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
>>   	}
>>   
>>   	pci_dev_put(err_port);
>> +	pci_dev_put(err_dev);
> 
> err_dev is not a valid pointer before calling dpc_process_error(). So either
> initialize it with NULL or only call it in error paths after
> dpc_process_error().
> 
> And btw, pci_dev_put(err_dev) should come before pci_dev_put(err_port).
> 
> - Mani
> 

You are right.

Will send a new patch to fix it.

Thanks.
Shuai


Return-Path: <linuxppc-dev+bounces-8667-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3323BABC02A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 16:04:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1KDY5TdPz2yhv;
	Tue, 20 May 2025 00:04:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747663453;
	cv=none; b=W+/RwvEaQG3bVnMrneMol9n//s/VK8K1XzOL8HxllT+2Z6rzoKVomHZLp0yJtbRhddkEZ9eV0cRpmuzbO7GYZbhY81+Tqn+PRvqvAiNkMIt402+TPPzgSxZ9QEgOEKpQPAdFMM/cXmRrVLVwUJhiTIYUmBBVe/h/qDHC5FMHQTVkmPfsS6fjmg8w4tUO/HqYOwdQh8ocklRGLj1nE0PfZ8lwVGcqNlYayoQO453CaS631xqJVHKMrwIVFEqAp31zi+YGccGzgKWtv2KyDLstWyNCzTf/xXXhex2dSxmVoBPLftO0o/G2xoYnenkXgGJELH63oIGcpgbjh/wONHaCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747663453; c=relaxed/relaxed;
	bh=w5WmlRLBiaSyBNP62+3UzxDW04RPKWnE0s58YY3pWoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0q2iXXjWYBbY/dVlPMgOEsszk0aXVqZEdLq264uDc+8au61Q7tLiof9fpBnRKHHt+Ti2IaQCeQ0StjlZ39W1OCBA6y06nJtpB+YFUzClgPiaTOeAvRMg4fKdd3/F4FHW8iKWluhHStWfVnMijHlnLcsf7ZTAvSRnCIlNvqfd8In3yhslGy8IXW+BqT9tkocZjSl4UwKQKB4qtPSFYW9gBrdTCxk7pxmZMJve9pt7I/Qg41xTff0k795PFC8MT+nmSmxGbFKeUnvbqW4sDcSYolOmRJifsPyMqZL4pyZPtRYHKS0y+UbwdI1ArVbFcP9D36kEjx1MKIO90vWb4RO4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ffyDfyS6; dkim-atps=neutral; spf=pass (client-ip=117.135.210.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ffyDfyS6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1KDW52vmz2yhV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 00:04:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=w5WmlRLBiaSyBNP62+3UzxDW04RPKWnE0s58YY3pWoQ=;
	b=ffyDfyS6/Sye1aNzIMf3Rx+icmkqMACwSvMovxfXiCqUcshMSAj2jMlfuSZsev
	gAmwPb9UkhuPFKi/JpZYmTQc5Q+8vznlWOfCvc/HkjtUW7/LPi9MypWEq0lB0WLK
	/oEOp9B38hEVClJZn8sjuuRjKWO0fYiwynfMwHWFHFaYc=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wC3T8srOitoOT5PCg--.21492S2;
	Mon, 19 May 2025 22:03:24 +0800 (CST)
Message-ID: <f3033cfb-6a70-4fa3-bf06-ee79517ef740@163.com>
Date: Mon, 19 May 2025 22:03:25 +0800
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
Subject: Re: [PATCH 3/4] PCI/AER: Expose AER panic state via
 pci_aer_panic_enabled()
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 bhelgaas@google.com, tglx@linutronix.de, kw@linux.com,
 manivannan.sadhasivam@linaro.org, mahesh@linux.ibm.com
Cc: oohall@gmail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Hans Zhang <hans.zhang@cixtech.com>
References: <20250516165518.125495-1-18255117159@163.com>
 <20250516165518.125495-4-18255117159@163.com>
 <6d946767-aa61-441d-965b-115e415bfd4f@linux.intel.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <6d946767-aa61-441d-965b-115e415bfd4f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3T8srOitoOT5PCg--.21492S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr1kGr4DZw1rXrWrKrWfKrg_yoW5GF1DpF
	WrJa4UArW8GFy8WFZ7Z3W8ZFyrZ3s7tryrArWxG3y8uFnxA3WrJF93AFyUWFn7Xr4DuF1a
	yF1jyrnxGF45taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBrWwUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwlSo2grOTwcZgAAsL
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/5/17 12:07, Sathyanarayanan Kuppuswamy wrote:
> 
> On 5/16/25 9:55 AM, Hans Zhang wrote:
>> From: Hans Zhang <hans.zhang@cixtech.com>
>>
>> Add pci_aer_panic_enabled() to check if aer_panic is enabled system-wide.
>> Export the function for use in error recovery logic.
>>
>> Signed-off-by: Hans Zhang <hans.zhang@cixtech.com>
>> ---
>>   drivers/pci/pci.h      |  2 ++
>>   drivers/pci/pcie/aer.c | 12 ++++++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 8ddfc1677eeb..f92928dadc6a 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -959,6 +959,7 @@ static inline void 
>> of_pci_remove_host_bridge_node(struct pci_host_bridge *bridge
>>   #ifdef CONFIG_PCIEAER
>>   void pci_no_aer(void);
>>   void pci_aer_panic(void);
>> +bool pci_aer_panic_enabled(void);
>>   void pci_aer_init(struct pci_dev *dev);
>>   void pci_aer_exit(struct pci_dev *dev);
>>   extern const struct attribute_group aer_stats_attr_group;
>> @@ -970,6 +971,7 @@ void pci_restore_aer_state(struct pci_dev *dev);
>>   #else
>>   static inline void pci_no_aer(void) { }
>>   static inline void pci_aer_panic(void) { }
>> +static inline bool pci_aer_panic_enabled(void) { return false; }
>>   static inline void pci_aer_init(struct pci_dev *d) { }
>>   static inline void pci_aer_exit(struct pci_dev *d) { }
>>   static inline void pci_aer_clear_fatal_status(struct pci_dev *dev) { }
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index fa51fb8a5fe7..4fd7db90b77c 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -125,6 +125,18 @@ void pci_aer_panic(void)
>>       pcie_aer_panic = true;
>>   }
>> +/**
>> + * pci_aer_panic_enabled() - Are AER panic enabled system-wide?
>> + *
>> + * Return: true if AER panic has not been globally disabled through 
>> ACPI FADT,
>> + * PCI bridge quirks, or the "pci=aer_panic" kernel command-line option.
> 
> I don't think we have code to disable it via ACPI FADT or PCI bridge quirks
> currently, right? If yes, just list what is currently supported.
> 

Dear Sathyanarayanan,

Thank you very much for your reply. You're right. If this series of 
patches is supported in the discussion, I will remove the comment "ACPI 
FADT, PCI bridge quirks" in the next version.

Best regards,
Hans

>> + */
>> +bool pci_aer_panic_enabled(void)
>> +{
>> +    return pcie_aer_panic;
>> +}
>> +EXPORT_SYMBOL(pci_aer_panic_enabled);
>> +
>>   bool pci_aer_available(void)
>>   {
>>       return !pcie_aer_disable && pci_msi_enabled();
> 



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A52D25ED7D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 10:33:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McqWL4kHGz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 18:33:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=CfEdIZt8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=CfEdIZt8;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McqVl4KKBz2xsD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 18:32:29 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id cv6so1758580pjb.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=AnfHroM50E8P0Ii+iSU31sgRh6u2MaB02I2cVNNuq8I=;
        b=CfEdIZt8l1WQDjOyQeWDMyKnvk4S7PxcJFyRFVhbdYdCj4+oumy2rfrw2svHEvFosM
         0YwVNJfK/5UCtOQO7rhnbQWs0BxHkcRGp+07m8J1nbKZ2R1p1HX3KE3Ac25PmhufYIWS
         bm0o324L/Xfg7OcOyc1cUkiz43Lsz2SKgSsN7e39qw1HBrYi6ZEcORTNwdY18gyBXdPy
         hkSX+wFNH5YVKZ0+1jKMoU3YlJdrvo6snbz6SD9PoDA7ik6QHgrqMOgebo10BuEbSuj9
         s0nrkc6fwAe6/lLOcMj5RzzPCqEsCIuINiTsZwiAU6wbnfn5DfzefbFPVlWRWNMFskH2
         f7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AnfHroM50E8P0Ii+iSU31sgRh6u2MaB02I2cVNNuq8I=;
        b=35h+h9xrf4m3Hz3MIF1pJcc2WJccQWxOHG5ixKV94qPSpeiBdD9UvYrXDcqRwUaTRz
         /9XLfS4jm16Kaoy9IV8PXR1hcnXyfps5p91rd5zq/QbMV0YGNscNLPh5lca9jMyDDQJn
         ye1nihaCGxYOdD8BWrRRGmQmnI7IoPR1yVsgWUwMq9q7FN4DGunD0/o2kupv9zuWL5zm
         GapngAOKIxOYQmD3wahqgH+jv9IuqKrqpLiPkakjNCJm8MwEfnuQ3FtopPnfRW6/qF8r
         A/78tTY+LUzoUIfjVMpDIxzKCipbm+uEH77Qt8RjLSI5bh38ifA8itwJA/70xcfq/MwT
         vIRg==
X-Gm-Message-State: ACrzQf0B8wMYFGcJ/BFgq7ZN0o7H5YYv7sIUXYHpqcV0B0Pr85yT56rO
	z+TKCgxkf18s8NcBWKYKqlDzlw==
X-Google-Smtp-Source: AMsMyM5LGu2rD0qQqLi/ZxdXqiVouuXIGTsKuwQkqeI9oSkcI/4nd83sN8JuM2eiL086bz1TLAJQCQ==
X-Received: by 2002:a17:903:40cc:b0:177:e44f:1fff with SMTP id t12-20020a17090340cc00b00177e44f1fffmr32460026pld.133.1664353946549;
        Wed, 28 Sep 2022 01:32:26 -0700 (PDT)
Received: from [10.2.223.68] ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id n9-20020aa79849000000b0055abc22a1absm647459pfq.209.2022.09.28.01.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:32:26 -0700 (PDT)
Message-ID: <e0a1b90d-8e60-bf04-1335-ec194049da31@bytedance.com>
Date: Wed, 28 Sep 2022 16:32:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v2 1/9] PCI/AER: Add
 pci_aer_clear_uncorrect_error_status() to PCI core
Content-Language: en-US
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
 <20220927153524.49172-2-chenzhuo.1@bytedance.com>
 <564e778a-4ed8-3907-1cb3-34af109d0ce0@linux.intel.com>
From: Zhuo Chen <chenzhuo.1@bytedance.com>
In-Reply-To: <564e778a-4ed8-3907-1cb3-34af109d0ce0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: allenbh@gmail.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/28/22 3:31 AM, Sathyanarayanan Kuppuswamy wrote:
> Hi,
> 
> On 9/27/22 8:35 AM, Zhuo Chen wrote:
>> Sometimes we need to clear aer uncorrectable error status, so we add
> 
> Adding n actual use case will help.
> 
>> pci_aer_clear_uncorrect_error_status() to PCI core.
> 
> If possible, try to avoid "we" usage in commit log. Just say "so add
> pci_aer_clear_uncorrect_error_status() function"
> 
>>
>> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
>> ---
>>   drivers/pci/pcie/aer.c | 16 ++++++++++++++++
>>   include/linux/aer.h    |  5 +++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index e2d8a74f83c3..4e637121be23 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -286,6 +286,22 @@ void pci_aer_clear_fatal_status(struct pci_dev *dev)
>>   		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
>>   }
>>   
>> +int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev)
>> +{
>> +	int aer = dev->aer_cap;
>> +	u32 status;
>> +
>> +	if (!pcie_aer_is_native(dev))
>> +		return -EIO;
>> +
>> +	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, &status);
>> +	if (status)
>> +		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
> 
> Why not just write all '1' and clear it? Why read and write?

Hi Sathyanarayanan,

The current implementation and the previous implementation are all first 
read and then write to clear the status. Currently just be consistent 
with them:
  - aer_enable_rootport()
  - pci_aer_raw_clear_status()
  - pcibios_plat_dev_init() in arch/mips/pci/pci-octeon.c
  - commit fd3362cb73de ("PCI/AER: Squash aerdrv_core.c into aerdrv.c")
    pci_cleanup_aer_uncorrect_error_status
> 
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(pci_aer_clear_uncorrect_error_status);
> 
> Add details about why you want to export in commit log.

Thanks,

I will add details and improve commit log in next version.
> 
>> +
>>   /**
>>    * pci_aer_raw_clear_status - Clear AER error registers.
>>    * @dev: the PCI device
>> diff --git a/include/linux/aer.h b/include/linux/aer.h
>> index 97f64ba1b34a..154690c278cb 100644
>> --- a/include/linux/aer.h
>> +++ b/include/linux/aer.h
>> @@ -45,6 +45,7 @@ struct aer_capability_regs {
>>   int pci_enable_pcie_error_reporting(struct pci_dev *dev);
>>   int pci_disable_pcie_error_reporting(struct pci_dev *dev);
>>   int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
>> +int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev);
>>   void pci_save_aer_state(struct pci_dev *dev);
>>   void pci_restore_aer_state(struct pci_dev *dev);
>>   #else
>> @@ -60,6 +61,10 @@ static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>>   {
>>   	return -EINVAL;
>>   }
>> +static inline int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev)
>> +{
>> +	return -EINVAL;
>> +}
>>   static inline void pci_save_aer_state(struct pci_dev *dev) {}
>>   static inline void pci_restore_aer_state(struct pci_dev *dev) {}
>>   #endif
> 

-- 
Thanks,
Zhuo Chen

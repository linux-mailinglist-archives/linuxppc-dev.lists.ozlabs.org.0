Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF915ED3E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 06:31:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mck8r2LW9z3c7l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 14:31:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aw2BsRX1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aw2BsRX1;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mck8B3pGYz2xvr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 14:31:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664339466; x=1695875466;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dpjycpQPackQteLHBBGJE4Wm5YPd9EdeBKzweZPn9SA=;
  b=aw2BsRX1w5YXGaoX+VVUuu6KCF+mEDl5woe6ZSSb6JXyaNw3P1KIzpw3
   1R1RQ+Oq+aTeN+4Kx6MqGpWYX5MSMCRLZwKLXY7K1REjjpyyB6TnfLasR
   XbivebrO4twzjfRoc9qEDmyNj7WyU/gB32q/U17ABL+g/PMgPZYvjXAuT
   P8+d8+Et7Ip8CHuU7LEuGkxqu3gjGoI27xKnrxdx8gBhbeS/3TVUXAq4U
   6vSbaBQ6/bMGepxaXkixj34+jJ8UUAxivzjHmpPbAZyAYgXEfE7e92oFj
   icS6PpmtaKwUJNJpKc29lQGKH44g2oT1Fwih+jxmQf0vELnt8x97UthWR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="299099157"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="299099157"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 21:30:51 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="684250788"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="684250788"
Received: from weimingg-mobl.amr.corp.intel.com (HELO [10.212.244.112]) ([10.212.244.112])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 21:30:51 -0700
Message-ID: <d3a5edb8-03cb-2ecb-b54c-9a2e05765805@linux.intel.com>
Date: Tue, 27 Sep 2022 21:30:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [External] Re: [PATCH v2 3/9] NTB: Change to use
 pci_aer_clear_uncorrect_error_status()
Content-Language: en-US
To: Zhuo Chen <chenzhuo.1@bytedance.com>, bhelgaas@google.com,
 ruscur@russell.cc, oohall@gmail.com, fancer.lancer@gmail.com,
 jdmason@kudzu.us, dave.jiang@intel.com, allenbh@gmail.com,
 james.smart@broadcom.com, dick.kennedy@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com
References: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
 <20220927153524.49172-4-chenzhuo.1@bytedance.com>
 <d8123aa3-a5e0-6131-bd0d-109f67923ff2@linux.intel.com>
 <1d62d0ac-b47c-94b5-dd75-b7df71817d0d@bytedance.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <1d62d0ac-b47c-94b5-dd75-b7df71817d0d@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-pci@vger.kernel.org, ntb@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/27/22 9:20 PM, Zhuo Chen wrote:
> 
> 
> On 9/28/22 3:39 AM, Sathyanarayanan Kuppuswamy wrote:
>>
>>
>> On 9/27/22 8:35 AM, Zhuo Chen wrote:
>>> Status bits for ERR_NONFATAL errors only are cleared in
>>> pci_aer_clear_nonfatal_status(), but we want clear uncorrectable
>>> error status in idt_init_pci(), so we change to use
>>> pci_aer_clear_uncorrect_error_status().
>>
>> You mean currently driver does not clear fatal errors now, and it is
>> a problem? Any error reported?
>>
> Hi Sathyanarayanan,
> 
> No error reports yet, I just changes the behavior back to what it was before commit e7b0b847de6d ("PCI/AER: Clear only ERR_NONFATAL bits during non-fatal recovery"), because this commit change the original function in commit bf2a952d31d2 ("NTB: Add IDT 89HPESxNTx PCIe-switches support").
> 

Ok. Thanks for clarifying.

>> Also, I am wondering why is it required to clear errors during init
>> code. Is it a norm?
>>
> I think there is no need to clear errors during init code.
>>>
>>> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
>>> ---
>>>   drivers/ntb/hw/idt/ntb_hw_idt.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
>>> index 0ed6f809ff2e..d5f0aa87f817 100644
>>> --- a/drivers/ntb/hw/idt/ntb_hw_idt.c
>>> +++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
>>> @@ -2657,8 +2657,8 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
>>>       ret = pci_enable_pcie_error_reporting(pdev);
>>>       if (ret != 0)
>>>           dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
>>> -    else /* Cleanup nonfatal error status before getting to init */
>>> -        pci_aer_clear_nonfatal_status(pdev);
>>> +    else /* Cleanup uncorrectable error status before getting to init */
>>> +        pci_aer_clear_uncorrect_error_status(pdev);
>>>         /* First enable the PCI device */
>>>       ret = pcim_enable_device(pdev);
>>
> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

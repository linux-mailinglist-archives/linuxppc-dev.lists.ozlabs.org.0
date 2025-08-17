Return-Path: <linuxppc-dev+bounces-11073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C69B293BE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Aug 2025 17:08:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c4fPg1MnQz2xgQ;
	Mon, 18 Aug 2025 01:08:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755443335;
	cv=none; b=RYcVW2CJUarEVObrCZ5CJ1TkwzvOGHcBPCveXd/Q0XzCv7R8Piqbw5qBuFmEWsYrFOJ/2vWLSsOfcIRtkojzgWny8RggzFKwjUKvAXn7qJmgSg101JaTD3D628Rc4XbGI4ZgndbIp//vSXyVQNRAwJAtVcZ6HiQrILC1ylSWJIGln65VCFe1R1c5Pqp7A2yUAyyV6sddRl5+sYuqRt3mhB9jbPAbuz+9mVCPh34CgtnHREQQrkuy67Iy+4x9NkT1VUtM7HkU5dEGkoQN5/djcruda88PtXXjC0QpnyYj6XFp4JOH9fFw/no1/o7NNDxQa/935JqoIaADLl8e6B1Kow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755443335; c=relaxed/relaxed;
	bh=Nh9VtSmIvZ6GYEv/OaxHwtfzdia7HWB/NNDWbUf/1ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOI4Qoqu1FMurIoX2kwhqITmzC+K+WW5I15u3zx9rQUluh+kc+vZVQszlPr+Rk47lQ+we+rrg6OFoXnov401zZ5slYZFsvI/LdB7AHX/KGifnlr26a9JyWQPN10AWXuawLuFoTqvl54I2VQ5Eio2Xq2J1lRjqE8FpOv9KnAmsdNJ8nUkFjj2Mx75ui7BfgBsoEJFUk8xtwlwB+/H+B3AfXtoA/UMcjT5QKV8BfnzrIplRqvXqYCJ0bcjXlbt6OSCY6Xfwj7R/5XWlaNzwgWNHrE7cUTTbUP8L32OUjqE1i1EvR2Ifd8q4bQB1yyD96QubAEVQHRMK25v0hrGTUqbfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RALJ+BR8; dkim-atps=neutral; spf=pass (client-ip=117.135.210.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RALJ+BR8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 82227 seconds by postgrey-1.37 at boromir; Mon, 18 Aug 2025 01:08:52 AEST
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c4fPc3lSMz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 01:08:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Nh9VtSmIvZ6GYEv/OaxHwtfzdia7HWB/NNDWbUf/1ug=;
	b=RALJ+BR87H3/NAZQHDCTrE6qZA1RQx1+qp5Iz+ukwudl1zoVySZo3vhY+3dsUX
	TUt2Y7zENiLAlx7wTUsgjXeTCDIkZh+U1sTpLsY4CbdD7WxRHaWh2IL8AybsifS8
	0gdBjOlSN7pmyoPxUGgaiv/r5mtbI4mkuuAf2PDZ864Xc=
Received: from [IPV6:240e:b8f:919b:3100:3980:6173:5059:2d2a] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAH0F5B8KFokuwsCg--.33766S2;
	Sun, 17 Aug 2025 23:07:46 +0800 (CST)
Message-ID: <c965d655-8423-435b-ade7-6bd02e5989b0@163.com>
Date: Sun, 17 Aug 2025 23:07:44 +0800
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
Subject: Re: [PATCH v3] PCI/AER: Use pci_clear_and_set_config_dword() to
 simplify mask updates
To: Lukas Wunner <lukas@wunner.de>
Cc: mahesh@linux.ibm.com, bhelgaas@google.com, oohall@gmail.com,
 mani@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250816161743.340684-1-18255117159@163.com>
 <aKDpIeQgt7I9Ts8F@wunner.de>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aKDpIeQgt7I9Ts8F@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wAH0F5B8KFokuwsCg--.33766S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw43ZrW3Xw48ZF45Ar4Utwb_yoWrJr4kpr
	Z8JF4rJrWUJF1YvrWDXaykArnYvr9rtFy8Kr93Gas5ZF4UuFZrJF9av347Jw1UKFZ5Xw4r
	Jw4rKan5Zr4UtaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UIeHgUUUUU=
X-Originating-IP: [240e:b8f:919b:3100:3980:6173:5059:2d2a]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWxmso2ih7swDZwABsD
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/8/17 04:25, Lukas Wunner wrote:
> On Sun, Aug 17, 2025 at 12:17:43AM +0800, Hans Zhang wrote:
>> Replace manual read-modify-write sequences in multiple functions with
>> pci_clear_and_set_config_dword() helper to reduce code duplication.
> 
> None of the occurrences you're replacing is clearing *and* setting
> bits at the same time.  They all either clear or set bits, but not both.
> 
> For the PCIe Capability, there are pcie_capability_clear_dword()
> and pcie_capability_set_dword() helpers.
> 
> It would arguably be clearer and less confusing to introduce similar
> pci_clear_config_dword() and pci_set_config_dword() helpers and use
> those, instead of using pci_clear_and_set_config_dword() and setting
> one argument to 0.
> 

Dear Lukas,

Thank you very much for your reply and suggestions.

In the next version, I will introduce two helper functions, 
pci_clear_config_dword() and pci_set_config_dword().

Best regards,
Hans


> Thanks,
> 
> Lukas
> 
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index e286c197d716..3d37e2b7e412 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -176,14 +176,13 @@ static int enable_ecrc_checking(struct pci_dev *dev)
>>   static int disable_ecrc_checking(struct pci_dev *dev)
>>   {
>>   	int aer = dev->aer_cap;
>> -	u32 reg32;
>>   
>>   	if (!aer)
>>   		return -ENODEV;
>>   
>> -	pci_read_config_dword(dev, aer + PCI_ERR_CAP, &reg32);
>> -	reg32 &= ~(PCI_ERR_CAP_ECRC_GENE | PCI_ERR_CAP_ECRC_CHKE);
>> -	pci_write_config_dword(dev, aer + PCI_ERR_CAP, reg32);
>> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_CAP,
>> +				       PCI_ERR_CAP_ECRC_GENE |
>> +				       PCI_ERR_CAP_ECRC_CHKE, 0);
>>   
>>   	return 0;
>>   }
>> @@ -1102,15 +1101,12 @@ static bool find_source_device(struct pci_dev *parent,
>>   static void pci_aer_unmask_internal_errors(struct pci_dev *dev)
>>   {
>>   	int aer = dev->aer_cap;
>> -	u32 mask;
>>   
>> -	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, &mask);
>> -	mask &= ~PCI_ERR_UNC_INTN;
>> -	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, mask);
>> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
>> +				       PCI_ERR_UNC_INTN, 0);
>>   
>> -	pci_read_config_dword(dev, aer + PCI_ERR_COR_MASK, &mask);
>> -	mask &= ~PCI_ERR_COR_INTERNAL;
>> -	pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, mask);
>> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_COR_MASK,
>> +				       PCI_ERR_COR_INTERNAL, 0);
>>   }
>>   
>>   static bool is_cxl_mem_dev(struct pci_dev *dev)
>> @@ -1556,23 +1552,19 @@ static irqreturn_t aer_irq(int irq, void *context)
>>   static void aer_enable_irq(struct pci_dev *pdev)
>>   {
>>   	int aer = pdev->aer_cap;
>> -	u32 reg32;
>>   
>>   	/* Enable Root Port's interrupt in response to error messages */
>> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
>> -	reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
>> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
>> +	pci_clear_and_set_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
>> +				       0, ROOT_PORT_INTR_ON_MESG_MASK);
>>   }
>>   
>>   static void aer_disable_irq(struct pci_dev *pdev)
>>   {
>>   	int aer = pdev->aer_cap;
>> -	u32 reg32;
>>   
>>   	/* Disable Root Port's interrupt in response to error messages */
>> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
>> -	reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
>> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
>> +	pci_clear_and_set_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
>> +				       ROOT_PORT_INTR_ON_MESG_MASK, 0);
>>   }
>>   
>>   /**



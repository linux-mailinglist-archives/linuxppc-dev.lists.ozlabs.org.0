Return-Path: <linuxppc-dev+bounces-8869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BAEAC08D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 11:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b336317sTz3c3w;
	Thu, 22 May 2025 19:34:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747906475;
	cv=none; b=BvVxY/QeUuSXmJ2ksuH15wdfFVQo7GBjM2QsU/TjRYA0IM4cfCm3GtVMYCIQ2XP+K9RqyUzPjRZiI+8MT2OUjTT1OJxIIWpB0PBDzGIwL1YdXQF2J0IQiYOPZIg1Ww5IAMTrrh16H5pfuP/vhdz3AGUYHMqBq9s+nVWihVsY1c4JLrcWt4/wUwZpvuoMHXJ56cUVNjx1auOS8yg8K01TEl/G4/xHXwiD9ySTi2vjowx+OjOgUOMk6aljrfcxAzH3ZD2pTjnJA1d7Tj7RNXyh7gAAD3+arbXRxNDkIPXjLgfg8foY8ciphOeclv19BhjecWhqR9FK9Wd7wuSAVegokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747906475; c=relaxed/relaxed;
	bh=5joGvSMwoogVlNO6iG3yyrQRJaGl4pOo4UfrlDIsfzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICft7O10ekAx89woFkjBSiGetT3YM92JnyHTJEpWhpFwF8clcfYoCgiEySpxmwgjSELO/ZWDR5W9w2PlX3tX25MrFUT7dgTJBpoH5VjKa1CI31/1lk8t0BKzOby/T3HGj0cj+QZmvQnerVaUMx4F1yLZ40WCqsX+zpvPKDCwYPhHv31YKmzjMx7xpaxg0OyDnG1r2GKPQXE4d81XrLdwBwnfxZzRyryByOkw7GJBZ6XpsVM4JNlvUihyQTCnfZAfEQR5C/eSMS///sHmSpxeFkiJenpVT+WNkxwA9FA2Cm5z8pH4mCiyHt4fOncLjFb80nYugwlGivZiyHt+Xdaw2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fw+AoSAq; dkim-atps=neutral; spf=pass (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fw+AoSAq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b336000NBz2yfK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 19:34:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=5joGvSMwoogVlNO6iG3yyrQRJaGl4pOo4UfrlDIsfzo=;
	b=fw+AoSAqF+Qy+D//w43Bpup1HrzL/gV326OincHmp3P90CZQhps46uOHrvDZL2
	pd9vToAHpWN2PTnxV9gkl9tKSrl5+xndBHdC/PTnE+DZw7WGdqrJD7dDB946JJbH
	Inxta77WOucOpzKUjcPi9iBWRP/vH27rZj1osuLITwJO8=
Received: from [192.168.18.52] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wC3T8tx7y5oT9UADQ--.40824S2;
	Thu, 22 May 2025 17:33:38 +0800 (CST)
Message-ID: <dd887a30-4bdc-4e7d-ba04-1f417a082a9f@163.com>
Date: Thu, 22 May 2025 17:33:37 +0800
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
Subject: Re: [PATCH 0/4] pci: implement "pci=aer_panic"
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 bhelgaas@google.com, tglx@linutronix.de, kw@linux.com,
 manivannan.sadhasivam@linaro.org, mahesh@linux.ibm.com
Cc: oohall@gmail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250516165518.125495-1-18255117159@163.com>
 <a1fdd6e1-8cd9-46b0-bd27-526729a1199d@linux.intel.com>
 <8434dc81-5d2d-4ce1-ab73-ca1cf16cb550@163.com>
 <e6ad7ef5-de9c-49bc-9882-5e97bd549168@163.com>
 <3dd17a45-2305-4ac4-a195-4c54ce357ddc@linux.intel.com>
 <1c21ec0b-ca89-4f7e-85f2-bdb48edb8055@163.com>
 <97e9850f-8a74-425f-93ab-5017599c98b5@linux.intel.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <97e9850f-8a74-425f-93ab-5017599c98b5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3T8tx7y5oT9UADQ--.40824S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtrWktF1kArWfAFy7Zry7ZFb_yoW7XrWDpa
	yrAa1jyr4DJFW2vFnFvw10qry5ta4DJw15Wrn8Jr13Kr90yr1UJr42vF4jkasrGrnrWw1j
	vF4Ut347WFy5JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRJ8n5UUUUU=
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDxlVo2gu7XhKJQAAsc
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/5/22 00:17, Sathyanarayanan Kuppuswamy wrote:
> 
> On 5/21/25 7:54 AM, Hans Zhang wrote:
>>
>>
>> On 2025/5/21 00:09, Sathyanarayanan Kuppuswamy wrote:
>>>
>>> On 5/19/25 7:41 AM, Hans Zhang wrote:
>>>>
>>>>
>>>> On 2025/5/19 22:21, Hans Zhang wrote:
>>>>>
>>>>>
>>>>> On 2025/5/17 02:10, Sathyanarayanan Kuppuswamy wrote:
>>>>>>
>>>>>> On 5/16/25 9:55 AM, Hans Zhang wrote:
>>>>>>> The following series introduces a new kernel command-line option 
>>>>>>> aer_panic
>>>>>>> to enhance error handling for PCIe Advanced Error Reporting (AER) in
>>>>>>> mission-critical environments. This feature ensures deterministic 
>>>>>>> recover
>>>>>>> from fatal PCIe errors by triggering a controlled kernel panic 
>>>>>>> when device
>>>>>>> recovery fails, avoiding indefinite system hangs.
>>>>>>
>>>>>> Why would a device recovery failure lead to a system hang? Worst case
>>>>>> that device may not be accessible, right?  Any real use case?
>>>>>>
>>>>>
>>>>>
>>>>> Dear Sathyanarayanan,
>>>>>
>>>>> Due to Synopsys and Cadence PCIe IP, their AER interrupts are 
>>>>> usually SPI interrupts, not INTx/MSI/MSIx interrupts. (Some 
>>>>> customers will design it as an MSI/MSIx interrupt, e.g.: RK3588, 
>>>>> but not all customers have designed it this way.)  For example, 
>>>>> when many mobile phone SoCs of Qualcomm handle AER interrupts and 
>>>>> there is a link down, that is, a fatal problem occurs in the 
>>>>> current PCIe physical link, the system cannot recover.  At this 
>>>>> point, a system restart is needed to solve the problem.
>>>>>
>>>>> And our company design of SOC: http://radxa.com/products/orion/o6/, 
>>>>> it has 5 road PCIe port.
>>>>> There is also the same problem.  If there is a problem with one of 
>>>>> the PCIe ports, it will cause the entire system to hang.  So I hope 
>>>>> linux OS can offer an option that enables SOC manufacturers to 
>>>>> choose to restart the system in case of fatal hardware errors 
>>>>> occurring in PCIe.
>>>>>
>>>>> There are also products such as mobile phones and tablets. We don't 
>>>>> want to wait until the battery is completely used up before 
>>>>> restarting them.
>>>>>
>>>>> For the specific code of Qualcomm, please refer to the email I sent.
>>>>>
>>>>
>>>>
>>>> Dear Sathyanarayanan,
>>>>
>>>> Supplementary reasons:
>>>>
>>>> drivers/pci/controller/cadence/pcie-cadence-host.c
>>>> cdns_pci_map_bus
>>>>     /* Clear AXI link-down status */
>>>>     cdns_pcie_writel(pcie, CDNS_PCIE_AT_LINKDOWN, 0x0);
>>>>
>>>> https://elixir.bootlin.com/linux/v6.15-rc6/source/drivers/pci/controller/cadence/pcie-cadence-host.c#L52
>>>>
>>>> If there has been a link down in this PCIe port, the register 
>>>> CDNS_PCIE_AT_LINKDOWN must be set to 0 for the AXI transmission to 
>>>> continue.  This is different from Synopsys.
>>>>
>>>> If CPU Core0 runs to code L52 and CPU Core1 is executing NVMe SSD 
>>>> saving files, since the CDNS_PCIE_AT_LINKDOWN register is still 1, 
>>>> it causes CPU Core1 to be unable to send TLP transfers and hang. 
>>>> This is a very extreme situation.
>>>> (The current Cadence code is Legacy PCIe IP, and the HPA IP is still 
>>>> in the upstream process at present.)
>>>>
>>>> Radxa O6 uses Cadence's PCIe HPA IP.
>>>> http://radxa.com/products/orion/o6/
>>>>
>>>
>>> It sounds like a system level issue to me. Why not they rely on 
>>> watchdog to reboot for
>>> this case ?
>>
>> Dear Sathyanarayanan,
>>
>> Thank you for your reply. Yes, personally, I think it's also a problem 
>> at the system level. I conducted a local test. When I directly 
>> unplugged the EP device on the slot, the system would hang. It has 
>> been tested many times. Since we don't have a bus timeout response 
>> mechanism for PCIe, it hangs easily.
> 
> Any comment on why watchdog is not used to reboot the unresponsive system?

Dear Sathyanarayanan,

Thank you very much for your reply.

After my testing, the watchdog doesn't work properly every time. There 
might be other reasons causing the entire system to hang.


> 
>>
>>>
>>> Even if you want to add this support, I think it is more appropriate 
>>> to add this to your
>>> specific PCIe controller driver.  I don't see why you want to add it 
>>> part of generic
>>> AER driver.
>>>
>> Because we want to use the processing logic of the general AER driver. 
>> If the recovery is successful, there will be no problem. If the 
>> recovery fails, my original intention was to restart the system.
>>
>> If added to the specific PCIe controller driver, a lot of repetitive 
>> AER processing logic will be written. So I was thinking whether the 
>> AER driver could be changed to be compiled as a KO module.
> 
> May be you can rely on err handler callbacks to get notification on 
> fatal errors or you can even use uevent handler to detect the 
> disconnected device event and handle it there.

I will try the method you suggested.

> 
>>
>>
>> If this series is not reasonable, I'll drop it.
> 
> Adding new kernel param to solve a specific system issue is not 
> recommended. Try to find some custom solution for your chip/controller.
> 

Ok. Understood. Thank you again for your reply.

Best regards,
Hans



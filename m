Return-Path: <linuxppc-dev+bounces-8839-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE0ABF866
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 16:55:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2ZH61L1cz2ydl;
	Thu, 22 May 2025 00:55:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747839346;
	cv=none; b=SD80J5Y7Cc7ZdaziqlhevGx9pRmKDTKuiqbA6iUijaLg2dioAw6SvI90cIIHB2H6CxfmQgMa7n4kfwjf8p6hauryB7382eouAhTqq4QRALc51Vcm+Zh7A32ZLLre5x09ojd/TfBgRVuPX+eSjPE0p4EmsAhAoBapAmPLeoEv1wnczXfH1UFaME7zxwM0SJtCAywSv9HwmTCIjNBLZ3Gz60nNLe10d6OQ1jn4P9dvQlkQphq1dffVssDhZbTcaR9tEiI1ND2JJx3y8/5RX87k+DYimv5Mrp9V9mQdAGETujJecgqvUht4uAETQmfEVGEJkoui1tuYGCGp42piyjI9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747839346; c=relaxed/relaxed;
	bh=nhOxlgQ7+nfY4fwX45DJfisexcraDE8HthO3m6cUSD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlCJwCs2GBSnL8XkAlStobgPWWCB7RSOOms2aH0cPc4DPBrRTd1gBYiohRA3ZCD0RAbOfyvYwiffaqYvYTpB/yKsvqE/MP7/bGRuPA2i7rmOd3/DUHWEdt0l5OKonHU2zV5uTNyRbF/OgmqTb/Rq1oved9ufCnpcKOnvUGA0hXunyLQCfP7vb8MlSRBnjcTF01PWRYYx2rIFGIE/BCoz/pGnuMW526987jqnPEJP0Il4BnHCTDyWjBVWkhOEqZs+w2ZSZ+Z1eoCQ7CITdaeVk0EbNbV25bkxIcvmTp2FYJbuc/3vKi95JQRh17H75HT46I1S+LA2tXxZlvbVCe3a7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bEG+QU3s; dkim-atps=neutral; spf=pass (client-ip=220.197.31.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bEG+QU3s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2ZH34ldNz2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 00:55:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=nhOxlgQ7+nfY4fwX45DJfisexcraDE8HthO3m6cUSD8=;
	b=bEG+QU3sKSN/NuvpbocLmTAFjn3OMDEwDPaUnaC4kS0C3iK4mzIwaEF4HmcXVO
	ZnavcnhanmaTbXJVe895+oOvXpEvoByrtyGULwfs5LbkZZWGHlKzzDNA9uV/SDpM
	sPf/8zRaFqw9/a8dXV2ei6j7Fyqo0BTA7lfmWG7yDChVg=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDX_2cp6S1oyxI2DA--.34395S2;
	Wed, 21 May 2025 22:54:34 +0800 (CST)
Message-ID: <1c21ec0b-ca89-4f7e-85f2-bdb48edb8055@163.com>
Date: Wed, 21 May 2025 22:54:33 +0800
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
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <3dd17a45-2305-4ac4-a195-4c54ce357ddc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX_2cp6S1oyxI2DA--.34395S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GFy3GrW7tF1fZF13XF1DKFg_yoWxAw1rpa
	yrAa1jkr4DJFyxAFn2yw1xXryYyasrJwn8Wrn5Jr1agrn0vryUXr4SvF45CF98WrnrWw1U
	ZF40v3srWr15ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U1rWwUUUUU=
X-Originating-IP: [124.79.114.92]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOg5Uo2gt4OzfkwAAsG
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/5/21 00:09, Sathyanarayanan Kuppuswamy wrote:
> 
> On 5/19/25 7:41 AM, Hans Zhang wrote:
>>
>>
>> On 2025/5/19 22:21, Hans Zhang wrote:
>>>
>>>
>>> On 2025/5/17 02:10, Sathyanarayanan Kuppuswamy wrote:
>>>>
>>>> On 5/16/25 9:55 AM, Hans Zhang wrote:
>>>>> The following series introduces a new kernel command-line option 
>>>>> aer_panic
>>>>> to enhance error handling for PCIe Advanced Error Reporting (AER) in
>>>>> mission-critical environments. This feature ensures deterministic 
>>>>> recover
>>>>> from fatal PCIe errors by triggering a controlled kernel panic when 
>>>>> device
>>>>> recovery fails, avoiding indefinite system hangs.
>>>>
>>>> Why would a device recovery failure lead to a system hang? Worst case
>>>> that device may not be accessible, right?  Any real use case?
>>>>
>>>
>>>
>>> Dear Sathyanarayanan,
>>>
>>> Due to Synopsys and Cadence PCIe IP, their AER interrupts are usually 
>>> SPI interrupts, not INTx/MSI/MSIx interrupts.  (Some customers will 
>>> design it as an MSI/MSIx interrupt, e.g.: RK3588, but not all 
>>> customers have designed it this way.)  For example, when many mobile 
>>> phone SoCs of Qualcomm handle AER interrupts and there is a link 
>>> down, that is, a fatal problem occurs in the current PCIe physical 
>>> link, the system cannot recover.  At this point, a system restart is 
>>> needed to solve the problem.
>>>
>>> And our company design of SOC: http://radxa.com/products/orion/o6/, 
>>> it has 5 road PCIe port.
>>> There is also the same problem.  If there is a problem with one of 
>>> the PCIe ports, it will cause the entire system to hang.  So I hope 
>>> linux OS can offer an option that enables SOC manufacturers to choose 
>>> to restart the system in case of fatal hardware errors occurring in 
>>> PCIe.
>>>
>>> There are also products such as mobile phones and tablets.  We don't 
>>> want to wait until the battery is completely used up before 
>>> restarting them.
>>>
>>> For the specific code of Qualcomm, please refer to the email I sent.
>>>
>>
>>
>> Dear Sathyanarayanan,
>>
>> Supplementary reasons:
>>
>> drivers/pci/controller/cadence/pcie-cadence-host.c
>> cdns_pci_map_bus
>>     /* Clear AXI link-down status */
>>     cdns_pcie_writel(pcie, CDNS_PCIE_AT_LINKDOWN, 0x0);
>>
>> https://elixir.bootlin.com/linux/v6.15-rc6/source/drivers/pci/controller/cadence/pcie-cadence-host.c#L52
>>
>> If there has been a link down in this PCIe port, the register 
>> CDNS_PCIE_AT_LINKDOWN must be set to 0 for the AXI transmission to 
>> continue.  This is different from Synopsys.
>>
>> If CPU Core0 runs to code L52 and CPU Core1 is executing NVMe SSD 
>> saving files, since the CDNS_PCIE_AT_LINKDOWN register is still 1, it 
>> causes CPU Core1 to be unable to send TLP transfers and hang. This is 
>> a very extreme situation.
>> (The current Cadence code is Legacy PCIe IP, and the HPA IP is still 
>> in the upstream process at present.)
>>
>> Radxa O6 uses Cadence's PCIe HPA IP.
>> http://radxa.com/products/orion/o6/
>>
> 
> It sounds like a system level issue to me. Why not they rely on watchdog 
> to reboot for
> this case ?

Dear Sathyanarayanan,

Thank you for your reply. Yes, personally, I think it's also a problem 
at the system level. I conducted a local test. When I directly unplugged 
the EP device on the slot, the system would hang. It has been tested 
many times. Since we don't have a bus timeout response mechanism for 
PCIe, it hangs easily.

> 
> Even if you want to add this support, I think it is more appropriate to 
> add this to your
> specific PCIe controller driver.  I don't see why you want to add it 
> part of generic
> AER driver.
> 
Because we want to use the processing logic of the general AER driver. 
If the recovery is successful, there will be no problem. If the recovery 
fails, my original intention was to restart the system.

If added to the specific PCIe controller driver, a lot of repetitive AER 
processing logic will be written. So I was thinking whether the AER 
driver could be changed to be compiled as a KO module.


If this series is not reasonable, I'll drop it.


Best regards,
Hans

>>>
>>>>>
>>>>> Problem Statement
>>>>> In systems where unresolved PCIe errors (e.g., bus hangs) occur,
>>>>> traditional error recovery mechanisms may leave the system 
>>>>> unresponsive
>>>>> indefinitely. This is unacceptable for high-availability environment
>>>>> requiring prompt recovery via reboot.
>>>>>
>>>>> Solution
>>>>> The aer_panic option forces a kernel panic on unrecoverable AER 
>>>>> errors.
>>>>> This bypasses prolonged recovery attempts and ensures immediate 
>>>>> reboot.
>>>>>
>>>>> Patch Summary:
>>>>> Documentation Update: Adds aer_panic to kernel-parameters.txt, 
>>>>> explaining
>>>>> its purpose and usage.
>>>>>
>>>>> Command-Line Handling: Implements pci=aer_panic parsing and state
>>>>> management in PCI core.
>>>>>
>>>>> State Exposure: Introduces pci_aer_panic_enabled() to check if the 
>>>>> panic
>>>>> mode is active.
>>>>>
>>>>> Panic Trigger: Modifies recovery logic to panic the system when 
>>>>> recovery
>>>>> fails and aer_panic is enabled.
>>>>>
>>>>> Impact
>>>>> Controlled Recovery: Reduces downtime by replacing hangs with 
>>>>> immediate
>>>>> reboots.
>>>>>
>>>>> Optional: Enabled via pci=aer_panic; no default behavior change.
>>>>>
>>>>> Dependency: Requires CONFIG_PCIEAER.
>>>>>
>>>>> For example, in mobile phones and tablets, when there is a problem 
>>>>> with
>>>>> the PCIe link and it cannot be restored, it is expected to provide an
>>>>> alternative method to make the system panic without waiting for the
>>>>> battery power to be completely exhausted before restarting the system.
>>>>>
>>>>> ---
>>>>> For example, the sm8250 and sm8350 of qcom will panic and restart the
>>>>> system when they are linked down.
>>>>>
>>>>> https://github.com/DOITfit/xiaomi_kernel_sm8250/blob/d42aa408e8cef14f4ec006554fac67ef80b86d0d/drivers/pci/controller/pci-msm.c#L5440
>>>>>
>>>>> https://github.com/OnePlusOSS/android_kernel_oneplus_sm8350/blob/13ca08fdf0979fdd61d5e8991661874bb2d19150/drivers/net/wireless/cnss2/pci.c#L950
>>>>>
>>>>>
>>>>> Since the design schemes of each SOC manufacturer are different, 
>>>>> the AXI
>>>>> and other buses connected by PCIe do not have a design to prevent 
>>>>> hanging.
>>>>> Once a FATAL error occurs in the PCIe link and cannot be restored, the
>>>>> system needs to be restarted.
>>>>>
>>>>>
>>>>> Dear Mani,
>>>>>
>>>>> I wonder if you know how other SoCs of qcom handle FATAL errors 
>>>>> that occur
>>>>> in PCIe link.
>>>>> ---
>>>>>



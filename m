Return-Path: <linuxppc-dev+bounces-8671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F950ABC10B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 16:40:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1L2G0MzMz2xPc;
	Tue, 20 May 2025 00:40:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747665621;
	cv=none; b=GvwEaNfAEdrEDvOzSQrray6nr3p/9y2Qn3LxQn2CJh+EsuridovSKIBM6aMjm7puHfqNuBLxm/ITOPZzkp0Ho1BvB8AqR2r86seO2cKjfdTzXgveF30vNwLQJGbMIlcZ8VZ+Nv/JUBoGuxl5VTy+pxXHgqgAsBofDejwPaC78L0uQ9u7vu/VhlVYn2oXZe7OO+K0XJCqc7GAp3b9yFfMwfI6LAyfRuenP4eHYlDigWrO9xrhvItFrjHmHI/bchLDgzG2XxzaWiPugfDHMUsa/UyPMukD5zph9HrzlBeb1QqrrCPLIIaIAGKFljvtdRinSU90F5/YBU/F/jQ7YT/Peg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747665621; c=relaxed/relaxed;
	bh=AntKYH1ZwZOest/SN1xkVuvvLJOxFubIGIo8RltCreo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VYsu54LMligwcsJWCmQJj5CDHBvn8zRFVGE5qbludxNPVXP7KbNEYDfQoV2nUw4UFm8kjKm9OEJ/zqa0oYkHW8vKUGLzbL+auJg+y2RkixHNG+5Q6YCdDBNbYqHCyYdvUVcBhii5kIMVaCz06jvXG3Xqb8768Fv3CHaqqt++vKzSxXD61Sa0T0xFPLiS6J83vtTlq+GA1ZnvklKpPaCTCDtTR2dt2REua3SaltfIQJkQk9aUF390k4ZwFkBwckDR9BhfCcbebo+XU1vd+TeGMkbxp+TqnV65VIelNiXyc5K+kWanfVOcTvyO8zzZP4l0dKYd+GK36ANO3ALr9OWgyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ftzeb1H+; dkim-atps=neutral; spf=pass (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ftzeb1H+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1L2C21FHz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 00:40:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:To:
	Content-Type; bh=AntKYH1ZwZOest/SN1xkVuvvLJOxFubIGIo8RltCreo=;
	b=ftzeb1H+0uTdhT6UuNoZVvK9VHRpz8MvCA9PXsLsdZQQcNLR5LOcw0GuXR73qN
	Uth9YEhGeszNDlYKH3RYLPCyQoAS+0Hyq9P4UXQJ0ptT3/tOKIubywj4ZwTF4KIl
	4z0H6dzA/mpBrD75lk/FzZbzyeLcUPyZEs9DwSj9yXnI8=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3526nQitoFe1UCg--.45396S2;
	Mon, 19 May 2025 22:39:36 +0800 (CST)
Message-ID: <ca5a4b17-d784-408d-a894-09e282751f99@163.com>
Date: Mon, 19 May 2025 22:39:35 +0800
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
From: Hans Zhang <18255117159@163.com>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 bhelgaas@google.com, tglx@linutronix.de, kw@linux.com,
 manivannan.sadhasivam@linaro.org, mahesh@linux.ibm.com
Cc: oohall@gmail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250516165518.125495-1-18255117159@163.com>
 <a1fdd6e1-8cd9-46b0-bd27-526729a1199d@linux.intel.com>
 <8434dc81-5d2d-4ce1-ab73-ca1cf16cb550@163.com>
Content-Language: en-US
In-Reply-To: <8434dc81-5d2d-4ce1-ab73-ca1cf16cb550@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3526nQitoFe1UCg--.45396S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ww4UJr4kAw13XFy5try7KFg_yoW7tF4kpa
	yrGa1YkrWkGF92van2k3WIqFyYyas3t345WrykGw13XFnIvFyjqrWSvFWYkFZIgrZYgw45
	ZrW0v347Wrn8AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U15l8UUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDw1So2grQqIAxAAAsU
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/5/19 22:21, Hans Zhang wrote:
> 
> 
> On 2025/5/17 02:10, Sathyanarayanan Kuppuswamy wrote:
>>
>> On 5/16/25 9:55 AM, Hans Zhang wrote:
>>> The following series introduces a new kernel command-line option 
>>> aer_panic
>>> to enhance error handling for PCIe Advanced Error Reporting (AER) in
>>> mission-critical environments. This feature ensures deterministic 
>>> recover
>>> from fatal PCIe errors by triggering a controlled kernel panic when 
>>> device
>>> recovery fails, avoiding indefinite system hangs.
>>
>> Why would a device recovery failure lead to a system hang? Worst case
>> that device may not be accessible, right?  Any real use case?
>>
> 
> 
> Dear Sathyanarayanan,
> 
> Due to Synopsys and Cadence PCIe IP, their AER interrupts are usually 
> SPI interrupts, not INTx/MSI/MSIx interrupts.  (Some customers will 
> design it as an MSI/MSIx interrupt, e.g.: RK3588, but not all customers 
> have designed it this way.)  For example, when many mobile phone SoCs of 
> Qualcomm handle AER interrupts and there is a link down, that is, a 
> fatal problem occurs in the current PCIe physical link, the system 
> cannot recover.  At this point, a system restart is needed to solve the 
> problem.
> 
> And our company design of SOC: http://radxa.com/products/orion/o6/, it 
> has 5 road PCIe port.
> There is also the same problem.  If there is a problem with one of the 
> PCIe ports, it will cause the entire system to hang.  So I hope linux OS 
> can offer an option that enables SOC manufacturers to choose to restart 
> the system in case of fatal hardware errors occurring in PCIe.
> 
> There are also products such as mobile phones and tablets.  We don't 
> want to wait until the battery is completely used up before restarting 
> them.
> 
> For the specific code of Qualcomm, please refer to the email I sent.
> 

Dear Sathyanarayanan,

Supplementary reasons:

drivers/pci/controller/cadence/pcie-cadence-host.c
cdns_pci_map_bus
     /* Clear AXI link-down status */
     cdns_pcie_writel(pcie, CDNS_PCIE_AT_LINKDOWN, 0x0);

https://elixir.bootlin.com/linux/v6.15-rc6/source/drivers/pci/controller/cadence/pcie-cadence-host.c#L52

If there has been a link down in this PCIe port, the register 
CDNS_PCIE_AT_LINKDOWN must be set to 0 for the AXI transmission to 
continue.  This is different from Synopsys.

If CPU Core0 runs to code L52 and CPU Core1 is executing NVMe SSD saving 
files, since the CDNS_PCIE_AT_LINKDOWN register is still 1, it causes 
CPU Core1 to be unable to send TLP transfers and hang.  This is a very 
extreme situation.
(The current Cadence code is Legacy PCIe IP, and the HPA IP is still in 
the upstream process at present.)

Radxa O6 uses Cadence's PCIe HPA IP.
http://radxa.com/products/orion/o6/

Best regards,
Hans
> 
>>>
>>> Problem Statement
>>> In systems where unresolved PCIe errors (e.g., bus hangs) occur,
>>> traditional error recovery mechanisms may leave the system unresponsive
>>> indefinitely. This is unacceptable for high-availability environment
>>> requiring prompt recovery via reboot.
>>>
>>> Solution
>>> The aer_panic option forces a kernel panic on unrecoverable AER errors.
>>> This bypasses prolonged recovery attempts and ensures immediate reboot.
>>>
>>> Patch Summary:
>>> Documentation Update: Adds aer_panic to kernel-parameters.txt, 
>>> explaining
>>> its purpose and usage.
>>>
>>> Command-Line Handling: Implements pci=aer_panic parsing and state
>>> management in PCI core.
>>>
>>> State Exposure: Introduces pci_aer_panic_enabled() to check if the panic
>>> mode is active.
>>>
>>> Panic Trigger: Modifies recovery logic to panic the system when recovery
>>> fails and aer_panic is enabled.
>>>
>>> Impact
>>> Controlled Recovery: Reduces downtime by replacing hangs with immediate
>>> reboots.
>>>
>>> Optional: Enabled via pci=aer_panic; no default behavior change.
>>>
>>> Dependency: Requires CONFIG_PCIEAER.
>>>
>>> For example, in mobile phones and tablets, when there is a problem with
>>> the PCIe link and it cannot be restored, it is expected to provide an
>>> alternative method to make the system panic without waiting for the
>>> battery power to be completely exhausted before restarting the system.
>>>
>>> ---
>>> For example, the sm8250 and sm8350 of qcom will panic and restart the
>>> system when they are linked down.
>>>
>>> https://github.com/DOITfit/xiaomi_kernel_sm8250/blob/d42aa408e8cef14f4ec006554fac67ef80b86d0d/drivers/pci/controller/pci-msm.c#L5440
>>>
>>> https://github.com/OnePlusOSS/android_kernel_oneplus_sm8350/blob/13ca08fdf0979fdd61d5e8991661874bb2d19150/drivers/net/wireless/cnss2/pci.c#L950
>>>
>>>
>>> Since the design schemes of each SOC manufacturer are different, the AXI
>>> and other buses connected by PCIe do not have a design to prevent 
>>> hanging.
>>> Once a FATAL error occurs in the PCIe link and cannot be restored, the
>>> system needs to be restarted.
>>>
>>>
>>> Dear Mani,
>>>
>>> I wonder if you know how other SoCs of qcom handle FATAL errors that 
>>> occur
>>> in PCIe link.
>>> ---
>>>
>>> Hans Zhang (4):
>>>    pci: implement "pci=aer_panic"
>>>    PCI/AER: Introduce aer_panic kernel command-line option
>>>    PCI/AER: Expose AER panic state via pci_aer_panic_enabled()
>>>    PCI/AER: Trigger kernel panic on recovery failure if aer_panic is set
>>>
>>>   .../admin-guide/kernel-parameters.txt          |  7 +++++++
>>>   drivers/pci/pci.c                              |  2 ++
>>>   drivers/pci/pci.h                              |  4 ++++
>>>   drivers/pci/pcie/aer.c                         | 18 ++++++++++++++++++
>>>   drivers/pci/pcie/err.c                         |  8 ++++++--
>>>   5 files changed, 37 insertions(+), 2 deletions(-)
>>>
>>>
>>> base-commit: fee3e843b309444f48157e2188efa6818bae85cf
>>> prerequisite-patch-id: 299f33d3618e246cd7c04de10e591ace2d0116e6
>>> prerequisite-patch-id: 482ad0609459a7654a4100cdc9f9aa4b671be50b
>>



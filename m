Return-Path: <linuxppc-dev+bounces-8759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC0ABDE84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 17:12:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1yhZ0JKBz3bhH;
	Wed, 21 May 2025 01:12:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747753933;
	cv=none; b=PRDHyXEFRMYDCM25+vPlOE1lI5CwUJQWoW5UYxDdd/SwYUbsQrpboVHqj8V1CMYjsAhYi66HLwxjuz/xv86WYZJVPFNz2mC11oL2mtSSA734M6WqGAeVCr+72jCHCDVrD0lRfiZcH+Ll5XIKtuUGyv8CC22cbxCvu5EH+VNW63YeVYI3zsopHNBa1f4aq0AyJBk5kklgfdvLXB2/8mkTObMHIVI4Haed6K09l8BghTY8ySwVjKDz4+docY3B6++lnjvcF63BfopvyLyOO7+sCe1YT4IsVtXPkB74BMzfpmpHSBZLhpnufMQMZ1zi/opqJCCYgrL24L4Fw2rKXgAnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747753933; c=relaxed/relaxed;
	bh=GPaZJXcP6XubVhJ/WV1CIEQYs82mgwU/ATflS6SjxSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eP6bIJAyhDm2IE9mOM3J17H+8W1N3e4vKuqQjVYZmNe5Yu7hHQ4wY/5ZlUSTiE9Lfz6LROGUn3F7xcFHll6AQz8ZeXC4BBRVzGovvY5m5ZHfT/HbjP30zwJpGnVlhi8ij3c75RAcIf0b2u8i0cpa5yDddbDD8k9Dxhrg3Y7i71dcomxEgbu75O80QE27rN36aBwl3RZHr7mllSx4B4LCTq4iu175oHLrzdNMCICEhsNuxhL+q7Vnju5RK/AvfkB2SeC3cN2jcR+ARWCobMVbx7siTjpbyMOONF3Qxti8IIik0VZ7pVDEAex63zqwSKVsi4iLID8R7nY59qtxgZoPPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=M6gbo3Pk; dkim-atps=neutral; spf=pass (client-ip=220.197.31.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=M6gbo3Pk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1yhV6zxmz3bgl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 01:12:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=GPaZJXcP6XubVhJ/WV1CIEQYs82mgwU/ATflS6SjxSY=;
	b=M6gbo3PkyNO6LKEIRcnZEar2L3xmcCL05XCix/scjTswOD8OfX3hq7iMJqVaW3
	qBSEtfuIuRcy+U5BVj4+FQ6VLe6nOO3g04/cNXFC5BUFJDThIliGdMQpLtqLeviU
	+R/SiXqIWGLa7OvxsSrbqv8VxwXFRA5h8wbO2Gk68EqPg=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBHzheFmyxoXz1HCw--.9652S2;
	Tue, 20 May 2025 23:11:01 +0800 (CST)
Message-ID: <5759e70d-1098-4a6a-bc7a-bcbad394d739@163.com>
Date: Tue, 20 May 2025 23:11:01 +0800
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
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, tglx@linutronix.de, kw@linux.com,
 manivannan.sadhasivam@linaro.org, mahesh@linux.ibm.com, oohall@gmail.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20250519220310.GA1258923@bhelgaas>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250519220310.GA1258923@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wBHzheFmyxoXz1HCw--.9652S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GF1xJF1UuF43KF1rXry7Wrg_yoWxJFyrpF
	WrWan0krs7GF9Ivan2k3W8WFyYyas3t34UGr1kKw17X3ZxZF95XrySvay5uFZFqrZY9w43
	ZF4jvFZrWF1DAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRP3ktUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwVTo2gslzmFdgAAs3
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/5/20 06:03, Bjorn Helgaas wrote:
> On Sat, May 17, 2025 at 12:55:14AM +0800, Hans Zhang wrote:
>> The following series introduces a new kernel command-line option aer_panic
>> to enhance error handling for PCIe Advanced Error Reporting (AER) in
>> mission-critical environments. This feature ensures deterministic recover
>> from fatal PCIe errors by triggering a controlled kernel panic when device
>> recovery fails, avoiding indefinite system hangs.
> 
> We try very hard not to add new kernel parameters.
> 
> It sounds like part of the problem is the use of SPI interrupts rather
> than the PCIe-architected INTx/MSI/MSI-X.  I'm not sure this warrants
> generic upstream code changes.  This might be something you need to
> maintain out-of-tree.
> 

Dear Bjorn,

This seems to have nothing to do with whether AER uses the 
INTx/MSI/MSI-X specified in the PCIe spec. Just like the example I gave 
earlier.

Our next-generation SOC has already converted AER interrupts into INTx 
and reported them to the GIC interrupt controller. But the following 
problems still cannot be solved.

```
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
```


If we are in the out-of-tree maintenance corresponding driver, but in 
the file the arch/arm64 / configs/defconfig "CONFIG_PCIEAER=y", make we 
can't modify the AER common code. It also cannot be compiled to aer.ko

Because: CONFIG_PCIEAER can only be equal to y or n.
config PCIEAER
	bool "PCI Express Advanced Error Reporting support"
	depends on PCIEPORTBUS
	select RAS
	help
	  This enables PCI Express Root Port Advanced Error Reporting
	  (AER) driver support. Error reporting messages sent to Root
	  Port will be handled by PCI Express AER driver.

Furthermore, the API of AER common code cannot be used either, and many 
variables have not been exported either. If we write another set of AER 
drivers by ourselves, it will lead to a lot of repetitive processing 
logic code.


I believe that the Qualcomm platform and many other platforms also have 
similar problems.


So can we add a config? For example: CONFIG_PCIEAER_PANIC instead of 
command-line option aer_panic. Or the AER driver can be KO(tristate), so 
that our SOC manufacturer can modify the AER driver.


Best regards,
Hans

>> Problem Statement
>> In systems where unresolved PCIe errors (e.g., bus hangs) occur,
>> traditional error recovery mechanisms may leave the system unresponsive
>> indefinitely. This is unacceptable for high-availability environment
>> requiring prompt recovery via reboot.
>>
>> Solution
>> The aer_panic option forces a kernel panic on unrecoverable AER errors.
>> This bypasses prolonged recovery attempts and ensures immediate reboot.
>>
>> Patch Summary:
>> Documentation Update: Adds aer_panic to kernel-parameters.txt, explaining
>> its purpose and usage.
>>
>> Command-Line Handling: Implements pci=aer_panic parsing and state
>> management in PCI core.
>>
>> State Exposure: Introduces pci_aer_panic_enabled() to check if the panic
>> mode is active.
>>
>> Panic Trigger: Modifies recovery logic to panic the system when recovery
>> fails and aer_panic is enabled.
>>
>> Impact
>> Controlled Recovery: Reduces downtime by replacing hangs with immediate
>> reboots.
>>
>> Optional: Enabled via pci=aer_panic; no default behavior change.
>>
>> Dependency: Requires CONFIG_PCIEAER.
>>
>> For example, in mobile phones and tablets, when there is a problem with
>> the PCIe link and it cannot be restored, it is expected to provide an
>> alternative method to make the system panic without waiting for the
>> battery power to be completely exhausted before restarting the system.
>>
>> ---
>> For example, the sm8250 and sm8350 of qcom will panic and restart the
>> system when they are linked down.
>>
>> https://github.com/DOITfit/xiaomi_kernel_sm8250/blob/d42aa408e8cef14f4ec006554fac67ef80b86d0d/drivers/pci/controller/pci-msm.c#L5440
>>
>> https://github.com/OnePlusOSS/android_kernel_oneplus_sm8350/blob/13ca08fdf0979fdd61d5e8991661874bb2d19150/drivers/net/wireless/cnss2/pci.c#L950
>>
>>
>> Since the design schemes of each SOC manufacturer are different, the AXI
>> and other buses connected by PCIe do not have a design to prevent hanging.
>> Once a FATAL error occurs in the PCIe link and cannot be restored, the
>> system needs to be restarted.
>>
>>
>> Dear Mani,
>>
>> I wonder if you know how other SoCs of qcom handle FATAL errors that occur
>> in PCIe link.
>> ---
>>
>> Hans Zhang (4):
>>    pci: implement "pci=aer_panic"
>>    PCI/AER: Introduce aer_panic kernel command-line option
>>    PCI/AER: Expose AER panic state via pci_aer_panic_enabled()
>>    PCI/AER: Trigger kernel panic on recovery failure if aer_panic is set
>>
>>   .../admin-guide/kernel-parameters.txt          |  7 +++++++
>>   drivers/pci/pci.c                              |  2 ++
>>   drivers/pci/pci.h                              |  4 ++++
>>   drivers/pci/pcie/aer.c                         | 18 ++++++++++++++++++
>>   drivers/pci/pcie/err.c                         |  8 ++++++--
>>   5 files changed, 37 insertions(+), 2 deletions(-)
>>
>>
>> base-commit: fee3e843b309444f48157e2188efa6818bae85cf
>> prerequisite-patch-id: 299f33d3618e246cd7c04de10e591ace2d0116e6
>> prerequisite-patch-id: 482ad0609459a7654a4100cdc9f9aa4b671be50b
>> -- 
>> 2.25.1
>>



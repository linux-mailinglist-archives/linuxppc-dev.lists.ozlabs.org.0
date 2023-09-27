Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 694D87AF865
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 05:02:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwLxM2gHbz3cdw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 13:01:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwLwq2xM2z2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 13:01:29 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R791e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0VsyiB2f_1695783680;
Received: from 30.240.112.49(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0VsyiB2f_1695783680)
          by smtp.aliyun-inc.com;
          Wed, 27 Sep 2023 11:01:22 +0800
Message-ID: <afea2d15-d73a-1ba0-a364-8e24ffbb583d@linux.alibaba.com>
Date: Wed, 27 Sep 2023 11:01:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: Questions: Should kernel panic when PCIe fatal error occurs?
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20230926230247.GA429368@bhelgaas>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20230926230247.GA429368@bhelgaas>
Content-Type: text/plain; charset=UTF-8
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, gregkh@linuxfoundation.org, Linux PCI <linux-pci@vger.kernel.org>, mahesh@linux.ibm.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "tanxiaofei@huawei.com" <tanxiaofei@huawei.com>, "bp@alien8.de" <bp@alien8.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, bhelgaas@google.com, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lenb@kernel.org" <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/9/27 07:02, Bjorn Helgaas wrote:
> On Fri, Sep 22, 2023 at 10:46:36AM +0800, Shuai Xue wrote:
>> ...
> 
>> Actually, this is a question from my colleague from firmware team.
>> The original question is that:
>>
>>     "Should I set CPER_SEV_FATAL for Generic Error Status Block when a
>>     PCIe fatal error is detected? If set, kernel will always panic.
>>     Otherwise, kernel will always not panic."
>>
>> So I pull a question about desired behavior of Linux kernel first :)
>> From the perspective of the kernel, CPER_SEV_FATAL for Generic Error
>> Status Block is not reasonable. The kernel will attempt to recover
>> Fatal errors, although recovery may fail.
> 
> I don't know the semantics of CPER_SEV_FATAL or why it's there.
> With CPER, we have *two* error severities: a "native" one defined by
> the PCIe spec and another defined by the platform via CPER.
> 
> I speculate that the reason for the CPER severity could be to provide
> a severity for error sources that don't have a "native" severity like
> AER does, or for the vendor to force the OS to restart (for
> CPER_SEV_FATAL, anyway) in cases where it might not otherwise.

Agreed, it is the key point.

Per ACPI 6.5 18.1 Hardware Errors and Error Sources[1]:

	- An uncorrected error is a hardware error condition that cannot be
	corrected by the hardware or by the firmware. Uncorrected errors
	are either fatal or non-fatal.

	- A fatal hardware error is an uncorrected or uncontained error
	condition that is determined to be unrecoverable by the hardware.
	When a fatal uncorrected error occurs, the system is restarted to
	prevent propagation of the error.

	A non-fatal hardware error is an uncorrected error condition from
	which OSPM can attempt recovery by trying to correct the error.
	These are also referred to as correctable or recoverable errors.

Based on our discussion and the PCIe and APCI Spec:

- Native AER fatal error defined in PCIe does not indate that there's
uncontained data corruption.
- The kernel is capable of handle native AER fatal and non-fatal errors.
- When a CPER_SEV_FATAL error nofitied by firmware, it indicates the
platform wants to force the OS to restart, and the APEI/GHES driver follows
the Spec now.

(Please correct me if I misunderstand any)


> 
> In the native case, we only have the PCIe severity and don't have the
> CPER severity at all, and I suspect that unless there's uncontained
> data corruption, we would rather handle even the most severe PCIe
> fatal error by disabling the specific device(s) instead of panicking
> and restarting the whole machine.
> 
> So for PCIe errors, I'm not sure setting CPER_SEV_FATAL is beneficial
> unless the platform wants to force the OS to panic, e.g., maybe the
> platform knows about data corruption and/or the vendor wants the OS to
> panic as part of a reliability story.

So back to the original question, I think your above comments are clear enough.

> 
> Presumably the platform has already logged the error, and I assume the
> platform *could* restart without even returning to the OS, but maybe
> it wants the OS to do a crashdump or shutdown in a more orderly way.
> 

If the system is reset in platform without even returning to the OS,
it is not visible to end user. IMHO, it always a bad choice.
The OS can provide enhanced debuggability, for example:

- providing details about the runtime context through crashdump
- saving error information to persistent storage

Thank you for your patience and valuable feedback. It is greatly appreciated
and truly helpful.

Best Regards and Cheers.
Shuai




[1] https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#hardware-errors-and-error-sources

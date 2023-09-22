Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1087AA712
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 04:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsGrg1DGmz3cfr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 12:47:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsGr912BNz3cGM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 12:46:47 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0VsaTkdL_1695350797;
Received: from 30.240.112.49(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0VsaTkdL_1695350797)
          by smtp.aliyun-inc.com;
          Fri, 22 Sep 2023 10:46:39 +0800
Message-ID: <fdc7a4ee-250f-7ec8-ca15-32cbd480bd3e@linux.alibaba.com>
Date: Fri, 22 Sep 2023 10:46:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: Questions: Should kernel panic when PCIe fatal error occurs?
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "tanxiaofei@huawei.com" <tanxiaofei@huawei.com>,
 "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 Miaohe Lin <linmiaohe@huawei.com>
References: <20230921215241.GA337765@bhelgaas>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20230921215241.GA337765@bhelgaas>
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
Cc: gregkh@linuxfoundation.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, mahesh@linux.ibm.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, Linux PCI <linux-pci@vger.kernel.org>, bhelgaas@google.com, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lenb@kernel.org" <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+ @Rafael for the APEI/GHES part.

On 2023/9/22 05:52, Bjorn Helgaas wrote:
> On Thu, Sep 21, 2023 at 08:10:19PM +0800, Shuai Xue wrote:
>> On 2023/9/21 07:02, Bjorn Helgaas wrote:
>>> On Mon, Sep 18, 2023 at 05:39:58PM +0800, Shuai Xue wrote:
>> ...
> 
>>> I guess your point is that for CPER_SEV_FATAL errors, the APEI/GHES
>>> path always panics but the native path never does, and that maybe both
>>> paths should work the same way?
>>
>> Yes, exactly. Both OS native and APEI/GHES firmware first are notifications
>> used to handles PCIe AER errors, and IMHO, they should ideally work in the
>> same way.
> 
> I agree, that would be nice, but the whole point of the APEI/GHES
> functionality is vendor value-add, so I'm not sure we can achieve that
> ideal.
> 
>> ...
>> As a result, AER driver only does recovery for non-fatal PCIe error.
> 
> This is only true for the APEI/GHES path, right?  For *native* AER
> handling, we attempt recovery for both fatal and non-fatal errors.

Yes, exactly.

> 
>>> It doesn't seem like the native path should always panic.  If we can
>>> tell that data was corrupted, we may want to panic, but otherwise I
>>> don't think we should crash the entire system even if some device is
>>> permanently broken.
>>
>> Got it. But how can we tell if the data is corrupted with OS native?
> 
> I naively expect that by PCIe protocol, corrupted DLLPs or TLPs
> detected by CRC, sequence number errors, etc, would be discarded
> before corrupting memory, so I doubt we'd get an uncorrectable error
> that means "sorry, I just corrupted your data."
> 
> But DPC is advertised as "avoiding the potential spread of any data
> corruption," so there must be some mechanisms of corruption, and since
> DPC is triggered by either ERR_FATAL or ERR_NONFATAL, I guess maybe
> the errors could tell us something.  I'm going to quit speculating
> because I obviously don't know enough about this area.
> 
>>>> However, I have changed my mind on this issue as I encounter a case where
>>>> a error propagation is detected due to fatal DLLP (Data Link Protocol
>>>> Error) error. A DLLP error occurred in the Compute node, causing the
>>>> node to panic because `struct acpi_hest_generic_status::error_severity` was
>>>> set as CPER_SEV_FATAL. However, data corruption was still detected in the
>>>> storage node by CRC.
>>>
>>> The only mention of Data Link Protocol Error that looks relevant is
>>> PCIe r6.0, sec 3.6.2.2, which basically says a DLLP with an unexpected
>>> Sequence Number should be discarded:
>>>
>>>   For Ack and Nak DLLPs, the following steps are followed (see Figure
>>>   3-21):
>>>
>>>     - If the Sequence Number specified by the AckNak_Seq_Num does not
>>>       correspond to an unacknowledged TLP, or to the value in
>>>       ACKD_SEQ, the DLLP is discarded
>>>
>>>       - This is a Data Link Protocol Error, which is a reported error
>>> 	associated with the Port (see Section 6.2).
>>>
>>> So data from that DLLP should not have made it to memory, although of
>>> course the DMA may not have been completed.  But it sounds like you
>>> did see corrupted data written to memory?
>>
>> The storage node use RDMA to directly access remote compute node.
>> And a error detected by CRC in the storage node. So I suspect yes.
> 
> When doing the CRC, can you distinguish between corrupted data and
> data that was not written because a DMA was only partially completed?

Yes, the receiving application layer will perform length verification.
So the data length is definitely correct.

> 
>> ...
>> I tried to inject Data Link Protocol Error on some platform. The mechanism
>> behind is that rootport controls the sequence number of the specific TLPs
>> and ACK/NAK DLLPs. Data Link Protocol Error will be detected at the Rx side
>> of ACK/NAK DLLPs.
>>
>> In such case, NIC and NVMe recovered on fatal and non-fatal DLLP
>> errors.
> 
> I'm guessing this error injection directly writes the AER status bit,
> which would probably only test the reporting (sending an ERR_FATAL
> message), AER interrupt generation, firmware or OS interrupt handling,
> etc.
> 
> It probably would not actually generate a DLLP with a bad sequence
> number, so it probably does not test the hardware behavior of
> discarding the DLLP if the sequence number is bad.  Just my guess
> though.

No, we don't touch AER status bit. The Root port controller provides Error
Injection Function to trigger a real DLLP error. For example,

- set a bad Bad sequence number, assuming 3
- enable error injection
- send a TLP from the controller's Application Interface, assuming SEQ#5 is
  given to the TLP
- the SEQ# is Changed to #2 by the Error Injection Function in Layer2.

> 
>> ...
>> My point is that how kernel could recover from non-fatal and fatal
>> errors in firmware first without DPC? If CPER_SEV_FATAL is used to
>> report fatal PCIe error, kernel will panic in APEI/GHES driver.
> 
> The platform decides whether to use CPER_SEV_FATAL, so we can't change
> that.  We *could* change whether Linux panics when the platform says
> an error is CPER_SEV_FATAL.  That happens in drivers/acpi, so it's
> really up to Rafael.

Agreed. Of course, we are talking about and focus on the desired behavior
of Linux kernel.

> 
> Personally I would want to hear from vendors who use the APEI/GHES
> path.  Poking around the web for logs that mention HEST and related
> things, it looks like at least Dell, HP, and Lenovo use it.  And there
> are drivers/acpi/apei commits from nxp.com, alibaba.com, amd.com,
> arm.com huawei.com, etc., so some of them probably care, too.
> 

Aha, sure. In OS native mode, kernel controls everything, directly acting
on the MSI, checking AER status and do recovery for CE, non-fatal and fatal
errors. While for firmware first, as it name indicates, the kernel and
firmware co-work together to handle processor, memory, PCIe and
platform specific errors.

Actually, this is a question from my colleague from firmware team.
The original question is that:

    "Should I set CPER_SEV_FATAL for Generic Error Status Block when a
    PCIe fatal error is detected? If set, kernel will always panic.
    Otherwise, kernel will always not panic."

So I pull a question about desired behavior of Linux kernel first :)
From the perspective of the kernel, CPER_SEV_FATAL for Generic Error
Status Block is not reasonable. The kernel will attempt to recover
Fatal errors, although recovery may fail.

Best Regards,
Shuai





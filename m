Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 773A51D8901
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 22:18:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qr1h36LnzDqjb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 06:18:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=prsriva@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=Q9rpHpZs; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 49Qqzl4FCFzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 06:16:50 +1000 (AEST)
Received: from [10.0.0.249] (c-24-19-135-168.hsd1.wa.comcast.net
 [24.19.135.168])
 by linux.microsoft.com (Postfix) with ESMTPSA id B920020B717B;
 Mon, 18 May 2020 13:16:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B920020B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1589833008;
 bh=AiI1FEEKEhOSrRhQ3c3bzHp2AdpU5JROR/niu6Z306c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q9rpHpZs48Mpes4cY2X39QKx5IHfkdJ2/ypAKpCbktJA44bsoqYL1qMcBcBSTW9p5
 LHN4E3zh7SF3PFrLthW/mOP2AZ4w/yRpivRy3xr3z1z6XI3XZsB+CoVnEK8V9BVqd7
 xBcJTcqKWHBuaojsIpeQnTElvTyd/b7Z6be2k15E=
Subject: Re: [RFC][PATCH 0/2] Add support for using reserved memory for ima
 buffer pass
To: Rob Herring <robh@kernel.org>
References: <20200504203829.6330-1-prsriva@linux.microsoft.com>
 <20200505095620.GA82424@C02TD0UTHF1T.local>
 <e8c7d74e-74bf-caa3-452d-23faa649e825@linux.microsoft.com>
 <20200512230509.GA2654@bogus>
From: Prakhar Srivastava <prsriva@linux.microsoft.com>
Message-ID: <7701df90-a68b-b710-4279-9d64e45ee792@linux.microsoft.com>
Date: Mon, 18 May 2020 13:16:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512230509.GA2654@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, kstewart@linuxfoundation.org,
 gregkh@linuxfoundation.org, bhsharma@redhat.com, tao.li@vivo.com,
 zohar@linux.ibm.com, paulus@samba.org, vincenzo.frascino@arm.com,
 will@kernel.org, nramas@linux.microsoft.com, frowand.list@gmail.com,
 masahiroy@kernel.org, jmorris@namei.org, takahiro.akashi@linaro.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 serge@hallyn.com, devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 hsinyi@chromium.org, tusharsu@linux.microsoft.com, tglx@linutronix.de,
 allison@lohutok.net, christophe.leroy@c-s.fr, mbrugger@suse.com,
 balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 james.morse@arm.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/12/20 4:05 PM, Rob Herring wrote:
> On Wed, May 06, 2020 at 10:50:04PM -0700, Prakhar Srivastava wrote:
>> Hi Mark,
> 
> Please don't top post.
> 
>> This patch set currently only address the Pure DT implementation.
>> EFI and ACPI implementations will be posted in subsequent patchsets.
>>
>> The logs are intended to be carried over the kexec and once read the
>> logs are no longer needed and in prior conversation with James(
>> https://lore.kernel.org/linux-arm-kernel/0053eb68-0905-4679-c97a-00c5cb6f1abb@arm.com/)
>> the apporach of using a chosen node doesn't
>> support the case.
>>
>> The DT entries make the reservation permanent and thus doesnt need kernel
>> segments to be used for this, however using a chosen-node with
>> reserved memory only changes the node information but memory still is
>> reserved via reserved-memory section.
> 
> I think Mark's point was whether it needs to be permanent. We don't
> hardcode the initrd address for example.
> 
Thankyou for clarifying my misunderstanding, i am modelling this keeping 
to the TPM log implementation that uses a reserved memory. I will rev up 
the version with chosen-node support.
That will make the memory reservation free after use.


>> On 5/5/20 2:59 AM, Mark Rutland wrote:
>>> Hi Prakhar,
>>>
>>> On Mon, May 04, 2020 at 01:38:27PM -0700, Prakhar Srivastava wrote:
>>>> IMA during kexec(kexec file load) verifies the kernel signature and measures
> 
> What's IMAIMA is a LSM attempting to detect if files have been accidentally or 
maliciously altered, both remotely and locally, it can also be used
to appraise a file's measurement against a "good" value stored as an 
extended attribute, and enforce local file integrity.

IMA also validates and measures the signers of the kernel and initrd
during kexec. The measurements are extended to PCR 10(configurable) and 
the logs stored in memory, however once kexec'd the logs are lost. Kexec 
is used as secondary boot loader in may use cases and loosing the signer
creates a security hole.

This patch is an implementation to carry over the logs and making it
possible to remotely validate the signers of the kernel and initrd. Such 
a support exits only in powerpc.
This patch makes the carry over of logs architecture independent and 
puts the complexity in a driver.

Thanks,
Prakhar
> 
>>>> the signature of the kernel. The signature in the logs can be used to verfiy the
>>>> authenticity of the kernel. The logs don not get carried over kexec and thus
>>>> remote attesation cannot verify the signature of the running kernel.
>>>>
>>>> Introduce an ABI to carry forward the ima logs over kexec.
>>>> Memory reserved via device tree reservation can be used to store and read
>>>> via the of_* functions.
>>>
>>> This flow needs to work for:
>>>
>>> 1) Pure DT
>>> 2) DT + EFI memory map
>>> 3) ACPI + EFI memory map
>>>
>>> ... and if this is just for transiently passing the log, I don't think
>>> that a reserved memory region is the right thing to use, since they're
>>> supposed to be more permanent.
>>>
>>> This sounds analogous to passing the initrd, and should probably use
>>> properties under the chosen node (which can be used for all three boot
>>> flows above).
>>>
>>> For reference, how big is the IMA log likely to be? Does it need
>>> physically contiguous space?
>>
>> It purely depends on the policy used and the modules/files that are accessed
>> for my local testing over a kexec session the log in
>> about 30KB.
>>
>> Current implementation expects enough contiguous memory to allocated to
>> carry forward the logs. If the log size exceeds the reserved memory the
>> call will fail.
>>
>> Thanks,
>> Prakhar Srivastava
>>>
>>> Thanks,
>>> Mark.
>>>
>>>>
>>>> Reserved memory stores the size(sizeof(size_t)) of the buffer in the starting
>>>> address, followed by the IMA log contents.
>>>>
>>>> Tested on:
>>>>     arm64 with Uboot
>>>>
>>>> Prakhar Srivastava (2):
>>>>     Add a layer of abstraction to use the memory reserved by device tree
>>>>       for ima buffer pass.
>>>>     Add support for ima buffer pass using reserved memory for arm64 kexec.
>>>>       Update the arch sepcific code path in kexec file load to store the
>>>>       ima buffer in the reserved memory. The same reserved memory is read
>>>>       on kexec or cold boot.
>>>>
>>>>    arch/arm64/Kconfig                     |   1 +
>>>>    arch/arm64/include/asm/ima.h           |  22 ++++
>>>>    arch/arm64/include/asm/kexec.h         |   5 +
>>>>    arch/arm64/kernel/Makefile             |   1 +
>>>>    arch/arm64/kernel/ima_kexec.c          |  64 ++++++++++
>>>>    arch/arm64/kernel/machine_kexec_file.c |   1 +
>>>>    arch/powerpc/include/asm/ima.h         |   3 +-
>>>>    arch/powerpc/kexec/ima.c               |  14 ++-
>>>>    drivers/of/Kconfig                     |   6 +
>>>>    drivers/of/Makefile                    |   1 +
>>>>    drivers/of/of_ima.c                    | 165 +++++++++++++++++++++++++
>>>>    include/linux/of.h                     |  34 +++++
>>>>    security/integrity/ima/ima_kexec.c     |  15 ++-
>>>>    13 files changed, 325 insertions(+), 7 deletions(-)
>>>>    create mode 100644 arch/arm64/include/asm/ima.h
>>>>    create mode 100644 arch/arm64/kernel/ima_kexec.c
>>>>    create mode 100644 drivers/of/of_ima.c
>>>>
>>>> -- 
>>>> 2.25.1
>>>>

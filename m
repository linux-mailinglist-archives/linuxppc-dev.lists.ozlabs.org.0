Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A64306C37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 05:27:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR6s03tTpzDsNq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 15:27:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=EdovfA0I; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DR6M87361zDrRs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 15:05:24 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7B19F20B7192;
 Wed, 27 Jan 2021 20:05:22 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7B19F20B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1611806723;
 bh=dzl2P44Yb+cNWgQrSsQPdvhI/zPDp51SLN+n5BsmTYw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EdovfA0Ie2vSW3q9X330ya4blxqJxmCNR8pb6jyTPfsAtUyZmv/J5Ert8cRTPsnjJ
 xhJBn/olUclZEvwaYdy3filR9a9BL3xmmmuC47b6RgwFGBYY+1lryf2SdYcSU6o5Tf
 +7NNRQWMwng/+UYSQ6g3DbAmnqbMMK2XACp6PUgo=
Subject: Re: [PATCH v15 10/10] arm64: Add IMA log information in kimage used
 for kexec
To: Will Deacon <will@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>
References: <20210115173017.30617-1-nramas@linux.microsoft.com>
 <20210115173017.30617-11-nramas@linux.microsoft.com>
 <20210127165424.GB358@willie-the-truck>
 <dec23eb8-0b27-3227-d1ef-f759338a7f9f@linux.microsoft.com>
 <20210127180230.GA593@willie-the-truck>
 <8a573f84-732a-3591-8751-f7b08edaa01d@linux.microsoft.com>
 <6343ab2eec390ab7582beea04f8006af095850c8.camel@linux.ibm.com>
 <20210127231334.GB1016@willie-the-truck>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <681a4410-8a96-bce1-fcd4-d45d56625b39@linux.microsoft.com>
Date: Wed, 27 Jan 2021 20:05:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127231334.GB1016@willie-the-truck>
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
Cc: mark.rutland@arm.com, bhsharma@redhat.com, tao.li@vivo.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, robh@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 takahiro.akashi@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, serge@hallyn.com, devicetree@vger.kernel.org,
 pasha.tatashin@soleen.com, prsriva@linux.microsoft.com, hsinyi@chromium.org,
 allison@lohutok.net, christophe.leroy@c-s.fr, mbrugger@suse.com,
 balajib@linux.microsoft.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, james.morse@arm.com, dmitry.kasatkin@gmail.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/27/21 3:13 PM, Will Deacon wrote:
> On Wed, Jan 27, 2021 at 01:31:02PM -0500, Mimi Zohar wrote:
>> On Wed, 2021-01-27 at 10:24 -0800, Lakshmi Ramasubramanian wrote:
>>> On 1/27/21 10:02 AM, Will Deacon wrote:
>>>> On Wed, Jan 27, 2021 at 09:56:53AM -0800, Lakshmi Ramasubramanian wrote:
>>>>> On 1/27/21 8:54 AM, Will Deacon wrote:
>>>>>> On Fri, Jan 15, 2021 at 09:30:17AM -0800, Lakshmi Ramasubramanian wrote:
>>>>>>> Address and size of the buffer containing the IMA measurement log need
>>>>>>> to be passed from the current kernel to the next kernel on kexec.
>>>>>>>
>>>>>>> Add address and size fields to "struct kimage_arch" for ARM64 platform
>>>>>>> to hold the address and size of the IMA measurement log buffer.
>>>>>>>
>>>>>>> Update CONFIG_KEXEC_FILE to select CONFIG_HAVE_IMA_KEXEC, if CONFIG_IMA
>>>>>>> is enabled, to indicate that the IMA measurement log information is
>>>>>>> present in the device tree for ARM64.
>>>>>>>
>>>>>>> Co-developed-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
>>>>>>> Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
>>>>>>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>>>>>>> Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>>>>>> ---
>>>>>>>     arch/arm64/Kconfig             | 1 +
>>>>>>>     arch/arm64/include/asm/kexec.h | 5 +++++
>>>>>>>     2 files changed, 6 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>>>>>> index 1d466addb078..ea7f7fe3dccd 100644
>>>>>>> --- a/arch/arm64/Kconfig
>>>>>>> +++ b/arch/arm64/Kconfig
>>>>>>> @@ -1094,6 +1094,7 @@ config KEXEC
>>>>>>>     config KEXEC_FILE
>>>>>>>     	bool "kexec file based system call"
>>>>>>>     	select KEXEC_CORE
>>>>>>> +	select HAVE_IMA_KEXEC if IMA
>>>>>>>     	help
>>>>>>>     	  This is new version of kexec system call. This system call is
>>>>>>>     	  file based and takes file descriptors as system call argument
>>>>>>> diff --git a/arch/arm64/include/asm/kexec.h b/arch/arm64/include/asm/kexec.h
>>>>>>> index d24b527e8c00..2bd19ccb6c43 100644
>>>>>>> --- a/arch/arm64/include/asm/kexec.h
>>>>>>> +++ b/arch/arm64/include/asm/kexec.h
>>>>>>> @@ -100,6 +100,11 @@ struct kimage_arch {
>>>>>>>     	void *elf_headers;
>>>>>>>     	unsigned long elf_headers_mem;
>>>>>>>     	unsigned long elf_headers_sz;
>>>>>>> +
>>>>>>> +#ifdef CONFIG_IMA_KEXEC
>>>>>>> +	phys_addr_t ima_buffer_addr;
>>>>>>> +	size_t ima_buffer_size;
>>>>>>> +#endif
>>>>>>
>>>>>> Why do these need to be in the arch structure instead of 'struct kimage'?
>>>>>>
>>>>>
>>>>> Currently, only powerpc and, with this patch set, arm64 have support for
>>>>> carrying forward IMA measurement list across kexec system call. The above
>>>>> fields are used for tracking IMA measurement list.
>>>>>
>>>>> Do you see a reason to move these fields to "struct kimage"?
>>>>
>>>> If they're gated on CONFIG_IMA_KEXEC, then it seems harmless for them to
>>>> be added to the shared structure. Or are you saying that there are
>>>> architectures which have CONFIG_IMA_KEXEC but do not want these fields?
>>>>
>>>
>>> As far as I know, there are no other architectures that define
>>> CONFIG_IMA_KEXEC, but do not use these fields.
>>
>> Yes, CONFIG_IMA_KEXEC enables "carrying the IMA measurement list across
>> a soft boot".   The only arch that currently carries the IMA
>> measurement across kexec is powerpc.
> 
> Ok, in which case this sounds like it should be in the shared structure, no?
> 

Ok - I'll move the IMA kexec buffer fields from "struct kimage_arch" to 
"struct kimage" for both powerpc and arm64.

thanks,
  -lakshmi



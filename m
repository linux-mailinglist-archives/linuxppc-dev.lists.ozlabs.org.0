Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9EF31FD71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 17:57:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhyRm4VxXz3cJk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 03:57:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=FYRJuY2O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=FYRJuY2O; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DhyRK4Rlrz30NJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 03:57:01 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id E620B209F5B5;
 Fri, 19 Feb 2021 08:56:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E620B209F5B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613753819;
 bh=iTig/qd/QFGUbmMQ2AA/PY/9N+Xj7TcCo65cJbp7QVU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FYRJuY2OHqIrR9U51vlBnGkozMi+zfs1dCX3syKmF8k70KCXr89Mz9X/88uC4nurX
 gQZhpy0mo/8eEP4lQ058URkDxHquXDU3/gHWTwtcQXgUKmad/irLGdZH2G+3KwMMrX
 vGjGjVZUsVqKWYYtQFMVMgIvlba0pV8SHnJRaSBE=
Subject: Re: [PATCH] of: error: 'const struct kimage' has no member named
 'arch'
To: Rob Herring <robh@kernel.org>
References: <20210218223305.2044-1-nramas@linux.microsoft.com>
 <c6490f6a126a2f10e3e3445b51ea552a26f896a9.camel@linux.ibm.com>
 <8b8c0b70-c7ab-33f3-b66c-9ea03388497b@linux.microsoft.com>
 <87k0r4yi4s.fsf@manicouagan.localdomain>
 <3ca0aa87-ca83-8024-4067-c2382a360db9@linux.microsoft.com>
 <CAL_JsqJiRV5xShOgso0PH2pFhv-yozay58i1uGQC0dJCVxkJPA@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <98a061d1-05ea-eff2-5c5c-a59f491fe924@linux.microsoft.com>
Date: Fri, 19 Feb 2021 08:56:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJiRV5xShOgso0PH2pFhv-yozay58i1uGQC0dJCVxkJPA@mail.gmail.com>
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
Cc: Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, Will Deacon <will@kernel.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/19/21 6:16 AM, Rob Herring wrote:
> On Thu, Feb 18, 2021 at 8:53 PM Lakshmi Ramasubramanian
> <nramas@linux.microsoft.com> wrote:
>>
>> On 2/18/21 5:13 PM, Thiago Jung Bauermann wrote:
>>>
>>> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
>>>
>>>> On 2/18/21 4:07 PM, Mimi Zohar wrote:
>>>>
>>>> Hi Mimi,
>>>>
>>>>> On Thu, 2021-02-18 at 14:33 -0800, Lakshmi Ramasubramanian wrote:
>>>>>> of_kexec_alloc_and_setup_fdt() defined in drivers/of/kexec.c builds
>>>>>> a new device tree object that includes architecture specific data
>>>>>> for kexec system call.  This should be defined only if the architecture
>>>>>> being built defines kexec architecture structure "struct kimage_arch".
>>>>>>
>>>>>> Define a new boolean config OF_KEXEC that is enabled if
>>>>>> CONFIG_KEXEC_FILE and CONFIG_OF_FLATTREE are enabled, and
>>>>>> the architecture is arm64 or powerpc64.  Build drivers/of/kexec.c
>>>>>> if CONFIG_OF_KEXEC is enabled.
>>>>>>
>>>>>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>>>>>> Fixes: 33488dc4d61f ("of: Add a common kexec FDT setup function")
>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>> ---
>>>>>>     drivers/of/Kconfig  | 6 ++++++
>>>>>>     drivers/of/Makefile | 7 +------
>>>>>>     2 files changed, 7 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
>>>>>> index 18450437d5d5..f2e8fa54862a 100644
>>>>>> --- a/drivers/of/Kconfig
>>>>>> +++ b/drivers/of/Kconfig
>>>>>> @@ -100,4 +100,10 @@ config OF_DMA_DEFAULT_COHERENT
>>>>>>             # arches should select this if DMA is coherent by default for OF devices
>>>>>>             bool
>>>>>>     +config OF_KEXEC
>>>>>> +  bool
>>>>>> +  depends on KEXEC_FILE
>>>>>> +  depends on OF_FLATTREE
>>>>>> +  default y if ARM64 || PPC64
>>>>>> +
>>>>>>     endif # OF
>>>>>> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
>>>>>> index c13b982084a3..287579dd1695 100644
>>>>>> --- a/drivers/of/Makefile
>>>>>> +++ b/drivers/of/Makefile
>>>>>> @@ -13,11 +13,6 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
>>>>>>     obj-$(CONFIG_OF_RESOLVE)  += resolver.o
>>>>>>     obj-$(CONFIG_OF_OVERLAY) += overlay.o
>>>>>>     obj-$(CONFIG_OF_NUMA) += of_numa.o
>>>>>> -
>>>>>> -ifdef CONFIG_KEXEC_FILE
>>>>>> -ifdef CONFIG_OF_FLATTREE
>>>>>> -obj-y     += kexec.o
>>>>>> -endif
>>>>>> -endif
>>>>>> +obj-$(CONFIG_OF_KEXEC) += kexec.o
>>>>>>       obj-$(CONFIG_OF_UNITTEST) += unittest-data/
>>>>> Is it possible to reuse CONFIG_HAVE_IMA_KEXEC here?
>>>>>
>>>>
>>>> For ppc64 CONFIG_HAVE_IMA_KEXEC is selected when CONFIG_KEXEC_FILE is enabled.
>>>> So I don't see a problem in reusing CONFIG_HAVE_IMA_KEXEC for ppc.
>>>>
>>>> But for arm64, CONFIG_HAVE_IMA_KEXEC is enabled in the final patch in the patch
>>>> set (the one for carrying forward IMA log across kexec for arm64). arm64 calls
>>>> of_kexec_alloc_and_setup_fdt() prior to enabling CONFIG_HAVE_IMA_KEXEC and hence
>>>> breaks the build for arm64.
>>>
>>> One problem is that I believe that this patch won't placate the robot,
>>> because IIUC it generates config files at random and this change still
>>> allows hppa and s390 to enable CONFIG_OF_KEXEC.
>>
>> I enabled CONFIG_OF_KEXEC for s390. With my patch applied,
>> CONFIG_OF_KEXEC is removed. So I think the robot enabling this config
>> would not be a problem.
>>
>>>
>>> Perhaps a new CONFIG_HAVE_KIMAGE_ARCH option? Not having that option
>>> would still allow building kexec.o, but would be used inside kexec.c to
>>> avoid accessing kimage.arch members.
>>>
>>
>> I think this is a good idea - a new CONFIG_HAVE_KIMAGE_ARCH, which will
>> be selected by arm64 and ppc for now. I tried this, and it fixes the
>> build issue.
>>
>> Although, the name for the new config can be misleading since PARISC,
>> for instance, also defines "struct kimage_arch". Perhaps,
>> CONFIG_HAVE_ELF_KIMAGE_ARCH since of_kexec_alloc_and_setup_fdt() is
>> accessing ELF specific fields in "struct kimage_arch"?
>>
>> Rob/Mimi - please let us know which approach you think is better.
> 
> I'd just move the fields to kimage.
> 

I think Mimi's suggestion to use CONFIG_HAVE_IMA_KEXEC for building 
drivers/of/kexec.c would work and also avoid the bisect issue if we do 
the following:

  - In the patch set for carrying forward the IMA log on kexec, move the 
following patch to a later point in the set

"[PATCH v18 04/11] arm64: Use common of_kexec_alloc_and_setup_fdt()"

and merge the above patch with the following patch
"[PATCH v18 11/11] arm64: Enable passing IMA log to next kernel on kexec"

I will try this now, and update.

thanks,
  -lakshmi

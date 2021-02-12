Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0531A36E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 18:20:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcgHr1Lz6zDwrK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Feb 2021 04:20:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=UFctr/Cj; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DcgFz5VTGzDwqn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Feb 2021 04:19:03 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id C5C7020B6C40;
 Fri, 12 Feb 2021 09:19:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C5C7020B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613150341;
 bh=ymZC2uSu1WhDmmhzMMk+j693znWvxWsQ0oRGutDXsUU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UFctr/CjGfWUVNUkmlcZdiSnRimSYXYpf7boiSafTdIohyW4op8aqXiOPIXG7tD9w
 2+CCCjIQwjmCzRCgCyJOtrEfXaan1toeQ6tewZfvQeoz8k1bHJnQ/MjJqkkzxmgjf+
 fBeDNBT4ANHJIZyDIIuAoR7Wx92T/5Rbhxu+1Yog=
Subject: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup function
To: Rob Herring <robh@kernel.org>
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210209182200.30606-3-nramas@linux.microsoft.com>
 <87k0reozwh.fsf@manicouagan.localdomain>
 <8a3aa3d2-2eba-549a-9970-a2b0fe3586c9@linux.microsoft.com>
 <CAL_JsqJ3sDzjsJXtb6EzE77BL+PhUxDJYUngLTqcm0popd7Ajw@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <55685b61-dac0-2f24-f74a-939acf74a4f2@linux.microsoft.com>
Date: Fri, 12 Feb 2021 09:19:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ3sDzjsJXtb6EzE77BL+PhUxDJYUngLTqcm0popd7Ajw@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, tao.li@vivo.com,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 vincenzo.frascino@arm.com, Frank Rowand <frowand.list@gmail.com>,
 Sasha Levin <sashal@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 James Morris <jmorris@namei.org>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, devicetree@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Will Deacon <will@kernel.org>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/12/21 6:38 AM, Rob Herring wrote:
> On Thu, Feb 11, 2021 at 7:17 PM Lakshmi Ramasubramanian
> <nramas@linux.microsoft.com> wrote:
>>
>> On 2/11/21 5:09 PM, Thiago Jung Bauermann wrote:
>>>
>>> There's actually a complication that I just noticed and needs to be
>>> addressed. More below.
>>>
>>
>> <...>
>>
>>>> +
>>>> +/*
>>>> + * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
>>>> + *
>>>> + * @image:          kexec image being loaded.
>>>> + * @initrd_load_addr:       Address where the next initrd will be loaded.
>>>> + * @initrd_len:             Size of the next initrd, or 0 if there will be none.
>>>> + * @cmdline:                Command line for the next kernel, or NULL if there will
>>>> + *                  be none.
>>>> + *
>>>> + * Return: fdt on success, or NULL errno on error.
>>>> + */
>>>> +void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
>>>> +                               unsigned long initrd_load_addr,
>>>> +                               unsigned long initrd_len,
>>>> +                               const char *cmdline)
>>>> +{
>>>> +    void *fdt;
>>>> +    int ret, chosen_node;
>>>> +    const void *prop;
>>>> +    unsigned long fdt_size;
>>>> +
>>>> +    fdt_size = fdt_totalsize(initial_boot_params) +
>>>> +               (cmdline ? strlen(cmdline) : 0) +
>>>> +               FDT_EXTRA_SPACE;
>>>
>>> Just adding 4 KB to initial_boot_params won't be enough for crash
>>> kernels on ppc64. The current powerpc code doubles the size of
>>> initial_boot_params (which is normally larger than 4 KB) and even that
>>> isn't enough. A patch was added to powerpc/next today which uses a more
>>> precise (but arch-specific) formula:
>>>
>>> https://lore.kernel.org/linuxppc-dev/161243826811.119001.14083048209224609814.stgit@hbathini/
>>>
>>> So I believe we need a hook here where architectures can provide their
>>> own specific calculation for the size of the fdt. Perhaps a weakly
>>> defined function providing a default implementation which an
>>> arch-specific file can override (a la arch_kexec_kernel_image_load())?
>>>
>>> Then the powerpc specific hook would be the kexec_fdt_totalsize_ppc64()
>>> function from the patch I linked above.
>>>
>>
>> Do you think it'd better to add "fdt_size" parameter to
>> of_kexec_alloc_and_setup_fdt() so that the caller can provide the
>> desired FDT buffer size?
> 
> Yes, I guess so. But please define the param as extra size, not total
> size. The kernel command line size addition can be in the common code.

Will do. Just to clarify -

The common code will do:

fdt_totalsize(initial_boot_params) + strlen(cmdline) + extra_fdt_size

The caller will pass "extra_fdt_size"
ARM64 => 4KB
PPC64 => fdt_totalsize(initial_boot_params) - which will be updated when 
the patch Thiago had referred to is merged.

> 
> The above change is also going to conflict, so I think this may have
> to wait. Or I'll take the common and arm bits and powerpc can be
> converted next cycle (or after the merge window).
> 

thanks.

  -lakshmi



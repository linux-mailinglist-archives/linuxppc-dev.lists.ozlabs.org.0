Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECD319855
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 03:29:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcHX30LQpzDwxt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 13:29:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=i6JWw/Jg; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DcHVS4QP6zDwvH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 13:28:31 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4513320B6C40;
 Thu, 11 Feb 2021 18:28:29 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4513320B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613096909;
 bh=7fqLD33HsQcypb6d5Z0LrN0OQye7FOvTJm1BvxIOKPU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=i6JWw/JgaKdiPtpXIDh2dk2yyovZo4VEy7LkXHjRlbfFJQ0krBS4f4j2wIwukTQKw
 tUAzIIAya/4ivg5htQLXSjr40CXyZSiWqk3+hFRJ+n3a5FXMabhqooYvtmQQJ71kvx
 TK09FA/TF/xMmTIsEksrZxCvlwRk/YVfNYXQO9aI=
Subject: Re: Fwd: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup
 function
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <202102120032.Bv0MoYv7-lkp@intel.com>
 <40fd1869-dcb4-36ae-e997-b8486dd4846c@linux.microsoft.com>
 <b534117e-333d-097c-a3c0-2a80985bd37f@linux.microsoft.com>
 <87mtwap35f.fsf@manicouagan.localdomain>
 <b4ebf962-4210-5d17-2149-6b152d587f95@linux.microsoft.com>
 <87eehmox08.fsf@manicouagan.localdomain>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <e7f3ae2e-20bc-9901-fb8d-80a3163e7d5e@linux.microsoft.com>
Date: Thu, 11 Feb 2021 18:28:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87eehmox08.fsf@manicouagan.localdomain>
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
Cc: Rob Herring <robh@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/11/21 6:11 PM, Thiago Jung Bauermann wrote:
> 
> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
> 
>> On 2/11/21 3:59 PM, Thiago Jung Bauermann wrote:
>>> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
>>>
>>>> On 2/11/21 9:42 AM, Lakshmi Ramasubramanian wrote:
>>>>> Hi Rob,
>>>>> [PATCH] powerpc: Rename kexec elfcorehdr_addr to elf_headers_mem
>>>>> This change causes build problem for x86_64 architecture (please see the
>>>>> mail from kernel test bot below) since arch/x86/include/asm/kexec.h uses
>>>>> "elf_load_addr" for the ELF header buffer address and not
>>>>> "elf_headers_mem".
>>>>> struct kimage_arch {
>>>>>        ...
>>>>>        /* Core ELF header buffer */
>>>>>        void *elf_headers;
>>>>>        unsigned long elf_headers_sz;
>>>>>        unsigned long elf_load_addr;
>>>>> };
>>>>> I am thinking of limiting of_kexec_alloc_and_setup_fdt() to ARM64 and
>>>>> PPC64 since they are the only ones using this function now.
>>>>> #if defined(CONFIG_ARM64) && defined(CONFIG_PPC64)
>>>> Sorry - I meant to say
>>>> #if defined(CONFIG_ARM64) || defined(CONFIG_PPC64)
>>>>
>>> Does it build correctly if you rename elf_headers_mem to elf_load_addr?
>>> Or the other way around, renaming x86's elf_load_addr to
>>> elf_headers_mem. I don't really have a preference.
>>
>> Yes - changing arm64 and ppc from "elf_headers_mem" to "elf_load_addr" builds
>> fine.
>>
>> But I am concerned about a few other architectures that also define "struct
>> kimage_arch" such as "parisc", "arm" which do not have any ELF related fields.
>> They would not build if the config defines CONFIG_KEXEC_FILE and
>> CONFIG_OF_FLATTREE.
>>
>> Do you think that could be an issue?
> 
> That's a good point. But in practice, arm doesn't support
> CONFIG_KEXEC_FILE. And while parisc does support CONFIG_KEXEC_FILE, as
> far as I could determine it doesn't support CONFIG_OF.
> 
> So IMHO we don't need to worry about them. We'll cross that bridge if we
> get there. If they ever implement KEXEC_FILE or OF_FLATTREE support,
> then (again, IMHO) the natural solution would be for them to name the
> ELF header member the same way the other arches do.
> 
> And since no other architecture defines struct kimage_arch, those are
> the only ones we need to consider.
> 

Sounds good Thiago.

I'll rename arm64 and ppc kimage_arch ELF address field to match that 
defined for x86/x64.

Also, will add "fdt_size" param to of_kexec_alloc_and_setup_fdt(). For 
now, I'll use 2*fdt_totalsize(initial_boot_params) for ppc.

Will send the updated patches shortly.

  -lakshmi


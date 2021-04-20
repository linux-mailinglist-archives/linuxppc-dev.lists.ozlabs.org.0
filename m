Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F0365B63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 16:42:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPmcW1bMCz30Gb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 00:42:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=hepldv/2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=hepldv/2; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FPmc51pV6z2xxq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 00:42:12 +1000 (AEST)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9A08120B8001;
 Tue, 20 Apr 2021 07:42:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9A08120B8001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1618929730;
 bh=NVm2vo4GXXRMexKDwSwg3+CXMqPX9ItM3I9tjQFYJeI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hepldv/2ui8GWJoHLyLWTVwmm7kq5UZFZipOgtP3OsMPbMS9OYkxhqJnRuBEqq1pz
 bkxXeMEs2LfKkTxZ2eAUkbIvjhEm/6oJHz4TChxZn9vCS57zzDEv7MyH7h66bossYy
 NjuigEso0BBbnxccOgktltZzkcaxa9xPIai7Xxjc=
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
To: Rob Herring <robh@kernel.org>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au> <87tuo6eh0j.fsf@mpe.ellerman.id.au>
 <2817d674-d420-580f-a0c1-b842da915a80@linux.microsoft.com>
 <87pmypdf93.fsf@mpe.ellerman.id.au> <20210420050015.GA1959@kadam>
 <b84c76d6-2be8-77a4-3c0f-ad8657c0e508@linux.microsoft.com>
 <CAL_JsqLS9Wu_+_S-2wwMb3Chd_8RYAtFe_uLh5tjj_sAkTgRJA@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <2e8dd39b-0372-4874-340e-6f87185091cc@linux.microsoft.com>
Date: Tue, 20 Apr 2021 07:42:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLS9Wu_+_S-2wwMb3Chd_8RYAtFe_uLh5tjj_sAkTgRJA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/20/21 6:06 AM, Rob Herring wrote:
> On Tue, Apr 20, 2021 at 12:20 AM Lakshmi Ramasubramanian
> <nramas@linux.microsoft.com> wrote:
>>
>> On 4/19/21 10:00 PM, Dan Carpenter wrote:
>>> On Tue, Apr 20, 2021 at 09:30:16AM +1000, Michael Ellerman wrote:
>>>> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
>>>>> On 4/16/21 2:05 AM, Michael Ellerman wrote:
>>>>>
>>>>>> Daniel Axtens <dja@axtens.net> writes:
>>>>>>>> On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
>>>>>>>>
>>>>>>>> Sorry - missed copying device-tree and powerpc mailing lists.
>>>>>>>>
>>>>>>>>> There are a few "goto out;" statements before the local variable "fdt"
>>>>>>>>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
>>>>>>>>> elf64_load(). This will result in an uninitialized "fdt" being passed
>>>>>>>>> to kvfree() in this function if there is an error before the call to
>>>>>>>>> of_kexec_alloc_and_setup_fdt().
>>>>>>>>>
>>>>>>>>> Initialize the local variable "fdt" to NULL.
>>>>>>>>>
>>>>>>> I'm a huge fan of initialising local variables! But I'm struggling to
>>>>>>> find the code path that will lead to an uninit fdt being returned...
>>>>>>>
>>>>>>> The out label reads in part:
>>>>>>>
>>>>>>>    /* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
>>>>>>>    return ret ? ERR_PTR(ret) : fdt;
>>>>>>>
>>>>>>> As far as I can tell, any time we get a non-zero ret, we're going to
>>>>>>> return an error pointer rather than the uninitialised value...
>>>>>
>>>>> As Dan pointed out, the new code is in linux-next.
>>>>>
>>>>> I have copied the new one below - the function doesn't return fdt, but
>>>>> instead sets it in the arch specific field (please see the link to the
>>>>> updated elf_64.c below).
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/arch/powerpc/kexec/elf_64.c?h=for-next
>>>>>
>>>>>>>
>>>>>>> (btw, it does look like we might leak fdt if we have an error after we
>>>>>>> successfully kmalloc it.)
>>>>>>>
>>>>>>> Am I missing something? Can you link to the report for the kernel test
>>>>>>> robot or from Dan?
>>>>>
>>>>> /*
>>>>>             * Once FDT buffer has been successfully passed to
>>>>> kexec_add_buffer(),
>>>>>             * the FDT buffer address is saved in image->arch.fdt. In that
>>>>> case,
>>>>>             * the memory cannot be freed here in case of any other error.
>>>>>             */
>>>>>            if (ret && !image->arch.fdt)
>>>>>                    kvfree(fdt);
>>>>>
>>>>>            return ret ? ERR_PTR(ret) : NULL;
>>>>>
>>>>> In case of an error, the memory allocated for fdt is freed unless it has
>>>>> already been passed to kexec_add_buffer().
>>>>
>>>> It feels like the root of the problem is that the kvfree of fdt is in
>>>> the wrong place. It's only allocated later in the function, so the error
>>>> path should reflect that. Something like the patch below.
>>>>
>>>> cheers
>>>>
>>>>
>>>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>>>> index 5a569bb51349..02662e72c53d 100644
>>>> --- a/arch/powerpc/kexec/elf_64.c
>>>> +++ b/arch/powerpc/kexec/elf_64.c
>>>> @@ -114,7 +114,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>>>       ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
>>>>                                 initrd_len, cmdline);
>>>>       if (ret)
>>>> -            goto out;
>>>> +            goto out_free_fdt;
>>>>
>>>>       fdt_pack(fdt);
>>>>
>>>> @@ -125,7 +125,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>>>       kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>>>>       ret = kexec_add_buffer(&kbuf);
>>>>       if (ret)
>>>> -            goto out;
>>>> +            goto out_free_fdt;
>>>>
>>>>       /* FDT will be freed in arch_kimage_file_post_load_cleanup */
>>>>       image->arch.fdt = fdt;
>>>> @@ -140,18 +140,14 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>>>       if (ret)
>>>>               pr_err("Error setting up the purgatory.\n");
>>>>
>>>> +    goto out;
>>>
>>> This will leak.  It would need to be something like:
>>>
>>>        if (ret) {
>>>                pr_err("Error setting up the purgatory.\n");
>>>                goto out_free_fdt;
>>>        }
>> Once "fdt" buffer is successfully passed to kexec_add_buffer() it cannot
>> be freed here - it will be freed when the kexec cleanup function is called.
> 
> That may be the case currently, but really if a function returns an
> error it should have undone anything it did like memory allocations. I
> don't think you should do that to fix this issue, but it would be a
> good clean-up.
> 

I agree - in case of an error the function should do a proper clean-up.
Just to be clear - for now, I will leave this as is. Correct?

In my patch, I will do the following changes:

  => Free "fdt" when possible (as Michael had suggested in his patch)
  => Zero out "elf_info" struct at the start of the function.

thanks,
  -lakshmi




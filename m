Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF21362285
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 16:38:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMJj9353Fz3c4W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 00:38:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=iMRHKbiJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=iMRHKbiJ; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FMJhk6xw1z30Bh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 00:37:42 +1000 (AEST)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9764920B8001;
 Fri, 16 Apr 2021 07:37:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9764920B8001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1618583859;
 bh=om/3vGgOZg+LIEcRJf0M9Ny9BhltFs3g4GQ3a2n92l0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iMRHKbiJoMe8luxwHTdfwJwXv0Zkz9XxY1n3v7T/KCX9IapcU85Sd3YKDZyS97TJf
 a+n+FKvcKXNG9LVU0KVPIARBA+W02Gh+MyaTY1p/uLXZPIeO0wzbBRYzKywKAddSFc
 sfpB57Bo2uiuXYLIZgdKcQ4/VJiDOpF5ndlYV87o=
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
To: Michael Ellerman <mpe@ellerman.id.au>, Daniel Axtens <dja@axtens.net>,
 robh@kernel.org, dan.carpenter@oracle.com
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au> <87tuo6eh0j.fsf@mpe.ellerman.id.au>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <2817d674-d420-580f-a0c1-b842da915a80@linux.microsoft.com>
Date: Fri, 16 Apr 2021 07:37:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87tuo6eh0j.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 kbuild-all@lists.01.org, bauerman@linux.ibm.com, lkp@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/16/21 2:05 AM, Michael Ellerman wrote:

> Daniel Axtens <dja@axtens.net> writes:
>>> On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
>>>
>>> Sorry - missed copying device-tree and powerpc mailing lists.
>>>
>>>> There are a few "goto out;" statements before the local variable "fdt"
>>>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
>>>> elf64_load(). This will result in an uninitialized "fdt" being passed
>>>> to kvfree() in this function if there is an error before the call to
>>>> of_kexec_alloc_and_setup_fdt().
>>>>
>>>> Initialize the local variable "fdt" to NULL.
>>>>
>> I'm a huge fan of initialising local variables! But I'm struggling to
>> find the code path that will lead to an uninit fdt being returned...
>>
>> The out label reads in part:
>>
>> 	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
>> 	return ret ? ERR_PTR(ret) : fdt;
>>
>> As far as I can tell, any time we get a non-zero ret, we're going to
>> return an error pointer rather than the uninitialised value...

As Dan pointed out, the new code is in linux-next.

I have copied the new one below - the function doesn't return fdt, but 
instead sets it in the arch specific field (please see the link to the 
updated elf_64.c below).

https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/arch/powerpc/kexec/elf_64.c?h=for-next

>>
>> (btw, it does look like we might leak fdt if we have an error after we
>> successfully kmalloc it.)
>>
>> Am I missing something? Can you link to the report for the kernel test
>> robot or from Dan?

/*
          * Once FDT buffer has been successfully passed to 
kexec_add_buffer(),
          * the FDT buffer address is saved in image->arch.fdt. In that 
case,
          * the memory cannot be freed here in case of any other error.
          */
         if (ret && !image->arch.fdt)
                 kvfree(fdt);

         return ret ? ERR_PTR(ret) : NULL;

In case of an error, the memory allocated for fdt is freed unless it has 
already been passed to kexec_add_buffer().

thanks,
  -lakshmi

>>
>> FWIW, I think it's worth including this patch _anyway_ because initing
>> local variables is good practice, but I'm just not sure on the
>> justification.
> 
> Why is it good practice?
> 
> It defeats -Wuninitialized. So you're guaranteed to be returning
> something initialised, but not necessarily initialised to the right
> value.
> 
> In a case like this NULL seems like a safe choice, but it's still wrong.
> The function is meant to return a pointer to the successfully allocated
> fdt, or an ERR_PTR() value. NULL is neither of those.
> 
> I agree there are security reasons that initialising stack variables is
> desirable, but I think that should be handled by the compiler, not at
> the source level.
> 
> cheers
> 


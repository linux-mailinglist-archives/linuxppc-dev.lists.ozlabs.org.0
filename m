Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E138366D7C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 16:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQMgM1hVXz30B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 00:02:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=M4fK1YtO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=M4fK1YtO; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FQMfs0qdLz2y6C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 00:01:40 +1000 (AEST)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7C1E920B8001;
 Wed, 21 Apr 2021 07:01:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7C1E920B8001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1619013699;
 bh=0rMlJHnlm7o7BhGsjgTQdkAaAL4NBVer+X1c+y9cuiQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=M4fK1YtOVuGYpHMek7CaIOsD57yKXdcOQWjDgRwY6P85Xy/LghAAmQCtWm7aEEs3D
 WXDP0a50HsrKEd2EDrgyUJOuxt8hjZu2OGat6LfVYHDQTOmg5mEX9rATixS01xuUV1
 Gcu5rVtXaRKSnE5NoapMWBAIKnP2qUbyrGLiGfps=
Subject: Re: [PATCH 1/2] powerpc: Free fdt on error in elf64_load()
To: Michael Ellerman <mpe@ellerman.id.au>, robh@kernel.org,
 dan.carpenter@oracle.com
References: <20210420190355.10059-1-nramas@linux.microsoft.com>
 <87r1j4aywp.fsf@mpe.ellerman.id.au>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <2f5b9e8b-6102-142f-57a5-a06fceee7d1b@linux.microsoft.com>
Date: Wed, 21 Apr 2021 07:01:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87r1j4aywp.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/21/21 12:18 AM, Michael Ellerman wrote:
> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
>> There are a few "goto out;" statements before the local variable "fdt"
>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
>> elf64_load().  This will result in an uninitialized "fdt" being passed
>> to kvfree() in this function if there is an error before the call to
>> of_kexec_alloc_and_setup_fdt().
>>
>> If there is any error after fdt is allocated, but before it is
>> saved in the arch specific kimage struct, free the fdt.
>>
>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> I basically sent you the diff, so this should probably be:
> 
>    Reported-by: kernel test robot <lkp@intel.com>
>    Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>    Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> 
> Otherwise looks good to me, thanks for turning it into a proper patch
> and submitting it.

I will submit the patch again with the above change.
Thanks for reviewing the patch.

Could you please review [PATCH 2/2] as well?

thanks,
  -lakshmi

> 
> cheers
> 
> 
>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>> index 5a569bb51349..02662e72c53d 100644
>> --- a/arch/powerpc/kexec/elf_64.c
>> +++ b/arch/powerpc/kexec/elf_64.c
>> @@ -114,7 +114,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>   	ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
>>   				  initrd_len, cmdline);
>>   	if (ret)
>> -		goto out;
>> +		goto out_free_fdt;
>>   
>>   	fdt_pack(fdt);
>>   
>> @@ -125,7 +125,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>   	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>>   	ret = kexec_add_buffer(&kbuf);
>>   	if (ret)
>> -		goto out;
>> +		goto out_free_fdt;
>>   
>>   	/* FDT will be freed in arch_kimage_file_post_load_cleanup */
>>   	image->arch.fdt = fdt;
>> @@ -140,18 +140,14 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>   	if (ret)
>>   		pr_err("Error setting up the purgatory.\n");
>>   
>> +	goto out;
>> +
>> +out_free_fdt:
>> +	kvfree(fdt);
>>   out:
>>   	kfree(modified_cmdline);
>>   	kexec_free_elf_info(&elf_info);
>>   
>> -	/*
>> -	 * Once FDT buffer has been successfully passed to kexec_add_buffer(),
>> -	 * the FDT buffer address is saved in image->arch.fdt. In that case,
>> -	 * the memory cannot be freed here in case of any other error.
>> -	 */
>> -	if (ret && !image->arch.fdt)
>> -		kvfree(fdt);
>> -
>>   	return ret ? ERR_PTR(ret) : NULL;
>>   }
>>   
>> -- 
>> 2.31.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB39366D81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 16:03:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQMhf04C7z30FQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 00:03:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fossix-org.20150623.gappssmtp.com header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=tow5+3Rx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=tow5+3Rx; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQMhB53ypz2y6C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 00:02:50 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id p2so14463510pgh.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 07:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=7JQFTWdsCn4fsbEucc5Bq7myn8+wnADXy2g5B7cWOzI=;
 b=tow5+3Rx8u7w/ZXLO6WaYfPn/2mG/N6rTZWvIb9darRByS5VoqnY2OT9pw2/gJ1vac
 zxBMTqtsUcS2IPwaCM39IpvQZ2CwDrgT58Vr10Gg2xKJt1qXsLPMfcbu6n3HzhYu/gFJ
 S0R5ZylAW4QVyDKVx2DHfSFmKwCi6sMsBOfC/MOxvG1oP5BHOxTcg/MBjP1pxVdd+QoP
 eygQ+LT60s1xEn8A/C91MWSCpOKz4RYSpiioYC5JnZPRaUqiwyPDeZi2Xy6zkyroWt7Z
 iZNUs+GPmPYWVDCFMhV7sueGj5QtEBWWk1L+0USo949cJR8gNp5KdDDJUWxPZe2rqWYc
 SOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=7JQFTWdsCn4fsbEucc5Bq7myn8+wnADXy2g5B7cWOzI=;
 b=HNCFahLpdwizUH3TcIjyF7GoB6Y7zMZET4ss51wB2qNmtE0XXFuTLFWEzcisgoO2Sz
 wPiISPwKALDUwP0KxzGnU3R7WR0xYSKa/XjBUGF6aBHGjUalzwv2vepx+ZBDvqQqUw6V
 IwtYOifn6BK5XYofqN51UxUOQnpnmqjSUUgDLAPAzTnQkWiq5jWIV/gGijcginfIph2H
 30bw/8jOzVSp6CxipezzZ0nHnoGFYmT1AnanEpbJx8IFQX1EjpmbIgnWHlj3gXymeYNU
 OXGViaoI084XPPJImAkUp/yYDFcYz/J+K8nP68Fdkfkxpi6a/gLWNwZv4tbIE6zyee96
 tlyw==
X-Gm-Message-State: AOAM5319IOTVWbjztUqyiZOMnKAeN1TBybtPE3XRHfc0dQmFyU1BnZ3a
 5xUgXBWezNX11hfF6jXL0GAo/w==
X-Google-Smtp-Source: ABdhPJz2WuVoCTLtTWeBX6xtbaCc2HVIo1lF0jCm0HCQdubOip2eddOYyvtmyszkIl48NY1zqa5WGA==
X-Received: by 2002:a17:90a:f00d:: with SMTP id
 bt13mr11509735pjb.90.1619013767218; 
 Wed, 21 Apr 2021 07:02:47 -0700 (PDT)
Received: from localhost ([103.21.79.4])
 by smtp.gmail.com with ESMTPSA id s3sm2113659pgs.62.2021.04.21.07.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 07:02:46 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, robh@kernel.org,
 dan.carpenter@oracle.com, mpe@ellerman.id.au
Subject: Re: [PATCH 1/2] powerpc: Free fdt on error in elf64_load()
In-Reply-To: <407a9f66-8f91-9c6e-9653-738ba79a97b2@linux.microsoft.com>
References: <20210420190355.10059-1-nramas@linux.microsoft.com>
 <871rb4yzca.fsf@fossix.org>
 <407a9f66-8f91-9c6e-9653-738ba79a97b2@linux.microsoft.com>
Date: Wed, 21 Apr 2021 19:32:42 +0530
Message-ID: <87pmynybul.fsf@fossix.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:

> On 4/20/21 10:35 PM, Santosh Sivaraj wrote:
> Hi Santosh,
>
>> 
>>> There are a few "goto out;" statements before the local variable "fdt"
>>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
>>> elf64_load().  This will result in an uninitialized "fdt" being passed
>>> to kvfree() in this function if there is an error before the call to
>>> of_kexec_alloc_and_setup_fdt().
>>>
>>> If there is any error after fdt is allocated, but before it is
>>> saved in the arch specific kimage struct, free the fdt.
>>>
>>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>>> ---
>>>   arch/powerpc/kexec/elf_64.c | 16 ++++++----------
>>>   1 file changed, 6 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>>> index 5a569bb51349..02662e72c53d 100644
>>> --- a/arch/powerpc/kexec/elf_64.c
>>> +++ b/arch/powerpc/kexec/elf_64.c
>>> @@ -114,7 +114,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>>   	ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
>>>   				  initrd_len, cmdline);
>>>   	if (ret)
>>> -		goto out;
>>> +		goto out_free_fdt;
>> 
>> Shouldn't there be a goto out_free_fdt if fdt_open_into fails?
>
> You are likely looking at elf_64.c in the mainline branch. The patch I 
> have submitted is based on Rob's device-tree for-next branch. Please see 
> the link below:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/arch/powerpc/kexec/elf_64.c?h=for-next

That's right, I was indeed looking at the mainline. Sorry for the noise.

Thanks,
Santosh

>
>> 
>>>   
>>>   	fdt_pack(fdt);
>>>   
>>> @@ -125,7 +125,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>>   	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>>>   	ret = kexec_add_buffer(&kbuf);
>>>   	if (ret)
>>> -		goto out;
>>> +		goto out_free_fdt;
>>>   
>>>   	/* FDT will be freed in arch_kimage_file_post_load_cleanup */
>>>   	image->arch.fdt = fdt;
>>> @@ -140,18 +140,14 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>>   	if (ret)
>>>   		pr_err("Error setting up the purgatory.\n");
>>>   
>>> +	goto out;
>>> +
>>> +out_free_fdt:
>>> +	kvfree(fdt);
>> 
>> Can just use kfree here?
> "fdt" is allocated through kvmalloc(). So it is freed using kvfree.
>
> thanks,
>   -lakshmi
>
>>>   out:
>>>   	kfree(modified_cmdline);
>>>   	kexec_free_elf_info(&elf_info);
>>>   
>>> -	/*
>>> -	 * Once FDT buffer has been successfully passed to kexec_add_buffer(),
>>> -	 * the FDT buffer address is saved in image->arch.fdt. In that case,
>>> -	 * the memory cannot be freed here in case of any other error.
>>> -	 */
>>> -	if (ret && !image->arch.fdt)
>>> -		kvfree(fdt);
>>> -
>>>   	return ret ? ERR_PTR(ret) : NULL;
>>>   }
>>>   
>>> -- 
>>> 2.31.0

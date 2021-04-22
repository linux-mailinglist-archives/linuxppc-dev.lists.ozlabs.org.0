Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA30367751
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 04:21:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQh4X1yKhz30D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 12:21:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=e9ZQBA84;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=e9ZQBA84; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQh461Z9Vz2xg1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 12:21:09 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 j14-20020a17090a694eb0290152d92c205dso132043pjm.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 19:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=rtMvEVhQW7PSxXx3gDEY/7/ndA+VJactp7XJCyvYRds=;
 b=e9ZQBA84dRYzG3c8qvB3M8kCpiwPbX0MF0xpeInbdqk0aAlkzOGlE/VTdOSoydcYJZ
 jH4i3Da7Gg5jq9AOdbo6muUudMD4MZaRMQF8uI8YLSQD++Ng8nmb7seDkOSdRvAVEDBL
 OO1kpq/LngnBf+Hk+gHoS86FQhMtGk3ET4xj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=rtMvEVhQW7PSxXx3gDEY/7/ndA+VJactp7XJCyvYRds=;
 b=XsXUXcdnS1dMmg1/ufNyEDm9XR9bV1W51AlgA+sDba6k8GcrWQFmR0KoeBilKabf0T
 Gdc4+JKxGhco0AUO9Wo+Zn2Afo4bBU3JTEXCytlDzKZePUo3PMwnLPWX+a6JJFNeW3w0
 wt7iZayyo3V8iyPQ4ZZQsHinq8lQ0Z18jX8YEhPG+NHGqCtRinUFS3Isu2/Hr1UkVFsV
 maehkYWRcvj1mxof1U+XQ+RhjaiDbfiFmsahPGBsgcieWLRTMJfgNimf3/UIwpgmuuZl
 bRvBNbBWm1WbLT7szIe5Vzh4KD14s8519i+XqY+GsPq4pGX6i6cQi7WgAdCn1/hBX/gm
 7ffA==
X-Gm-Message-State: AOAM532/dfXophccqaJfaU8vH8aYJnCnyClz27xpvgfatalSFAgQpmP4
 Jh8grUPA2Nhoj3QWR74D9gsXDQ==
X-Google-Smtp-Source: ABdhPJzSfBbIuocRNt5X/klBmTsHAtSRfJcc6vLLNyDfYWk2IMBm6IUeS/HlmWtYoMPitwmt5p0UEQ==
X-Received: by 2002:a17:90a:c404:: with SMTP id
 i4mr14838105pjt.10.1619058065160; 
 Wed, 21 Apr 2021 19:21:05 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-0077-ddd3-a27e-431c.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:77:ddd3:a27e:431c])
 by smtp.gmail.com with ESMTPSA id nv7sm3032529pjb.18.2021.04.21.19.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 19:21:04 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, robh@kernel.org,
 dan.carpenter@oracle.com
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
In-Reply-To: <87eefag241.fsf@linkitivity.dja.id.au>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au>
Date: Thu, 22 Apr 2021 12:21:01 +1000
Message-ID: <87r1j3ys8i.fsf@dja-thinkpad.axtens.net>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 kbuild-all@lists.01.org, bauerman@linux.ibm.com, lkp@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:

> Hi Lakshmi,
>
>> On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
>>
>> Sorry - missed copying device-tree and powerpc mailing lists.
>>
>>> There are a few "goto out;" statements before the local variable "fdt"
>>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
>>> elf64_load(). This will result in an uninitialized "fdt" being passed
>>> to kvfree() in this function if there is an error before the call to
>>> of_kexec_alloc_and_setup_fdt().
>>> 
>>> Initialize the local variable "fdt" to NULL.
>>>
> I'm a huge fan of initialising local variables! But I'm struggling to
> find the code path that will lead to an uninit fdt being returned...

OK, so perhaps this was putting it too strongly. I have been bitten
by uninitialised things enough in C that I may have taken a slightly
overly-agressive view of fixing them in the source rather than the
compiler. I do think compiler-level mitigations are better, and I take
the point that we don't want to defeat compiler checking.

(Does anyone - and by anyone I mean any large distro - compile with
local variables inited by the compiler?)

I was reading the version in powerpc/next, clearly I should have looked
at linux-next. Having said that, I think I will leave the rest of the
bikeshedding to the rest of you, you all seem to have it in hand :)

Kind regards,
Daniel

>
> The out label reads in part:
>
> 	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
> 	return ret ? ERR_PTR(ret) : fdt;
>
> As far as I can tell, any time we get a non-zero ret, we're going to
> return an error pointer rather than the uninitialised value...
>
> (btw, it does look like we might leak fdt if we have an error after we
> successfully kmalloc it.)
>
> Am I missing something? Can you link to the report for the kernel test
> robot or from Dan? 
>
> FWIW, I think it's worth including this patch _anyway_ because initing
> local variables is good practice, but I'm just not sure on the
> justification.
>
> Kind regards,
> Daniel
>
>>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>>   arch/powerpc/kexec/elf_64.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>>> index 5a569bb51349..0051440c1f77 100644
>>> --- a/arch/powerpc/kexec/elf_64.c
>>> +++ b/arch/powerpc/kexec/elf_64.c
>>> @@ -32,7 +32,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>>   	int ret;
>>>   	unsigned long kernel_load_addr;
>>>   	unsigned long initrd_load_addr = 0, fdt_load_addr;
>>> -	void *fdt;
>>> +	void *fdt = NULL;
>>>   	const void *slave_code;
>>>   	struct elfhdr ehdr;
>>>   	char *modified_cmdline = NULL;
>>> 
>>
>> thanks,
>>   -lakshmi

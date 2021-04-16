Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B48633619FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 08:45:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM6CK1fB4z3brc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 16:45:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=cmkn0sPj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=cmkn0sPj; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM6Bw018Sz302y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 16:44:37 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id cu16so11426174pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 23:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=u+Ddaz9peG998Lz+UWrfM3P9RuEHrzjlPdY7UuQjR3w=;
 b=cmkn0sPjbiOFMw3vcx7xC7oxxDxJsOQgHZThhseH2E67KTpHQzcGNfHb7pLVnAhbOd
 KP5BsZj6O95A4Fa4wkODthEfd0hNN+33+PIYjmlwpopFRZq0d+33TC+2dwdcVT/ag8bH
 sGdUdlu4WCj+TxjV14NkUd3V2tpQYOo5FZYog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=u+Ddaz9peG998Lz+UWrfM3P9RuEHrzjlPdY7UuQjR3w=;
 b=RNvudN8WhfSG9RuuK2mkNWzU9Tb5HxPHVduuRmWFzcAZiNTlc0biJg348EPo9k0Si6
 5a+CW/C7CbxOoksG3Hv3aRgyTkAQGv4pIVt22YaPqFcS3QG/+1VN5vzeE4ZEcocWOLz5
 ALjmHvXEwL+2YBHVJqXsh/+Q0ZoJ16UQHtRVInvX5EjioV9xplmRHFkw7NS8ywftncI4
 2hwiLB1hNmSQvA4wPQORDkSR7Rm1RLCRZiZeHV/Tczqqx3/nOSTYN/G1InYWSL7J2rAu
 n03gOdIfga2EV6Vt1XzNcrzn5g/re2p4j3yaUOSBuKIkhON4BG+6p85smvi/JJfuJPYG
 UuCw==
X-Gm-Message-State: AOAM532P2XzLIwV8kgD1fiWRD/wdIOANUC98B7nYFB30ulIgagep1xSK
 m6TOJxl3Q/8aMkCrjV7V8ZULLA==
X-Google-Smtp-Source: ABdhPJxGCOWnXZrcOlgeZVlgOb/YJRzhJ0+FDOT14Z0DI5NPNg9oeLXfCM2nZMTMzS98hh8QrL6eMg==
X-Received: by 2002:a17:90a:6582:: with SMTP id
 k2mr8039400pjj.11.1618555475245; 
 Thu, 15 Apr 2021 23:44:35 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-09c3-a49e-2955-78c6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:9c3:a49e:2955:78c6])
 by smtp.gmail.com with ESMTPSA id g18sm3815559pfb.178.2021.04.15.23.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 23:44:34 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, robh@kernel.org,
 dan.carpenter@oracle.com
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
In-Reply-To: <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
Date: Fri, 16 Apr 2021 16:44:30 +1000
Message-ID: <87eefag241.fsf@linkitivity.dja.id.au>
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

Hi Lakshmi,

> On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
>
> Sorry - missed copying device-tree and powerpc mailing lists.
>
>> There are a few "goto out;" statements before the local variable "fdt"
>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
>> elf64_load(). This will result in an uninitialized "fdt" being passed
>> to kvfree() in this function if there is an error before the call to
>> of_kexec_alloc_and_setup_fdt().
>> 
>> Initialize the local variable "fdt" to NULL.
>>
I'm a huge fan of initialising local variables! But I'm struggling to
find the code path that will lead to an uninit fdt being returned...

The out label reads in part:

	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
	return ret ? ERR_PTR(ret) : fdt;

As far as I can tell, any time we get a non-zero ret, we're going to
return an error pointer rather than the uninitialised value...

(btw, it does look like we might leak fdt if we have an error after we
successfully kmalloc it.)

Am I missing something? Can you link to the report for the kernel test
robot or from Dan? 

FWIW, I think it's worth including this patch _anyway_ because initing
local variables is good practice, but I'm just not sure on the
justification.

Kind regards,
Daniel

>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>   arch/powerpc/kexec/elf_64.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>> index 5a569bb51349..0051440c1f77 100644
>> --- a/arch/powerpc/kexec/elf_64.c
>> +++ b/arch/powerpc/kexec/elf_64.c
>> @@ -32,7 +32,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>   	int ret;
>>   	unsigned long kernel_load_addr;
>>   	unsigned long initrd_load_addr = 0, fdt_load_addr;
>> -	void *fdt;
>> +	void *fdt = NULL;
>>   	const void *slave_code;
>>   	struct elfhdr ehdr;
>>   	char *modified_cmdline = NULL;
>> 
>
> thanks,
>   -lakshmi

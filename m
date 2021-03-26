Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97D34AB2D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:14:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6QVS6RZpz3c5y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 02:14:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rNPmT0XJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=0x7f454c46@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rNPmT0XJ; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6QV130Hvz30GW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 02:13:44 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id x16so5989973wrn.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+GI+W3RAa0ZA+ym1aj65EaNHQ7xpXkJd2wHQUksXW8w=;
 b=rNPmT0XJf9fiX//aPicgq8RW2boG43CQCI0y6Oe+J/qn/riqKzbp4hzTC8rUxcH69C
 +I31qXKJqJ0HTDxuS+vw2E6AKeeItdk50653Ayz6fuuoDJZRFjyrHRfMPI7L8MOClMAM
 iAwU1GXAAs9KkTtUVQeRTCV7xn8yk4mlgWl3dulUGn6sRHaDmxEUvy6wr5YiISlcJYwK
 n/7rB47Dy/fF0VB/kAUrlOv1btw3T0t5sEDTBXdFrtRXiwz1mUik38pJTRun6PQOnoz7
 UIb1YSAPjUE2iDO7Q2T+zuNNynfTfoDtv4iDDr6ORxkgxv+o5Mngj+LC19HflU6vwS8o
 PzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+GI+W3RAa0ZA+ym1aj65EaNHQ7xpXkJd2wHQUksXW8w=;
 b=K39tzJSPu/FnYzmZgDP2td1lsyTnwb0xGlIeB8Wvi7oEATzQnP1r8jzBXFaUgQ8zZt
 tvbBBYadHobNPBuN4x2WjL5MSGK5SIV1waXv5n1iG32D8sOeDvLfgbBaFvIZfP0X//mi
 fi91mI63tZbIluXyTFDOWmOmXOxFKFoGx+YM2oxNxV4MsN+ddwlOFk3wBWIj39/HXvCT
 kQpBJUaADm4c9n0pb/acFNepyFvq4mDl+cW9TOwxDPHenvXaVpQr+10oSoR6YHZbK1CK
 Q2P3AHvnIkPGipJ4UgOvlpqoWrHE4oKhnSd2LLR99dIxIxFHOo012sPhc8I0igH9424w
 JVLw==
X-Gm-Message-State: AOAM530QyLeHcBJ1Wb/ZPwcSkRS4JFKIkizW1M3Yrpbj0XW0TFKhsOaj
 0g3enRC1Wh9i56SBtNkur5w=
X-Google-Smtp-Source: ABdhPJwyedS09qkghJnr6fvsJmqTp6DuE4JIjrhL3AgIFYLFBt7/+ifqcXRp6tKFyR56ACn9nYcO+Q==
X-Received: by 2002:a5d:4445:: with SMTP id x5mr15382053wrr.30.1616771617031; 
 Fri, 26 Mar 2021 08:13:37 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8?
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id v18sm13958548wrf.41.2021.03.26.08.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 08:13:36 -0700 (PDT)
Subject: Re: VDSO ELF header
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Laurent Dufour <ldufour@linux.ibm.com>
References: <c45ae4f8-1cbc-c687-b6a2-9a431fafc85c@linux.ibm.com>
 <9366c258-127f-f105-abd1-6baa9a6745c5@csgroup.eu>
 <5b03e966-2cfd-5f0c-c48d-dea5e0001833@linux.ibm.com>
 <30c51951-332b-7aa8-13ba-44a0b6ae3498@linux.ibm.com>
 <87blb6gpkj.fsf@mpe.ellerman.id.au>
 <c7e0568f-786b-2c1c-fb6d-cd804bc1b539@csgroup.eu>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Message-ID: <e8c2b4b5-f0b6-945e-4a42-c2308dd719a2@gmail.com>
Date: Fri, 26 Mar 2021 15:13:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c7e0568f-786b-2c1c-fb6d-cd804bc1b539@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 3/26/21 10:50 AM, Christophe Leroy wrote:
> 
> 
> Le 26/03/2021 à 11:46, Michael Ellerman a écrit :
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>> Le 25/03/2021 à 17:56, Laurent Dufour a écrit :
>>>> Le 25/03/2021 à 17:46, Christophe Leroy a écrit :
>>>>> Le 25/03/2021 à 17:11, Laurent Dufour a écrit :
>>>>>> Since v5.11 and the changes you made to the VDSO code, it no more
>>>>>> exposing
>>>>>> the ELF header at the beginning of the VDSO mapping in user space.
>>>>>>
>>>>>> This is confusing CRIU which is checking for this ELF header cookie
>>>>>> (https://github.com/checkpoint-restore/criu/issues/1417).
>>>>>
>>>>> How does it do on other architectures ?
>>>>
>>>> Good question, I'll double check the CRIU code.
>>>
>>> On x86, there are 2 VDSO entries:
>>> 7ffff7fcb000-7ffff7fce000 r--p 00000000 00:00
>>> 0                          [vvar]
>>> 7ffff7fce000-7ffff7fcf000 r-xp 00000000 00:00
>>> 0                          [vdso]
>>>
>>> And the VDSO is starting with the ELF header.
>>>
>>>>>> I'm not an expert in loading and ELF part and reading the change
>>>>>> you made, I
>>>>>> can't identify how this could work now as I'm expecting the loader
>>>>>> to need
>>>>>> that ELF header to do the relocation.
>>>>>
>>>>> I think the loader is able to find it at the expected place.
>>>>
>>>> Actually, it seems the loader relies on the AUX vector
>>>> AT_SYSINFO_EHDR. I guess
>>>> CRIU should do the same.
>>>>
>>>>>>
>>>>>>   From my investigation it seems that the first bytes of the VDSO
>>>>>> area are now
>>>>>> the vdso_arch_data.
>>>>>>
>>>>>> Is the ELF header put somewhere else?
>>>>>> How could the loader process the VDSO without that ELF header?
>>>>>>
>>>>>
>>>>> Like most other architectures, we now have the data section as
>>>>> first page and
>>>>> the text section follows. So you will likely find the elf header on
>>>>> the second
>>>>> page.
>>>
>>> I'm wondering if the data section you're refering to is the vvar
>>> section I can
>>> see on x86.
>>
>> Many of the other architectures have separate vm_special_mapping's for
>> the data page and the vdso binary, where the former is called "vvar".
>>
>> eg, s390:
>>
>> static struct vm_special_mapping vvar_mapping = {
>>     .name = "[vvar]",
>>     .fault = vvar_fault,
>> };
>>
>> static struct vm_special_mapping vdso_mapping = {
>>     .name = "[vdso]",
>>     .mremap = vdso_mremap,
>> };
>>
>>
>> I guess we probably should be doing that too.
>>
> 
> Dmitry proposed the same, see
> https://github.com/0x7f454c46/linux/commit/783c7a2532d2219edbcf555cc540eab05f698d2a
> 
> 
> Discussion at https://github.com/checkpoint-restore/criu/issues/1417

Yeah, I didn't submit it officially to lkml because I couldn't test it
yet (and I usually don't send untested patches). The VM I have fails to
kexec and there's some difficulty to get serial console working, so I'd
appreciate if someone could either pick it up, or add tested-by.

Thanks,
          Dmitry

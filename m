Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 652862FCA35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 06:09:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLD8900RHzDqwD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 16:08:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=T+xxjS6n; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLD4T21dCzDqwF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 16:05:43 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id g15so1412483pjd.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 21:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cXSghafCoLyghf6a9xRFVTCEKKeerf091GAh1xBKiX0=;
 b=T+xxjS6ngUZXEL9PZSygGdcRGZlvjS0UdUGZMg4oUCjF18ltxXzhLuA//+XDrqtlSN
 3YQZTABoyPB3NCjLwp8Vm7Jo7UD287RNuNsxOqceDMR+CPoEE330LumjGJrulfEAHETL
 Bhr/Swzmm0nXHCOKdjpoOzKCN+VQurkG1jbQ5Dz77X268zgofnl9KwFDPjyBGwx6aOg8
 vLQVa2JiIRPPX086EFj2aNwo/RWUNVEYlsZ0U7pPDpAIquR7Tqw4urYXEzVMJkW8pm75
 oyNnKIYIF/CGxIh9Bi7FAnKhP62porcQBGSsb1VJrCAnsio9Wu6ydzRWo9fbAmfCS5u6
 OIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cXSghafCoLyghf6a9xRFVTCEKKeerf091GAh1xBKiX0=;
 b=MQ+MZtq7la7yFtXR1Nsq9faLV9MP+FM1R5ERIK9TWiwjLc1xQDkFc+586Ni9p8+Zxm
 jLsWA2qQC3hSoHQJdunPGsmuvlRrV/+7Te1jv0LtfwWrevNtQgMPNLk46kWwCF5HItDN
 ZaFdfPqX87MUBBGT1oaq+TMoK+nV0x8kzecB1Ty05yFvMc0gKlmhpkEcbCoU7w8sz66a
 Y/lLzFu0YzZRxhvsCffJusoyFHcKnij0DsGjsROhawR86DYpBSSh99tX9p4VXUSEza19
 mTgYVhG53LjgvrovXhJFzpSQTK2qNq6YlhrwENMkKMkFs//spelDZ1Bcmdu5wZqg9pHp
 RMZg==
X-Gm-Message-State: AOAM530wNI9gIvDCicmPB0USLzuRFSn854NoMy/1o7ZzGFkr9oq0prf0
 omWCiom7cJlOhNaUzmwYMCGoPwnvbVyzhA==
X-Google-Smtp-Source: ABdhPJxEx1FT+hCD4SAfiwBcxNKAPxgPrjkIhqz0i6HNlFXsKHPvvYmGgKmrdPQ9/CXo1CNfBoYEzw==
X-Received: by 2002:a17:90a:f0c1:: with SMTP id
 fa1mr3597985pjb.3.1611119137214; 
 Tue, 19 Jan 2021 21:05:37 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id bj18sm622364pjb.40.2021.01.19.21.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 21:05:36 -0800 (PST)
Subject: Re: [PATCH 5/6] powerpc/rtas: rename RTAS_RMOBUF_MAX to
 RTAS_USER_REGION_SIZE
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-6-nathanl@linux.ibm.com>
 <d91c5b15-7c3d-a332-45ac-1b865341e962@ozlabs.ru>
 <87a6taxkgf.fsf@linux.ibm.com>
 <6905c3d2-e524-b6d8-036f-7812ea3f8b85@ozlabs.ru>
 <87y2gowgo6.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <7988dce5-6cf3-df79-1276-7bc91ce7c8b2@ozlabs.ru>
Date: Wed, 20 Jan 2021 16:05:31 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <87y2gowgo6.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/01/2021 12:17, Nathan Lynch wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>> On 16/01/2021 02:56, Nathan Lynch wrote:
>>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>>> On 15/01/2021 09:00, Nathan Lynch wrote:
>>>>> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
>>>>> index 332e1000ca0f..1aa7ab1cbc84 100644
>>>>> --- a/arch/powerpc/include/asm/rtas.h
>>>>> +++ b/arch/powerpc/include/asm/rtas.h
>>>>> @@ -19,8 +19,11 @@
>>>>>     #define RTAS_UNKNOWN_SERVICE (-1)
>>>>>     #define RTAS_INSTANTIATE_MAX (1ULL<<30) /* Don't instantiate rtas at/above this value */
>>>>>     
>>>>> -/* Buffer size for ppc_rtas system call. */
>>>>> -#define RTAS_RMOBUF_MAX (64 * 1024)
>>>>> +/* Work areas shared with RTAS must be 4K, naturally aligned. */
>>>>
>>>> Why exactly 4K and not (for example) PAGE_SIZE?
>>>
>>> 4K is a platform requirement and isn't related to Linux's configured
>>> page size. See the PAPR specification for RTAS functions such as
>>> ibm,configure-connector, ibm,update-nodes, ibm,update-properties.
>>
>> Good, since we are documenting things here - add to the comment ("per
>> PAPR")?
> 
> But almost every constant in this header relates to a specification or
> requirement in PAPR.


Yup, "almost".

> 
>>> There are other calls with work area parameters where alignment isn't
>>> specified (e.g. ibm,get-system-parameter) but 4KB alignment is a safe
>>> choice for those.
>>>
>>>>> +#define RTAS_WORK_AREA_SIZE   4096
>>>>> +
>>>>> +/* Work areas allocated for user space access. */
>>>>> +#define RTAS_USER_REGION_SIZE (RTAS_WORK_AREA_SIZE * 16)
>>>>
>>>> This is still 64K but no clarity why. There is 16 of something, what
>>>> is it?
>>>
>>> There are 16 4KB work areas in the region. I can name it
>>> RTAS_NR_USER_WORK_AREAS or similar.
>>
>>
>> Why 16? PAPR (then add "per PAPR") or we just like 16 ("should be
>> enough")?
> 
> PAPR doesn't know anything about the user region; it's a Linux
> construct. It's been 64KB since pre-git days and I'm not sure what the
> original reason is. At this point, maintaining a kernel-user ABI seems
> like enough justification for the value.

I am not arguing keeping the numbers but you are replacing one magic 
number with another and for neither it is horribly obvious where they 
came from. Is 16 the max number of concurrently running sys_rtas system 
calls? Does the userspace ensure there is no more than 16? btw where is 
that userspace code? I thought 
https://github.com/power-ras/ppc64-diag.git but no. Thanks,



-- 
Alexey

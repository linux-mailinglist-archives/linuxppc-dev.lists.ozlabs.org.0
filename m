Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785835061B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 20:15:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9ZHn37Ctz3bpT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 05:15:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=f1Ar6CrH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256
 header.s=google header.b=f1Ar6CrH; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9ZHL4N7Fz2yR3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 05:15:23 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id j18so20611369wra.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 11:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eA66IfwNLCvflZyaO4GLWcFCdnWN4ORiomGXqXfK2fI=;
 b=f1Ar6CrHVwvmPAM3/9xMSRkKbN4usB8LfM583KmVSNJXs0r9cwmW9stwOKoZwMrxBC
 8M90NIfDKnoSwcSiBxVfvwLjuz4IWvYeL1vFxRhKMDhJy6I/CtyXQDHWLF33EeEata6X
 Vi3odTlTawbhhkRC9Uy49cUyQLQlneOe1+Gor6WnNMINgZ3UD+UJIp/iYVsdaGRunxCw
 8/5ewEzObkstEaa9ST1but+pEE6GrBuM+tCgEoaMtfPcVJ/swYbM7F45HJ43j2bArRWg
 1OjhHJJFXK4zMoAnUEpJPxvr1NkIVWETfE9pNj6lDRs36zWNuAsqSW7gDAoMo5YZCzYf
 2ZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eA66IfwNLCvflZyaO4GLWcFCdnWN4ORiomGXqXfK2fI=;
 b=o83oYv6PhYkAV7CqA0DjKr+olNnDhYKwjMPrEEfefVSoql3/iIn75bDtqWBcIGjjtK
 Rv5qMaLCmFmEy0K7mY0SwT6wRo65sWkqg/dNty/jJ1/iOUD27KViVQZ1ah8INGAimsHo
 EWsvKWsKToTPhFqRWMxdXNWD8cOhQ35MEAJ5vzdjYs3vzqzhBwaPh27fW8sA0Ajm20Ur
 621+8zoSQmJYNEkmAvzQytbZsNLN1ynir60SdjbEQ1QAKCcMok+9gyYUJCXeIApis8Ju
 YNoyG3cdHF2U1r5+qCsfRlZ6oTtnjPqaeIMJVBxfiVHBHDNEROFrPUUMlYARnY2yXN4S
 UyVg==
X-Gm-Message-State: AOAM530pN6rWPZACaxYhQOD2+T+P83KLrjfZdie9vgg/3IieltQutr7R
 elecjiRGdr3TtGDiZhMhPQVuow==
X-Google-Smtp-Source: ABdhPJyyWfx/c+aqE54lTrl3dhisDbSZEmIFGt41YeVVb1gbg4eQ0gsUx3VoNGnZ5VsumWW6ywd2EQ==
X-Received: by 2002:adf:ba94:: with SMTP id p20mr5188220wrg.300.1617214516602; 
 Wed, 31 Mar 2021 11:15:16 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8?
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id i4sm4661186wmq.12.2021.03.31.11.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 11:15:16 -0700 (PDT)
Subject: Re: [PATCH] powerpc/vdso: Separate vvar vma from vdso
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org
References: <20210326191720.138155-1-dima@arista.com>
 <47623d02-eb29-0fcb-0cfd-a9c11c9fab02@csgroup.eu>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <8cd82b69-c8cc-8591-1f92-5c9400e00579@arista.com>
Date: Wed, 31 Mar 2021 19:15:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <47623d02-eb29-0fcb-0cfd-a9c11c9fab02@csgroup.eu>
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
Cc: Dmitry Safonov <0x7f454c46@gmail.com>, stable@vger.kernel.org,
 Andrei Vagin <avagin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/30/21 11:17 AM, Christophe Leroy wrote:
> 
> 
> Le 26/03/2021 à 20:17, Dmitry Safonov a écrit :
[..]
>> --- a/arch/powerpc/kernel/vdso.c
>> +++ b/arch/powerpc/kernel/vdso.c
>> @@ -55,10 +55,10 @@ static int vdso_mremap(const struct
>> vm_special_mapping *sm, struct vm_area_struc
>>   {
>>       unsigned long new_size = new_vma->vm_end - new_vma->vm_start;
>>   -    if (new_size != text_size + PAGE_SIZE)
>> +    if (new_size != text_size)
>>           return -EINVAL;
> 
> In ARM64 you have removed the above test in commit 871402e05b24cb56
> ("mm: forbid splitting special mappings"). Do we need to keep it here ?
> 
>>   -    current->mm->context.vdso = (void __user *)new_vma->vm_start +
>> PAGE_SIZE;
>> +    current->mm->context.vdso = (void __user *)new_vma->vm_start;
>>         return 0;
>>   }
> 

Yes, right you are, this can be dropped.

Thanks,
          Dmitry

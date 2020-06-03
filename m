Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E731ED65B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 20:49:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cdH81khWzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 04:49:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=broadcom.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=scott.branden@broadcom.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=HPiwpNtw; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cdFX2sC6zDqbl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 04:47:39 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id e1so3496837wrt.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jun 2020 11:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TzkCJWzdXaXToiK1TH4bCK6fKN5cv3juL4tw/MkKx6w=;
 b=HPiwpNtwlOc31xmKeKSwthIlmCa/tOMQd/8kH1Smc+RG80zxiqip4pjUe/KbToiKth
 1jg+auUvy0TzI4kQ+wsVWroEXtGf4xb5T1Y1R4iT02cZ6lxnsOl1LqDfkPSDxdwdJwzY
 Ka9GI0aq/AGJf0EUB5aCHTK9PkWj4xdXCLoiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TzkCJWzdXaXToiK1TH4bCK6fKN5cv3juL4tw/MkKx6w=;
 b=Yhgyec8uKWGQoXP0jg2bThPmkmIFWIyTf5SjTHFlbql0deJG4hL8mCW371hjoLRuYu
 W02fjcdAZSEzKfpSWyM55jXS/nqWNBTVmpJua4TbKrB9dJmk8wXacb1Hjzfj0d+/F80N
 og482LjnmMXvLToU910sSslV02t46XwXu6t3ikuU1daOc8QIfT7tTVwTTFm4TRVX2uL5
 flYu+Vb/0FR9xPIY91frK3/q9SqTw0/ZJXPAj0R2rMnSH1SihMWwgVT1KrvTOKWwSZVy
 2dCve1TLbkBtDqq5DYDDBkdU9Onne7rEamHU3UAc1Pyhf5gmAnT/LJkL4C6RGbA1GFAH
 aFhg==
X-Gm-Message-State: AOAM531HXvN+4eOuGXxhRxuVUHvQvnWgXqqwespFg5GT5xltSEstDfJt
 rH7Jj1T31jIOTES9CC4isRqDkg==
X-Google-Smtp-Source: ABdhPJyU+ic03oHqmau6OU/msEDtw9ypuyg7l03D3xQ7uDwGOZ1+JJWX1PGIHshdEbfWG/GbBSGPDw==
X-Received: by 2002:a5d:50c9:: with SMTP id f9mr794147wrt.9.1591210054149;
 Wed, 03 Jun 2020 11:47:34 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id k14sm4428396wrq.97.2020.06.03.11.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 11:47:33 -0700 (PDT)
Subject: Re: Re: [RESEND PATCH v5 5/5] Documentation/vmcoreinfo: Add
 documentation for 'TCR_EL1.T1SZ'
To: Bhupesh Sharma <bhsharma@redhat.com>, James Morse <james.morse@arm.com>,
 linux-kernel@vger.kernel.org
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-6-git-send-email-bhsharma@redhat.com>
 <8a982138-f1fa-34e8-18fd-49a79cea3652@arm.com>
 <b7d8d603-d9fe-3e18-c754-baf2015acd16@redhat.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <51606585-77a3-265f-1d4e-19f25a90697d@broadcom.com>
Date: Wed, 3 Jun 2020 11:47:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b7d8d603-d9fe-3e18-c754-baf2015acd16@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>, Dave Anderson <anderson@redhat.com>,
 bhupesh.linux@gmail.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bhupesh,

Would be great to get this patch series upstreamed?

On 2019-12-25 10:49 a.m., Bhupesh Sharma wrote:
> Hi James,
>
> On 12/12/2019 04:02 PM, James Morse wrote:
>> Hi Bhupesh,
>
> I am sorry this review mail skipped my attention due to holidays and 
> focus on other urgent issues.
>
>> On 29/11/2019 19:59, Bhupesh Sharma wrote:
>>> Add documentation for TCR_EL1.T1SZ variable being added to
>>> vmcoreinfo.
>>>
>>> It indicates the size offset of the memory region addressed by 
>>> TTBR1_EL1
>>
>>> and hence can be used for determining the vabits_actual value.
>>
>> used for determining random-internal-kernel-variable, that might not 
>> exist tomorrow.
>>
>> Could you describe how this is useful/necessary if a debugger wants 
>> to walk the page
>> tables from the core file? I think this is a better argument.
>>
>> Wouldn't the documentation be better as part of the patch that adds 
>> the export?
>> (... unless these have to go via different trees? ..)
>
> Ok, will fix the same in v6 version.
>
>>> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst 
>>> b/Documentation/admin-guide/kdump/vmcoreinfo.rst
>>> index 447b64314f56..f9349f9d3345 100644
>>> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
>>> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
>>> @@ -398,6 +398,12 @@ KERNELOFFSET
>>>   The kernel randomization offset. Used to compute the page offset. If
>>>   KASLR is disabled, this value is zero.
>>>   +TCR_EL1.T1SZ
>>> +------------
>>> +
>>> +Indicates the size offset of the memory region addressed by TTBR1_EL1
>>
>>> +and hence can be used for determining the vabits_actual value.
>>
>> 'vabits_actual' may not exist when the next person comes to read this 
>> documentation (its
>> going to rot really quickly).
>>
>> I think the first half of this text is enough to say what this is 
>> for. You should include
>> words to the effect that its the hardware value that goes with 
>> swapper_pg_dir. You may
>> want to point readers to the arm-arm for more details on what the 
>> value means.
>
> Ok, got it. Fixed this in v6, which should be on its way shortly.
I can't seem to find v6?
>
> Thanks,
> Bhupesh
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>


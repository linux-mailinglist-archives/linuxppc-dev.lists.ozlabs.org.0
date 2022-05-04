Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B84519570
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 04:19:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtL9f36Ngz3brM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 12:19:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=n/0q8ggA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=n/0q8ggA; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtL8z0208z2xt0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 12:18:23 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 7so40519pga.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 May 2022 19:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oRTJFa40kHEh7n+tr3P07b1F40qTa0npYYEBgfPr++w=;
 b=n/0q8ggAw/ULQhiaru0IV3uK2w+sdISkFouZ1TEhbqIcrsZxTnBxvgzZXKMtWCK5gf
 cRbvr41Ie/Dz1d6ZSbVSxXS8ghz15CLo7dmzdO1hR1aVz6BCDd9NLKdYbpXpySsPZ4yg
 +elIiZRfRerfPmK+ESdtpIxNLDywj4X4dwyW+IL69pF4x2fypmlL5aZycoCU8iSUSQ2j
 85xi7aRskoAA5rgZAQCgK06QjKUD61do2Qu28KqDLLKSLIJHksYlULKSMIJ6mG8WfUBd
 dtpHtYo5MmRbRA+k0o5YH6fp7dkQS2uhJQST9DN6bz/fts85PKiiPjse/lPOas8qsAt8
 2aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oRTJFa40kHEh7n+tr3P07b1F40qTa0npYYEBgfPr++w=;
 b=kSwbFCSH5N9R+rCCfSpNO1msH6lwSJDQ+HJNtnhht5LSOLCr0ZeOdo47hkrImwNCgv
 FuFC+4K4DWqOZySPFY1N/pcN/NHFDLjoV1pkrOojetU1MFJVqGjEAb/R0Cx9wz8eJfnM
 vI1HIAHPtROSJ80Z96pQ3540c+2G/oF2qX+RZQE4FfwAomXBn8wfMcRFOeVtNS5LgSYh
 XSVSJ3Bd8tBp8o7yHqBormwErbeBKctFbmPdfKiivoYsQVT6q4x+iYECV9utyc2lqQY4
 OxXjLJZcPK9QvUnMABZ2R91SlTKQ/U5i7cmz7escRhebk8PP/HY6bZpd2Skx14seasZT
 gvbQ==
X-Gm-Message-State: AOAM532VtZoPzQ9iE4Ya0ehxCVwEe9wWXr/pN4u2TuGdREtZK/YPe/ev
 dcFHFTbbtOo0i1dFFTG0/IGH+A==
X-Google-Smtp-Source: ABdhPJxU0wXZroQ6HfCO+s6K0BJhScDxfmzFomW6S3SzG3CgbjBZpzrMge6CMRgp7CAdqn4/FP3RXA==
X-Received: by 2002:a63:1b5e:0:b0:3aa:593c:9392 with SMTP id
 b30-20020a631b5e000000b003aa593c9392mr16086048pgm.470.1651630699497; 
 Tue, 03 May 2022 19:18:19 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 q26-20020a63505a000000b003aa8b87feb5sm13968274pgl.0.2022.05.03.19.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 19:18:18 -0700 (PDT)
Message-ID: <0b2a1361-e0a4-35b2-c58d-ef4b913c025e@ozlabs.ru>
Date: Wed, 4 May 2022 12:18:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20220429064547.2334280-1-aik@ozlabs.ru>
 <CAKwvOdmFhua9b4=DS4QYJmKg=0kT3CtEjXgfo8fnifU2t-ttPQ@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <CAKwvOdmFhua9b4=DS4QYJmKg=0kT3CtEjXgfo8fnifU2t-ttPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: llvm@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/4/22 07:24, Nick Desaulniers wrote:
> On Thu, Apr 28, 2022 at 11:46 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
>> index b66dd6f775a4..5b783bd51260 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -476,9 +476,11 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>>                  .if IHSRR_IF_HVMODE
>>                  BEGIN_FTR_SECTION
>>                  bne     masked_Hinterrupt
>> +               b       4f
>>                  FTR_SECTION_ELSE
> 
> Do you need to have the ELSE even if there's nothing in it; should it
> have a nop?  The rest of the assembler changes LGTM, but withholding
> RB tag until we have Kconfig dependencies in better shape.


The FTR patcher will add the necessary amount of "nop"s there and 
dropping "FTR_SECTION_ELSE" breaks the build as it does some 
"pushsection" magic.


> 
>> -               bne     masked_interrupt
>>                  ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
>> +               bne     masked_interrupt
>> +4:
>>                  .elseif IHSRR
>>                  bne     masked_Hinterrupt
>>                  .else
> 

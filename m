Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4D524087
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 01:07:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz9Y967Mhz3cdH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 09:07:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=DcSvKcr6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.39;
 helo=alexa-out-sd-02.qualcomm.com; envelope-from=quic_jjohnson@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=DcSvKcr6; dkim-atps=neutral
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Thu, 12 May 2022 05:53:46 AEST
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz5FQ2pdYz2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 05:53:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652298826; x=1683834826;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tJUoH32r2DhYogH9Td6X47AQDJfM19sTpFtOpSyDiTg=;
 b=DcSvKcr6T826MM4GuJSgsAscnhiXY8UBJHld5i4cpc9gUlOGOt1rwJrg
 KFA6M9h04obYyUfbB0HzZPV/OrHsyd7WWvsnCl2MTkpEzQMRFIGXNVE7V
 ZNRtGk++XYgnTNSJAsUcveCmiXHveMTAXgQiJF5MbzZN6UkBVZmHQUpqo 8=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 11 May 2022 12:51:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 12:51:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 11 May 2022 12:51:38 -0700
Received: from [10.110.84.131] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 11 May
 2022 12:51:37 -0700
Message-ID: <8babc23b-5e24-f662-6c4a-eb1c30e0e6da@quicinc.com>
Date: Wed, 11 May 2022 12:51:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 03/14] modpost: split the section mismatch checks into
 section-check.c
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-4-masahiroy@kernel.org>
 <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
 <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
 <CAKwvOdmK4oH0t8Q6F19sWKX1fT=AgS=kfvn05FT01HffLJwgMQ@mail.gmail.com>
 <CAK7LNAR5preB59HJH1-F_ZfEmoF3N8b9z4eRhYzsEVwu_XUH4Q@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CAK7LNAR5preB59HJH1-F_ZfEmoF3N8b9z4eRhYzsEVwu_XUH4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Thu, 12 May 2022 09:06:31 +1000
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 clang-built-linux <llvm@lists.linux.dev>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/11/2022 12:27 PM, Masahiro Yamada wrote:
> On Thu, May 12, 2022 at 3:48 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> On Mon, May 9, 2022 at 11:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>>
>>>>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>>>>> index a78b75f0eeb0..e7e2c70a98f5 100644
>>>>> --- a/scripts/mod/modpost.c
>>>>> +++ b/scripts/mod/modpost.c
>>>>> @@ -31,7 +31,7 @@ static bool external_module;
>>>>>   /* Only warn about unresolved symbols */
>>>>>   static bool warn_unresolved;
>>>>>
>>>>> -static int sec_mismatch_count;
>>>>> +int sec_mismatch_count;
>>>>
>>>> ^ this should go in modpost.h if it is to be used in two translation
>>>> units, rather than forward declaring it in section-check.c.  You did
>>>> this for the functions.
>>>
>>>
>>> Sorry, I do not understand.
>>>
>>>
>>> In modpost.h, I put the declaration:
>>>
>>>    extern int sec_mismatch_count;
>>>
>>> If I moved it to the header without 'extern'
>>> I would get multiple definitions.
>>
>> Yeah, you need to _declare_ it w/ extern in the header, then _define_
>> it in one source file.
>>
>> That way, if the type ever changes, the sources will agree on type in
>> all source files. You will get a redefinition error if the definition
>> changes the type of the variable since the last declaration.
>>
>> What you're doing is forward declaring, which works, and is a common
>> pattern for (bloated) C++, but is less type safe than sharing a single
>> common declaration between multiple source files via a single common
>> shared header. (Sorry I didn't respond before you sent v5)
> 
> Sorry, I still do not understand your suggestion.
> 
> 
> Could you provide me with a code diff
> showing how to do this better?

I think you are doing exactly what he's asking for:
declare it with extern in the header (modpost.h change)
define it in one source file (modpost.c change)


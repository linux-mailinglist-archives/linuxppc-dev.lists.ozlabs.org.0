Return-Path: <linuxppc-dev+bounces-3825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8059E5AB7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 17:06:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3zm86p0Yz2yD5;
	Fri,  6 Dec 2024 03:06:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733414808;
	cv=none; b=ltRCde8Wd4ERoeZrxPT0k2L6RqacQDyLbsxGKI43f2xLr7X7Oec8GR7gV+g+7eW/O/zeaV6cYqMbKIC4yjIwgSYp9lhHPwmQ+vHqeC7nKLqM5PEbjik7mpbWpIY+i8XaOlZCG2IniAvHZLhlsgBBktiMU/BVORnKW5vy8KXvcq+FfDZ3k0v36ulV/vRcgUdbOj9bqiZPpShQ91HVnQoIDUOn4n504nT5sUIAE8GMxbHfXdHDmp4HIW35vQcbRHfg0bAWkAx1gMaqfrTyOGR88lbOXCbGwohKb/gBVlArE7vIojIlgAlI1cQsPQ/kcbvBgpXOS1qaNJ78cwGWSNtJ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733414808; c=relaxed/relaxed;
	bh=G7E/0K/5K1BjOut5mLlzCa+24O07aK8RA1Bdk2pEJFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFWwuASFVBqMiXwIkqP8bL9XEtqxwSBA+VcuqLC6FFtBIk3ErxN0muy1fKr1tKMRQe03xTaCVdfxf9fc668AYWo91eswAoLa0i3K13c0z7nJ/5HRtMIDvs/W8mtR5Enls1G25UAbtbYMddfSW8pe8yxHyOR174Ix9b1RdPEs16cu3rgG8YtHdc4gcyVhPeS5thTP5TDnKD9yREXd2NFAFzW7nRythgJ6pllAvkS2NIeLSAXWtzj9kE+N5DTGYuS47V092DIA8iIL+U2/LvjhmiSjkpnQAdyx/n3taKMLlSY2GZG9172l55tFjY553XunhP86qRUOfqLz3rrQ80pe2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=OJZbudpI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=OJZbudpI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3zm65mj8z2xtb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 03:06:46 +1100 (AEDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3a7df790371so7807765ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2024 08:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733414804; x=1734019604; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7E/0K/5K1BjOut5mLlzCa+24O07aK8RA1Bdk2pEJFM=;
        b=OJZbudpIfDTeffAPmYCwNn4gGgzdocNpAxWJy4qi0dVdipb8gkhxTsEECD6imvLLrH
         8RWTJFovtIwiepRyQYXLWF923ezHxsrGXSvPUNuie6/Hzcj56E8SXEKxdTCSC3uqgp3S
         z9PCTwNZx8SWrISZ9455Iez8tEZI2hSl3GzCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733414804; x=1734019604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7E/0K/5K1BjOut5mLlzCa+24O07aK8RA1Bdk2pEJFM=;
        b=u7WWonj56MUvi23jI1DTYi3q9Vx67D20ge2qVPzESwihOXc4uMp0kiVttcVwFI1GEu
         SB80XRBLXHG0GQMkLGllPP9jNTwhrlA7ISqL85+bI0vDhNnhyEhUY6j203QNgCV1Qe7U
         RX26WKfnH4kOFNsUbxlbetZOVdtY4NSXLVPiHhbVQV0e+ozR545HiqZy3Bm1CKcdqH6y
         f8SgxwX7KrgxwguloWsKs5obDq8uaBCkygxGj0+fe7xpN7eO60Pd0d2iZnqREYQ8mkas
         DgByhojhNUYN88/eaNC9gUTcgYlYcakmshZ3kFSOy4pSdgaELFq+BcA0GxRKH2zVlIUh
         0hXg==
X-Forwarded-Encrypted: i=1; AJvYcCVSnwR8FNx51kNpIlXODDTjyn5pInYmVTfQvXoO42Fb/SbuLQD0FOr94J6t0e5fJ4I2HNDJqNWu14z94eU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLqXWwLLe9rllELQPIyssoCV9RxcM7t+jMMVOZmadhS2QJjF/7
	DsB3V1y9ori4x40biC++dA7CZEeBD7P7QtJop/UYmCIT3hI8bVJQn/QW+O9t+vQ=
X-Gm-Gg: ASbGncvR2Ls2IqQ6XIUFPDrC0Rott8E0sdTaNp2NgUSNj9Csz7cHnMeuArVGTIk7WrG
	abRHPp09msiYbgX8UdGYoGGEj8zSH6LERyJBpN+PazbSxYR4ipCS/LjbB5OdFPYmcZvWqHeP0IJ
	gfkP79AnwZFQdY5J9pU34FMj3sPsYwgwsZoBxNIcBUqhaGv/GrgDKpXnKmNKBds03yel0V3C74P
	73F9LA7p/zy+lgZCeJQOFtACdwEWxDipgIpYe6HTkoWKoFas+myPqAXpXlMkw==
X-Google-Smtp-Source: AGHT+IECQoo3AU1H3Cux4NWyUqkEkqx386V5pN6kVl0r6Wn3PSuY9bnBffRQmWJX+QbbsEJHmnHHEA==
X-Received: by 2002:a92:c56a:0:b0:3a7:dfe4:bd33 with SMTP id e9e14a558f8ab-3a7fecc82b3mr114487405ab.6.1733414804406;
        Thu, 05 Dec 2024 08:06:44 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e286224210sm337614173.161.2024.12.05.08.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:06:43 -0800 (PST)
Message-ID: <d9467ba5-ec01-4683-8078-d85574b2506c@linuxfoundation.org>
Date: Thu, 5 Dec 2024 09:06:43 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/ftrace: adjust offset for kprobe syntax
 error test
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, "Naveen N. Rao"
 <naveen@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241129202621.721159-1-hbathini@linux.ibm.com>
 <20241202144111.75d1bb3b@gandalf.local.home>
 <fa1e747f-1823-4d20-86c0-b85a3b959952@linuxfoundation.org>
 <20241203202008.1f30a266@gandalf.local.home>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241203202008.1f30a266@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/3/24 18:20, Steven Rostedt wrote:
> On Tue, 3 Dec 2024 18:01:06 -0700
> Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
>> On 12/2/24 12:41, Steven Rostedt wrote:
>>> On Sat, 30 Nov 2024 01:56:21 +0530
>>> Hari Bathini <hbathini@linux.ibm.com> wrote:
>>>    
>>>> In 'NOFENTRY_ARGS' test case for syntax check, any offset X of
>>>> `vfs_read+X` except function entry offset (0) fits the criterion,
>>>> even if that offset is not at instruction boundary, as the parser
>>>> comes before probing. But with "ENDBR64" instruction on x86, offset
>>>> 4 is treated as function entry. So, X can't be 4 as well. Thus, 8
>>>> was used as offset for the test case. On 64-bit powerpc though, any
>>>> offset <= 16 can be considered function entry depending on build
>>>> configuration (see arch_kprobe_on_func_entry() for implementation
>>>> details). So, use `vfs_read+20` to accommodate that scenario too.
>>>>
>>>> Suggested-by: Masami Hiramatsu <mhiramat@kernel.org>
>>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>>
>>> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>>>
>>> Shuah,
>>>
>>> Can you take this through your tree?
>>
>> Yes I can take it. I do have question about whether this is
>> a fix - sounds like it is from the change log.
>>
>> Clearly stating that it is a fix will help so it can be picked
>> up for stables.
> 
> I would say it's a fix, as the test currently fails in certain scenarios
> for powerpc.
> 
> You can add:
> 
> Fixes: 4231f30fcc34a ("selftests/ftrace: Add BTF arguments test cases")
> 

I applied this to linux-kselftest fixes - will send it up for rc2 or rc3

thanks,
-- Shuah



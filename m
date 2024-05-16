Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D283C8C77DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 15:43:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=C76aUC3l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgBB62Qb7z3fps
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 23:43:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cryptogams.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=C76aUC3l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cryptogams.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=appro@cryptogams.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgB9K72LLz3cZ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 23:42:27 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2e576057c2bso12723411fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 06:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1715866936; x=1716471736; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iiFTd9vLC+WBmXaWz0Ro0gtEC5QRTIQUDbpfIDLM78A=;
        b=C76aUC3liqt3Y83HikENbquJRMDGcnfb0szv1RARrTWprwbxSiiILV5J1D7PKXf71B
         BZ4W3tKBsMEnGMGcYs81Lf8JwXSA+TfDvIgt1L/cBZnkjIxp5PA8m9YU1YETNh1iTKL1
         aCP+N5n/XiqCW8Xt4HAZaK7Y/yh+8HxDe9QgAYt+Dox8rE56kxxx2h7p8Hf1BT1YnE5o
         6W7S/HqP8JVMfs0xqRg/RbCt+G01aLskMCugy+Yf9m1bu0+l/g2FgvLkX5W4tbMtukhK
         mqBRc5IhB690CHJI4VjaWWchSnOdKsxLZRgwdVLrhHHf80d07/CAgXPRQzaxo4JuyqAI
         8AHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715866936; x=1716471736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiFTd9vLC+WBmXaWz0Ro0gtEC5QRTIQUDbpfIDLM78A=;
        b=qg+HlFK0Q49tLb1ndq0OjRZxXlpSJuhhI93dMjI91q89GGlPntKl7iTIboX77bQgxW
         r6cHVMmVHXSvXyN1a8UkM+PyyEsMfvdyY2OcIpPmrdp8BQPcsSXqZ3J3ACJsNILRqAX1
         yZYPr9vAgWuu8DsZhac60h7cQU0r0kZEUfHCiwh/90D8HSlb8jmqr1n53zYC9+8SuqYF
         7/YXzUrnkDiZL2cmfHjKRCHLH4WCi+s/RFPQqOKVJH7wD/FjmBlQjmRwjVD35YvG9qCy
         8Y/+YxD5iFSt5uf4qk5r0ohJax6ic6V12GISbjYonME1MJyo2EIyVDf8YTcGHpU/MWzQ
         UF7A==
X-Forwarded-Encrypted: i=1; AJvYcCWGKI1ymXNeMULCx+ngvRCk2GKcGyBPgguLqnV15BUocr0CQLYZTEd3RUMd/LHqDgnHKm4xHX515qIhYWTfWBji3e3OqyVFJ290gP/o5Q==
X-Gm-Message-State: AOJu0YwhOEr+lIHXRPO47ijhchdPGs/m1QNMwd0x1CaQdYxPwApuDNqe
	AHCEANJFOwumMnH60PciSorxvmbJ5D7h+zjbmIKidWJBXZbe6N6DDKori6gaA1I=
X-Google-Smtp-Source: AGHT+IHMVWL5FCeucAox6jSM5BC3F6ELEMd53V+fH6IyH7uugBQxemkHfOIOLVukBEROZInnopv+QA==
X-Received: by 2002:a05:6512:234f:b0:51f:2f5a:54ae with SMTP id 2adb3069b0e04-5220fc7c5e0mr22121911e87.7.1715866936263;
        Thu, 16 May 2024 06:42:16 -0700 (PDT)
Received: from [10.0.1.129] (c-922370d5.012-252-67626723.bbcust.telenor.se. [213.112.35.146])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52399de9832sm658502e87.7.2024.05.16.06.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 06:42:16 -0700 (PDT)
Message-ID: <bea0a088-f9f0-4fc8-8235-ebc0ee42ad16@cryptogams.org>
Date: Thu, 16 May 2024 15:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
To: Michael Ellerman <mpe@ellerman.id.au>, Danny Tsen <dtsen@linux.ibm.com>,
 linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-2-dtsen@linux.ibm.com> <87a5kqwe59.fsf@mail.lhotse>
 <89e7b4b0-9804-41be-b9b1-aeba57cd3cc6@cryptogams.org>
 <875xvevu3h.fsf@mail.lhotse>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <875xvevu3h.fsf@mail.lhotse>
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

>>>> +.abiversion	2
>>>
>>> I'd prefer that was left to the compiler flags.
>>
>> Problem is that it's the compiler that is responsible for providing this
>> directive in the intermediate .s prior invoking the assembler. And there
>> is no assembler flag to pass through -Wa.
> 
> Hmm, right. But none of our existing .S files include .abiversion
> directives.
> 
> We build .S files with gcc, passing -mabi=elfv2, but it seems to have no
> effect.
> 
> So all the intermediate .o's generated from .S files are not ELFv2:
> 
>    $ find .build/ -name '*.o' | xargs file | grep Unspecified
>    .build/arch/powerpc/kernel/vdso/note-64.o:                        ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped

I would guess that contemporary linker is more forgiving than it was 
back then when the .abiversion directive was added. If it works now, 
then it of course can be omitted. I suppose my original remark should be 
viewed rather as "you can't replace it with a command line option" than 
"you can't make it work without it." :-)

> But the actual code follows ELFv2, because we wrote it that way, and I
> guess the linker doesn't look at the actual ABI version of the .o ?
> 
> So it currently works. But it's kind of gross that those .o files are
> not ELFv2 for an ELFv2 build.

Well, as far as passing base types and pointers to/from assembly goes, 
there are no differences between the versions. Then it's a question of 
meaning assigned to r2 and r13, but as long as you don't touch them, you 
can freely reuse the code with either ABI. With this in mind the 
.abiversion directive is effectively reduced to just a marker in the .o 
file. In other words the instruction sequences by themselves are 
customarily ABI-neutral, at least in "general calculation" modules such 
as the suggested one, so that if it works 100% without the .abiversion 
directive, then it can be safely omitted.

Cheers.


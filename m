Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125E0325AA0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 01:18:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dmqxk0Ff9z3dFL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 11:18:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=ghrXi5gN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=ghrXi5gN; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmqxJ19rmz3ckn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 11:17:53 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id 201so4833921pfw.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 16:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=W+X1NbDzxQcXAdef3rzLvGa/2poksE2eT2ediy7X7vA=;
 b=ghrXi5gNNW9zIo806gaf+OA4fcu5QDp6g4H3TUMlpX8DvgJgPt+I/r+zU7x8+6Iznq
 r3BciTivQuDlQ9fV/3TaC8mAzJyWB3xXzdEfxqspumZ4yPCv039T8XkTzr8VOY1lwcVZ
 qIH8gzVBRQQxLkCn4JX9HWIcnOJWHLM4gBDbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=W+X1NbDzxQcXAdef3rzLvGa/2poksE2eT2ediy7X7vA=;
 b=iPbUUekityhA89RNHgvnHxHBbt3ki4NtzF5Q12LXohzKY5vuZaSALgiJkYLm0kOZBN
 y/0D34ZCx9eXotUj7/xtckaaaknl7GXVaDUluaKZF5SNDnz8H7w7BjwuEt7JIvXXl0Ru
 Hog6halq8EoRlBMj1pt6sTozZdu0twKF6uggK/OH7ZN6nk6LMh4a9b5SvU+Vuylyz4GD
 wYFhsCz73r6ZDCFkyvJCsNwxwyvApege7GBZaAS9/M20uR+4zG2z2yFRBHEh8E+ZRivs
 2ZYTIoCacbB+z22ZcCZX94RD/5owuf4Qm22G+pHOuy0DsSt0W0eYz5ESpGva0ajXXvGY
 37Sw==
X-Gm-Message-State: AOAM530gffoD5CPZR/JplW+kBwhZ/C/zPt6JNLffsVPlNqeR44QCo0rp
 DTdX1t/xiaoD4uXIk0C+nvwTUjZnj4DJ/A==
X-Google-Smtp-Source: ABdhPJwAsjqZaVjPFO30xjlEIe1loyEfCA8l5DUUb7VjffwKPwfTWRs2KjSeP7fs2XakUEqPoBS2lw==
X-Received: by 2002:aa7:9d9b:0:b029:1ed:6c08:b93c with SMTP id
 f27-20020aa79d9b0000b02901ed6c08b93cmr285127pfq.37.1614298670430; 
 Thu, 25 Feb 2021 16:17:50 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-0af1-7e55-275a-1dc8.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:af1:7e55:275a:1dc8])
 by smtp.gmail.com with ESMTPSA id c18sm6538766pgm.88.2021.02.25.16.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 16:17:50 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [RFC PATCH 7/8] powerpc/purgatory: drop .machine specifier
In-Reply-To: <20210225155836.GG28121@gate.crashing.org>
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-8-dja@axtens.net>
 <20210225155836.GG28121@gate.crashing.org>
Date: Fri, 26 Feb 2021 11:17:47 +1100
Message-ID: <87o8g7of6c.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, llvmlinux@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:

> On Thu, Feb 25, 2021 at 02:10:05PM +1100, Daniel Axtens wrote:
>> It's ignored by future versions of llvm's integrated assembler (by not -11).
>> I'm not sure what it does for us in gas.
>
> It enables all insns that exist on 620 (the first 64-bit PowerPC CPU).
>
>> --- a/arch/powerpc/purgatory/trampoline_64.S
>> +++ b/arch/powerpc/purgatory/trampoline_64.S
>> @@ -12,7 +12,7 @@
>>  #include <asm/asm-compat.h>
>>  #include <asm/crashdump-ppc64.h>
>>  
>> -	.machine ppc64
>> +//upgrade clang, gets ignored	.machine ppc64
>
> Why delete it if it is ignored?  Why add a cryptic comment?

Sorry, poor form on my part. I think I will give up on having llvm-11
work and target llvm HEAD, which means I can drop this.

>
>
> Segher

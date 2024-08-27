Return-Path: <linuxppc-dev+bounces-616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 505559613F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 18:25:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtXwC1CPDz2xrM;
	Wed, 28 Aug 2024 02:25:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724775947;
	cv=none; b=QJgWDm5VwfURyI1czABPqlD/Ezq8+wOa7g5zLF4YHT5Xl3nRO0BifdfBRPkG9GZjnR1IgaOV+WI75jmRMb6v98ADPhe1L3kghzJPTx7vAXFYsAOBdF/XVPR/jzng7Euxf6O7yt3ttdoF57xpWHhIpsQWvN8tSVPIDkKv7DaBlNJAyqhI7umeZUZUgPQgFzEZJ6SIZhIQYvuZqEcRQuin+uVBzs0bUkauHkh1xfTEq+KpOGZELrh2rlzFPHLLErQq7hAk0LdSstdNoe5/kv0uU3PnAgMqW0ZLY3esIOJYP530LfqlEEstjZNvI8105CiETGJaYBUM4oykSkzVPeVKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724775947; c=relaxed/relaxed;
	bh=mmwQdy1L7bvHhUG9d4cS5oEONLOPtoTo9oYcLdJyc2M=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:Date:Message-ID:
	 References:MIME-version:Content-type:Content-Transfer-Encoding; b=CfgA7kVYVxrXQgi/0O0I3pI8JfYf20j9+JmnmqeSXwilEInIzO5VNRGxJ+0mSP7D4Lf6TmaWq547orcLu1gNpGlIIyFAcKUH421UPPtiHzLUxO34ohYeoDWoXimpHBY660Sp+smKnwKzXWFtkAilqbv4ruEHmR/GlXzEP6K7SkBm2N0iKSDAls3ub1Fd4OlMrbZ2xgnR1IdjBz2Lajih3zMAvyCHciZUMEgQa+EY7c9f5lXDrfgFFx/Yi+5yS6nw2iv4Q51k030EZgy1fAf42gIvqpCDgxmvBfned1s7m2CaDhfMe15aK1Z26tAPTA29YLNV8+LLEqwTa8q8roUxHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vl7NQoPO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vl7NQoPO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtXwB210pz2xfb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 02:25:44 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-39d254187daso18032985ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724775941; x=1725380741; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmwQdy1L7bvHhUG9d4cS5oEONLOPtoTo9oYcLdJyc2M=;
        b=Vl7NQoPOmQjarB5A94+GKAwy1xsSRWOAV1KosWwMKjrmP9x7Rtft7XzRrFzx251EvD
         L6iZuQKPudqjgViFymakQEZNDzDLZ6u0wL1kx8U1Il0rlHkhtnCEixX6QzRW84SbWujb
         4AwoYynM8CDw+HrkrpTUQGNb7e5q3Qdvt6TjSdaOV/o8RfxWVUUTOnxJH5mjY1a2BHu8
         5oRDqrhwWjXHH9zB+ce4K6YJcDyGpSRkvTIMHWcIQcSN1cAKAs+7kDFZp2tPRZkyqhYS
         OJp/5uDzFIVbMzySYY7Wb3HtyRCZAY8CVaUd/CzqcyFRbwd+7EcRvynNPtknQVLOmOyD
         9GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775941; x=1725380741;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmwQdy1L7bvHhUG9d4cS5oEONLOPtoTo9oYcLdJyc2M=;
        b=SyKmhG4hVHp/hf+8rFl0u7aGVI70YSL3a7EuGWWjlur9ojICOF3nXSv1niqtiqTAIN
         rDnLlmrwfCmeYbuXQkFgDIKbNCaME2jSaUl9v0j/b6VXqg9m4rcNC2OvrhKWK1Yyrd5V
         IeuxJRPQIq1pl5Qdq1VCqY7H51yYLMot0FW3zeAVYJr1RRlQXTFpJdG+shnCQ/YjoVKq
         zuc2cXCss+SloLPO+EYMUqB50FI0YpvtfEQdihk/pCfc7/6JmtUVAXDaV0VlQKC0qlHH
         u7KIIrVZjmko+fb58GIekSQA9p6WrktpwTTQPGUCcMfNZDjY83OdeGQbGTA/TYbVDEOM
         07Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ7Qh5hhrES89hgKWhSMPPkWIUb/zBk47fDTCBuGluwVpWjqZgaNyL/jhJrD+ezjo+rgRMwlbjRh+ugr4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwmbkSguGuygkq22zsxSP1vNHQ3qTPa1A3BMP3zkVNtnCpUa7S4
	MhWA4CDQ8RPUbeu5Mf90Ype7rFgPpASrQBIO46AL0rF0wfZHFodMrlHFLw==
X-Google-Smtp-Source: AGHT+IEs1lrKazwjzbRbmgfB7ql6htzs+E5KBDJhx4yq1CCu2lGNA9KxQhp/rM6JVcrOZyRLZXJTyA==
X-Received: by 2002:a05:6e02:1b08:b0:39b:33b5:5cc1 with SMTP id e9e14a558f8ab-39e3c9ee646mr160818515ab.24.1724775940880;
        Tue, 27 Aug 2024 09:25:40 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acabe0esm9536055a12.35.2024.08.27.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 09:25:40 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Use printk instead of WARN in change_memory_attr
In-Reply-To: <a09687b8-184c-40bf-bf5f-b9639dd6d136@csgroup.eu>
Date: Tue, 27 Aug 2024 21:36:45 +0530
Message-ID: <875xrmrluy.fsf@gmail.com>
References: <e2fcabe78795552264f045bd224f83609903708f.1724749026.git.ritesh.list@gmail.com> <a09687b8-184c-40bf-bf5f-b9639dd6d136@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 27/08/2024 à 11:12, Ritesh Harjani (IBM) a écrit :
>> [Vous ne recevez pas souvent de courriers de ritesh.list@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>> 
>> Use pr_warn_once instead of WARN_ON_ONCE as discussed here [1]
>> for printing possible use of set_memory_* on linear map on Hash.
>> 
>> [1]: https://lore.kernel.org/all/877cc2fpi2.fsf@mail.lhotse/#t
>> 
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/mm/pageattr.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
>> index ac22bf28086f..c8c2d664c6f3 100644
>> --- a/arch/powerpc/mm/pageattr.c
>> +++ b/arch/powerpc/mm/pageattr.c
>> @@ -94,8 +94,11 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
>>          if (!radix_enabled()) {
>>                  int region = get_region_id(addr);
>> 
>> -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
>> +               if (region != VMALLOC_REGION_ID && region != IO_REGION_ID) {
>> +                       pr_warn_once("%s: possible use of set_memory_* on linear map on Hash from (%ps)\n",
>> +                                       __func__, __builtin_return_address(0));
>
> Is it really only linear map ?
>
> What about "possible user of set_memory_* outside of vmalloc or io region.

"warning: possible user of set_memory_* outside of vmalloc and io region."

I am thinking of adding a word "warning" too. I can make above change and send v2.

>
> Maybe a show_stack() would also be worth it ?

IMO, since we have the caller, we need not pollute the dmesg with the
entire call stack. Besides I am not aware of dump_stack_once() style prints.

>
>
> But in principle I think it would be better to keep the WARN_ONCE until 
> we can add __must_check to set_memory_xxx() functions to be sure all 
> callers check the result, as mandated by 
> https://github.com/KSPP/linux/issues/7

Fixing the callers to check the return value is something that need not
depend on this change no?

The intention of this change is to mainly remove the heavy WARN_ON_ONCE
from powerpc specific change_memory_attr() and convert to printk warn.

-ritesh


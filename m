Return-Path: <linuxppc-dev+bounces-5671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F483A218BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 09:17:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjZks4GFbz2xLR;
	Wed, 29 Jan 2025 19:17:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738138629;
	cv=none; b=SwBgaz5x3r1XvSXFvYbl8NnysE4/MKsdQOHK0W0VHF4/t7Oj0mRi8RPu3okecSVhxG8+6e1zHE3OD/6jC2RnylT304TeEBROtze33Xq8sL5WoP+Vt/RE3PAjcxXTDT4bsl44Dv99VNQFn4m614vhtn4YUgYVGXIyi80sistKPerygXJtJY449iKeWLP/CWzaYlJBbWYpqbSbvSbj9uHcwzsSGtXOjKQFN7qcvVNDMhLZw5DdSTcJTuBZzAydou/Q3DuLV3PUBBcfMPD2pNHcE5ZJwr8swRKHtiou1hsVecNjXsdhIAF0s5LIZL5rQf2VaphsS58WkMyK1+0Fqj5WXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738138629; c=relaxed/relaxed;
	bh=8HF9JyUjSdqOnsTGSd0EKrYsWFRCtXI6AZufgT6dTq8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=n16sZg4T8mIbWm8suN2Len0+4mw0I/HnpU3m9/GdZjADjchRC4wfX92xG0DnmXUFzeM+8NWYG9NBbkZU5joc+2IItoItC3m7ctnKRUbLnmgvIej4wqRUbSGTTaUopdsgLKp655hbVT5w3Ft+xOqNsVTTez/2s9FFl44Tf/6S9b8KcoGAbpSn8ZNUswNCSQf5gaeOV4dniVIAyaVLFi5M3uUk7ROScDJ8l5CsSlwUrcs0cWgiZJc1VkYVbmp+ap4INmDvV/U5Ju7j4rzf7AmZVnwO9wz4Ah1SSgxRT+NnsFARt1vVrlnDEeWYSshItlItfguKGOkXhOKmk++cATjLAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JZnBgnPB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JZnBgnPB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjZkr69LBz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 19:17:08 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2f441791e40so8700529a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 00:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738138626; x=1738743426; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HF9JyUjSdqOnsTGSd0EKrYsWFRCtXI6AZufgT6dTq8=;
        b=JZnBgnPB0Q4QHlTBjJROvgyhgNx+gozt6xCz4nwjfKiaHomipajahkuoNgYmwbMOPQ
         WZqhXR336a++eVYclgDrXah5rs9Q5g0LqXZ3UBCjI12p2ftwbogFlTjgPWokl6nxX6m0
         X64PbraImT1DksOTSVBkLINnslrN6m6eq67PYrnWaDukxvrvAspeZlPooZeLIM+7iEdh
         cNlsBARTBoCOtpeF0ySsGCg24NeB4WkaTJfEJwIQYNt++Un9m/Vfyi+m5N3kSsIxMLa8
         EnPJ0WsZ0rOmwAv+QxK0AwOA08IUJqz9NIyeFxTsVeau4Fcu1Ktt/4mIvE6hzonq6ePM
         1dpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138626; x=1738743426;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8HF9JyUjSdqOnsTGSd0EKrYsWFRCtXI6AZufgT6dTq8=;
        b=j/tVeIS2onIsbpnDqfgIMiSQVQAK0b4w+e9iGNh8W69xrrIcXZ8rOrv691bNDGh3wH
         uVK/16MWLhPyXP7HTZfpm+iPc9hnLxz/K+1zfGjsnFfCsJQrsQsxi8xyxaK2ba8850nH
         yClYcOR0AkSRkqHlmp95qJiPW4UFb9gtAONEPIZGErutj/16jRqXT10XJjMyb2JrYA7C
         wLRi5fMb73YWnYRKLj9diU/1ZakePZ0l2yUFEz7Iokvi5Arsg7RDBjKmCSgqE7TT2dwy
         5eJrUQA1x7e1A8z8WUvj5PtYvVPVTkn+EzarescbcbC1BzbLcPIpfi89eq/cqkKbgZlP
         piDQ==
X-Gm-Message-State: AOJu0Yw6pJ18u3DUNt1wW2GRXH7/I5VPGWADtfqTDMufQS81adFsKfa7
	AtZ4HT+m9W3GEgivvKQI5XZxC30E9WglQVkwK9Nr+TZQEO7IFekw
X-Gm-Gg: ASbGncsfzEcxOOX8CG3Cep3AqtXIouSqvopwLO0FGUMg5FIv3OUgG1cQvsgweBJpwyI
	EKLNY9SvcQ8HRHC0DAKTMH/uVSHTdvY7YXr2Q60/2kOsl9jR+K6kX5mNXQck7kXIYiD72V1SJnI
	O67hKHpsvZHKakjd164f1+SMUKv0E7avfMosvBxfTpNzeksU/bSqC/Y+H2GqXOU2dHqf5za4xxb
	Dm2DCe6Fh9DKh1RczOMTkKuq+GUcaSD6WPPsC2mxLAiyupq+CGnSv7sWdOVs2CClxj24Cpvhs4H
	OrefFUSA
X-Google-Smtp-Source: AGHT+IFEcChxd57g48O703ADn4uR2KuV7dfnFaF5Ru71gZ9rgRvQNuf4g08h5O9bZCfXdSMaddT+Sg==
X-Received: by 2002:a17:90b:51d1:b0:2ee:3fa7:ef4d with SMTP id 98e67ed59e1d1-2f83ac8c4acmr3224200a91.24.1738138626268;
        Wed, 29 Jan 2025 00:17:06 -0800 (PST)
Received: from localhost ([1.146.123.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bd0ce03sm977823a91.26.2025.01.29.00.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 00:17:05 -0800 (PST)
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 18:17:00 +1000
Message-Id: <D7EEPV6CFJO1.28GHITX47M9FB@gmail.com>
Subject: Re: [PATCH 4/5] powerpc: Define config option for processors
 without broadcast TLBIE
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Paul Mackerras" <paulus@ozlabs.org>
Cc: <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.19.0
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lf-OrrbRe5Q0O-@thinks.paulus.ozlabs.org>
 <D7EC3ZZ2E3YY.5ALSOA646CK4@gmail.com>
 <Z5nUc54yZDqGqr0P@thinks.paulus.ozlabs.org>
In-Reply-To: <Z5nUc54yZDqGqr0P@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed Jan 29, 2025 at 5:10 PM AEST, Paul Mackerras wrote:
> On Wed, Jan 29, 2025 at 04:14:25PM +1000, Nicholas Piggin wrote:
>> On Wed Jan 29, 2025 at 8:53 AM AEST, Paul Mackerras wrote:
>> > Power ISA v3.1 implementations in the Linux Compliancy Subset and
>> > lower are not required to implement broadcast TLBIE, and in fact
>> > Microwatt doesn't.  To avoid the need to specify "disable_tlbie" on
>> > the kernel command line on SMP Microwatt systems, this defines a
>> > config option that asserts that broadcast TLBIE should never be used
>> > (the kernel will instead use IPIs to trigger local TLBIEs on other
>> > CPUs when required).
>> >
>> > Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
>> > ---
>> >  arch/powerpc/mm/book3s64/pgtable.c       | 10 ++++++++--
>> >  arch/powerpc/platforms/Kconfig.cputype   | 12 ++++++++++++
>> >  arch/powerpc/platforms/microwatt/Kconfig |  1 +
>> >  3 files changed, 21 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book=
3s64/pgtable.c
>> > index 374542528080..14ee96e2a581 100644
>> > --- a/arch/powerpc/mm/book3s64/pgtable.c
>> > +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> > @@ -588,10 +588,16 @@ int pmd_move_must_withdraw(struct spinlock *new_=
pmd_ptl,
>> >  }
>> >  #endif
>> > =20
>> > +#ifndef CONFIG_PPC_RADIX_NO_BROADCAST_TLBIE
>>=20
>> Hate to bikeshed, but would it be annoying to make this an affirmative
>> option?
>
> I guess we'd have to make all the platforms that do have broadcast
> tlbie (and a book3s-64 MMU with radix) select that option.  Which
> would be powernv and pseries, I would think.  If that's correct then
> it's probably not too annoying.  Should I do that in v2?

I think you're right, powernv and pseries. If you wouldn't mind doing
it please.

Thanks,
Nick


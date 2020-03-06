Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8868C17BDE4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 14:14:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Yp3z6PT8zDr1V
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 00:14:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=gDWywhmb; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YnyK5MgzzDq9D
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 00:09:29 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id 2so1082974pfg.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2020 05:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QwvL99c3sTAWScS17ZDj22BvXW0QqQWIhRt4cYTFYXI=;
 b=gDWywhmbdzL/1mNf8BQtKOQQExNz+wqF3qt0L2eaCPZbG2Lj6B7bL8WZg+7u0K5wes
 7pVDP7QvRuKySmNNFafef4bDzshFV/CT33oXdQ+tiARnCAzwniqXtfPzWNYFvlYn8K9m
 KMzZFJKAxHpogMkKBks+kigB6njnZ3FSc9GT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=QwvL99c3sTAWScS17ZDj22BvXW0QqQWIhRt4cYTFYXI=;
 b=GtdU6/HwOLnl5ZuYfbbURfeWRONTCVgnsRVVun4ZDoUV4j1w5H8eWevGba9dztaGlJ
 VfpFLMLEQC4oHohfCPybYCv8Jh/vWPBKkw7ydLDxJvhdnZUvJoLTlpmGpz4fVF8TPNEA
 te7mocF3HiXTWmyLi4cybzgGD/n4Kr/oid7PHSPNa19YKqdXV+etJWkWpt2IrEg0nSl3
 uIqGZGNs5e19NjD9iKGepHtxnD7dFJv708lhoo6aAtia3Jh1fGILsyfXeVFjMxZwV/QU
 OHgSyt8FBMoLMt4I15/y+12JAQwXa/XZPDD8s7NUNWk2f95VkgtkLqo4vnVYDz9cbTY6
 uXIg==
X-Gm-Message-State: ANhLgQ1qYdRfqZxPRvd3EinH4cvw+4lioMuTuwhhSmAdkczOuSDJZZZW
 BpUfCc9rmN2laewYDVrC4AHNkg==
X-Google-Smtp-Source: ADFU+vv7MeaUlbRH0dd28x9kTKqYJIqOlQ7piuYzJGALMuTyWBBErd/77e69xbBepw42k+51RfRhkg==
X-Received: by 2002:a63:a351:: with SMTP id v17mr3195903pgn.319.1583500163031; 
 Fri, 06 Mar 2020 05:09:23 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-b120-f113-a8cb-35fd.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:b120:f113:a8cb:35fd])
 by smtp.gmail.com with ESMTPSA id k5sm9354724pju.29.2020.03.06.05.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 05:09:21 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: Re: [PATCH v7 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
In-Reply-To: <abcc9f7d-995d-e06e-ef04-1dbd144a38e0@c-s.fr>
References: <20200213004752.11019-1-dja@axtens.net>
 <20200213004752.11019-5-dja@axtens.net>
 <abcc9f7d-995d-e06e-ef04-1dbd144a38e0@c-s.fr>
Date: Sat, 07 Mar 2020 00:09:17 +1100
Message-ID: <87wo7xpr42.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Le 13/02/2020 =C3=A0 01:47, Daniel Axtens a =C3=A9crit=C2=A0:
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 497b7d0b2d7e..f1c54c08a88e 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -169,7 +169,9 @@ config PPC
>>   	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
>>   	select HAVE_ARCH_JUMP_LABEL
>>   	select HAVE_ARCH_KASAN			if PPC32
>> +	select HAVE_ARCH_KASAN			if PPC_BOOK3S_64 && PPC_RADIX_MMU
>
> That's probably detail, but as it is necessary to deeply define the HW=20
> when selecting that (I mean giving the exact amount of memory and with=20
> restrictions like having a wholeblock memory), should it also depend of=20
> EXPERT ?

If it weren't a debug feature I would definitely agree with you, but I
think being a debug feature it's not so necessary. Also anything with
more memory than the config option specifies will still boot - it's just
less memory that won't boot. I've set the default to 1024MB: I know
that's a lot of memory for an embedded system but I think for anything
with the Radix MMU it's an OK default.

I'm sure if mpe disagrees he can add EXPERT when he's merging :)

> Maybe we could have
>
> -  	select HAVE_ARCH_KASAN_VMALLOC		if PPC32
> +	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN

That's a good idea. Done.

Thanks for the review!

Regards,
Daniel

>
>>   	select HAVE_ARCH_KGDB
>>   	select HAVE_ARCH_MMAP_RND_BITS
>>   	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>
>
> Christophe

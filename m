Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7753827676
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 09:01:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458gQZ4rdWzDqW5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 17:01:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Oe+r78Ud"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458gNs5n8xzDqC4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 16:59:55 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id a3so2623447pgb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 23:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sTVf2HlQGeeweyPoper6ABpd3ug5oigjMesp2xkd4m0=;
 b=Oe+r78UdW+Kd0IH2xb+qj2L2OV8okEa0WqG9Fe7j+KI7DOhP6xZoTxw6EFyYiT2HAp
 v4TJeLUZoaaH0Uc4I/7mfkGKdIlkFvnVJNcsaj+fYNYasshr4DVtEZLtZn9FQOkyse4W
 IDAA1S+VVRcKOhiEOEBsTK7ALVSQUz0M+mEwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=sTVf2HlQGeeweyPoper6ABpd3ug5oigjMesp2xkd4m0=;
 b=pbvKwFqizuPAjPg61Dilydt5NkteLu/sWB8I7rtv8TzJgHHn3BBLoNpamynAR1M+Br
 gCKrbRrEFCVRmUhdpl4zRTYmc4pmfobVnFZjDkXMs1TVeBOHFG4B3LtLmEmGDl2HqOm+
 rNiXkEfnVVzMnlvSQZ8bZZimq5rWw6gIJyD1EQnA3kO3SzZQoZ19Bu2pVmunPNgcOooG
 8TTYxg7qKx/D+fRtyORulD3yDmKBX79H20BpVfrXsk1fOo1F82Ui1f4in1M7LegZCqe2
 onu6bp2mEAaUcnAJ5Vq7C610eumvAHShrKpXb1vSVTSJspbnpRFx1x+uiqNWxhQtFnlq
 GyPw==
X-Gm-Message-State: APjAAAUktRLEDJhSFBlhStB9JMCM9ORH7sewTNQLJl9ul97yUAOpRQc5
 Qz47BL+vN/+cXwyH5DJ3vMDyFA==
X-Google-Smtp-Source: APXvYqzM4PWOJt5MxCFOI2DrqbYW4isjjV9tRRbe6Fz5yaniZBRItZhT4Kfk1bwqh+c09DtBf551dw==
X-Received: by 2002:a17:90a:2590:: with SMTP id
 k16mr219167pje.11.1558594791623; 
 Wed, 22 May 2019 23:59:51 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id v81sm52690410pfa.16.2019.05.22.23.59.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 23:59:50 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: Re: [RFC PATCH 6/7] kasan: allow arches to hook into global
 registration
In-Reply-To: <b7f23406-c1dc-de50-d477-86cdf8f0d471@c-s.fr>
References: <20190523052120.18459-1-dja@axtens.net>
 <20190523052120.18459-7-dja@axtens.net>
 <b7f23406-c1dc-de50-d477-86cdf8f0d471@c-s.fr>
Date: Thu, 23 May 2019 16:59:47 +1000
Message-ID: <87h89lzme4.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Le 23/05/2019 =C3=A0 07:21, Daniel Axtens a =C3=A9crit=C2=A0:
>> Not all arches have a specific space carved out for modules -
>> some, such as powerpc, just use regular vmalloc space. Therefore,
>> globals in these modules cannot be backed by real shadow memory.
>
> Can you explain in more details the reason why ?

At this point, purely simplicity. As you discuss below, it's possible to
do better.

>
> PPC32 also uses regular vmalloc space, and it has been possible to=20
> manage globals on it, by simply implementing a module_alloc() function.
>
> See=20
> https://elixir.bootlin.com/linux/v5.2-rc1/source/arch/powerpc/mm/kasan/ka=
san_init_32.c#L135
>
> It is also possible to easily define a different area for modules, by=20
> replacing the call to vmalloc_exec() by a call to __vmalloc_node_range()=
=20
> as done by vmalloc_exec(), but with different bounds than=20
> VMALLOC_START/VMALLOC_END
>
> See https://elixir.bootlin.com/linux/v5.2-rc1/source/mm/vmalloc.c#L2633
>
> Today in PPC64 (unlike PPC32), there is already a split between VMALLOC=20
> space and IOREMAP space. I'm sure it would be easy to split it once more=
=20
> for modules.
>

OK, good to know, I'll look into one of those approaches for the next
spin!

Regards,
Daniel


> Christophe
>
>>=20
>> In order to allow arches to perform this check, add a hook.
>>=20
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>> ---
>>   include/linux/kasan.h | 5 +++++
>>   mm/kasan/generic.c    | 3 +++
>>   2 files changed, 8 insertions(+)
>>=20
>> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
>> index dfee2b42d799..4752749e4797 100644
>> --- a/include/linux/kasan.h
>> +++ b/include/linux/kasan.h
>> @@ -18,6 +18,11 @@ struct task_struct;
>>   static inline bool kasan_arch_is_ready(void)	{ return true; }
>>   #endif
>>=20=20=20
>> +#ifndef kasan_arch_can_register_global
>> +static inline bool kasan_arch_can_register_global(const void * addr)	{ =
return true; }
>> +#endif
>> +
>> +
>>   #ifndef ARCH_HAS_KASAN_EARLY_SHADOW
>>   extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
>>   extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
>> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
>> index 0336f31bbae3..935b06f659a0 100644
>> --- a/mm/kasan/generic.c
>> +++ b/mm/kasan/generic.c
>> @@ -208,6 +208,9 @@ static void register_global(struct kasan_global *glo=
bal)
>>   {
>>   	size_t aligned_size =3D round_up(global->size, KASAN_SHADOW_SCALE_SIZ=
E);
>>=20=20=20
>> +	if (!kasan_arch_can_register_global(global->beg))
>> +		return;
>> +
>>   	kasan_unpoison_shadow(global->beg, global->size);
>>=20=20=20
>>   	kasan_poison_shadow(global->beg + aligned_size,
>>=20

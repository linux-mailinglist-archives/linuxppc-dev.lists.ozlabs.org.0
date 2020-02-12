Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF615A8F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 13:18:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HdwC6jhDzDqF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 23:18:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=XWCVr0we; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hdsr6k1JzDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 23:16:32 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id ay11so914896plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 04:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ORoK11ERH5m7YuJvIylQ/MWzmpJfOKr+pxcrwqBrMvQ=;
 b=XWCVr0we/B0Dnr38QeVN0NAFBB7OHmJ6catF4Y/m8KUXV6l1ibCWIyD6aROfJdFo9Q
 ys5FzIM1S4R9WZVpjIF+j0u96+EHCi/Uhcf05fseXW6fudw77tn/uCmRGDs36XDbemzz
 0r6x9Ef6eJ3zC+P5L1ag/zMCrB7t/hSxhwWhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ORoK11ERH5m7YuJvIylQ/MWzmpJfOKr+pxcrwqBrMvQ=;
 b=bdwZ29Eo+J/3HgWaFcaSig5ulI7APPW4CgM87P7Y+WfuKjLHAh4xVNt3Ak7xuDZr2l
 vtisYjSs5YWWSBmCAFeAKnd5lrl8Y/h81fMHTV0ZMDJm16hE+QYmC9xPBmZ2jcYl3lMY
 FpITjro1wTCo2nvg7c5tvMvKlbYnOjvP8dRcF1acvhr36cG3BZryeFf916s+RxcyIhmy
 iTuv61sCAnSLqJ4NWKXYd2oyGaNKdKdoh+RnLDoMjYES95z+5AJHyFWdh4wwU2JKrLkz
 UuJm2PG4UV0RfldRoU+JceFSKIgQhqMcZKWBphc4nRMtwUsnPe11A7y2djSHCPjjOh9U
 KUdw==
X-Gm-Message-State: APjAAAXF1KVDXpIaCKTLQXvj5vCOJJONMTOaEc725+Y/k8+aX7dFJyT4
 M98oXqSA8IxYqziS/D3eGCnEeA==
X-Google-Smtp-Source: APXvYqzZYTz24FDyHd0eRpGzSXdXy/ZDf7dLI/ImpCx1ChsLkUO9NJ/LKn0a3OCf6UX0E41BiUUemA==
X-Received: by 2002:a17:902:34d:: with SMTP id
 71mr7957844pld.140.1581509789395; 
 Wed, 12 Feb 2020 04:16:29 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-65dc-9b98-63a7-c7a4.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:65dc:9b98:63a7:c7a4])
 by smtp.gmail.com with ESMTPSA id z27sm749357pfj.107.2020.02.12.04.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 04:16:25 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: Re: [PATCH v6 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
In-Reply-To: <5e392944-50ac-ed06-5896-2664894335d9@c-s.fr>
References: <20200212054724.7708-1-dja@axtens.net>
 <20200212054724.7708-5-dja@axtens.net>
 <224745f3-db66-fe46-1459-d1d41867b4f3@c-s.fr>
 <87imkcru6b.fsf@dja-thinkpad.axtens.net>
 <5e392944-50ac-ed06-5896-2664894335d9@c-s.fr>
Date: Wed, 12 Feb 2020 23:16:21 +1100
Message-ID: <87ftfgrofe.fsf@dja-thinkpad.axtens.net>
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

> Le 12/02/2020 =C3=A0 11:12, Daniel Axtens a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>=20
>>> Le 12/02/2020 =C3=A0 06:47, Daniel Axtens a =C3=A9crit=C2=A0:
>>>> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/a=
sm/kasan.h
>>>> index fbff9ff9032e..2911fdd3a6a0 100644
>>>> --- a/arch/powerpc/include/asm/kasan.h
>>>> +++ b/arch/powerpc/include/asm/kasan.h
>>>> @@ -2,6 +2,8 @@
>>>>    #ifndef __ASM_KASAN_H
>>>>    #define __ASM_KASAN_H
>>>>=20=20=20=20
>>>> +#include <asm/page.h>
>>>> +
>>>>    #ifdef CONFIG_KASAN
>>>>    #define _GLOBAL_KASAN(fn)	_GLOBAL(__##fn)
>>>>    #define _GLOBAL_TOC_KASAN(fn)	_GLOBAL_TOC(__##fn)
>>>> @@ -14,29 +16,41 @@
>>>>=20=20=20=20
>>>>    #ifndef __ASSEMBLY__
>>>>=20=20=20=20
>>>> -#include <asm/page.h>
>>>> -
>>>>    #define KASAN_SHADOW_SCALE_SHIFT	3
>>>>=20=20=20=20
>>>>    #define KASAN_SHADOW_START	(KASAN_SHADOW_OFFSET + \
>>>>    				 (PAGE_OFFSET >> KASAN_SHADOW_SCALE_SHIFT))
>>>>=20=20=20=20
>>>> +#ifdef CONFIG_KASAN_SHADOW_OFFSET
>>>>    #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
>>>> +#endif
>>>>=20=20=20=20
>>>> +#ifdef CONFIG_PPC32
>>>>    #define KASAN_SHADOW_END	0UL
>>>>=20=20=20=20
>>>> -#define KASAN_SHADOW_SIZE	(KASAN_SHADOW_END - KASAN_SHADOW_START)
>>>> +#ifdef CONFIG_KASAN
>>>> +void kasan_late_init(void);
>>>> +#else
>>>> +static inline void kasan_late_init(void) { }
>>>> +#endif
>>>> +
>>>> +#endif
>>>> +
>>>> +#ifdef CONFIG_PPC_BOOK3S_64
>>>> +#define KASAN_SHADOW_END	(KASAN_SHADOW_OFFSET + \
>>>> +				 (RADIX_VMEMMAP_END >> KASAN_SHADOW_SCALE_SHIFT))
>>>> +
>>>> +static inline void kasan_late_init(void) { }
>>>> +#endif
>>>>=20=20=20=20
>>>>    #ifdef CONFIG_KASAN
>>>>    void kasan_early_init(void);
>>>>    void kasan_mmu_init(void);
>>>>    void kasan_init(void);
>>>> -void kasan_late_init(void);
>>>>    #else
>>>>    static inline void kasan_init(void) { }
>>>>    static inline void kasan_mmu_init(void) { }
>>>> -static inline void kasan_late_init(void) { }
>>>>    #endif
>>>
>>> Why modify all this kasan_late_init() stuff ?
>>>
>>> This function is only called from kasan init_32.c, it is never called by
>>> PPC64, so you should not need to modify anything at all.
>>=20
>> I got a compile error for a missing symbol. I'll repro it and attach it.
>>=20
>
> Oops, sorry. I looked too quickly. It is defined in kasan_init_32.c and=20
> called from mm/mem.c
>
> We don't have a performance issue here, since this is called only once=20
> during startup. Could you define an empty kasan_late_init() in=20
> init_book3s_64.c instead ?

Yeah, I can do that, will respin tomorrow.

Would you mind having a quick check of the documentation changes in
patches 2 and 4? I just want to confirm I've accurately captured the
state of ppc32 kasan work.

Thanks!
Daniel
>
> Christophe

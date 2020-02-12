Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBAB15A5E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 11:13:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hb8N04g5zDqPR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 21:13:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=l9MckMLM; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hb6X0tlBzDqDJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 21:12:19 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id i6so1020678pfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 02:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KF/rQa9b+YDdw75c1nDcpos7LuX+EOPNM62K9KllEpE=;
 b=l9MckMLM6VWO1ur/vOxwH7Ki/VdQKc3ohUWRt7Z+z5CEQdKhRYppYU0suH5JuIRRlW
 zMhhtPNhmyl6LV8NVVEBOxpA493MJxADljyEKDs7i7DResuH38OdDodI3gJp2XbHbmzF
 pl4+t+bEOXPrykcn67P2WFq+uELfWizH8f2Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=KF/rQa9b+YDdw75c1nDcpos7LuX+EOPNM62K9KllEpE=;
 b=OjLMPGOr1LsG+Lj0WuCEfNceTrVNhZ7qPqSXAGkOGJNAronJZNA3G3snEUYIRAaMKv
 pRno2g89cyAovsW/fLRAxXONLJc9O5alA/xu9trgurSbcAJDPW8QWJoMN3cY1Z5cL0jN
 CRfwmM8Ewia97ATcLCWlq1TyORkEL5DIw0cUmvooxcHPXYUPVxmWIYZPNsx7YxYfSJZ4
 4iqfZ45nXP+zYYDgumcXL2xz/2zIy2nbANluNkD8jOJk486XuoH3dcqXoe6B0bfn+68W
 Lrao4ZaRVvrL2JxsRim4Vwb51QnTdkt75JAMVpIO6EX/VtoOAVKVXQaoXgbMFShv+piE
 tLMw==
X-Gm-Message-State: APjAAAXOXe607kk047yZIVM5gwrctNfO5R+GNkg3RBVKujjuaFDrCDOV
 xU3tJxVIrh+zGctZhQF0VyPG4Q==
X-Google-Smtp-Source: APXvYqx8As5sCy+kyC1OBVsfxJsYqEDJa2CntdnKeubs3WgKdDjGAI/TLJdKgvADeZfCHkDrxyuXxQ==
X-Received: by 2002:a63:d44e:: with SMTP id i14mr7939813pgj.417.1581502336089; 
 Wed, 12 Feb 2020 02:12:16 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-65dc-9b98-63a7-c7a4.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:65dc:9b98:63a7:c7a4])
 by smtp.gmail.com with ESMTPSA id e7sm190440pfj.114.2020.02.12.02.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 02:12:15 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: Re: [PATCH v6 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
In-Reply-To: <224745f3-db66-fe46-1459-d1d41867b4f3@c-s.fr>
References: <20200212054724.7708-1-dja@axtens.net>
 <20200212054724.7708-5-dja@axtens.net>
 <224745f3-db66-fe46-1459-d1d41867b4f3@c-s.fr>
Date: Wed, 12 Feb 2020 21:12:12 +1100
Message-ID: <87imkcru6b.fsf@dja-thinkpad.axtens.net>
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

> Le 12/02/2020 =C3=A0 06:47, Daniel Axtens a =C3=A9crit=C2=A0:
>> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm=
/kasan.h
>> index fbff9ff9032e..2911fdd3a6a0 100644
>> --- a/arch/powerpc/include/asm/kasan.h
>> +++ b/arch/powerpc/include/asm/kasan.h
>> @@ -2,6 +2,8 @@
>>   #ifndef __ASM_KASAN_H
>>   #define __ASM_KASAN_H
>>=20=20=20
>> +#include <asm/page.h>
>> +
>>   #ifdef CONFIG_KASAN
>>   #define _GLOBAL_KASAN(fn)	_GLOBAL(__##fn)
>>   #define _GLOBAL_TOC_KASAN(fn)	_GLOBAL_TOC(__##fn)
>> @@ -14,29 +16,41 @@
>>=20=20=20
>>   #ifndef __ASSEMBLY__
>>=20=20=20
>> -#include <asm/page.h>
>> -
>>   #define KASAN_SHADOW_SCALE_SHIFT	3
>>=20=20=20
>>   #define KASAN_SHADOW_START	(KASAN_SHADOW_OFFSET + \
>>   				 (PAGE_OFFSET >> KASAN_SHADOW_SCALE_SHIFT))
>>=20=20=20
>> +#ifdef CONFIG_KASAN_SHADOW_OFFSET
>>   #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
>> +#endif
>>=20=20=20
>> +#ifdef CONFIG_PPC32
>>   #define KASAN_SHADOW_END	0UL
>>=20=20=20
>> -#define KASAN_SHADOW_SIZE	(KASAN_SHADOW_END - KASAN_SHADOW_START)
>> +#ifdef CONFIG_KASAN
>> +void kasan_late_init(void);
>> +#else
>> +static inline void kasan_late_init(void) { }
>> +#endif
>> +
>> +#endif
>> +
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +#define KASAN_SHADOW_END	(KASAN_SHADOW_OFFSET + \
>> +				 (RADIX_VMEMMAP_END >> KASAN_SHADOW_SCALE_SHIFT))
>> +
>> +static inline void kasan_late_init(void) { }
>> +#endif
>>=20=20=20
>>   #ifdef CONFIG_KASAN
>>   void kasan_early_init(void);
>>   void kasan_mmu_init(void);
>>   void kasan_init(void);
>> -void kasan_late_init(void);
>>   #else
>>   static inline void kasan_init(void) { }
>>   static inline void kasan_mmu_init(void) { }
>> -static inline void kasan_late_init(void) { }
>>   #endif
>
> Why modify all this kasan_late_init() stuff ?
>
> This function is only called from kasan init_32.c, it is never called by=
=20
> PPC64, so you should not need to modify anything at all.

I got a compile error for a missing symbol. I'll repro it and attach it.

Regards,
Daniel

>
> Christophe

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F82E30B7F8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 07:44:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVFfQ0ZbvzDqvR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 17:44:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PWite5q3; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVFb04B7qzDr4m
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 17:41:32 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id v19so14242563pgj.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 22:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=rC09dL3t0JmuXKRGS11QfpT22mY/bCGC3yvB+dUe0fk=;
 b=PWite5q3ilvWPrNzABf1n2ObHEBeUkcRaH7O0mz9AUYo+3gOXj1emeuovYEtUxa40D
 Pprs3M/4nSbG5F422bG4VwKat8Yp6XPMULl2rGLdYqtHigSUo61/0wIy78mG+4EzglQp
 lVpv80EHwoEh1xUNYr4+xQm4xm1O4J5JMT974md8qoEZNixRctDEXLd3PlFg4Lo4Wm5U
 9GDmEgEdFw09Kn10gxC6lSyxDMixod5KD0FStaEkanlSCWPLmLZNDxsNG6BkKW+2qSG5
 ITkh8hkgQvpJ541DDIyNaR1Gmci80t/qg+3wM0UTKUpsB32nnu9zSJJOIw5EswRPmx1+
 o8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=rC09dL3t0JmuXKRGS11QfpT22mY/bCGC3yvB+dUe0fk=;
 b=CsKd2V/DSqpK/gePpisP0tpRoG36zGDM3HhzIup8Xmpqfa9gM9qllcQehRaevo9wbQ
 Rmdl7heEe9lFelphrMlOUwYIL6LWnQwcJHMyg3BCmUiYr7Rs/YpoYfWwTFXAs5AMmdSI
 jum9ftZTPeC5b+2jVHjDrM1hzLpyQi7rpljMhzJgzuGhkYQ1hrxLZaqIAUwxK+W/9FMm
 TjKVq6XdL7WhpSE9wKNKYEjlMqGOD7OIcIdUQOGodrgJreQSN+LTxxxgwnOTR/JcoIgI
 wIvYj+Gsb8tTWsx8uHMM+rMh5fQgzk+/8ZtKP+rmGsFYsXFACqX+Gltw0qmmG+GkpZuT
 kP3Q==
X-Gm-Message-State: AOAM533/MSwiIZsqo7b4wSo1btoz+/VM/WO6nxoSMrOkBT/qrYP6wO3Y
 Q3JsHaO2z0RHOIIroRVlZzA=
X-Google-Smtp-Source: ABdhPJyaqrVbEaywPer83Q1yamTBUdgzhSLBAu5yKXicZ9+owt7LJ3m0errPFW51m0M7fMC12YcztQ==
X-Received: by 2002:a62:7694:0:b029:1b9:8d43:95af with SMTP id
 r142-20020a6276940000b02901b98d4395afmr20512354pfc.2.1612248088518; 
 Mon, 01 Feb 2021 22:41:28 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id k10sm20969227pfk.0.2021.02.01.22.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 22:41:27 -0800 (PST)
Date: Tue, 02 Feb 2021 16:41:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC 11/20] mm/tlb: remove arch-specific tlb_start/end_vma()
To: Nadav Amit <nadav.amit@gmail.com>, Peter Zijlstra <peterz@infradead.org>
References: <20210131001132.3368247-1-namit@vmware.com>
 <20210131001132.3368247-12-namit@vmware.com>
 <YBfvh1Imz6RRTUDV@hirez.programming.kicks-ass.net>
In-Reply-To: <YBfvh1Imz6RRTUDV@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1612247956.0a1r1yjmm3.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 x86@kernel.org, Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Peter Zijlstra's message of February 1, 2021 10:09 pm:
> On Sat, Jan 30, 2021 at 04:11:23PM -0800, Nadav Amit wrote:
>=20
>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>> index 427bfcc6cdec..b97136b7010b 100644
>> --- a/include/asm-generic/tlb.h
>> +++ b/include/asm-generic/tlb.h
>> @@ -334,8 +334,8 @@ static inline void __tlb_reset_range(struct mmu_gath=
er *tlb)
>> =20
>>  #ifdef CONFIG_MMU_GATHER_NO_RANGE
>> =20
>> -#if defined(tlb_flush) || defined(tlb_start_vma) || defined(tlb_end_vma=
)
>> -#error MMU_GATHER_NO_RANGE relies on default tlb_flush(), tlb_start_vma=
() and tlb_end_vma()
>> +#if defined(tlb_flush)
>> +#error MMU_GATHER_NO_RANGE relies on default tlb_flush()
>>  #endif
>> =20
>>  /*
>> @@ -362,10 +362,6 @@ static inline void tlb_end_vma(struct mmu_gather *t=
lb, struct vm_area_struct *vm
>> =20
>>  #ifndef tlb_flush
>> =20
>> -#if defined(tlb_start_vma) || defined(tlb_end_vma)
>> -#error Default tlb_flush() relies on default tlb_start_vma() and tlb_en=
d_vma()
>> -#endif
>=20
> #ifdef CONFIG_ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING
> #error ....
> #endif
>=20
> goes here...
>=20
>=20
>>  static inline void tlb_end_vma(struct mmu_gather *tlb, struct vm_area_s=
truct *vma)
>>  {
>>  	if (tlb->fullmm)
>>  		return;
>> =20
>> +	if (IS_ENABLED(CONFIG_ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING))
>> +		return;
>=20
> Also, can you please stick to the CONFIG_MMU_GATHER_* namespace?
>=20
> I also don't think AGRESSIVE_FLUSH_BATCHING quite captures what it does.
> How about:
>=20
> 	CONFIG_MMU_GATHER_NO_PER_VMA_FLUSH

Yes please, have to have descriptive names.

I didn't quite see why this was much of an improvement though. Maybe=20
follow up patches take advantage of it? I didn't see how they all fit=20
together.

Thanks,
Nick

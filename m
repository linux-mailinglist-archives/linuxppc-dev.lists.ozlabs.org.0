Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B657E22B00E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 15:13:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCCSf44RPzDrPp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 23:13:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VHCvV4tD; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCCQC0kYNzDr9B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 23:11:13 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id q17so2536533pls.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=E/e6bkQ7xor2tf39B3HoCRN8UgDNduwN1Zl5yinxqAQ=;
 b=VHCvV4tDO0Bo5lG2Zc4hPcBRi5ULljYg08PlC0vzAhBt1p+CAjOX0WO/MyIX6FT/Xz
 AVXqfD1jopjxBj0S7kL4mgO5TWFgxhWjIwgiNW/HnU1AXeN9Wa9A/R9UWkrrkJZDEl9A
 Y4GRXVfQdi2aBc5if6fb1s/fm8E43m7KFrJmOZ5D4lLx1neR//DLIeK5TXy+RMVs9mWL
 zXyf0bGiSKnAjEfPXF02FACc0rMk0Ikkzot//SenWG4yCVgqJ4UgWgE4sRgiS6gbaRIH
 maTuWUdkFpnk4sPb5nhbOtEDUUMLgvXitYsyqxIZqPsm2ZMlXRIHbfw+ZRcAv2LRAGjV
 wLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=E/e6bkQ7xor2tf39B3HoCRN8UgDNduwN1Zl5yinxqAQ=;
 b=YVaztnaRZo8J4zRVruqAZ/UT2ZlR6p1Y5T8h/sVA25DYN5WNFFxttHVH3/Ki530ERg
 MYdbYzXT/Xk4kndejmPOETezPBSh6NXGqeCShnMTjYVmG3IgjuI3kUkjqDdkOiYnt0Ia
 cxUeDx7E9Ldk3O+BI2V9Vhv/n8b0WFplGqZHnF//KJlK/G92Kx7749oywn8FTWSHIeS4
 mrDL57nUwWkCrvyOLiK5L5BLuWwItm/KpjVEJLan7h0UE57jNYMOBABy2WnpthZ6yqQI
 bCwGMPbr7uR5g+LNT7OemEoLGA2J9OwSjhHTVJsVXa3pdNn2UiTIIVw3UBRfVDExvy/9
 f+Pg==
X-Gm-Message-State: AOAM533SI2PB9YxigoKy8+71seMt4YmCjzgU3Yu9XIRXXpjJg+rcxWet
 4PH62qYkXfg/zh+Ur3v7uZY=
X-Google-Smtp-Source: ABdhPJzyDRqU0+pKFo017avcsBGjeFT0wLcR3XwTdTSuoYbBl6djhiXCSDZYxDgTPpeRhvXDAsKYsw==
X-Received: by 2002:a17:90a:6b02:: with SMTP id
 v2mr310422pjj.163.1595509869825; 
 Thu, 23 Jul 2020 06:11:09 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id g18sm3001623pfi.141.2020.07.23.06.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 06:11:09 -0700 (PDT)
Date: Thu, 23 Jul 2020 23:11:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
To: Peter Zijlstra <peterz@infradead.org>
References: <20200723105615.1268126-1-npiggin@gmail.com>
 <20200723114010.GO5523@worktop.programming.kicks-ass.net>
In-Reply-To: <20200723114010.GO5523@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1595506730.3mvrxktem5.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Peter Zijlstra's message of July 23, 2020 9:40 pm:
> On Thu, Jul 23, 2020 at 08:56:14PM +1000, Nicholas Piggin wrote:
>=20
>> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/as=
m/hw_irq.h
>> index 3a0db7b0b46e..35060be09073 100644
>> --- a/arch/powerpc/include/asm/hw_irq.h
>> +++ b/arch/powerpc/include/asm/hw_irq.h
>> @@ -200,17 +200,14 @@ static inline bool arch_irqs_disabled(void)
>>  #define powerpc_local_irq_pmu_save(flags)			\
>>  	 do {							\
>>  		raw_local_irq_pmu_save(flags);			\
>> -		trace_hardirqs_off();				\
>> +		if (!raw_irqs_disabled_flags(flags))		\
>> +			trace_hardirqs_off();			\
>>  	} while(0)
>>  #define powerpc_local_irq_pmu_restore(flags)			\
>>  	do {							\
>> -		if (raw_irqs_disabled_flags(flags)) {		\
>> -			raw_local_irq_pmu_restore(flags);	\
>> -			trace_hardirqs_off();			\
>> -		} else {					\
>> +		if (!raw_irqs_disabled_flags(flags))		\
>>  			trace_hardirqs_on();			\
>> -			raw_local_irq_pmu_restore(flags);	\
>> -		}						\
>> +		raw_local_irq_pmu_restore(flags);		\
>>  	} while(0)
>=20
> You shouldn't be calling lockdep from NMI context!

After this patch it doesn't.

trace_hardirqs_on/off implementation appears to expect to be called in NMI=20
context though, for some reason.

> That is, I recently
> added suport for that on x86:
>=20
>   https://lkml.kernel.org/r/20200623083721.155449112@infradead.org
>   https://lkml.kernel.org/r/20200623083721.216740948@infradead.org
>=20
> But you need to be very careful on how you order things, as you can see
> the above relies on preempt_count() already having been incremented with
> NMI_MASK.

Hmm. My patch seems simpler.

I don't know this stuff very well, I don't really understand what your patc=
h=20
enables for x86 but at least it shouldn't be incompatible with this one=20
AFAIKS.

Thanks,
Nick

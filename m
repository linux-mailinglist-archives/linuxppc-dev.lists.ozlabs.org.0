Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EC72E04C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 04:38:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0MWY5BRLzDqNC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:38:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PZkdAvYy; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0MTv0Y3XzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Dec 2020 14:37:22 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id m5so587011pjv.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 19:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=SjVqR8LiKx+s317aaGQgE8GKdQdQNO7jtaSxEgd+qCM=;
 b=PZkdAvYyE4n255xokppXyYOvh4C17/w4hOu7mSoq//6MQq8kdln4/McvhY7ykGmCxo
 JnrIARVaNikcMYQikWNp+Fiw24zkTMFEXwMUQnG65WaijO+98wRVcLCLx4WC9eGxrBBq
 Qw2dhLIDB8VWnRDc+gSb6gRrHoEfdXrCWUuNtcnq891wfs8aTcs4YBIawCg2i9S9pAZz
 ZFMO405ABRhVDYMrb0jbSrYqkvjnw6ErmlfPWvfqKjrOsMw4UM3wZzKQzM33miAOIyxw
 eC+jBsZXB81ObwNPXgEsM/gl28XiIYCdelKVCaTD5J4fqtKJbj4XVVjjojovt2ymcNNB
 pYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=SjVqR8LiKx+s317aaGQgE8GKdQdQNO7jtaSxEgd+qCM=;
 b=UOcIal6oOKulUlpsu1IEmsQY9e5NXtiTjC4h8bv3UxE87H0CC72j/g6IxqKzS2XD8Z
 zK2Qa73lZw5GgK8JypLjckIzZAJGgHtPgT2PvNgywtGKDwvd6oYnelgxMf2o+y5ULm8K
 z1diSe2Tw8BaeumExSifrWR0O4mlKZaeHzvIhvyT1aqQFROfzW9Htm0JfjoxG8CPxuJl
 m+x+miN2FupxqLLdGPBBTuQmHbaHSvbm8OdqlNRMKDb3ytBuo9xcsbf2SYR0uba8prBG
 aOi3jc3SCSnCxotB8/BqwOCfZx0dmtZQtdQEdCwRxIWM09yomfv4i1BqIjkDh+GDtXpx
 tIKA==
X-Gm-Message-State: AOAM530fCxi9le9fdI0nieN9fKAWpOAd3LKJHkw2O+gWsSgt9LoO+sJd
 vKWF/LYlE7Q0O2ktHCidxWZP6CdlAWU=
X-Google-Smtp-Source: ABdhPJxopyFeh1K9izlViMi8zYrs3yUJ1ljOgAy8ipL65ocAYPpii68mo3iQrdNNQhWq2bi8EKLqxw==
X-Received: by 2002:a17:90b:1945:: with SMTP id
 nk5mr19974935pjb.30.1608608239410; 
 Mon, 21 Dec 2020 19:37:19 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id t22sm17707576pgm.18.2020.12.21.19.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 19:37:18 -0800 (PST)
Date: Tue, 22 Dec 2020 13:37:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 3/5] powerpc/64s: add CONFIG_PPC_NMMU for nest MMU
 support
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201219234813.830747-1-npiggin@gmail.com>
 <20201219234813.830747-4-npiggin@gmail.com>
 <7860a2b3-205f-9b27-42cb-e298264f8253@csgroup.eu>
In-Reply-To: <7860a2b3-205f-9b27-42cb-e298264f8253@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1608607962.g5w7ucan12.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of December 20, 2020 9:43 pm:
>=20
>=20
> Le 20/12/2020 =C3=A0 00:48, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This allows some nest MMU features to be compiled away if coprocessor
>> support is not selected.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/Kconfig                          | 1 +
>>   arch/powerpc/include/asm/book3s/64/mmu.h      | 2 ++
>>   arch/powerpc/include/asm/book3s/64/tlbflush.h | 2 ++
>>   arch/powerpc/include/asm/mmu_context.h        | 5 +++--
>>   arch/powerpc/platforms/Kconfig                | 3 +++
>>   arch/powerpc/platforms/powernv/Kconfig        | 1 +
>>   6 files changed, 12 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index ae7391627054..4376bf4c53b4 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -888,6 +888,7 @@ config PPC_PROT_SAO_LPAR
>>  =20
>>   config PPC_COPRO_BASE
>>   	bool
>> +	select PPC_NMMU if PPC_BOOK3S_64
>>  =20
>>   config SCHED_SMT
>>   	bool "SMT (Hyperthreading) scheduler support"
>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/inc=
lude/asm/book3s/64/mmu.h
>> index 995bbcdd0ef8..07850d68a624 100644
>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>> @@ -103,8 +103,10 @@ typedef struct {
>>   	/* Number of bits in the mm_cpumask */
>>   	atomic_t active_cpus;
>>  =20
>> +#ifdef CONFIG_PPC_NMMU
>>   	/* Number of users of the external (Nest) MMU */
>>   	atomic_t copros;
>> +#endif
>>  =20
>>   	/* Number of user space windows opened in process mm_context */
>>   	atomic_t vas_windows;
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerp=
c/include/asm/book3s/64/tlbflush.h
>> index 0a7431e954c6..c70a82851f78 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>> @@ -16,8 +16,10 @@ enum {
>>  =20
>>   static inline bool mm_has_nmmu(struct mm_struct *mm)
>>   {
>> +#ifdef CONFIG_PPC_NMMU
>>   	if (unlikely(atomic_read(&mm->context.copros) > 0))
>>   		return true;
>> +#endif
>>   	return false;
>>   }
>>  =20
>> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/inclu=
de/asm/mmu_context.h
>> index d5821834dba9..53eac0cc4929 100644
>> --- a/arch/powerpc/include/asm/mmu_context.h
>> +++ b/arch/powerpc/include/asm/mmu_context.h
>> @@ -143,6 +143,7 @@ static inline void dec_mm_active_cpus(struct mm_stru=
ct *mm)
>>   	atomic_dec(&mm->context.active_cpus);
>>   }
>>  =20
>> +#ifdef CONFIG_PPC_NMMU
>>   static inline void mm_context_add_copro(struct mm_struct *mm)
>>   {
>>   	/*
>> @@ -187,6 +188,7 @@ static inline void mm_context_remove_copro(struct mm=
_struct *mm)
>>   			dec_mm_active_cpus(mm);
>>   	}
>>   }
>> +#endif
>>  =20
>>   /*
>>    * vas_windows counter shows number of open windows in the mm
>> @@ -218,8 +220,7 @@ static inline void mm_context_remove_vas_window(stru=
ct mm_struct *mm)
>>   #else
>>   static inline void inc_mm_active_cpus(struct mm_struct *mm) { }
>>   static inline void dec_mm_active_cpus(struct mm_struct *mm) { }
>> -static inline void mm_context_add_copro(struct mm_struct *mm) { }
>> -static inline void mm_context_remove_copro(struct mm_struct *mm) { }
>=20
> Are you sure you can remove those ?
> If so, I think it belongs to another patch, I can't see how the new PPC_N=
MMU would allow that by itself.

Yeah possibly a separate patch. Nothing except 64s should compile such
code though, I think?

Thanks,
Nick

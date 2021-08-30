Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D002F3FB16E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 08:52:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GygxF34HNz2ymZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 16:52:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ej9TCAma;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ej9TCAma; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GygwZ4grKz2xs6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 16:51:57 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso13126478pjh.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Aug 2021 23:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=aX1xBl38mZQKejRSAClnnHxvkM20r3w8OGOn8f4j3uc=;
 b=Ej9TCAma1r5v4cbFP15tTRik6yTGUo+NgfvKClvSdcp/pF7+OCY4TtpMWnbvkixt6U
 IOzKzev9zFU8NncetuZpNSr13ss2sU8Z5l0GPU8ZLz2Z9WeW82Guomd2vYzopikSXplo
 4o/vijsmnuKoXJnZA/nFHZHg2XHcljiFWMLommDm1348wtOPfsqKgwHgG8orjmJa7Lww
 wZOdsuaE3krDw6ofLSJOvDwQHGlWfIvchR9UFsgSYX0U/peMaxSNnITmzGRw8T2MKMqb
 1TWUB6RrbKenkQ6MwDKlXKTzYpJl5tgCiaHyqyrts0jMyBTWRawB8ejfkrqhYiTStrzA
 NAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=aX1xBl38mZQKejRSAClnnHxvkM20r3w8OGOn8f4j3uc=;
 b=CVCbWCSUbHIqzrWQkAfklz2bJsd8IaH7dEPtH4J/E6reDdpdJ8UYE39qlw1OqU5ftR
 mtDM4eBm8JWWq14n2Vm6P+ZcNCfhinyItCMSMbMh4kKoz4U5PaUPi3mPvvvroiGrnSs0
 5ZOjNGQl8p/LwjKAL+/vdVXRhqankM0wEZCsa8QU8H8OJrgiKTAoNfm34UPU+gX/FRLM
 RFPtKQNUITB+XQPZ6MRNa1yIR1FdpaKpS71Mb64frPQUMM+1lV8AI83WTafGyTLCodIK
 i+Q3xYyGEGt8ZM0Bw8LpQmRxODJ3bGDXsEDy3f2n+ut3yAsWGvQ8iLSmV9U3bHc3FvHV
 INhg==
X-Gm-Message-State: AOAM532ZZcU1T6oz9Zztt0pRQ8xhsBZgQIFYEqZdjeb43xCQWZM3Esq9
 rRtCq9k0pKKWl/1DYpVqg4o=
X-Google-Smtp-Source: ABdhPJyfnHTWSeR59J9WEdpG19T30AUgg5AehrlFqk1C40AIMeAGaTshkL6wbp0lp+o2uX85kcuJOg==
X-Received: by 2002:a17:902:9b89:b0:12d:7f02:f6a5 with SMTP id
 y9-20020a1709029b8900b0012d7f02f6a5mr20365671plp.39.1630306314453; 
 Sun, 29 Aug 2021 23:51:54 -0700 (PDT)
Received: from localhost (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id t38sm13258545pfg.207.2021.08.29.23.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:51:54 -0700 (PDT)
Date: Mon, 30 Aug 2021 16:51:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/6] powerpc/64s: Make hash MMU code build configurable
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210827163410.1177154-1-npiggin@gmail.com>
 <20210827163410.1177154-5-npiggin@gmail.com>
 <3b419b53-02b8-1a52-2f22-7b8ca49c4460@csgroup.eu>
In-Reply-To: <3b419b53-02b8-1a52-2f22-7b8ca49c4460@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1630306030.3s9bpofbg9.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of August 28, 2021 7:34 pm:
>=20
>=20
> Le 27/08/2021 =C3=A0 18:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Introduce a new option CONFIG_PPC_64S_HASH_MMU which allows the 64s hash
>> MMU code to be compiled out if radix is selected and the minimum
>> supported CPU type is POWER9 or higher, and KVM is not selected.
>>=20
>> This saves 128kB kernel image size (90kB text) on powernv_defconfig
>> minus KVM, 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>=20
> ...
>=20
>> @@ -324,6 +330,7 @@ static inline void assert_pte_locked(struct mm_struc=
t *mm, unsigned long addr)
>>   }
>>   #endif /* !CONFIG_DEBUG_VM */
>>  =20
>> +#if defined(CONFIG_PPC_RADIX_MMU) && defined(CONFIG_PPC_64S_HASH_MMU)
>>   static inline bool radix_enabled(void)
>>   {
>>   	return mmu_has_feature(MMU_FTR_TYPE_RADIX);
>> @@ -333,6 +340,27 @@ static inline bool early_radix_enabled(void)
>>   {
>>   	return early_mmu_has_feature(MMU_FTR_TYPE_RADIX);
>>   }
>> +#elif defined(CONFIG_PPC_64S_HASH_MMU)
>> +static inline bool radix_enabled(void)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline bool early_radix_enabled(void)
>> +{
>> +	return false;
>> +}
>> +#else
>> +static inline bool radix_enabled(void)
>> +{
>> +	return true;
>> +}
>> +
>> +static inline bool early_radix_enabled(void)
>> +{
>> +	return true;
>> +}
>> +#endif
>=20
> You don't need something that complex. You don't need to change that at a=
ll indeed, just have to=20
> ensure that when CONFIG_PPC_64S_HASH_MMU is not selected you have MMU_FTR=
_TYPE_RADIX included in=20
> MMU_FTRS_ALWAYS and voila.

Yeah I had that as a later patch that fixes up the MMU ftrs for 64s=20
which does that, I think was required before some of your patches were=20
upstreamed.

But looks like it is now trivial so I should just pull that in here.

Thanks,
Nick

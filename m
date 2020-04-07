Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8751A05C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 06:34:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xF1V0SpdzDqww
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 14:34:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q999j+LK; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xDzg0FRWzDqs8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 14:33:02 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id v23so870490pfm.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 21:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Wfpx3gWAV+sANt3oPD2qhTAPCIp+YXihOOlShEYQXXw=;
 b=Q999j+LKF6HfFK0/1J06WR/992cI2eFrcx+h2ig2seMcKuHIkWS1rBBr502NATEVNj
 pLECfiLZE03hZew1mxIWBSLdR2iZG5QVJ5PFSwBV63xNgNzD7iFfWg3Q+oYf6hpnKRQX
 JbcwVvp1SVd1PPMjE3SBuyHRlQzuiodtwmwDfnrk/bpeMd00uoq+la3lDjIDOm+oDVHc
 02PHdWDa9KLJjCC13u9ymTaOJDZcOds6rgA4fjaAxAi+xcoKw8jsD57g+GPn9CeCU7gz
 E0OCkr/iiSBHBRVZqR+txtbA10MLqsLTl1gMyHIRi4yEv347D1LGHvr8XymHqJs/9kaN
 z5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Wfpx3gWAV+sANt3oPD2qhTAPCIp+YXihOOlShEYQXXw=;
 b=DQb51lSaO9UPKCuP7Q9mdNtdsfp73Li4Vd0vfx410IbZ3+Nj1LL1J207BY+1bJo1jl
 2VwybWkeL/wPXIFxuCx7LRPjc++jYIc85GT+iT5UeYdHUt6J5A4TDnr9C1zvjuGBzHLJ
 QBhQhsMHEgmnv4ZAp0sMbpq1Orl0p+xuENIE6EGyexNKldUSvF2H7Hld8KddzOqCjFRc
 kAY4GuTQ7J3sfAgOA5JKxl9hEu/I/bHaVPG6qFFx70qOhEfwSX6z6WKKDdS9kB/hQ5b9
 zBjB9JMYhCgiUIobx0iH3Up3CKgcV7AIt4gLVqDsdH7x0PoqaG+c6VciUpy4oXvV+U9/
 emIQ==
X-Gm-Message-State: AGi0PuYP2TmOdXRvicfLbcqNfqOzMNA9fNJzScXWsEPoZPlOLuGS6kiR
 jCIWa3CvN9iJFbsqhxbNwio=
X-Google-Smtp-Source: APiQypKelj19iBbRi81GhDfuzLli9pSN2pERr/jqW6KmRYH6Ph33ymD0otMl35tGfLaeags2ya+8fg==
X-Received: by 2002:a63:ab05:: with SMTP id p5mr197514pgf.33.1586233978628;
 Mon, 06 Apr 2020 21:32:58 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id e26sm13057067pfj.61.2020.04.06.21.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 21:32:58 -0700 (PDT)
Date: Tue, 07 Apr 2020 14:31:28 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 09/14] powerpc/pseries: limit machine check stack to 4GB
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20200403132622.130394-1-npiggin@gmail.com>
 <20200403132622.130394-10-npiggin@gmail.com>
 <2b114363-7fa9-8383-0b95-93540e00f2a8@c-s.fr>
In-Reply-To: <2b114363-7fa9-8383-0b95-93540e00f2a8@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586233873.l2apf9xo4a.astroid@bobo.none>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 4, 2020 12:19 am:
>=20
>=20
> Le 03/04/2020 =C3=A0 15:26, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This allows rtas_args to be put on the machine check stack, which
>> avoids a lot of complications with re-entrancy deadlocks.
>>=20
>> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/kernel/setup_64.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_=
64.c
>> index e05e6dd67ae6..3a2428aa3d9a 100644
>> --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -692,6 +692,9 @@ void __init exc_lvl_early_init(void)
>>   void __init emergency_stack_init(void)
>>   {
>>   	u64 limit;
>> +#ifdef CONFIG_PPC_BOOK3S_64
>=20
> #ifdef not needed, see below
>=20
>> +	u64 mce_limit;
>> +#endif
>>   	unsigned int i;
>>  =20
>>   	/*
>> @@ -710,6 +713,18 @@ void __init emergency_stack_init(void)
>>   	 */
>>   	limit =3D min(ppc64_bolted_size(), ppc64_rma_size);
>>  =20
>> +	/*
>> +	 * Machine check on pseries calls rtas, but can't use the static
>> +	 * rtas_args due to a machine check hitting while the lock is held.
>> +	 * rtas args have to be under 4GB, so the machine check stack is
>> +	 * limited to 4GB so args can be put on stack.
>> +	 */
>> +#ifdef CONFIG_PPC_BOOK3S_64
>=20
> This ifdef is not needed. FW_FEATURE_LPAR is only possible on=20
> CONFIG_PPC_BOOK3S_64 (indeed only on PSERIES or PS3). On others=20
> firmware_has_feature(FW_FEATURE_LPAR) should return 0 at compile time.

Sure I'll remove it.

>> +	mce_limit =3D limit;
>> +	if (firmware_has_feature(FW_FEATURE_LPAR) && mce_limit > 4UL*1024*1024=
*1024)
>> +		mce_limit =3D 4UL*1024*1024*1024;
>=20
> You should use SZ_4G instead of hardcoding.

Will do.

Thanks,
Nick
=

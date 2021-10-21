Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68586435B7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 09:14:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZdyS6vFyz3c7d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 18:14:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ULw8QeX4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ULw8QeX4; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZdxm23tjz2xvw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 18:13:46 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id y4so17915963plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 00:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=5hW2DE0Jc8KYePK7dl7lxH+edrplk6zenDQIZhrl6Jo=;
 b=ULw8QeX4294wRkBc2IdJdlxQghoHeLxlnRp3/4BnFhgDffmGJvTHesxxOe2fBil+NM
 CcfPWeMiNfc44ElDbpzg0ir8cqFgzf8FS0MctcjUmG6z7KlXr3TxunlikoLUcKB5zN7w
 7Xl7PkJoY/cl/V7YMYtkYRXz49QNzLm3nhELSEAZvlChgpKnwLDh2WdvS4NaLuQC0uix
 wrfn0bsFU6jHErOqDrOaE5xMW+JXali/caRN0tlB8jr66SfYAn5LeeKPnYCJCXlLw7sr
 RMBpfFQQkNrQ6apfbJLnjEDL7RtBIeQWgLYMKKm2WFjbap81KO3yLYz7RF0pTELF2/s5
 +qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5hW2DE0Jc8KYePK7dl7lxH+edrplk6zenDQIZhrl6Jo=;
 b=YYlvqIKUqS9Yg7Cwg+O3bvawux/thVWDivwTn7e0dWgfXW6rJHziJt21gAmGzNt5xb
 KEb2tAR6FTTv0Cmfa0dtNB2Q4HZPuDMlKiRiyLh82wIWta4e1YDoFPqqoq4pUYLw8j/Y
 v/wzU2jHMhXwtvV8DpFIrcajAJ28SkLRYQCVquwbLma73X2m3dWYL9RnElmhusvYssQO
 FJ2n+epHEOrOzhDPi4K1hykv6CpYNk5jeVByAJqA1rj7u6VXFibM/f1TY/GtIb2xdZCj
 +kfY7hRLQ3TsziiDaqu2fuO1q+/YHAnaUgYjPiWAuvI+Pzc7O+kqLa19MaTaTWs6Xg35
 AA+Q==
X-Gm-Message-State: AOAM530+5qG3c+kcymdQwpBNEu4KeQLVb7v5uRpdj2XTVyOZnweeBFZ+
 8sncVzUgl129qqs6EOWqiG0=
X-Google-Smtp-Source: ABdhPJzzqM4KngKd05m4jGFe6snSj4MWIFexzV/A9TZnHaQgBce1REpJcOxpSudSpBj3q71D28y1PA==
X-Received: by 2002:a17:90b:4c4d:: with SMTP id
 np13mr4651573pjb.193.1634800422919; 
 Thu, 21 Oct 2021 00:13:42 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 u4sm8321792pjg.54.2021.10.21.00.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 00:13:42 -0700 (PDT)
Date: Thu, 21 Oct 2021 17:13:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 11/16] powerpc/64: pcpu setup avoid reading
 mmu_linear_psize on 64e or radix
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211021035417.2157804-1-npiggin@gmail.com>
 <20211021035417.2157804-12-npiggin@gmail.com>
 <11227d01-7ff4-2b14-e6a8-b1a596253b90@csgroup.eu>
In-Reply-To: <11227d01-7ff4-2b14-e6a8-b1a596253b90@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634799967.ew7myzwf30.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of October 21, 2021 2:52 pm:
>=20
>=20
> Le 21/10/2021 =C3=A0 05:54, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Radix never sets mmu_linear_psize so it's always 4K, which causes pcpu
>> atom_size to always be PAGE_SIZE. 64e sets it to 1GB always.
>>=20
>> Make paths for these platforms to be explicit about what value they set
>> atom_size to.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/kernel/setup_64.c | 21 +++++++++++++++------
>>   1 file changed, 15 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_=
64.c
>> index eaa79a0996d1..7d4bcbc3124e 100644
>> --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -880,14 +880,23 @@ void __init setup_per_cpu_areas(void)
>>   	int rc =3D -EINVAL;
>>  =20
>>   	/*
>> -	 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
>> -	 * to group units.  For larger mappings, use 1M atom which
>> -	 * should be large enough to contain a number of units.
>> +	 * BookE and BookS radix are historical values and should be revisited=
.
>>   	 */
>> -	if (mmu_linear_psize =3D=3D MMU_PAGE_4K)
>> -		atom_size =3D PAGE_SIZE;
>> -	else
>> +	if (IS_ENABLED(CONFIG_PPC_BOOK3E)) {
>>   		atom_size =3D 1 << 20;
>> +	} else if (radix_enabled()) {
>> +		atom_size =3D PAGE_SIZE;
>> +	} else {
>=20
> You can keep a single level (and remove the brackets)
>=20
> 	if (IS_ENABLED(CONFIG_PPC_BOOK3E))
> 		atom_size =3D SZ_1M;
> 	else if (radix_enabled())
> 		atom_size =3D PAGE_SIZE;
> 	else if (mmu_linear_psize =3D=3D MMU_PAGE_4K)
> 		atom_size =3D PAGE_SIZE;
> 	else
> 		atom_size =3D SZ_1M;

I could but the below comment and logic applies to BookS hash so I'm=20
happier to put it in its own block. Radix later might also inherit a
comment and size from x86-64.

>> +		/*
>> +		 * Linear mapping is one of 4K, 1M and 16M.  For 4K, no need
>> +		 * to group units.  For larger mappings, use 1M atom which
>> +		 * should be large enough to contain a number of units.
>> +		 */
>> +		if (mmu_linear_psize =3D=3D MMU_PAGE_4K)
>> +			atom_size =3D PAGE_SIZE;
>> +		else
>> +			atom_size =3D 1 << 20;
>=20
> Use SZ_1M instead of hardcoding.

Sure.

Thanks,
Nick


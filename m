Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA43FB17C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 08:58:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gyh4P6RFXz2yfk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 16:58:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fyW6a1Vn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fyW6a1Vn; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gyh3l4lZbz2xZZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 16:58:10 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id q68so12456158pga.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Aug 2021 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=Ijh/yZq8yxgSu/pObHwQoPCUoOSK74kfuTjf6qlR0cY=;
 b=fyW6a1Vn8CUjmhhMnN9Vg6Wr5M2OKS26ZvRuXVgCj4JsVhB+TCcLeNBJeL18G9y4dh
 JWzSTa5wbcf9d8lKJB89iRpMZSyc4RmAEGDFMcSg1mGayDiYO/GMzoSVH6zjAfhISqon
 ayj6pGYzjyA9m9/vSRo0wkJppZd+hFwUM+iQPbRN3VLMtWsWD5Ap7SCMSjG6rcOQ1QiA
 pq2AXwz8SY+DwHIRjAnMPRzJcx9M3Pqi2q1yiDgAqWtf0eVFrbG2xmLSghoo4YgZjOYF
 NudEW2dWREinjaebqU+da1aTr56aoWlDhenw+s1MPcXFi3sl7jhM8wmw1JKAiXCTJwoB
 XMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Ijh/yZq8yxgSu/pObHwQoPCUoOSK74kfuTjf6qlR0cY=;
 b=A7++R5ggB2px6nv+jDi032+Bq7Hx6bA5oxfCtHUMMOIWtUMADYWqZwv8z91akSCwox
 0FNxjR3RjYdkbKwbqtGi0hNH7drd9FHq5rogyALNPuanryp7HVN/8Do7QS6o3MtpSl2R
 da/sPXKcbZYsyNneWFfTiJ1ZH3muoMbZFp9vf5jHj+xkjKXJ6AkzifC4fnsCp3INq74c
 tQMuweiuZhkVgF+4aDA1fUfeOF698k19iwEE5HoQjNBfFdGvlozUo8OqF8KVyBATKQkn
 TNMzpE4oVo2JXOmXTKrY92BOll6vIhXNYnRNIkjRP7ynCQsMWUWPquLxDnh4OPR2MXKS
 Vf1Q==
X-Gm-Message-State: AOAM5332qgwZBkP4YrXsKzjhWJvHlH8EZkM6zbPtWgYWFAnCVeX8bBo9
 kriqc7aH1T9Mg9ysg7DOwoer4P6pKfA=
X-Google-Smtp-Source: ABdhPJxeZ06VCVQ6l+PIRaxHZKQJavEJ4iaxGIBM8gzJEaog0QJFL5tbnXwiZ9fm3+cc9d1MKx++QA==
X-Received: by 2002:a63:5812:: with SMTP id m18mr16980475pgb.131.1630306687764; 
 Sun, 29 Aug 2021 23:58:07 -0700 (PDT)
Received: from localhost (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id n15sm13912895pff.149.2021.08.29.23.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:58:07 -0700 (PDT)
Date: Mon, 30 Aug 2021 16:58:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 6/6] powerpc/microwatt: Stop building the hash MMU code
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210827163410.1177154-1-npiggin@gmail.com>
 <20210827163410.1177154-7-npiggin@gmail.com>
 <1d1484fe-70db-bafc-016f-29671e941bc8@csgroup.eu>
 <87y28jehrt.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y28jehrt.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1630306597.92woqvxutn.astroid@bobo.none>
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

Excerpts from Michael Ellerman's message of August 30, 2021 1:24 pm:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 27/08/2021 =C3=A0 18:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Microwatt is radix-only, so stop selecting the hash MMU code.
>>>=20
>>> This saves 20kB compressed dtbImage and 56kB vmlinux size.
>>>=20
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>   arch/powerpc/configs/microwatt_defconfig | 1 -
>>>   arch/powerpc/platforms/Kconfig.cputype   | 1 +
>>>   arch/powerpc/platforms/microwatt/Kconfig | 1 -
>>>   3 files changed, 1 insertion(+), 2 deletions(-)
>>>=20
>>> diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/co=
nfigs/microwatt_defconfig
>>> index bf5f2e5905eb..6fbad42f9e3d 100644
>>> --- a/arch/powerpc/configs/microwatt_defconfig
>>> +++ b/arch/powerpc/configs/microwatt_defconfig
>>> @@ -26,7 +26,6 @@ CONFIG_PPC_MICROWATT=3Dy
>>>   # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
>>>   CONFIG_CPU_FREQ=3Dy
>>>   CONFIG_HZ_100=3Dy
>>> -# CONFIG_PPC_MEM_KEYS is not set
>>>   # CONFIG_SECCOMP is not set
>>>   # CONFIG_MQ_IOSCHED_KYBER is not set
>>>   # CONFIG_COREDUMP is not set
>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/plat=
forms/Kconfig.cputype
>>> index 9b90fc501ed4..b9acd6c68c81 100644
>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>> @@ -371,6 +371,7 @@ config SPE
>>>   config PPC_64S_HASH_MMU
>>>   	bool "Hash MMU Support"
>>>   	depends on PPC_BOOK3S_64
>>> +	depends on !PPC_MICROWATT
>>
>> Do we really want to start nit picking which platforms can select such o=
r such option ?
>> Isn't it enough to get it off through the defconfig ?
>>
>> Is PPC_MICROWATT mutually exclusive with other book3s64 configs ? Don't =
we build multiplatform kernels ?
>=20
> Yeah that belongs in the microwatt defconfig, not as a forced exclusion
> in Kconfig.

Okay I'll fix that up. In that case the select POWER9 should not be in=20
Kconfig but just defconfig too. Which is fine, it just means oldconfig
won't change it.

Thanks,
Nick

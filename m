Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABC9435BDE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 09:39:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZfWW4r79z2yJy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 18:39:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cmxU42c0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cmxU42c0; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZfVs29S0z2yHJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 18:38:59 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id t184so5179041pfd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 00:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=00xpRa8ozTlu7HLED3dd6Z6xnuQeZD4PtKDfc9rSo20=;
 b=cmxU42c0w66BB1tqzF8hhRtcP8NJBHJYQjOoKl81U/hkBLHWb90xnc+aO5T13t42iY
 DydImUL4sO7ZA5LKCuYU6s96iaK1JKWsacN28+OKULz7/TxeU+AWL5Ed38CqP7/NutU/
 rjN3ze7Gco+772m/i5pWrrFeR0ehonJYOYHW8qMJVCU2NQG4oH7EiKJz9NOausiFFKAp
 0kg+Ft4jajPKhnxrRSZc3k0WnvlXj8cNEagm61EkxkU9PQXpTDRigS1GF+kplCS1KNL3
 JVkv3uCc7DDKhMXRN3vbu0BgNXGe1ISBBYP/kIs+r6OMlt1PAUpYb4+LGsYq3xbu3vap
 ThoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=00xpRa8ozTlu7HLED3dd6Z6xnuQeZD4PtKDfc9rSo20=;
 b=ffiiELUXuPmEW3at7PgH3PaVZqyj8nTDk2WHvXr/PvjTyxkbsL+nXYMaIvLMCRKn8Q
 V4V15GGjYlIQURSVh8RCCuwVqn/4M15ju9KgQHvYk1Fw+IjmxGUtkH2qP93GKZBKZ4af
 S+Ikv7UDMhfqzo2T0Za2MHvPW9rnBmpj0pEUs7vILsIRcQKubhlvYkN+DMKOm9QHuZpS
 yrOctlqMgAQAGp3weiqRNWGa6HMtyZxvJwLTuICiNekDPDQOPMW0d/l8Ool/S1PpeAni
 jNwFyaRf2PPKnx+9LJ++6Z/b06YqmecsObSriFGJwkClFm4x4HZL+wMkyjDmZX0YX335
 xH9w==
X-Gm-Message-State: AOAM530+heYVEPAbCeOrMaf48wOsZbqsJ85KlyHMOfW9BXx++A/6FOEi
 HfFSIzvDwmfYKZsfFPi3vUsaGdRzWGM=
X-Google-Smtp-Source: ABdhPJwIh0lsPvIBbkQu0Qf/sTtjmmJVS8GsAY1prq8StVEaJet6H280rPA8dARCD/pHWsZeehdHqw==
X-Received: by 2002:a63:950f:: with SMTP id p15mr3205550pgd.265.1634801936027; 
 Thu, 21 Oct 2021 00:38:56 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 73sm4621473pfv.125.2021.10.21.00.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 00:38:55 -0700 (PDT)
Date: Thu, 21 Oct 2021 17:38:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 16/16] powerpc/microwatt: Don't select the hash MMU code
To: Joel Stanley <joel@jms.id.au>
References: <20211021035417.2157804-1-npiggin@gmail.com>
 <20211021035417.2157804-17-npiggin@gmail.com>
 <CACPK8XfuR6QqyP-Bj8S6APbVNugTJLZuARfNHN6Knqe+-MeKSA@mail.gmail.com>
In-Reply-To: <CACPK8XfuR6QqyP-Bj8S6APbVNugTJLZuARfNHN6Knqe+-MeKSA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1634801796.rx7phmr7bf.astroid@bobo.none>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Joel Stanley's message of October 21, 2021 3:19 pm:
> On Thu, 21 Oct 2021 at 04:04, Nicholas Piggin <npiggin@gmail.com> wrote:
>>
>> Microwatt is radix-only, so it does not require hash MMU support.
>>
>> This saves 20kB compressed dtbImage and 56kB vmlinux size.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/configs/microwatt_defconfig | 1 -
>>  arch/powerpc/platforms/microwatt/Kconfig | 1 -
>>  2 files changed, 2 deletions(-)
>>
>> diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/con=
figs/microwatt_defconfig
>> index 6e62966730d3..7c8eb29d8afe 100644
>> --- a/arch/powerpc/configs/microwatt_defconfig
>> +++ b/arch/powerpc/configs/microwatt_defconfig
>> @@ -27,7 +27,6 @@ CONFIG_PPC_MICROWATT=3Dy
>>  # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
>>  CONFIG_CPU_FREQ=3Dy
>>  CONFIG_HZ_100=3Dy
>> -# CONFIG_PPC_MEM_KEYS is not set
>>  # CONFIG_SECCOMP is not set
>>  # CONFIG_MQ_IOSCHED_KYBER is not set
>>  # CONFIG_COREDUMP is not set
>=20
> We still end up with CONFIG_PPC_64S_HASH_MMU=3Dy in the config as it
> defaults to y.

If you make microwatt_defconfig? Hm, IIRC this came from savedefconfig=20
after unselecting hash mmu so I'm not sure why that doesn't work.
>=20
> We should disable in the defconfig it so your new changes are tested
> by that defconfig:
>=20
> +# CONFIG_PPC_64S_HASH_MMU is not set
>=20
> I boot tested your series on Microwatt with microwatt_defconfig (with
> and without that option set) and ppc64le_defconfig.

Nice.

Thanks,
Nick

>=20
> Cheers,
>=20
> Joel
>=20
>> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/pla=
tforms/microwatt/Kconfig
>> index 823192e9d38a..5e320f49583a 100644
>> --- a/arch/powerpc/platforms/microwatt/Kconfig
>> +++ b/arch/powerpc/platforms/microwatt/Kconfig
>> @@ -5,7 +5,6 @@ config PPC_MICROWATT
>>         select PPC_XICS
>>         select PPC_ICS_NATIVE
>>         select PPC_ICP_NATIVE
>> -       select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
>>         select PPC_UDBG_16550
>>         select ARCH_RANDOM
>>         help
>> --
>> 2.23.0
>>
>=20

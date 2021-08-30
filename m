Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D83FB173
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 08:55:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gyh165mTNz2yWN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 16:55:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TDgR5LU+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TDgR5LU+; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gyh0R24ZQz2xqy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 16:55:19 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id g184so12482418pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Aug 2021 23:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=CKAm+UKmrtIo6FlGBmpSgsqY15aRUn+G8Cai+bB1w0c=;
 b=TDgR5LU+4Huo8Myw75NykScL1650PMIPrUYSmMv6c+WXLiTbKWWrncPhkmkoUNaytP
 clY2qMUXIJU7drx9/wIB7T//BGzDdn0GhR8s8+p8f9qEDgY1Mt2QSb0YOL5o+9Fj3e3W
 qFTq+0TZbue2FPYEqmcvqVArAmB0iuybb2BT+VgTjkXiWKXs0LXiiEUIi5Rl7SCTsmNq
 qBB1QsyUUj1RwAgqsvdTdFFr7vTNr5aeDLDqjiL+9jJ1PHCSmcLtqe6+c95W2ayQqXE5
 +Ij6jA7RRK4yMzSYuL8jPFoEXJ7z3wep+9Ff6aXxj9XDbtXrhhALA630E60RzG9Nr7qe
 YwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=CKAm+UKmrtIo6FlGBmpSgsqY15aRUn+G8Cai+bB1w0c=;
 b=eLPTjxGK0sjZ7xCgUDblWECMbAd+Pql39kHEgFwcyR/Ady/10r4rY2B3GWLQ3W/Itr
 FTDKTcSG9ConpwW9COU5q/OcFX/qdlVjZHM5MvoNQmJorb6xlD2w3ntDDYgBsHZjxs3J
 PzYTlQwrm6uuMt9gCw2MormoVQm819vbAkTmFxVTCPFQeiiulsZbQ37SiD2lVrPHq6zt
 pdjBFHI/eLu/potdwyzDulTr1zBck2Ojtzl+LJlG6TnHQtg89p3w0KipuJw87PuEYaAL
 ZIRaEys1OnfiUsWhCPkQB/M6qa8UCBDHVZZoHQzyzXmI0YKs9JxpkchpbhrAYtToQqOH
 +IYg==
X-Gm-Message-State: AOAM531AFUMP8tooYMUtlF+EyEeDwDGOdZ3UMp+HR0e0VSIUtdV//a4V
 92eC6pX0TfLlAzJKJKf0A173Sg5MayM=
X-Google-Smtp-Source: ABdhPJzLoZKcPtAhA2YjcyxdbrO4ov7gtZWTGNaMajJAZTPZkZ+u+FLdvsfWP3H1PEswNa8ntqgFCg==
X-Received: by 2002:a63:1f24:: with SMTP id f36mr20355138pgf.6.1630306516015; 
 Sun, 29 Aug 2021 23:55:16 -0700 (PDT)
Received: from localhost (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id b13sm14178707pfr.72.2021.08.29.23.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:55:15 -0700 (PDT)
Date: Mon, 30 Aug 2021 16:55:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/6] powerpc/64s: Make hash MMU code build configurable
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210827163410.1177154-1-npiggin@gmail.com>
 <20210827163410.1177154-5-npiggin@gmail.com>
 <da2863dc-f8d9-f58b-0d52-7e1bd668718c@csgroup.eu>
In-Reply-To: <da2863dc-f8d9-f58b-0d52-7e1bd668718c@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1630306319.j6p7gkgn6s.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of August 28, 2021 7:59 pm:
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
>>   arch/powerpc/Kconfig                          |  1 +
>>   arch/powerpc/include/asm/book3s/64/mmu.h      | 22 +++++-
>>   .../include/asm/book3s/64/tlbflush-hash.h     |  7 ++
>>   arch/powerpc/include/asm/book3s/pgtable.h     |  4 ++
>>   arch/powerpc/include/asm/mmu.h                | 38 +++++++++--
>>   arch/powerpc/include/asm/mmu_context.h        |  2 +
>>   arch/powerpc/include/asm/paca.h               |  8 +++
>>   arch/powerpc/kernel/asm-offsets.c             |  2 +
>>   arch/powerpc/kernel/dt_cpu_ftrs.c             | 10 ++-
>>   arch/powerpc/kernel/entry_64.S                |  4 +-
>>   arch/powerpc/kernel/exceptions-64s.S          | 16 +++++
>>   arch/powerpc/kernel/mce.c                     |  2 +-
>>   arch/powerpc/kernel/mce_power.c               | 10 ++-
>>   arch/powerpc/kernel/paca.c                    | 18 ++---
>>   arch/powerpc/kernel/process.c                 | 13 ++--
>>   arch/powerpc/kernel/prom.c                    |  2 +
>>   arch/powerpc/kernel/setup_64.c                |  4 ++
>>   arch/powerpc/kexec/core_64.c                  |  4 +-
>>   arch/powerpc/kexec/ranges.c                   |  4 ++
>>   arch/powerpc/kvm/Kconfig                      |  1 +
>>   arch/powerpc/mm/book3s64/Makefile             | 17 +++--
>>   arch/powerpc/mm/book3s64/hash_pgtable.c       |  1 -
>>   arch/powerpc/mm/book3s64/hash_utils.c         | 10 ---
>>   .../{hash_hugetlbpage.c =3D> hugetlbpage.c}     |  6 ++
>>   arch/powerpc/mm/book3s64/mmu_context.c        | 16 +++++
>>   arch/powerpc/mm/book3s64/pgtable.c            | 22 +++++-
>>   arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 ++
>>   arch/powerpc/mm/book3s64/slb.c                | 16 -----
>>   arch/powerpc/mm/copro_fault.c                 |  2 +
>>   arch/powerpc/mm/fault.c                       | 17 +++++
>>   arch/powerpc/mm/pgtable.c                     | 10 ++-
>>   arch/powerpc/platforms/Kconfig.cputype        | 20 +++++-
>>   arch/powerpc/platforms/cell/Kconfig           |  1 +
>>   arch/powerpc/platforms/maple/Kconfig          |  1 +
>>   arch/powerpc/platforms/microwatt/Kconfig      |  2 +-
>>   arch/powerpc/platforms/pasemi/Kconfig         |  1 +
>>   arch/powerpc/platforms/powermac/Kconfig       |  1 +
>>   arch/powerpc/platforms/powernv/Kconfig        |  2 +-
>>   arch/powerpc/platforms/powernv/idle.c         |  2 +
>>   arch/powerpc/platforms/powernv/setup.c        |  2 +
>>   arch/powerpc/platforms/pseries/lpar.c         | 68 ++++++++++---------
>>   arch/powerpc/platforms/pseries/lparcfg.c      |  2 +-
>>   arch/powerpc/platforms/pseries/mobility.c     |  6 ++
>>   arch/powerpc/platforms/pseries/ras.c          |  4 ++
>>   arch/powerpc/platforms/pseries/reconfig.c     |  2 +
>>   arch/powerpc/platforms/pseries/setup.c        |  6 +-
>>   arch/powerpc/xmon/xmon.c                      |  8 ++-
>>   47 files changed, 310 insertions(+), 111 deletions(-)
>>   rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c =3D> hugetlbpage.c=
} (95%)
>=20
> Whaou ! Huge patch.
>=20
> Several places you should be able to use IS_ENABLED() or simply radix_ena=
bled() instead of #ifdefs=20
> and rely on GCC to opt out stuff when radix_enabled() folds into 'true'.

A lot of it couldn't be done because of data structures but I'm sure I=20
missed a lot. I will go over it again.

> I may do more detailed comments later when I have time.

Very much appreciated, but let me send out another version before you
get the fine toothed comb out so I don't waste too much of your time.
If there are no objections to the idea from a high level.

Thanks,
Nick

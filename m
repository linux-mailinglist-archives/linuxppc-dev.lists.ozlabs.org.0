Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 318C7102E4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 00:54:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44txfn283RzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 08:54:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ob84DQ66"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44txdG6q4nzDqSG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 08:53:06 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id w24so7439628plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 15:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=bDztD/ujVpn8NFHqaBmoePCgiisBaSiTIMPziP0Fi7o=;
 b=ob84DQ66+PN+jmJEe9bawx9ajfBeBS0ZwkSg7XsXrPpkdyMWZl4lpCjjUf1uV5Pxqn
 +xYGWWQ9erdpom1KVqwLHl4RiBHrswQkt3IEXggZbG3agcWQ8Fn+kboeIt1d3+vi6W4D
 5rAPZozZ2fQf9FtDSws0CO3LzI61WA9ZdDm+rsFT7FrAj7wmdFe/fFzSFq84cGNoHH6M
 M2E0NXgbGMdBtedJeVBzQJtzIBQF9Yo7HKibYQdpqhchkTDhfbTZ6NSOGn+biBIBS5cS
 7D2CiAkqpDOuiOkxaERjtolAay5m+zQIN5zRr8EMvOAqITAcd+GeCTEBK/aWijVLqGU6
 tG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=bDztD/ujVpn8NFHqaBmoePCgiisBaSiTIMPziP0Fi7o=;
 b=a4Yw7mc1VzzUg+uvbSdmXEf4HpIjI/c7QvoQWcvg+7iFhdVAE818Vq+wcaMfhWMliW
 xE3qvR4uqbuSNviYmpEr/+XAZiB8Ze29bh+qamMNFnpYPWB0H0unlM07FRUbOVMftIjo
 mvnqe9cAN1rdF85s2XBOZOlS2y4PFoisXVXeThmf7tmKrmPkp4lEvQ0davtuSlbavBnQ
 V/13DNSzTj91f4DZV4TlohUefYVS6U2R5r7BA9TNJKRrjYGDoTPl/+cZwYEYx9s1W65L
 1r3HZAwEBzlcYanALrek2p408QNDg003Bw7g09R4W3/PbB/FdIpzrNfzv/N7PJyIfP3N
 ZYGw==
X-Gm-Message-State: APjAAAXTFh924G6sGab2Fp/bdzP5fRt/zx6IPb9vYijYWatuwQHx5KQV
 r9d1L5n+Crg03pIAL0ilGiQ=
X-Google-Smtp-Source: APXvYqzxfVaCacRpduoD2Xwazbs85NCmpezPFY44gKLxahC3sY2HvIa6YLQ6tX0Wk4DmgXr6SlZm2g==
X-Received: by 2002:a17:902:a3:: with SMTP id
 a32mr1820708pla.111.1556664783054; 
 Tue, 30 Apr 2019 15:53:03 -0700 (PDT)
Received: from localhost ([61.68.7.233])
 by smtp.gmail.com with ESMTPSA id i3sm52883816pfa.90.2019.04.30.15.53.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Apr 2019 15:53:01 -0700 (PDT)
Date: Wed, 01 May 2019 08:52:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: vdso: drop unnecessary cc-ldoption
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley
 <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>, Nick Desaulniers
 <ndesaulniers@google.com>, Paul Mackerras <paulus@samba.org>
References: <20190423211116.261111-1-ndesaulniers@google.com>
 <CAKwvOd=dBLXQUzv8R3-JqF=pUTH0-5O3v+_ceekT3W23VxtDbg@mail.gmail.com>
In-Reply-To: <CAKwvOd=dBLXQUzv8R3-JqF=pUTH0-5O3v+_ceekT3W23VxtDbg@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1556664541.74fhfupxpn.astroid@bobo.none>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick Desaulniers's on May 1, 2019 6:25 am:
> On Tue, Apr 23, 2019 at 2:11 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> Towards the goal of removing cc-ldoption, it seems that --hash-style=3D
>> was added to binutils 2.17.50.0.2 in 2006. The minimal required version
>> of binutils for the kernel according to
>> Documentation/process/changes.rst is 2.20.
>>
>> Link: https://gcc.gnu.org/ml/gcc/2007-01/msg01141.html
>> Cc: clang-built-linux@googlegroups.com
>> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>> ---
>>  arch/powerpc/kernel/vdso32/Makefile | 5 ++---
>>  arch/powerpc/kernel/vdso64/Makefile | 5 ++---
>>  2 files changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/v=
dso32/Makefile
>> index ce199f6e4256..06f54d947057 100644
>> --- a/arch/powerpc/kernel/vdso32/Makefile
>> +++ b/arch/powerpc/kernel/vdso32/Makefile
>> @@ -26,9 +26,8 @@ GCOV_PROFILE :=3D n
>>  KCOV_INSTRUMENT :=3D n
>>  UBSAN_SANITIZE :=3D n
>>
>> -ccflags-y :=3D -shared -fno-common -fno-builtin
>> -ccflags-y +=3D -nostdlib -Wl,-soname=3Dlinux-vdso32.so.1 \
>> -               $(call cc-ldoption, -Wl$(comma)--hash-style=3Dboth)
>> +ccflags-y :=3D -shared -fno-common -fno-builtin -nostdlib \
>> +       -Wl,-soname=3Dlinux-vdso32.so.1 -Wl,--hash-style=3Dboth
>>  asflags-y :=3D -D__VDSO32__ -s
>>
>>  obj-y +=3D vdso32_wrapper.o
>> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/v=
dso64/Makefile
>> index 28e7d112aa2f..32ebb3522ea1 100644
>> --- a/arch/powerpc/kernel/vdso64/Makefile
>> +++ b/arch/powerpc/kernel/vdso64/Makefile
>> @@ -12,9 +12,8 @@ GCOV_PROFILE :=3D n
>>  KCOV_INSTRUMENT :=3D n
>>  UBSAN_SANITIZE :=3D n
>>
>> -ccflags-y :=3D -shared -fno-common -fno-builtin
>> -ccflags-y +=3D -nostdlib -Wl,-soname=3Dlinux-vdso64.so.1 \
>> -               $(call cc-ldoption, -Wl$(comma)--hash-style=3Dboth)
>> +ccflags-y :=3D -shared -fno-common -fno-builtin -nostdlib \
>> +       -Wl,-soname=3Dlinux-vdso64.so.1 -Wl,--hash-style=3Dboth
>>  asflags-y :=3D -D__VDSO64__ -s
>>
>>  obj-y +=3D vdso64_wrapper.o
>> --
>> 2.21.0.593.g511ec345e18-goog
>>
>=20
> bumping for review

This looks like a good cleanup.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

=

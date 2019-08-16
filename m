Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 563CC8F9A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 06:17:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468qmB5wg7zDqlR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 14:17:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="NXiOb2Ib"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468qdQ1gVVzDrFY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 14:11:37 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id d1so1689791pgp.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 21:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wkLW+QCz58nlrQENUl4iKN6nR8hpfPIajfbfonDVy48=;
 b=NXiOb2IbRxQ9P6mw8NebF0CH7Hx2peWC09yUbqi+dsGx+BLY/Kjimz46fC/zHab15z
 oywzpzIlt09NU90O/s2/v6dUCqsCgSKT0HRUsi54Ip+1ZaQG4wZqK3opZ9c9K1WbgWr1
 IKfahth4iWisP9d91ObHis4FXOI8m9Tw0aUa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=wkLW+QCz58nlrQENUl4iKN6nR8hpfPIajfbfonDVy48=;
 b=n6jf3sbJ6br4+8uWRVUD7ZdcNh/Fyr4IQrEwkyNeCII2j9CcvWEWGu33Cix/VfG8yc
 vKC29wshzUuNbvuf6WWmxTgWGOmeoLDlEuG9+zdM4jJW/KJV6yKNeoioBD8sPAhUZCfs
 g0ReATi4Pjrpn+Ggo8T+ADvgBvMhOHT3pjkm38QASv9yAdl+S7/3QwlV8y14C6eh24C8
 XSvR+v+BwANqEkOFZ7oPTZ+9Lm/JlzDorc7tAG0QKEU+PEqisg3mWfKHJKJTIO4HqE3V
 w4AVLpL2SV6nsmqm0bG2am1tD6PhdKT+ru46iXaw9VNR2KEJsMsPNvM/Yefyu6Kke+JH
 AcdQ==
X-Gm-Message-State: APjAAAVLbYZcE7nhULc0B2ICZwIW71wTj1zWTmQ3EUeBhOa3YpzgdYEg
 ThNEtHXGg3arBdy/T5M5gx5BgQ==
X-Google-Smtp-Source: APXvYqzltUU3Gz/5slsg61NG2gXrr4At0XJbkosw1jRi5ebEEaVc9I8edtPBiICgiJVet6BsDebpEA==
X-Received: by 2002:a62:8344:: with SMTP id h65mr8846322pfe.85.1565928693727; 
 Thu, 15 Aug 2019 21:11:33 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id n128sm4298287pfn.46.2019.08.15.21.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 21:11:32 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: Re: [PATCH 0/4] powerpc: KASAN for 64-bit Book3S on Radix
In-Reply-To: <fe758b6c-93ec-7069-5151-a395c8666844@c-s.fr>
References: <20190806233827.16454-1-dja@axtens.net>
 <fe758b6c-93ec-7069-5151-a395c8666844@c-s.fr>
Date: Fri, 16 Aug 2019 14:11:28 +1000
Message-ID: <87lfvtg367.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Le 07/08/2019 =C3=A0 01:38, Daniel Axtens a =C3=A9crit=C2=A0:
>> Building on the work of Christophe, Aneesh and Balbir, I've ported
>> KASAN to 64-bit Book3S kernels running on the Radix MMU.
>>=20
>> It builds on top Christophe's work on 32bit. It also builds on my
>> generic KASAN_VMALLOC series, available at:
>> https://patchwork.kernel.org/project/linux-mm/list/?series=3D153209
>
> Would be good to send that one to the powerpc list as well.
>

Done for v4.

>>=20
>> This provides full inline instrumentation on radix, but does require
>> that you be able to specify the amount of memory on the system at
>> compile time. More details in patch 4.
>>=20
>> Notable changes from the RFC:
>>=20
>>   - I've dropped Book3E 64-bit for now.
>>=20
>>   - Now instead of hacking into the KASAN core to disable module
>>     allocations, we use KASAN_VMALLOC.
>>=20
>>   - More testing, including on real hardware. This revealed that
>>     discontiguous memory is a bit of a headache, at the moment we
>>     must disable memory not contiguous from 0.
>>=20=20=20=20=20
>>   - Update to deal with kasan bitops instrumentation that landed
>>     between RFC and now.
>
> This is rather independant and also applies to PPC32. Could it be a=20
> separate series that Michael could apply earlier ?
>

Will do this and address your feedback on the rest of the series later.

Regards,
Daniel

> Christophe
>
>>=20
>>   - Documentation!
>>=20
>>   - Various cleanups and tweaks.
>>=20
>> I am getting occasional problems on boot of real hardware where it
>> seems vmalloc space mappings don't get installed in time. (We get a
>> BUG that memory is not accessible, but by the time we hit xmon the
>> memory then is accessible!) It happens once every few boots. I haven't
>> yet been able to figure out what is happening and why. I'm going to
>> look in to it, but I think the patches are in good enough shape to
>> review while I work on it.
>>=20
>> Regards,
>> Daniel
>>=20
>> Daniel Axtens (4):
>>    kasan: allow arches to provide their own early shadow setup
>>    kasan: support instrumented bitops with generic non-atomic bitops
>>    powerpc: support KASAN instrumentation of bitops
>>    powerpc: Book3S 64-bit "heavyweight" KASAN support
>>=20
>>   Documentation/dev-tools/kasan.rst            |   7 +-
>>   Documentation/powerpc/kasan.txt              | 111 ++++++++++++++
>>   arch/powerpc/Kconfig                         |   4 +
>>   arch/powerpc/Kconfig.debug                   |  21 +++
>>   arch/powerpc/Makefile                        |   7 +
>>   arch/powerpc/include/asm/bitops.h            |  25 ++--
>>   arch/powerpc/include/asm/book3s/64/radix.h   |   5 +
>>   arch/powerpc/include/asm/kasan.h             |  35 ++++-
>>   arch/powerpc/kernel/process.c                |   8 ++
>>   arch/powerpc/kernel/prom.c                   |  57 +++++++-
>>   arch/powerpc/mm/kasan/Makefile               |   1 +
>>   arch/powerpc/mm/kasan/kasan_init_book3s_64.c |  76 ++++++++++
>>   include/asm-generic/bitops-instrumented.h    | 144 ++++++++++---------
>>   include/linux/kasan.h                        |   2 +
>>   lib/Kconfig.kasan                            |   3 +
>>   mm/kasan/init.c                              |  10 ++
>>   16 files changed, 431 insertions(+), 85 deletions(-)
>>   create mode 100644 Documentation/powerpc/kasan.txt
>>   create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3s_64.c
>>=20

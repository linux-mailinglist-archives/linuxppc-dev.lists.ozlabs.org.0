Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66F275F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 08:19:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458fVC4p49zDqX1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 16:19:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="CVE170U4"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458fT04ndkzDqCb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 16:18:28 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id z26so2648383pfg.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 23:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=R2DcKDY8hNYt3eHiRg3vn/4L/iz0wQN/kPiNKVfWds4=;
 b=CVE170U4xMbO/w7cA7KC0/euQNYTd1c7+lLxedTjKkmfVv1znbxH93xNe25Yb35ypD
 3HMQB9HAtslOZa4CUGEHzLB6+SyhIJRaNa0AaVZT45JaCsHoP1aMjJQeoQ4OkGCWV5+X
 0JASCniFEqJl4I8I4GUn+oCOPB6ZjqnjfBu5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=R2DcKDY8hNYt3eHiRg3vn/4L/iz0wQN/kPiNKVfWds4=;
 b=R06QDxoILHHkx93ZYc4+D46PZsc/VQXXAZ+KDAFF6hCKTzlvZkZlgTM3qjuqWFGBB+
 wdv9PqSj9NDGC+tQriIvJWGd27llxUQC876sZb+RNb7oWxuZfxcuG8eAt+jXIUS5P6sd
 8YwCntYqFZeyMd7xXNYeJt2lx8F+lPPWTsBfePbkDHcBKMzvdyUurQnMWVO/qFZ+Xy5d
 zZ/UT+jKNlJxLv9oJ6/SghMv1DGdUzRRdCb9eBh5isGwQJttDITvrfTtSUuh1hSBzZxY
 gfJ61IAZGK/C0p83WnIZjA616vGPteHRnx9c8DTZlUJNg8ZJO7NsfY+t9EIoiisB1vlL
 OQ9A==
X-Gm-Message-State: APjAAAU05rQfrf6u/kJt4G+khnqGvOKq93twieCs5lfgyzBzyN/19dOo
 Ji+0T+V2OcD8b8GiWqijUsVWrg==
X-Google-Smtp-Source: APXvYqxs3SYhudtRDiSCa4bTmgHLpb6SLa1gLx4fD2NK+/73BnnhCrhMqbKZ0v37NeiIa2sJvnvVMQ==
X-Received: by 2002:a65:5647:: with SMTP id m7mr94371900pgs.348.1558592305053; 
 Wed, 22 May 2019 23:18:25 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id 4sm9920517pfj.111.2019.05.22.23.18.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 23:18:24 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: Re: [RFC PATCH 0/7] powerpc: KASAN for 64-bit 3s radix
In-Reply-To: <584b6b5b-7051-e2de-ca4e-a686c5491aad@c-s.fr>
References: <20190523052120.18459-1-dja@axtens.net>
 <584b6b5b-7051-e2de-ca4e-a686c5491aad@c-s.fr>
Date: Thu, 23 May 2019 16:18:20 +1000
Message-ID: <87k1ehzob7.fsf@dja-thinkpad.axtens.net>
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

> Hi Daniel,
>
> Le 23/05/2019 =C3=A0 07:21, Daniel Axtens a =C3=A9crit=C2=A0:
>> Building on the work of Christophe, Aneesh and Balbir, I've ported
>> KASAN to Book3S radix.
>>=20
>> It builds on top Christophe's work on 32bit, and includes my work for
>> 64-bit Book3E (3S doesn't really depend on 3E, but it was handy to
>> have around when developing and debugging).
>>=20
>> This provides full inline instrumentation on radix, but does require
>> that you be able to specify the amount of memory on the system at
>> compile time. More details in patch 7.
>>=20
>> Regards,
>> Daniel
>>=20
>> Daniel Axtens (7):
>>    kasan: do not open-code addr_has_shadow
>>    kasan: allow architectures to manage the memory-to-shadow mapping
>>    kasan: allow architectures to provide an outline readiness check
>>    powerpc: KASAN for 64bit Book3E
>
> I see you are still hacking the core part of KASAN.
>
> Did you have a look at my RFC patch=20
> (https://patchwork.ozlabs.org/patch/1068260/) which demonstrate that=20
> full KASAN can be implemented on book3E/64 without those hacks ?

I haven't gone back and looked at the book3e patches as I've just been
working on the 3s stuff. I will have a look at that for the next version
for sure. I just wanted to get the 3s stuff out into the world sooner
rather than later! I don't think 3s uses those hacks so we can probably
drop them entirely.

Regards,
Daniel

>
> Christophe
>
>>    kasan: allow arches to provide their own early shadow setup
>>    kasan: allow arches to hook into global registration
>>    powerpc: Book3S 64-bit "heavyweight" KASAN support
>>=20
>>   arch/powerpc/Kconfig                         |   2 +
>>   arch/powerpc/Kconfig.debug                   |  17 ++-
>>   arch/powerpc/Makefile                        |   7 ++
>>   arch/powerpc/include/asm/kasan.h             | 116 +++++++++++++++++++
>>   arch/powerpc/kernel/prom.c                   |  40 +++++++
>>   arch/powerpc/mm/kasan/Makefile               |   2 +
>>   arch/powerpc/mm/kasan/kasan_init_book3e_64.c |  50 ++++++++
>>   arch/powerpc/mm/kasan/kasan_init_book3s_64.c |  67 +++++++++++
>>   arch/powerpc/mm/nohash/Makefile              |   5 +
>>   include/linux/kasan.h                        |  13 +++
>>   mm/kasan/generic.c                           |   9 +-
>>   mm/kasan/generic_report.c                    |   2 +-
>>   mm/kasan/init.c                              |  10 ++
>>   mm/kasan/kasan.h                             |   6 +-
>>   mm/kasan/report.c                            |   6 +-
>>   mm/kasan/tags.c                              |   3 +-
>>   16 files changed, 345 insertions(+), 10 deletions(-)
>>   create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3e_64.c
>>   create mode 100644 arch/powerpc/mm/kasan/kasan_init_book3s_64.c
>>=20

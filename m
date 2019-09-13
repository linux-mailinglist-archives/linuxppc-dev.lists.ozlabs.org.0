Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2427EB219A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 16:07:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VHWs10dszF5DC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 00:07:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="UFkVQVLL"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VHRT63pQzF5hS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 00:03:32 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id c17so7558798pgg.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vpmitwkoehCvB7dqkSmwhbgYzpwlvWcY38/mwAHllec=;
 b=UFkVQVLLfYMzvetJ9zD6dYwDftLzvnJhg/6r+xH/MrR9sI2bRT7iGFyIhw4skj/Gtq
 UI1p4nIlx32+Z1PZtASeVFd3Vsn/K1RzYxd/PZuKKm7EGf7wTlG+IMIOGibcnvyB0i6Q
 DIAW6+t7xAbx6wgjAvl6jSkThhnm4MujFOlbQWIfW/d3kKhajUXYHbR8x7iMYOiRGdrM
 L8lYFSC8Cki2eJzWIF6bvbPAtww5Y4eovljDt1Qtf8CEgvoP48YFmUWXDnDx+D4j+WRI
 wwaY4bGh67EiNA6rIdMrSWvqWgytLTtVff6BAMuFS9k+n/yd6D0ah1fjhqKcvs0bvQZf
 V/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=vpmitwkoehCvB7dqkSmwhbgYzpwlvWcY38/mwAHllec=;
 b=CrMBhJZOcIRLQZBg14akLSndVl3WDLqpglID+X9HwkJMmkEvH6c9o7oKBEUkMxsjbR
 BiwGv8njMuT8UfaTzQermG6jNKQKx5qvBSCgxSnSJT1ZiRW/i36B34+zvYKD0hxS1rCP
 JFvGq0e7+qHv5qZY5CYAFhdtQjmfNDes7h8NkFYBMqQmE21bvYd5/9XXkqKAHZQcJbPU
 ZpJLseH44AqL1XopzjAYlWAHhrdJp4ZZBvAC6zNHR1ZLN6ilAermhvhB5ZEF0Ae7RX4u
 ZFhrRcRTFsD55JstQtnSFenKQ6xbH8HuoJvEJD0FgjyWRq8TLSyNJJoYXhBhuCHKSq2Z
 kY9w==
X-Gm-Message-State: APjAAAVe6gYcwKkEabox+/W+nOKyypnb0x+eR83a988dEF+YYjggKnVX
 p6MTHiGFCj6omGIMjIToD3QbeQ==
X-Google-Smtp-Source: APXvYqz9Ak5zvFaLOBaz8kX/Gcf8o6jJP3aS6fv6pGphH4og6+EVm3Ul8XrvDMoTLaNK0KctWpfX3w==
X-Received: by 2002:a65:6901:: with SMTP id s1mr6335459pgq.338.1568383410623; 
 Fri, 13 Sep 2019 07:03:30 -0700 (PDT)
Received: from localhost ([49.207.57.15])
 by smtp.gmail.com with ESMTPSA id l72sm4751241pjb.7.2019.09.13.07.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 07:03:29 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 4/8] powerpc/vdso32: inline __get_datapage()
In-Reply-To: <559296a2-37f6-dc83-7f60-07567637a9a8@c-s.fr>
References: <cover.1566491310.git.christophe.leroy@c-s.fr>
 <194fb7bc973ef2ce43016c97dd32f2b2dcbae4e7.1566491310.git.christophe.leroy@c-s.fr>
 <87h864iiq9.fsf@santosiv.in.ibm.com>
 <a95c4a58-bc59-3e75-46db-414f6d0f1412@c-s.fr>
 <87blvonwzz.fsf@santosiv.in.ibm.com>
 <559296a2-37f6-dc83-7f60-07567637a9a8@c-s.fr>
Date: Fri, 13 Sep 2019 19:33:27 +0530
Message-ID: <875zlwnvio.fsf@santosiv.in.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Le 13/09/2019 =C3=A0 15:31, Santosh Sivaraj a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>=20
>>> Hi Santosh,
>>>
>>> Le 26/08/2019 =C3=A0 07:44, Santosh Sivaraj a =C3=A9crit=C2=A0:
>>>> Hi Christophe,
>>>>
>>>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>>>
>>>>> __get_datapage() is only a few instructions to retrieve the
>>>>> address of the page where the kernel stores data to the VDSO.
>>>>>
>>>>> By inlining this function into its users, a bl/blr pair and
>>>>> a mflr/mtlr pair is avoided, plus a few reg moves.
>>>>>
>>>>> The improvement is noticeable (about 55 nsec/call on an 8xx)
>>>>>
>>>>> vdsotest before the patch:
>>>>> gettimeofday:    vdso: 731 nsec/call
>>>>> clock-gettime-realtime-coarse:    vdso: 668 nsec/call
>>>>> clock-gettime-monotonic-coarse:    vdso: 745 nsec/call
>>>>>
>>>>> vdsotest after the patch:
>>>>> gettimeofday:    vdso: 677 nsec/call
>>>>> clock-gettime-realtime-coarse:    vdso: 613 nsec/call
>>>>> clock-gettime-monotonic-coarse:    vdso: 690 nsec/call
>>>>>
>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>>> ---
>>>>>    arch/powerpc/kernel/vdso32/cacheflush.S   | 10 +++++-----
>>>>>    arch/powerpc/kernel/vdso32/datapage.S     | 29 ++++---------------=
----------
>>>>>    arch/powerpc/kernel/vdso32/datapage.h     | 11 +++++++++++
>>>>>    arch/powerpc/kernel/vdso32/gettimeofday.S | 13 ++++++-------
>>>>>    4 files changed, 26 insertions(+), 37 deletions(-)
>>>>>    create mode 100644 arch/powerpc/kernel/vdso32/datapage.h
>>>>
>>>> The datapage.h file should ideally be moved under include/asm, then we=
 can use
>>>> the same for powerpc64 too.
>>>
>>> I have a more ambitious project indeed.
>>>
>>> Most of the VDSO code is duplicated between vdso32 and vdso64. I'm
>>> aiming at merging everything into a single source code.
>>>
>>> This means we would have to generate vdso32.so and vdso64.so out of the
>>> same source files. Any idea on how to do that ? I'm not too good at
>>> creating Makefiles. I guess we would have everything in
>>> arch/powerpc/kernel/vdso/ and would have to build the objects twice,
>>> once in arch/powerpc/kernel/vdso32/ and once in arch/powerpc/kernel/vds=
o64/
>>=20
>> Should we need to build the objects twice? For 64 bit config it is going=
 to be
>> a 64 bit build else a 32 bit build. It should suffice to get the single =
source
>> code compile for both, maybe with macros or (!)CONFIG_PPC64 conditional
>> compilation. Am I missing something when you say build twice?
>>=20
>
> IIUC, on PPC64 we build vdso64 for 64bits user apps and vdso32 for=20
> 32bits user apps.
>
> In arch/powerpc/kernel/Makefile, you have:
>
> obj-$(CONFIG_VDSO32)		+=3D vdso32/
> obj-$(CONFIG_PPC64)		+=3D vdso64/
>
> And in arch/powerpc/platforms/Kconfig.cputype, you have:
>
> config VDSO32
> 	def_bool y
> 	depends on PPC32 || CPU_BIG_ENDIAN
> 	help
> 	  This symbol controls whether we build the 32-bit VDSO. We obviously
> 	  want to do that if we're building a 32-bit kernel. If we're building
> 	  a 64-bit kernel then we only want a 32-bit VDSO if we're building for
> 	  big endian. That is because the only little endian configuration we
> 	  support is ppc64le which is 64-bit only.
>

I didn't know we build 32 bit vdso for 64 bit big endians. But I don't think
its difficult to do it, might be a bit tricky. We can have two targets from
the same source.

SRC =3D vdso/*.c
OBJS_32 =3D $(SRC:.c=3Dvdso32/.o)
OBJS_64 =3D $(SRC:.c=3Dvdso64/.o)

Something like this would work. Of course, this is out of memory, might hav=
e to
do something slightly different for the Makefiles in kernel.

Thanks,
Santosh

>
>
>
> Christophe

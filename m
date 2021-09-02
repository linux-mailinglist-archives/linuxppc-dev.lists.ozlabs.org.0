Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 409363FE7F9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 05:28:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0RFn5Ksbz2yY0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 13:27:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WuJ6Y60V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WuJ6Y60V; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0RF60dvbz2xfH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 13:27:21 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id bg1so312325plb.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 20:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6QD7KcqHqWk+4BIQfPfj1iaDtoIE4Sgeo7R8ZXZLjDs=;
 b=WuJ6Y60VGfFaGPaXATN60HaoSwBU+F6GP6ygzG2L3zVy5cQwuTdI2ulerMO9axuADS
 0CiHAaJ3DS2NMGSAAWdc2uPGcvrn4JS0v3TdowfIhkDuwSAdjzzxEYPc06GpNbppOBEl
 D4Tuntk3E7roTSGQYXL5g/ZFzuzi+mptD7hM4vtqWRdpe/4PYc5NKa79NI1GzXmTbBMg
 zRU8gv7VSLBkzdBO2OmX8OAUI4cM9LicpuAHPBBfZ1LC8t89cNHQ0dWL9thXiUV1pLE7
 TssKMzqGKVjkH+oOigYMdueXJgETPI37aJ8Tzglmc4gEovU6dwAxTozfAc5FBqaXAIiv
 pXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6QD7KcqHqWk+4BIQfPfj1iaDtoIE4Sgeo7R8ZXZLjDs=;
 b=Q70hwPeoN1tJRwVWiZE/xJp7PZ6/5uQuJew8Y2TBNNJbhEThaM+R5JGfVSz/pxb+16
 lp9urHvHKdAlxYgGnzTtksKYTu29pVwrbjQcFPRruHTrfXAJuQ13Dn/TPrq+dwZHjlRt
 rg5R84b9wdnC3WH4MAHO3T8Q4T8FG46/he4yRzQjkv8Za1+rf2VL092CPJqSgbGc9TKO
 ae7jLX2uDDdq+z2urFqVbeNVzqQSrH5oAXwRhO7wzrlVcKgZ+8iqqJWBL0kjrXoO+oB1
 DjRKifN9x+5pHfaogzr7ZsPqpRzEmUG8Lne3oCalyZYlzdnQ+CtPKvPaENZK5UR1waMH
 Twqw==
X-Gm-Message-State: AOAM530N7eTqMAxo3s0lZuncal4MoIifvZyIkkzA8nvnZukJATwROPZF
 +ETYFc8JTYPkY2uOz6AO0wU=
X-Google-Smtp-Source: ABdhPJxaDXuztHzx8rrM3TI5P+LdaLepeAcVjX/BVqP0TLQrhGURSsuGiLjUk5Wdo21camVz+Ee3CQ==
X-Received: by 2002:a17:90a:fb90:: with SMTP id
 cp16mr1387259pjb.140.1630553236095; 
 Wed, 01 Sep 2021 20:27:16 -0700 (PDT)
Received: from localhost (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id h8sm363637pfr.219.2021.09.01.20.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 20:27:15 -0700 (PDT)
Date: Thu, 02 Sep 2021 13:27:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 2/2] selftests/powerpc: Add scv versions of the basic
 TM syscall tests
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210901165418.1412891-1-npiggin@gmail.com>
 <20210901165418.1412891-2-npiggin@gmail.com>
 <f99fa6c6-cebe-c261-0971-0f485cbcea2d@csgroup.eu>
In-Reply-To: <f99fa6c6-cebe-c261-0971-0f485cbcea2d@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1630553190.fkqnk0by89.astroid@bobo.none>
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
Cc: Eirik Fuller <efuller@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of September 2, 2021 3:15 am:
>=20
>=20
> Le 01/09/2021 =C3=A0 18:54, Nicholas Piggin a =C3=A9crit=C2=A0:
>> The basic TM vs syscall test code hard codes an sc instruction for the
>> system call, which fails to cover scv even when the userspace libc has
>> support for it.
>>=20
>> Duplicate the tests with hard coded scv variants so both are tested
>> when possible.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   .../selftests/powerpc/tm/tm-syscall-asm.S     | 46 +++++++++++++++++++
>>   .../testing/selftests/powerpc/tm/tm-syscall.c | 36 ++++++++++++---
>>   2 files changed, 75 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S b/tools=
/testing/selftests/powerpc/tm/tm-syscall-asm.S
>> index bd1ca25febe4..849316831e6a 100644
>> --- a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
>> +++ b/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
>> @@ -2,6 +2,10 @@
>>   #include <ppc-asm.h>
>>   #include <asm/unistd.h>
>>  =20
>> +/* ppc-asm.h does not define r0 or r1 */
>> +#define r0 0
>> +#define r1 1
>> +
>=20
> See https://github.com/gcc-mirror/gcc/blob/master/gcc/config/rs6000/ppc-a=
sm.h
>=20
> It doesn't not define r1 but it defines r0.

Oops, I'll fix that.

> And it defines 'sp' as register 1.

Does userspace code typically use that? Kernel code AFAIKS does not.

Thanks,
Nick

Return-Path: <linuxppc-dev+bounces-802-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F9D965F79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 12:41:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwF7L0PQkz305T;
	Fri, 30 Aug 2024 20:41:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725014478;
	cv=none; b=WO4SJggxj7GZKxJ1iv0Y2M89LBFqW1kd+hxhjs0du94wYKq4RTDoVS9fBtIqtXzUGGMR5QrOrAFiMRCGYtMwA6+LXdtioriRsbmvx2k+88UPnUNdsbGJKEwgZ6uis8QzraQsr3mDhsOFORNtQx7JvdDxlPS9p+kwCOYzxvwKsOJko/olE1YDo7zjlns68onV5HUfTSQgPGQtEvO9mK/mbByh7wVGMJ5wFFYBL4efWJ/JJ+21DpSU6NlJsw9+TUrjkBtotbBfIqJ+7FbnzbNZ7vGpmSMCuOx5gFv/8fqyp9vSGGzxiJrkQNqSn5qd7KJnsWdM+RCw3UQ6C+tiqHSYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725014478; c=relaxed/relaxed;
	bh=ETYDxzy/kgkq4rTYhxS5tQqVeU9vFRvLOW/VLYWSa/g=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=Ck7185xmxSLrM9JC6C0143WXFcUWP7F+jgLPUM1Hee7ZLUbM4rsuuhUdclQw0e6cnth8ExaK9I0rR8F1005kS7B9YARvUL5Z/2lDvVEBSSBUeBjs3pZSlEn5XFdaPcOxdgqtMsvdkhGcHLcHbxSqZpCj0ftAuDuCqlrYKZdewgnCyl2QQT1EKPM7RQ8S2+K5rQBtwhbeyQ7TklbF4aHLXwQczhwyPhmoMDxI80gmYQd/WBsCAii8TDCX4nlfgmT0GnAvZ05HrinIIF+ZD1cr1Xl2U2jiW3/iZvy4MTI/WjUV7CE0c2ofzHmLoB/RrmRrUdynq3COi8pX8rYcD3+cFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CD7pTo56; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CD7pTo56;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwF7K4FKlz302K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 20:41:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725014476;
	bh=ETYDxzy/kgkq4rTYhxS5tQqVeU9vFRvLOW/VLYWSa/g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CD7pTo560TpYybwhWX2nEienESXyXTd1IstUrqcvD4VxUz4j0U8c63/5EpSLJn9gr
	 Jy+o5fHnEM/RhAjIqBLw7Ai72k5p4h2YZStDZvQWY/BzolO9Oq+vGYKLirY0ygFzOg
	 4YKV9BWCwaJhy0bl834M2fbGPXgdB0RBatHbqhEHEeQuUVAZWNupzL0mC5PENFpZpL
	 Jdh+pnn1Vs293ZATSXDdzUKWPoCwq80S0zyLBsBf4Wd4Cc6LNJ0J4Uq7HLaAmYyfkp
	 7a17S8cuVjIovNUvcXX3Fzm5Iz0ck7t9oNU/vhV7558YV1sbbbjn71QbBVmhatOTAs
	 wBbh8cPOMkAwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WwF7H4mf1z4wyR;
	Fri, 30 Aug 2024 20:41:14 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: cuigaosheng <cuigaosheng1@huawei.com>, LEROY Christophe
 <christophe.leroy2@cs-soprasteria.com>, "npiggin@gmail.com"
 <npiggin@gmail.com>, "naveen@kernel.org" <naveen@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "david@redhat.com" <david@redhat.com>, "Liam.Howlett@oracle.com"
 <Liam.Howlett@oracle.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "bgray@linux.ibm.com" <bgray@linux.ibm.com>, "joel@jms.id.au"
 <joel@jms.id.au>, "bhelgaas@google.com" <bhelgaas@google.com>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH -next 1/4] powerpc: Remove obsoleted declaration for
 _get_SP
In-Reply-To: <48668764-8a8f-98f8-909a-8406207499d7@huawei.com>
References: <20240822130609.786431-1-cuigaosheng1@huawei.com>
 <20240822130609.786431-2-cuigaosheng1@huawei.com>
 <1c4f7f77-ad18-4956-b794-98b452d0780c@cs-soprasteria.com>
 <48668764-8a8f-98f8-909a-8406207499d7@huawei.com>
Date: Fri, 30 Aug 2024 20:41:13 +1000
Message-ID: <87h6b2e1iu.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

cuigaosheng <cuigaosheng1@huawei.com> writes:
> On 2024/8/22 22:16, LEROY Christophe wrote:
>>
>> Le 22/08/2024 =C3=A0 15:06, Gaosheng Cui a =C3=A9crit=C2=A0:
>>> [Vous ne recevez pas souvent de courriers de cuigaosheng1@huawei.com. D=
=C3=A9couvrez pourquoi ceci est important =C3=A0 https://aka.ms/LearnAboutS=
enderIdentification ]
>>>
>>> The _get_SP() have been removed since
>>> commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc"),
>>> and now it is useless, so remove it.
>> Not sure that commit is relevant since it relates to arch/ppc/ not
>> arch/powerpc/
>>
>> For arch/powerpc/ I think it is commit f4db196717c6 ("[POWERPC] Remove
>> _get_SP")
>
> In commit 1da177e4c3f4, linux implemented the _get_SP function in misc.S
> and declared and use it in arch/ppc/kernel/process.c, the declaration
> of _get_SP in arch/powerpc/kernel/process.c was introduced in commit
> 14cf11af6cf608, but at this time arch/powerpc/kernel/misc_32.S has not
> been introduced yet=EF=BC=8Cso I think the declaration belongs to _get_SP=
 in the
> misc.S=EF=BC=8Cit have been removed since commit 917f0af9e5a9.

It's true that in

  14cf11af6cf6 ("powerpc: Merge enough to start building in arch/powerpc.")

there was no _get_SP() in arch/powerpc, and the build used the one in
arch/ppc, and so at that point the prototype in
arch/powerpc/kernel/process.c was for the implementation in arch/ppc.

But in commit

  e7e2d2da2638 ("powerpc: Don't compile in arch/ppc/kernel for 32-bit ARCH=
=3Dpowerpc")

we stopped building arch/ppc/kernel as part of the powerpc build.

So from then on the prototype was for the implementation in
arch/powerpc. If we check out e7e2d2da2638 and grep in arch/powerpc for _ge=
t_SP:

  $ git grep -w _get_SP arch/powerpc/ include/asm-powerpc/
  arch/powerpc/kernel/misc_32.S:_GLOBAL(_get_SP)
  arch/powerpc/kernel/process.c:extern unsigned long _get_SP(void);

So it was indeed f4db196717c6 ("[POWERPC] Remove _get_SP") that removed
the implementation this prototype was referring to.

I'll update the change log, no need to send a v2.

cheers


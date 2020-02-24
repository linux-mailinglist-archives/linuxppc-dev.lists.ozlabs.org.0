Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E63316A468
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 11:55:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QzVq2jNZzDqRy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 21:55:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QzT41F7RzDqJk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 21:54:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=sBs1S4Fp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48QzT36SWzz9sP7;
 Mon, 24 Feb 2020 21:53:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582541640;
 bh=k0BqyixTJoNetYX9suYhia4s7kCRC36DzGPHDhr3mo4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=sBs1S4FpxMEXaNkDN3F4/M+KmkKLxfXttli0RCvqhL7K0iXzNvYnQOLL8hpByXajJ
 elAusZETQUdwRNVzw/k2kVnAsF3uY5Sezbek1ohH3yEgcD5fSzgQHMRPxzpx1itG9W
 0WnCODRM2k/kHQs/waNxhsn/FBVaFepVm+oZB4561D4dI5IaArWHx3wMynGgdSDSrR
 tF8MtVXpq8amG8WM9LJG4w9E+FeQiNHYU8HJp+gZuhXs6BFYL+hYRIfqnjDwJ+2dFi
 dQx4daUIcze42+VBgCFd0n4iIHcjLo0cCH1J5fc0WDsJuihqZdLoIbBtveQJ8QOQsU
 Ali8Himjep26Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Neuling <mikey@neuling.org>
Subject: Re: [RFC PATCH v2 00/12] Reduce ifdef mess in ptrace
In-Reply-To: <5b5d8f61-c9aa-1afd-6001-44a17f00c1a6@c-s.fr>
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
 <f62b0f67-c418-3734-0b07-65aea7537a78@c-s.fr>
 <7b86733f81c7e15d81ab14b98c8998011ed54880.camel@neuling.org>
 <5b5d8f61-c9aa-1afd-6001-44a17f00c1a6@c-s.fr>
Date: Mon, 24 Feb 2020 21:54:00 +1100
Message-ID: <8736b01cjb.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 24/02/2020 =C3=A0 03:15, Michael Neuling a =C3=A9crit=C2=A0:
>> Christophe,
>>> Le 28/06/2019 =C3=A0 17:47, Christophe Leroy a =C3=A9crit :
>>>> The purpose of this series is to reduce the amount of #ifdefs
>>>> in ptrace.c
>>>
>>> Any feedback on this series which aims at fixing the issue you opened at
>>> https://github.com/linuxppc/issues/issues/128 ?
>>=20
>> Yeah, sorry my bad. You did all the hard work and I ignored it.
>>=20
>> I like the approach and is a long the lines I was thinking. Putting it i=
n a
>> ptrace subdir, splitting out adv_debug_regs, TM, SPE, Alitivec, VSX.
>> ppc_gethwdinfo() looks a lot nicer now too (that was some of the worst o=
f it).
>>=20
>> I've not gone through it with a fine tooth comb though. There is (rightl=
y) a lot
>> of code moved around which could have introduced some issues.
>>=20
>> It applies on v5.2 but are you planning on updating it to a newer base?
>>=20
>
> As you noticed there is a lot of code moved around, and rebasing=20
> produces a lot of conflicts. So I didn't want to spend hours to rebase=20
> and rebase without being sure it was the right approach.
>
> Now that I got a positive feedback I'll consider rebasing it, hopping=20
> that Michael will pick it up.

I would love to.

cheers

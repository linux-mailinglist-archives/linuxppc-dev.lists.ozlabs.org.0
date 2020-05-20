Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0251DA900
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 06:17:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rfbp60g3zDqKj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 14:17:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RfZB4cxZzDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 14:16:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=L19GfukT; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49RfZ93pSWz9sT4;
 Wed, 20 May 2020 14:16:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589948162;
 bh=43zZG5GAwIVehgLEssQ+j84EkvSON+rpesmKhqQ5ZBI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=L19GfukTFVTRxTuP7BONTFAnfr8Q1IhmsJjhqh4xl5OAukY31cB9C0qyu1LMOA76V
 u5kN7jZHy2IWIBWSJNa+fLCn5NpaRcq6wOrstAMxba42zN7ttqOC2ywUZHrvD1HvR7
 wodEEB2liHBhjoTE2zta5r07dizvwcMSdVCsTL/D1D1OGqU+G/juyEkAfluAa/+klx
 +O3UWa17WeJQtA+mc3FHaHQPH3psNAa0vSX0/NIMZWb/ZbDOHWhMKIqbsM0VejMaWN
 QJTDesBZHcsZZINY05EpMf3FCcRMLl+0UdOPvADba0Ito3V0HLMs4RBsqEWIVj80x4
 I6SE9PMWkvjCA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v8 12/30] powerpc: Use a function for reading instructions
In-Reply-To: <08df818c-b602-1a20-7eb4-a3e1f78188c3@csgroup.eu>
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-13-jniethe5@gmail.com>
 <a7005edf-cdda-4aec-b7b0-fd9f45776147@csgroup.eu>
 <CACzsE9qBXBsv0s25DWugjWUaTUZfYpHyONW5ryE4dnLKP5P7cA@mail.gmail.com>
 <877dx84liy.fsf@mpe.ellerman.id.au>
 <08df818c-b602-1a20-7eb4-a3e1f78188c3@csgroup.eu>
Date: Wed, 20 May 2020 14:16:23 +1000
Message-ID: <87imgr8cmg.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 19/05/2020 =C3=A0 06:05, Michael Ellerman a =C3=A9crit=C2=A0:
>> Jordan Niethe <jniethe5@gmail.com> writes:
>>> On Sun, May 17, 2020 at 4:39 AM Christophe Leroy
>>> <christophe.leroy@csgroup.eu> wrote:
>>>>
>>>> Le 06/05/2020 =C3=A0 05:40, Jordan Niethe a =C3=A9crit :
>>>>> Prefixed instructions will mean there are instructions of different
>>>>> length. As a result dereferencing a pointer to an instruction will not
>>>>> necessarily give the desired result. Introduce a function for reading
>>>>> instructions from memory into the instruction data type.
>>>>
>>>> Shouldn't this function be used in mmu_patch_addis() in mm/nohash/8xx.=
c ?
>>=20
>>> Yes, that would be a good idea.
>>=20
>>> mpe here is a fix, along with one I'll
>>> post for [PATCH v8 11/30] powerpc: Use a datatype for instructions.
>>=20
>> I didn't fold this in because I'd prefer one of you send me a patch on
>> top of the series that converts that code to use the new type.
>>=20
>> That way it can be tested separately from this big series.
>>=20
>
> All this code is going away with the series implementing the use of=20
> hugepages for kernel mappings on 8xx=20
> (https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D176094)=
=20
> that I hope will go in 5.8, so there is no point in sending a patch to=20
> change that I guess.

OK.

> Is there anything special I need to do to secure the merging of that=20
> series in 5.8 ?

Review it for me :P

As long as it is only touching 8xx I'm happy to defer to you. So I guess
any parts that affect other platforms will be where I need to spend more
effort reviewing it.

I'll try and get it into my test branch today and get some testing done
on it.

cheers

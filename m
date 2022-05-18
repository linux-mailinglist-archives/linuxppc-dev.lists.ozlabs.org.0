Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 056A652BB46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 15:01:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Clw6yF0z3c9x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 23:01:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cw4E8HBS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3ClH6PX0z3bqk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 23:00:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cw4E8HBS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L3ClD2Z4qz4xXk;
 Wed, 18 May 2022 23:00:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652878824;
 bh=8HGYHJPOmY1dIKPSQacOtCK4s9CAWP95ivD2NBejQPM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cw4E8HBSr95cBHPK7ZOUBnc5sAKWS6+aTe9yKvjHS2T9aSI55aOoUeJpWZCJzzCiW
 dWqfRJGNK9z3bKJcJtMQrdznCUxRJeDr7HySp1nS57PTqkgoevjLuq+sBgbp5uQUNO
 IrLOY7017oapY48nVynMlSxckU6x/nqsjXUluzFe4N3GeG/StisLvVKeagV42o39N2
 LxUu762iZteZGfGoOCggm/ETSSO9spoGwxEnjrcrdWC/teodjZ+LSjQYZFp/HKj7uj
 3sm83a3U8X5FCHsYxN1ArtqfS2b53aVwzazmWe3PXZodOw601yaDLYmj/enEMRmezI
 lnJAwP8Wgn3Bg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc: Add generic PAGE_SIZE config symbols
In-Reply-To: <c6cbd41c-4cef-d4d7-324a-b4c3e2498262@csgroup.eu>
References: <20220505125123.2088143-1-mpe@ellerman.id.au>
 <c6cbd41c-4cef-d4d7-324a-b4c3e2498262@csgroup.eu>
Date: Wed, 18 May 2022 23:00:20 +1000
Message-ID: <87fsl7nggr.fsf@mpe.ellerman.id.au>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 05/05/2022 =C3=A0 14:51, Michael Ellerman a =C3=A9crit=C2=A0:
>> Other arches (sh, mips, hexagon) use standard names for PAGE_SIZE
>> related config symbols.
>>=20
>> Add matching symbols for powerpc, which are enabled by default but
>> depend on our architecture specific PAGE_SIZE symbols.
>>=20
>> This allows generic/driver code to express dependencies on the PAGE_SIZE
>> without needing to refer to architecture specific config symbols.
>
> I guess next step should be to get rid of powerpc specific symbols and=20
> use generic symbols instead.
>
> We have (only) 111 occurences of it.

I thought about doing that, but it's quite a bit of churn. Maybe it's
worth it though to avoid confusion between the two symbols.

There's probably some that could be converted to IS_ENABLED() at the
same time, especially in hash_utils.c.

cheers

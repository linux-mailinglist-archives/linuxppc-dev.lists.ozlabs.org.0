Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1EE5EC5E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:22:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McMJc00Hmz3cH1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 00:22:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OYOoQ4mY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McMJ004Yvz3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 00:21:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OYOoQ4mY;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4McMHv70MPz4x3w;
	Wed, 28 Sep 2022 00:21:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664288492;
	bh=OpoI3UZ74EZlMC8jgXOW/xJUJltCEFXZMV/A+Yb3j0E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OYOoQ4mYSEeNpkAI2t/jqEVQdE/KxGdaE9pW16u97m9rddxur5dYJXcz5BWaA/aYZ
	 DiBH8HPw2deMR01ZPrcbCoR+fUxk1fgKZqerIX5a1PMrZdhRKG8JShd1TMMlfnXwIQ
	 FZGmwhFnw2IfsaPVAyNrQrzcrp5z6QTSF3kjFWATfndv7aRBDgQC/tvXCqeQe/5DvN
	 3PN71IkkGlzDbWzdiVVn7u+5C2Fe6Gv1xnlM01DwYciCJuwSujYG10c2/REj5JmXz6
	 LRn5oCkNmJLegGr3yRgNdWWlY5+3j6zegSkaKnHaUZtVF2aqiSuwGBbHr2baKVH8d8
	 2hDROe9wtIZoA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/5] powerpc/64: use 32-bit immediate for
 STACK_FRAME_REGS_MARKER
In-Reply-To: <bdd608bc-8488-ee21-656d-6ff5a8b552f0@csgroup.eu>
References: <20220926034057.2360083-1-npiggin@gmail.com>
 <20220926034057.2360083-2-npiggin@gmail.com>
 <bdd608bc-8488-ee21-656d-6ff5a8b552f0@csgroup.eu>
Date: Wed, 28 Sep 2022 00:21:25 +1000
Message-ID: <87h70szymy.fsf@mpe.ellerman.id.au>
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
Cc: Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 26/09/2022 =C3=A0 05:40, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Using a 32-bit constant for this marker allows it to be loaded with
>> two ALU instructions, like 32-bit. This avoids a TOC entry and a
>> TOC load that depends on the r2 value that has just been loaded from
>> the PACA.
>>=20
>> This changes the value for 32-bit as well, so both have the same
>> value in the low 4 bytes and 64-bit has 0xffffffff in the top bytes.
>
> The above is wrong now, isn't it ?

Yeah, I fixed it when applying.

cheers

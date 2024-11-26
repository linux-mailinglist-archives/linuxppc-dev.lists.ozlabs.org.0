Return-Path: <linuxppc-dev+bounces-3574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BFD9D9882
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 14:27:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyNfM3kFzz2ymb;
	Wed, 27 Nov 2024 00:27:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732627643;
	cv=none; b=DxCoob8djs1gkj9RH5elKZdHWqtmsuFDL7Nm5KOVYeOR6FneNqIGHRJz9UfDYjkc7MwF6IoC/+kXV2FxZrauEzymb+cPx48pPDV73eFSuu+np7FFfqj0RhxwNpNquRyGJaP6VB55bFXsFFgkmC02wvaed6Al6OBmUXkssu68d4ju5LKe1IQcrPk/SL1lxMcFC8JLKFpcIl0XzIn5D0Bs6n5IR+FFzbWYq87z1PESvLA6nwu5DXxlwDjlV0KqvkG7LTaUOXzeFwabQRJSwETB/VtWHukzXOlsvON0e3sEgMNtzty/1S46C9uU9etZNshVfW8VLFLmE0EDUSAy3MfVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732627643; c=relaxed/relaxed;
	bh=PCYjy73HuYFntkPiDGBkHEccdajNYD1R0CFtq8zFieg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XDBwQ6bSBnoy1mBS2Cw/4rN8enMP/QnwJ4lXc+5ZaIcALbp3f/NbLT6OHBlaP/ESJGGPZdVfBR0pwd8/mbLRgVv45nEDXf89XwADr46+yTI5qZc9qdhX2DzL3/ScXGFa4LX8oEjo1vSGZbGFBt9q3KkKXphZi2jOdiFeeV/SvcIIB0BQCFqS8D3MAcU1nxgy+sTmMj9A55vl1PCtCvTBtIWURNJWoqfKu4SJNA5fcG75+6UlmQw8mZYvBrbWmYqbvaqvI7dQJeF9f4QIHinrSozr4emmMX47bC67YkNA9RJ6kVxhAiU952O+968znbLnO4JOTKruF8dQfXRuc9/9bA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=aI3OJpBY; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=aI3OJpBY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyNfH0Ml3z2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 00:27:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PCYjy73HuYFntkPiDGBkHEccdajNYD1R0CFtq8zFieg=; t=1732627639; x=1733232439; 
	b=aI3OJpBYKSC9McqATQc8ugWrcEDLx7rFsDza4thPyoW2sA/+9VOEzy2LEEd2+l3/o4shASYCp9T
	bbSFoMNaHhRqH+0cRs32WIyDGbJFF0vEuZBiY90HmvLfxwwleg+rTex45vb3zzxOCMXZqh5HU4Jor
	td37COX1gcu6YoSD9MY0F8Ljv4fDmQlgnS+doPa7FZc+CGwW5bY7gbCrfMnk0CFascB3yjaki5Xba
	NP8HX8ksUJvG69N8nvjIYaLUQgG+qVsDLygfRgaei4/BOy8Hi2SxWyKStji7oi/946aoYn5MLV0Cj
	lCRlgnCjDyv2p1qhCc6NAsW/BYogzmJvUeOA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tFvau-000000046Jp-1nCv; Tue, 26 Nov 2024 14:27:08 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tFvau-00000000PFp-0rGA; Tue, 26 Nov 2024 14:27:08 +0100
Message-ID: <a981939be1ad279ef11014d93446762cdaa93823.camel@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: arnd@arndb.de, geert@linux-m68k.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Date: Tue, 26 Nov 2024 14:27:07 +0100
In-Reply-To: <87sere7jyc.fsf@mpe.ellerman.id.au>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
	 <20241121083846.3648473-1-glaubitz@physik.fu-berlin.de>
	 <87sere7jyc.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.144.78
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Tue, 2024-11-26 at 14:27 +1100, Michael Ellerman wrote:
> > > The Linux CHRP code only supports a handful of machines, all 32-bit, =
eg.
> > > IBM B50, bplan/Genesi Pegasos/Pegasos2, Total Impact briQ, and possib=
ly
> > > some from Motorola? No Apple machines should be affected.
> >=20
> > I have a Pegasos 2 and I planned on keeping it.
>=20
> OK great. You're the first user we've heard from in quite a while :)

Well, as I said, you won't find the people using that hardware on the LKML
as most of these people aren't developers but just users.

> Any idea what is the latest kernel version you have run on it?

I don't remember. But I'm planning to test a current kernel in the near fut=
ure.

There is just so much other stuff on my plate, including that debian-instal=
ler
regression on all PowerPC targets introduced by a recent change.

> > Have you asked among the Amiga community whether they plan on discardin=
g
> > your hardware? I think it's always ill-fated to ask for popularity of
> > hardware on just the LKML. Most users are not on the LKML.
>=20
> I haven't because I don't really know anything about the Amiga
> community, who they are, where they hang out, etc.
>=20
> Please cross post this to any Amiga folks you know, or tell me where I
> should post it.

I will.

> We've maintained this code for over 20 years, at some point if there's
> no one in the *Linux community* who cares about it then it's hard to
> justify keeping it.

The problem is that you don't reach the whole Linux community over the
Linux PPC kernel development mailing list ;-).

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


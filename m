Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1BD6A8DC1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 01:12:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PST274wnrz3cfj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 11:12:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nCx/NlLy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PST1D3XsTz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 11:12:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nCx/NlLy;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PST185lsbz4x1R;
	Fri,  3 Mar 2023 11:11:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677802320;
	bh=y8wWNYars5Wp25KTgB4IaQUGxk80vrVSQ9DCSBUaDpQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nCx/NlLyhE7MIPjtBUMoILPKlGudC5d2X4jiywJrXt2G2IbBAq3FuwrzyeIV1XsQ/
	 NJhxQxGiIyBkyMp8QrPWxWlSps7uA0HF0VhGHR8xtsyc5kcZdN8wLecb13lRYyN5Hz
	 JvK4CU2orYG4IpG++/9+SS5Tnbgxt4LZ7o7S0eHrjAY8/NH1bGMEfge/UGx+342qiA
	 8n1Mfv5d3ZTVAJoN4lBQczBMy4E8yRwtygE/uOKh0UeJvdODbBM5s6hm+TCpqKu5ID
	 j22U/sK3TyINj7wezs+YeHg9OQFhmM2QorjVFKz4640ZVitj5YmZ1+DCSX/d+VPxM1
	 nK5PnlzmxfGRw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 5/5] of: address: Always use dma_default_coherent for
 default coherency
In-Reply-To: <B43602D1-89D4-465F-83B1-CD106E07CB29@flygoat.com>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
 <20230223113644.23356-6-jiaxun.yang@flygoat.com>
 <20230301130613.GC467@lst.de>
 <B43602D1-89D4-465F-83B1-CD106E07CB29@flygoat.com>
Date: Fri, 03 Mar 2023 11:11:56 +1100
Message-ID: <87356mlmlv.fsf@mpe.ellerman.id.au>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, robin.murphy@arm.com, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jiaxun Yang <jiaxun.yang@flygoat.com> writes:
>> 2023=E5=B9=B43=E6=9C=881=E6=97=A5 13:06=EF=BC=8CChristoph Hellwig <hch@l=
st.de> =E5=86=99=E9=81=93=EF=BC=9A
>>=20
>>> - select OF_DMA_DEFAULT_COHERENT if !NOT_COHERENT_CACHE
>>=20
>> Doesn't powerpc need to select CONFIG_ARCH_DMA_DEFAULT_COHERENT now,
>> or even better should be doing that in the patch adding that
>> symbol?
>
> If I read the code correctly for powerpc OF_DMA_DEFAULT_COHERENT is only =
selected
> with !NOT_COHERENT_CACHE, which means non-coherent dma support is disable=
d=E2=80=A6.

I think you're right, but it's not easy to understand.

powerpc's NOT_COHERENT_CACHE selects:

  select ARCH_HAS_DMA_PREP_COHERENT
  select ARCH_HAS_SYNC_DMA_FOR_DEVICE
  select ARCH_HAS_SYNC_DMA_FOR_CPU


Then in your patch 3 you do:

 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
-bool dma_default_coherent;
+bool dma_default_coherent =3D IS_ENABLED(CONFIG_ARCH_DMA_DEFAULT_COHERENT);
 #endif

So for powerpc if NOT_COHERENT_CACHE=3Dn, then none of those ARCH_HAS
symbols are defined, and so CONFIG_ARCH_DMA_DEFAULT_COHERENT is never used.

But like I said it's not very obvious, and it also seems fragile to
future changes.

So it seems it would be more future proof, and self documenting for
powerpc to just have:

        select ARCH_DMA_DEFAULT_COHERENT if !NOT_COHERENT_CACHE


cheers

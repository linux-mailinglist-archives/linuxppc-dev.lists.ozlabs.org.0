Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A2A530A06
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 10:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L68rk4G0xz3bqS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 18:00:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256 header.s=201811 header.b=WvYm8+sj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L68r62PlBz301P
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 17:59:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=WvYm8+sj; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L68r36zfjz4xD9;
 Mon, 23 May 2022 17:59:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuling.org;
 s=201811; t=1653292788;
 bh=oSt4siI/+EHjQYRD6jSfx8OQK5CsGwTEf2KDaSSQe4k=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=WvYm8+sj3ePqXoITcFrQlEzK/xRjHoEfpmv3kEj0NMBvIyN521N9PKT7ZR9MVSEJ5
 Fu2zD5XlnupKHN/VG17W/y6WCpplzAXbAr5o3Jm6Pn9NP2pFLWoFqeZf73KmMN6PYf
 7GSPuP8kgatZINK6vlQM6uqTCGoq1KdTudNkBb4ov5/2naTDGUotpI5FPbeC6bKdv8
 c4Vive/8paDvvyeFC3ht9aHpeekqtrAleBbutDo3dwIcVsX93AtH6CQEMyFwo8SYJv
 7UeMHaNEBzdlAEDyn1qwzdFtVV0Lrpc+gnmIQtU9cVLYsM9RK4QzcNb/rLmAvcVaZ3
 Pa/Rx0oXczcTw==
Received: by neuling.org (Postfix, from userid 1000)
 id D5DDC2C030C; Mon, 23 May 2022 17:59:47 +1000 (AEST)
Message-ID: <d6dca2e8db43a04f5346ad0a17acb812786c3912.camel@neuling.org>
Subject: Re: [PATCH] powerpc/microwatt: Add mmu bits to device tree
From: Michael Neuling <mikey@neuling.org>
To: Nicholas Piggin <npiggin@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 linuxppc-dev@lists.ozlabs.org
Date: Mon, 23 May 2022 17:59:47 +1000
In-Reply-To: <1653005064.mw8ywmb8ft.astroid@bobo.none>
References: <20220519125706.593532-1-joel@jms.id.au>
 <1653005064.mw8ywmb8ft.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
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
Cc: Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-05-20 at 10:06 +1000, Nicholas Piggin wrote:
> Excerpts from Joel Stanley's message of May 19, 2022 10:57 pm:
> > In commit 5402e239d09f ("powerpc/64s: Get LPID bit width from device
> > tree") the kernel tried to determine the pid and lpid bits from the
> > device tree. If they are not found, there is a fallback, but Microwatt
> > wasn't covered as has the unusual configuration of being both !HV and b=
are
> > metal.
> >=20
> > Set the values in the device tree to avoid having to add a special case=
.
> > The lpid value is the only one required, but add both for completeness.
> >=20
> > Fixes: 5402e239d09f ("powerpc/64s: Get LPID bit width from device tree"=
)
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>=20
> LGTM... does Microwatt actually need 12 lpid bits, or does it just need=
=20
> the LPID 0 partition table entry?=C2=A0

Microwatt just assumes LPID=3D0 as it doesn't actually have an LPID SPR. It=
 just
uses the first entry in the partition table.

There are some details here:

   https://github.com/antonblanchard/microwatt/commit/18120f153d138f733fa7e=
8a89c3456bb93683f96

> I wonder if you set it to 1. That's a minor nit though.

.. or even set it to 0.

Mikey

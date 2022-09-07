Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E80745B1041
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 01:13:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNJ3665T7z3c46
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 09:13:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MNiE2RDD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNJ2W2wFdz2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 09:13:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MNiE2RDD;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MNJ2T2786z4x1d;
	Thu,  8 Sep 2022 09:13:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662592387;
	bh=0bUt53x2i4pta+bAYawg+7tCz4lvzfR2m6V4eAYk5kQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MNiE2RDDH4CVTXnFyay3KC1A6QyLKXmu651m3W4NmJBr2xuhysGtP9+DXVDfN0TdC
	 0nJZyvjZjVyAK01x4e/Ltbwd84MUbg51ITnGSGsxom7tbbE2efplo7hV9ugMmxUUA2
	 mV1aQkxTBrul9FaiJXDBCIov3tYO1z2YG6H5mMkp6oBsdAWohiR3O1Rr1MolyoMH/c
	 uTRsywmFGQS1p3tlVnpRA4viIsWlFTUjK5MJy5ZX+j6oxDLoX5t82S9GuXMKqlUCv5
	 u4u1Ntj2OXsDXhPbQtkmRXNhhfgc7pAFig7BR64O0PpNpSZ/D2n/7SXheuG0nyZWCy
	 rovxz+n/hVtFw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Holger Brunck
 <holger.brunck@ch.abb.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/83xx: update kmeter1 defconfig and dts
In-Reply-To: <269be158-2451-30cc-f478-0b0453b58c3a@csgroup.eu>
References: <20191216095006.13590-1-holger.brunck@ch.abb.com>
 <269be158-2451-30cc-f478-0b0453b58c3a@csgroup.eu>
Date: Thu, 08 Sep 2022 09:13:03 +1000
Message-ID: <87y1uueq2o.fsf@mpe.ellerman.id.au>
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
Cc: Matteo Ghidoni <matteo.ghidoni@ch.abb.com>, Heiko Schocher <hs@denx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 16/12/2019 =C3=A0 10:50, Holger Brunck a =C3=A9crit=C2=A0:
>> From: Matteo Ghidoni <matteo.ghidoni@ch.abb.com>
>>=20
>> The defconfig is synchronized and the missing
>> MTD_PHYSMAP, DEVTMPFS and I2C MUX support are switched on.
>>=20
>> Additionally the I2C mux device is added to the DTS with
>> its attached temperature sensors and I2C clock frequency
>> is lowered.
>
> This patch doesn't apply.
>
> Is it still relevant ?

If so it should be split into two patches.

cheers

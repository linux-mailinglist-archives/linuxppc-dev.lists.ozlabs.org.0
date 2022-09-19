Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA385BD850
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 01:35:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWgyZ5D9mz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 09:35:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZpydokL2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWgxx4yNzz2yjC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 09:34:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZpydokL2;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MWgxv30rMz4xFs;
	Tue, 20 Sep 2022 09:34:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663630484;
	bh=wkqCtl2G3V/O0lDcyf4l8F3kHR7sKMgUgWzJ0d/lZsY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZpydokL2BUp98/28JcbeIpw4ASfJ0udXn7NH99DmfjjxP0tJj5xs7Ryhj7AwQFUvn
	 icmS/qx+c9P7A5oIudiVfSzv0HwV2Jwt9xs2eTFvk7x3bIzub1rFp3g0qlSfbBz5Bt
	 fzej/C6BdSnMjbAF1c4xY5YHMtZfGA716qzUjDpsoSY9rEm02zpIi3N5Y7bqgqeauN
	 hLOSmt5USZTICcsGLgFSmjXNflKc4UCaO0nyv+kg0mszDXFtv1z0ap13ceD1+3FNXl
	 9OAtwcU6MF88SkTaTOSM/QiFlYewBN3MqraXsHcRTGfHLsfLKszw3zTaJfrea8USLw
	 B1m1FPa3rsnkg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Holger Brunck <holger.brunck@hitachienergy.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH] powerpc/83xx: update kmeter1 defconfig and dts
In-Reply-To: <DB6PR0601MB2485716EBE45037CB8ED7196F74D9@DB6PR0601MB2485.eurprd06.prod.outlook.com>
References: <20191216095006.13590-1-holger.brunck@ch.abb.com>
 <269be158-2451-30cc-f478-0b0453b58c3a@csgroup.eu>
 <87y1uueq2o.fsf@mpe.ellerman.id.au>
 <DB6PR0601MB2485716EBE45037CB8ED7196F74D9@DB6PR0601MB2485.eurprd06.prod.outlook.com>
Date: Tue, 20 Sep 2022 09:34:42 +1000
Message-ID: <87edw7kkfh.fsf@mpe.ellerman.id.au>
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
Cc: Heiko Schocher <hs@denx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Holger Brunck <holger.brunck@hitachienergy.com> writes:
>> > Le 16/12/2019 =C3=A0 10:50, Holger Brunck a =C3=A9crit :
>> >> From: Matteo Ghidoni <matteo.ghidoni@ch.abb.com>
>> >>
>> >> The defconfig is synchronized and the missing MTD_PHYSMAP,
>> DEVTMPFS
>> >> and I2C MUX support are switched on.
>> >>
>> >> Additionally the I2C mux device is added to the DTS with its attached
>> >> temperature sensors and I2C clock frequency is lowered.
>> >
>> > This patch doesn't apply.
>> >
>> > Is it still relevant ?
>>=20
>> If so it should be split into two patches.
>>=20
>
> Ok. Then you can abandon this one. If I find the time I will split it up =
and
> rebase it and send it as a new patch series with two patches.

Thanks.

cheers

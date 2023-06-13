Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3212972E428
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 15:32:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ecExd3Id;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgTy00s98z30MS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 23:32:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ecExd3Id;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgTx51m8vz301c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 23:31:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QgTww0NYGz4x4F;
	Tue, 13 Jun 2023 23:31:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686663112;
	bh=26xyDyXLr2R9oIQudjRYuumJylpFB2DfYjVBeh6Bfjo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ecExd3IdIr19iytscT8t47baEmFlYjtzeoR4KlaOZcdUtKZeRK4gIAlWkrmJnS+4a
	 GG+21ow407VloXJ6EC0uC6MFNKmjV/6HpTI3DK3OVCM5g5V2VOEJtzRxHI338f7Elm
	 Ng/ar2ndwAnnhazUlq7LOpsJe9Mi9eUtS2B06diFiw4KkSFZYwswcR3R+Le7fcKG1G
	 BhEHlzH7INj+uFvqNAry5BR8IY7pC57shGOiAp6w+6VA8BU+4ttXTEtb/NjMmcPjbD
	 P/yynncDng/VvFvpvSrIpVkcXD6S87Gqct1OHBZv3lk4F63mGLsHK4yK/QgulLJQ26
	 VP+Jb/nOUYmzQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Benjamin
 Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] macintosh: Switch i2c drivers back to use .probe()
In-Reply-To: <20230613072044.gqyzostj4yu6yxo4@pengutronix.de>
References: <20230523195053.464138-1-u.kleine-koenig@pengutronix.de>
 <20230613072044.gqyzostj4yu6yxo4@pengutronix.de>
Date: Tue, 13 Jun 2023 23:31:39 +1000
Message-ID: <871qifh4jo.fsf@mail.lhotse>
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
Cc: Corey Minyard <cminyard@mvista.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ajay Gupta <ajayg@nvidia.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Liang He <windhl@126.com>, Jean Delvare <jdelvare@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Adrien Grassein <adrien.grassein@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Colin Leroy <colin@colino.net>, Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Petr Machata <petrm@nvidia.com>, Maximilian Luz <luzmaximilian@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Peter Rosin <peda@axentia.se>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
> On Tue, May 23, 2023 at 09:50:53PM +0200, Uwe Kleine-K=C3=B6nig wrote:
>> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
>> call-back type"), all drivers being converted to .probe_new() and then
>> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
>> back to (the new) .probe() to be able to eventually drop .probe_new() fr=
om
>> struct i2c_driver.
>>=20
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> ---
>> Hello,
>>=20
>> this patch was generated using coccinelle, but I aligned the result to
>> the per-file indention.
>>=20
>> I chose to convert all drivers below drivers/macintosh in a single
>> patch, but if you prefer I can split by driver.
>>=20
>> v6.4-rc1 was taken as a base, as there are no commits in next touching
>> drivers/macintosh I don't expect problems when applying this patch. If
>> conflicts arise until this is applied, feel free to just drop the files
>> with conflicts from this patch. I'll care about the fallout later then.
>>=20
>> Also note there is no coordination necessary with the i2c tree. Dropping
>> .probe_new() will happen only when all (or most) drivers are converted,
>> which will happen after v6.5-rc1 for sure.
>
> Can someone still pick up this patch for v6.5-rc1?

Yes, I will.

cheers

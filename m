Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B7269C3C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 01:56:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKkWS5hWHz3c6C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 11:56:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hASHGpra;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKkVZ63t9z3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 11:55:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hASHGpra;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKkVZ0LWxz4x7y;
	Mon, 20 Feb 2023 11:55:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676854534;
	bh=wxqOjIm9/rnhk0pS41BKLly/M/tr+p6ZjiKfnuxgXX4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hASHGpraEGVm1pbs2YxrgdCHJmBkRxLZE04kXhblwxeU26unJMQrUr/wTLRkDiQE3
	 ar48nDqIlr11/lMClSplUY99AYwMfD8ND/tvgG3+NZepWy7kFQKDt0Et7dM5rhHdbx
	 jh1b4myf3hFibcDyVRnP/eR5fufZoq+lsuCW5Q8wZhnBKtsO1WD2GmZAgDwgs39pY8
	 BnEXJeDHbIZFiZDOS5kHsVBEbqVGeSGud76Zz4k22VzoSxAdeySkCtpcP8xgWK4Muq
	 k6bp51hxRQDLFGfNq4rqLY30bSnr/IaUreM57mVtEaIlA9chO0wlfGw8jDd5LVUuJ6
	 PJPEnRt1CCtEg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v4 3/3] powerpc: dts: turris1x.dts: Set lower priority
 for CPLD syscon-reboot
In-Reply-To: <20230218120525.7zplk5zdg5qmkmaz@pali>
References: <20220820102925.29476-1-pali@kernel.org>
 <20221226114513.4569-1-pali@kernel.org>
 <20221226114513.4569-3-pali@kernel.org>
 <20230209001021.oitnv6x7ilwvy4it@pali>
 <20230218120525.7zplk5zdg5qmkmaz@pali>
Date: Mon, 20 Feb 2023 11:55:33 +1100
Message-ID: <878rgtyx2y.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pali Roh=C3=A1r <pali@kernel.org> writes:
> On Thursday 09 February 2023 01:10:21 Pali Roh=C3=A1r wrote:
>> On Monday 26 December 2022 12:45:13 Pali Roh=C3=A1r wrote:
>> > Due to CPLD firmware bugs, set CPLD syscon-reboot priority level to 64
>> > (between rstcr and watchdog) to ensure that rstcr's global-utilities r=
eset
>> > method which is preferred stay as default one, and to ensure that CPLD
>> > syscon-reboot is more preferred than watchdog reset method.
>> >=20
>> > Fixes: 0531a4abd1c6 ("powerpc: dts: turris1x.dts: Add CPLD reboot node=
")
>> > Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
>>=20
>> May I ask who can take this 3/3 patch? powersupply or powerpc tree?

I assume the fact that Sebastian applied patches 1 & 2 means he didn't
want to take this one.

So the best way to get it applied by me is to send a new version with
just patch 3, with the changelog explaining that commit xxxyyy
implements the property and this patch is just wiring it up.

cheers

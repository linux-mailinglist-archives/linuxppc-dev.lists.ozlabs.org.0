Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D63F2BFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 14:23:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrglB61gLz3cXH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 22:23:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fcObJ9PK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fcObJ9PK; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Grgkb3G5wz30FB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 22:22:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GrgkP6qBnz9sSs;
 Fri, 20 Aug 2021 22:22:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629462142;
 bh=FwqhrW0jlcaccscWe7HSecqPt23K1sWrCz8sv2I2U8o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fcObJ9PKBbwD+oswsEJuJeMThfuMjw1vDwSUNYw468/Ilt2GmgYr15jDY9cwtL8jf
 BPscAHen458rR3lm/o/5EMVvv2A/qHTzeDuJA8xzDa2a/Q7fR1WsKfFO12uCR7yQvJ
 WUpPh4XBpVxukv7RUwr3UWAplz7ghkHQPb+U5UngRUp761+I5UBch1ULt8j3TSffrj
 cmHD1N8uvlDHeGSJs1PsY6uQsh1Un9wS5Y4X5SoMiaIMiQP2y08/vomeiDO4szLfQn
 Gudb63hzYwDt6fb5VeAajz9fzkTTsiyeJAylm7/1qFnx07W1lrZ+K+tGaP9FUk2oZk
 JsrjOVOA1MXKg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/6] powerpc/prom: Introduce early_reserve_mem_old()
In-Reply-To: <d79611e0-b42b-e74b-d628-5db718e6ebfa@csgroup.eu>
References: <20210819125656.14498-1-clg@kaod.org>
 <20210819125656.14498-2-clg@kaod.org>
 <d79611e0-b42b-e74b-d628-5db718e6ebfa@csgroup.eu>
Date: Fri, 20 Aug 2021 22:22:21 +1000
Message-ID: <87y28wcnlu.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 19/08/2021 =C3=A0 14:56, C=C3=A9dric Le Goater a =C3=A9crit=C2=A0:
>> and condition its call with IS_ENABLED(CONFIG_PPC32). This fixes a
>> compile error with W=3D1.
>>=20
>> arch/powerpc/kernel/prom.c: In function =E2=80=98early_reserve_mem=E2=80=
=99:
>> arch/powerpc/kernel/prom.c:625:10: error: variable =E2=80=98reserve_map=
=E2=80=99 set but not used [-Werror=3Dunused-but-set-variable]
>>    __be64 *reserve_map;
>>            ^~~~~~~~~~~
>> cc1: all warnings being treated as errors
>>=20
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>=20
>>   Christophe, I think you had comments on this one ? Yes, I am being a b=
it lazy.
>
>
> Yeah, my comment was to leave thing almost as is, just drop the #ifdef CO=
NFIG_PPC32 and instead put=20
> something like:
>
> 	if (!IS_ENABLED(CONFIG_PPC32))
> 		return;

Yeah that's cleaner, let's do that.

cheers

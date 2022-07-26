Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6551F58117D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 12:54:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsYgZ2ypcz3cfb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 20:54:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JRrZkDpT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsYfx46RLz2xCS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 20:53:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JRrZkDpT;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LsYfq3p2Jz4xD9;
	Tue, 26 Jul 2022 20:53:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658832805;
	bh=e0EUedkqhJ1b57DPBaL0yyDtxdDY/BCjyXAIINYG4mw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JRrZkDpTo9+yy3aaV9r4JdVGbVeLe2ATkOknoJ5+p/Xe1iss0Vn1HHVEpgqWhGt72
	 mfq3eXbFPINYl3odQGW1kAYXpq4d3Yc2uQRXccgGxOo5C0XNkv+vhZ8faIDlMjX4TT
	 gdKewLIUoVToLO3HsCtZrKM4gPedk8eb8Sqez4vHeXCV05idChuzR/hBBO3nLPKUw/
	 o+Wc66sMaC9dW7lQhFWp4x0iKwGhNrSLTTCkThYasHOPMFz1RYQoQ/QBfAy3J4FsCH
	 oZUiYFaQjZ4IbV//8iHU+MeqnDXbeGk/hMgwxSUA2P85v07bjUi8KUSC8/Jh5aCSxd
	 LCjhxqr5dSzsQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>, Randy Dunlap
 <rdunlap@infradead.org>, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 wim@linux-watchdog.org, linux@roeck-us.net, nathanl@linux.ibm.com
Subject: Re: [PATCH v5 4/4] pseries/mobility: set NMI watchdog factor during
 an LPM
In-Reply-To: <4e366d73-fb9f-bd83-abd0-c624a737a0cd@linux.ibm.com>
References: <20220713154729.80789-1-ldufour@linux.ibm.com>
 <20220713154729.80789-5-ldufour@linux.ibm.com>
 <e6232bb4-a8e5-8f33-e80e-06b1356565b7@infradead.org>
 <4e366d73-fb9f-bd83-abd0-c624a737a0cd@linux.ibm.com>
Date: Tue, 26 Jul 2022 20:53:21 +1000
Message-ID: <878rogb0wu.fsf@mpe.ellerman.id.au>
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
Cc: hch@infradead.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, haren@linux.vnet.ibm.com, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> Le 13/07/2022 =C3=A0 22:17, Randy Dunlap a =C3=A9crit=C2=A0:
>> Hi Laurent,
>>=20
>> On 7/13/22 08:47, Laurent Dufour wrote:
>>> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentatio=
n/admin-guide/sysctl/kernel.rst
>>> index ddccd1077462..d73faa619c15 100644
>>> --- a/Documentation/admin-guide/sysctl/kernel.rst
>>> +++ b/Documentation/admin-guide/sysctl/kernel.rst
>>> @@ -592,6 +592,18 @@ to the guest kernel command line (see
>>>  Documentation/admin-guide/kernel-parameters.rst).
>>>=20=20
>>>=20=20
>>> +nmi_wd_lpm_factor (PPC only)
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>> +
>>> +Factor apply to the NMI watchdog timeout (only when ``nmi_watchdog`` is
>>=20
>>    Factor to apply to
>
> Thanks, Randy.
>
> Michael, could you fix that when applying the series?

Yes, I did.

cheers

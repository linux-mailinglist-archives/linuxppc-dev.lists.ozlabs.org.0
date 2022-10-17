Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E3260047D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 02:18:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrHf46PBdz3c1c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 11:18:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b8Psnbtm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrHd75WKQz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 11:17:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b8Psnbtm;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MrHd21Stkz4xFy;
	Mon, 17 Oct 2022 11:17:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665965864;
	bh=AJqe2HU8J2/WA6eYpUtYAH/y7BPMGhIEqMgVvaG3SVk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b8PsnbtmdmVK0DI2taJH2SaECnpehR22hZVoAVxSYXwKcVbJepVadWbokT3GAOX6N
	 vyqW07LDra44QD4EVl6IxqWzf/uay8U1t4Za/om+OrEZz9G9IjXVpJO66AXLq96oel
	 sActOH/WVPTUE6sXYonoV2m2WiXXap48v+a0gkJJAKD2suF7YF2qlaoLIwZYJYWv5R
	 z5CweK9gDLGBIluNhLfRCpLSd6n85MVdHcFPKfBkxGeFFN2XaurHZtHXZ822MjcPgt
	 dYdtv67Y9R6XdCv3ve7/IZuVPUHrabcYpoO7/CHCad8wUytv7gWmre+6dp4urAYfFS
	 XpoGMhHm3xGHw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Olof Johansson <olof@lixom.net>, Christian Zigotzky
 <chzigotzky@xenosoft.de>
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
In-Reply-To: <CAOesGMgETp0KDfdJxbqkYzCS+BWmMz9Wvv94xK7RQ7bjj27YjA@mail.gmail.com>
References: <0D40FEF9-D87D-42C4-BC31-EC8AE952C1FB@xenosoft.de>
 <0D8C8783-238D-4B4D-BA3D-766AB7139253@xenosoft.de>
 <CAOesGMgETp0KDfdJxbqkYzCS+BWmMz9Wvv94xK7RQ7bjj27YjA@mail.gmail.com>
Date: Mon, 17 Oct 2022 11:17:40 +1100
Message-ID: <871qr7mhgb.fsf@mpe.ellerman.id.au>
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com, rmclure@linux.ibm.com, mad skateman <madskateman@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Olof Johansson <olof@lixom.net> writes:
> On Fri, Oct 14, 2022 at 9:11 AM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>>
>> make oldconfig has asked because of the CPU family. I choosed GENERIC fo=
r my P.A. Semi PWRficient PA6T-1682M. Is this correct? Maybe this is the pr=
oblem.
>>
>> config GENERIC_CPU
>> - bool "Generic (POWER4 and above)"
>> + bool "Generic (POWER5 and PowerPC 970 and above)"
>>   depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
>>   select PPC_64S_HASH_MMU
>>
>> There isn=E2=80=99t a POWER4 anymore and I used it via CONFIG_GENERIC_CP=
U=3Dy before.
>>
>> Before the first PowerPC updates:
>> CONFIG_GENERIC_CPU=3Dy
>> # CONFIG_POWER5_CPU is not set
>>
>> Link: https://github.com/torvalds/linux/blob/master/arch/powerpc/platfor=
ms/Kconfig.cputype
>
> I think the mistake here is that there are two GENERIC_CPUs now, and
> one of them is the wrong one and overrides settings. I'm surprised
> Kconfig didn't balk at it.

We've had two GENERIC_CPUs since 2018:

  a73657ea19ae ("powerpc/64: Add GENERIC_CPU support for little endian")

They're mutually exclusive because of the ENDIAN dependencies.

I don't know if that's supposed to be allowed by Kconfig, but AFAIK it
has been working.

> I have a vague memory that PA6T had a little-endian mode, but it was
> never used much and I wouldn't expect it to work.

I don't think endian is an issue here. Christian should be getting the
big endian version of GENERIC_CPU.

cheers

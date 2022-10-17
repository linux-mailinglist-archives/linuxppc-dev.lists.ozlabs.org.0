Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF2600498
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 02:43:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrJC40JRpz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 11:43:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=myUXAcEn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrJB71Smxz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 11:42:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=myUXAcEn;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MrJB706b6z4x1G;
	Mon, 17 Oct 2022 11:42:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665967375;
	bh=N23Jut8Z5LGdpnJdMvqJqMrXe+KgoU+mIuEegke+ihw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=myUXAcEnbsz1sj2bOG1/Cbkj0CPz8Ezwx/4pZOWzwHb6GhSY1Vf1FpwEAFuJdEtEh
	 oOEToC0cmcBV4NUg7HAojIMmDIHeJiWPzWbxvvdDSP9aLFn/nEIdHHcjQuAB937aL8
	 s3laOGqVIUPhovd3dF4qsCdlc9OgB0N7N6f3PT2HJGeloRFp8/In1DVbNeRodexAOr
	 qJJs4cxO4A1a/RnxOaokehqqOyu3Fwma+MkjZ5dD7Npl43+2d76dV1ViAsOul7NWSm
	 r8X/fZtnai7LHcegwFd4v38hASwyujlgNYxLUAH3YqpWCpArnhlvMu2j9frdlm9ABZ
	 fI37UZd11Pc0w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Segher Boessenkool
 <segher@kernel.crashing.org>
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
In-Reply-To: <C4072BA4-BF73-41B8-A109-8062C4F051DD@xenosoft.de>
References: <20221016164654.GH25951@gate.crashing.org>
 <C4072BA4-BF73-41B8-A109-8062C4F051DD@xenosoft.de>
Date: Mon, 17 Oct 2022 11:42:54 +1100
Message-ID: <87y1tfl1pt.fsf@mpe.ellerman.id.au>
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com, rmclure@linux.ibm.com, mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> No, it=E2=80=99s not fine. We used the POWER4 CPU config before.

We dropped POWER4 support in 2018.

The recent commit just updated the help text to match reality.

There were some changes to the CPU flags, but if anything they should
have made things more likely to work properly on old CPUs.

Previously BIG_ENDIAN && GENERIC_CPU would use -mcpu=3Dpower5, now it uses
-mcpu=3Dpower4.


cheers

>> On 16. Oct 2022, at 18:51, Segher Boessenkool <segher@kernel.crashing.or=
g> wrote:
>>=20
>> =EF=BB=BFOn Fri, Oct 14, 2022 at 06:11:21PM +0200, Christian Zigotzky wr=
ote:
>>> make oldconfig has asked because of the CPU family. I choosed GENERIC f=
or my P.A. Semi PWRficient PA6T-1682M. Is this correct? Maybe this is the p=
roblem.
>>>=20
>>> config GENERIC_CPU
>>> -    bool "Generic (POWER4 and above)"
>>> +    bool "Generic (POWER5 and PowerPC 970 and above)"
>>>    depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
>>>    select PPC_64S_HASH_MMU
>>>=20
>>> There isn=E2=80=99t a POWER4 anymore and I used it via CONFIG_GENERIC_C=
PU=3Dy before.
>>=20
>> PA6T is ISA 2.04, just like POWER5+.  It should be fine.
>>=20
>>=20
>> Segher

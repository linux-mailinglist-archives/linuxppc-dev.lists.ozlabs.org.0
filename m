Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14014750883
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 14:40:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nOluD2tj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1HQ16wkyz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 22:40:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nOluD2tj;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1HPB2fSzz30fl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 22:39:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1689165566;
	bh=T6VYKVVfdvano9tjQIzE080BQEj4ZRWAzPeP9tElmhY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nOluD2tjGFa+bExvfZOwLud99ykHUhRE00PF+K2HOPFyA9Nx8NwYhHs851k3QFzId
	 Qr51LbARimQvjkIbBrxlMqraHbR4X+s2kwUvrL2aywcsceNYnXmCSAAyHyN8gk4cRC
	 7Ri8SM13HjnNfaKsq7kop8n0kO64dq4gkjLQNvQQznOCDSOoWsGl64+JeL36tDwWJ4
	 T/6ZJJyNMW6g4ocrK8geUxAVuxukNNEA50KSQc8D/RL9BoNqUeDnajp7AmikFNZf7p
	 eVDTWOGCn27X8+Vr0CbAW5rvwCjvqag6rAJJGZXGbbR0dImlQPixbmdq60ol4QNPE5
	 mHhnQvaLpkBig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R1HPB11XDz4wxR;
	Wed, 12 Jul 2023 22:39:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger
 <stefanb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] powerpc/tpm: Create linux,sml-base/size as big
 endian
In-Reply-To: <ec564375084b6edd7b7d77eb341f451e798fb50d.camel@kernel.org>
References: <20230615123703.4028156-1-mpe@ellerman.id.au>
 <4d378d53225fc8b8cdc99dde900388d2eefaad4e.camel@kernel.org>
 <0fb26243-0d63-118b-2737-05391ba0c69a@linux.ibm.com>
 <ec564375084b6edd7b7d77eb341f451e798fb50d.camel@kernel.org>
Date: Wed, 12 Jul 2023 22:39:25 +1000
Message-ID: <87r0pde22q.fsf@mail.lhotse>
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
Cc: jgg@ziepe.ca, linux-integrity@vger.kernel.org, eajames@linux.ibm.com, peterhuewe@gmx.de, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jarkko Sakkinen <jarkko@kernel.org> writes:
> On Tue, 2023-07-11 at 08:47 -0400, Stefan Berger wrote:
>> On 7/10/23 17:23, Jarkko Sakkinen wrote:
>> > On Thu, 2023-06-15 at 22:37 +1000, Michael Ellerman wrote:
>> > > There's code in prom_instantiate_sml() to do a "SML handover" (Stored
>> > > Measurement Log) from OF to Linux, before Linux shuts down Open
>> > > Firmware.
>> > >=20
>> > > This involves creating a buffer to hold the SML, and creating two de=
vice
>> > > tree properties to record its base address and size. The kernel then
>> > > later reads those properties from the device tree to find the SML.
>> > >=20
>> > > When the code was initially added in commit 4a727429abec ("PPC64: Add
>> > > support for instantiating SML from Open Firmware") the powerpc kernel
>> > > was always built big endian, so the properties were created big endi=
an
>> > > by default.
>> > >=20
>> > > However since then little endian support was added to powerpc, and n=
ow
>> > > the code lacks conversions to big endian when creating the propertie=
s.
>> > >=20
>> > > This means on little endian kernels the device tree properties are
>> > > little endian, which is contrary to the device tree spec, and in
>> > > contrast to all other device tree properties.
>> > >=20
>> > > To cope with that a workaround was added in tpm_read_log_of() to skip
>> > > the endian conversion if the properties were created via the SML
>> > > handover.
>> > >=20
>> > > A better solution is to encode the properties as big endian as they
>> > > should be, and remove the workaround.
>> > >=20
>> > > Typically changing the encoding of a property like this would present
>> > > problems for kexec. However the SML is not propagated across kexec, =
so
>> > > changing the encoding of the properties is a non-issue.
>> > >=20
>> > > Fixes: e46e22f12b19 ("tpm: enhance read_log_of() to support Physical=
 TPM event log")
>> > > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> > > Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>> > > ---
>> > >   arch/powerpc/kernel/prom_init.c |  8 ++++++--
>> > >   drivers/char/tpm/eventlog/of.c  | 23 ++++-------------------
>> > >   2 files changed, 10 insertions(+), 21 deletions(-)
>> >=20
>> > Split into two patches (producer and consumer).
>>=20
>> I think this wouldn't be right since it would break the system when only=
 one patch is applied since it would be reading the fields in the wrong end=
ianess.
>
> I think it would help if the commit message would better explain
> what is going on. It is somewhat difficult to decipher, if you
> don't have deep knowledge of the powerpc architecture.

I mean, it's already 8 paragraphs =C2=AF\_(=E3=83=84)_/=C2=AF

But I'm happy to expand it. I just don't really know what extra detail
is needed to make it clearer.

cheers

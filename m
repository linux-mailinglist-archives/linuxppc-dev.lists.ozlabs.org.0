Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9AF74FA2A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 23:55:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qnJ2jolN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0vnD3T4rz3c3w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 07:55:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qnJ2jolN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0vmH4nNlz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 07:54:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2845C615FF;
	Tue, 11 Jul 2023 21:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206ABC433C8;
	Tue, 11 Jul 2023 21:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689112474;
	bh=EuiTP5R/M7ypb8hxPmxqp/u62cmZF8d2Lc6VA4N1Ag0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qnJ2jolNq26WcgU0E799VXsleOypeG9zelUnqkZ5+jABNYvYAWxNut0umGQfjkrmg
	 KPo6HeVpyz4N7M4nsaBAUqisaTs8Msff7+bQNZ2zVJgphEvUatGg/ubTIv2g9t6iUu
	 AJp3yNLEFOpBomBfTLk+36mYPFS1EvDBr/oaC/B0rOlRu4V/AWIk3u3UARJWPNurxL
	 btTHzbvoKCjnPum32Ev9dtfHBuONVAdru1+0e3gdyn6tF8chdKMZ5CH1fVUwYppXmz
	 pCdPdYd66pv8BfkMjlJSsZK+BplJluEerKx4hB6/UAEKrmhNwMBaQf5Mq2/nwzsbEY
	 uuOKDXaRSWsDw==
Message-ID: <ec564375084b6edd7b7d77eb341f451e798fb50d.camel@kernel.org>
Subject: Re: [PATCH v2 1/2] powerpc/tpm: Create linux,sml-base/size as big
 endian
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>,  linuxppc-dev@lists.ozlabs.org
Date: Wed, 12 Jul 2023 00:54:31 +0300
In-Reply-To: <0fb26243-0d63-118b-2737-05391ba0c69a@linux.ibm.com>
References: <20230615123703.4028156-1-mpe@ellerman.id.au>
	 <4d378d53225fc8b8cdc99dde900388d2eefaad4e.camel@kernel.org>
	 <0fb26243-0d63-118b-2737-05391ba0c69a@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
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
Cc: jgg@ziepe.ca, linux-integrity@vger.kernel.org, eajames@linux.ibm.com, peterhuewe@gmx.de, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-07-11 at 08:47 -0400, Stefan Berger wrote:
>=20
> On 7/10/23 17:23, Jarkko Sakkinen wrote:
> > On Thu, 2023-06-15 at 22:37 +1000, Michael Ellerman wrote:
> > > There's code in prom_instantiate_sml() to do a "SML handover" (Stored
> > > Measurement Log) from OF to Linux, before Linux shuts down Open
> > > Firmware.
> > >=20
> > > This involves creating a buffer to hold the SML, and creating two dev=
ice
> > > tree properties to record its base address and size. The kernel then
> > > later reads those properties from the device tree to find the SML.
> > >=20
> > > When the code was initially added in commit 4a727429abec ("PPC64: Add
> > > support for instantiating SML from Open Firmware") the powerpc kernel
> > > was always built big endian, so the properties were created big endia=
n
> > > by default.
> > >=20
> > > However since then little endian support was added to powerpc, and no=
w
> > > the code lacks conversions to big endian when creating the properties=
.
> > >=20
> > > This means on little endian kernels the device tree properties are
> > > little endian, which is contrary to the device tree spec, and in
> > > contrast to all other device tree properties.
> > >=20
> > > To cope with that a workaround was added in tpm_read_log_of() to skip
> > > the endian conversion if the properties were created via the SML
> > > handover.
> > >=20
> > > A better solution is to encode the properties as big endian as they
> > > should be, and remove the workaround.
> > >=20
> > > Typically changing the encoding of a property like this would present
> > > problems for kexec. However the SML is not propagated across kexec, s=
o
> > > changing the encoding of the properties is a non-issue.
> > >=20
> > > Fixes: e46e22f12b19 ("tpm: enhance read_log_of() to support Physical =
TPM event log")
> > > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > > Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> > > ---
> > >   arch/powerpc/kernel/prom_init.c |  8 ++++++--
> > >   drivers/char/tpm/eventlog/of.c  | 23 ++++-------------------
> > >   2 files changed, 10 insertions(+), 21 deletions(-)
> >=20
> > Split into two patches (producer and consumer).
>=20
> I think this wouldn't be right since it would break the system when only =
one patch is applied since it would be reading the fields in the wrong endi=
aness.

I think it would help if the commit message would better explain
what is going on. It is somewhat difficult to decipher, if you
don't have deep knowledge of the powerpc architecture.

BR, Jarkko

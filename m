Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E31F91EBC3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 02:19:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hgsDS1QC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCk7M0CHhz3fnV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 10:19:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hgsDS1QC;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCk6f4RwJz3fmx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 10:19:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719879545;
	bh=K9oeLGJQU+rgsK96dB9QMC+iN8/+4+J/PBYB7gUN7Zs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hgsDS1QCjQdVgp1dT+k+xCgYKDv9+/NO7OuKPD5gSHHb2n8GHvpxBWICIUFcSQ/P/
	 zq5c3c4v6Qz0rYIbBLCIHsOOrOfmrz/rWjzlKveoQz2j0f/gb5DN/4DOOqGQmPtqs5
	 MRYrGg/V2soCvU5db/DmnXP/3dGLtMrrPQo0ZXYvGiLpnbWiW5WGoo5yut6MxTw+7S
	 LxrRj3oJZJy7PvTxv7E5koOZUTmk6IEYQZRksmLTRf2HRBEykDbUKgW08ebGdrpr38
	 eP2AiFpQlI9Vemdz1ACoQG6wJ6IeHZhuNuaTIhnWobz/8mQjdvdGE6EyUhcQV9Vkfe
	 YyN2U+C+GZWew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCk6d19g7z4wcS;
	Tue,  2 Jul 2024 10:19:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 regressions@lists.linux.dev
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
In-Reply-To: <4108938158d888cc6ec371bb151e7ac35d3b4cb0.camel@HansenPartnership.com>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
 <87pls1lwe0.fsf@mail.lhotse>
 <4108938158d888cc6ec371bb151e7ac35d3b4cb0.camel@HansenPartnership.com>
Date: Tue, 02 Jul 2024 10:19:04 +1000
Message-ID: <87y16kk5mv.fsf@mail.lhotse>
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
Cc: linux-kernel@vger.kernel.org, jarkko@kernel.org, naveen.n.rao@linux.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

James Bottomley <James.Bottomley@HansenPartnership.com> writes:
> On Fri, 2024-06-28 at 10:54 +1000, Michael Ellerman wrote:
>> Stefan Berger <stefanb@linux.ibm.com> writes:
>> > Fix the following type of error message caused by a missing call to
>> > tpm2_sessions_init() in the IBM vTPM driver:
>> >=20
>> > [=C2=A0=C2=A0=C2=A0 2.987131] tpm tpm0: tpm2_load_context: failed with=
 a TPM error
>> > 0x01C4
>> > [=C2=A0=C2=A0=C2=A0 2.987140] ima: Error Communicating to TPM chip, re=
sult: -14
>> >=20
>> > Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
>> > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> > ---
>> > =C2=A0drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
>> > =C2=A01 file changed, 4 insertions(+)
>> >=20
>> > diff --git a/drivers/char/tpm/tpm_ibmvtpm.c
>> > b/drivers/char/tpm/tpm_ibmvtpm.c
>> > index d3989b257f42..1e5b107d1f3b 100644
>> > --- a/drivers/char/tpm/tpm_ibmvtpm.c
>> > +++ b/drivers/char/tpm/tpm_ibmvtpm.c
>> > @@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev
>> > *vio_dev,
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D tpm2_get_cc_attrs_tbl(chip);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc)
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
goto init_irq_cleanup;
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0rc =3D tpm2_sessions_init(chip);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (rc)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto i=
nit_irq_cleanup;
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> > =C2=A0
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return tpm_chip_regist=
er(chip);
>>=20
>> #regzbot ^introduced: d2add27cf2b8=20
>
> Could you please test out the patch I proposed for this:
>
> https://lore.kernel.org/linux-integrity/1302b413a2d7bf3b275133e7fdb04b44b=
fe2d5e3.camel@HansenPartnership.com/

Your patch does fix the issue on my PowerVM system, as does Stefan's.

cheers

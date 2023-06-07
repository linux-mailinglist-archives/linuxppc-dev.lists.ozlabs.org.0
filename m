Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 933AC726565
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 18:04:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbsc82mtwz3dt7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 02:04:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pehR3VLZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pehR3VLZ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbsbC34DNz2yw0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 02:03:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2AD264121;
	Wed,  7 Jun 2023 16:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAE1C433D2;
	Wed,  7 Jun 2023 16:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686153827;
	bh=J16zGDckle7C4LdmhMdOVXFH/Zg0clJWTEbdvbDGIl8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=pehR3VLZMvh72JpDSV4164kNkP4JMFv5uLG8kP5Bc7LHbUfQmxqLX4eslL8N5euxV
	 giRI7DFGJSwjDYsWJfZRBp4C5SEnjgoSM6tOArSP+IUjh8sq8uOcIwb06kDLS3ERHc
	 wckgOddFL3Ne2yHH+FdDtzBre18y1hIz5VW15R5xqo2UVci+s4+hwCCcW+gzTS80+W
	 RG8hez47mD9gdkGftsb9uQhjXxu8/dnd3kGRaFV+x9BL7A2RzeR5C0GAxciTbhy/d+
	 oMkdMX++DSivtUC/9XdafyKhZAUEV9NRmUP82/lOOIzsMOlTahYzM1AWFJQ/jBtW6r
	 GrAvJ7/0pZ3vQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jun 2023 19:03:42 +0300
Message-Id: <CT6JN8JJ18NJ.39MUF0A404TPF@suppilovahvero>
Subject: Re: [PATCH] security/integrity: fix pointer to ESL data and its
 size on pseries
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Nayna" <nayna@linux.vnet.ibm.com>, "Nayna Jain" <nayna@linux.ibm.com>,
 "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-integrity"
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230606172652.198227-1-nayna@linux.ibm.com>
 <CT5V56O3NZS8.1V2L3JJWRKIOE@suppilovahvero>
 <6a4cac35-efa9-40f6-ae0f-ad3509ef7fbb@linux.vnet.ibm.com>
In-Reply-To: <6a4cac35-efa9-40f6-ae0f-ad3509ef7fbb@linux.vnet.ibm.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, Russell Currey <ruscur@russell.cc>, George
 Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jun 7, 2023 at 3:28 PM EEST, Nayna wrote:
>
> On 6/6/23 16:51, Jarkko Sakkinen wrote:
> > On Tue Jun 6, 2023 at 8:26 PM EEST, Nayna Jain wrote:
> >> On PowerVM guest, variable data is prefixed with 8 bytes of timestamp.
> >> Extract ESL by stripping off the timestamp before passing to ESL parse=
r.
> >>
> > Cc: stable@vger.kenrnel.org # v6.3
> >
> > ?
>
> Aah yes. Missed that.. Thanks..
>
>
> >
> >> Fixes: 4b3e71e9a34c ("integrity/powerpc: Support loading keys from PLP=
KS")
> >> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> >> ---
> >>   .../integrity/platform_certs/load_powerpc.c   | 39 ++++++++++++-----=
--
> >>   1 file changed, 26 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/security/integrity/platform_certs/load_powerpc.c b/securi=
ty/integrity/platform_certs/load_powerpc.c
> >> index b9de70b90826..57768cbf1fd3 100644
> >> --- a/security/integrity/platform_certs/load_powerpc.c
> >> +++ b/security/integrity/platform_certs/load_powerpc.c
> >> @@ -15,6 +15,9 @@
> >>   #include "keyring_handler.h"
> >>   #include "../integrity.h"
> >>  =20
> >> +#define extract_data(db, data, size, offset)	\
> >> +	do { db =3D data + offset; size =3D size - offset; } while (0)
> >> +
> >>   /*
> >>    * Get a certificate list blob from the named secure variable.
> >>    *
> >> @@ -55,8 +58,10 @@ static __init void *get_cert_list(u8 *key, unsigned=
 long keylen, u64 *size)
> >>    */
> >>   static int __init load_powerpc_certs(void)
> >>   {
> >> +	void *data =3D NULL;
> >> +	u64 dsize =3D 0;
> >> +	u64 offset =3D 0;
> >>   	void *db =3D NULL, *dbx =3D NULL;
> > So... what do you need db still for?
> >
> > If you meant to rename 'db' to 'data', then you should not do it, since=
 this is
> > a bug fix. It is zero gain, and a factor harder backport.
>
> In case of PowerVM guest, data points to timestamp + ESL.=C2=A0 And then =
with=20
> offset of 8 bytes, db points to ESL.
>
> While db is used for parsing ESL, data is then later used to free=20
> (timestamp + ESL) memory.
>
> Hope it answers the question.

OK, cool. Only thing I have to add that it would be more consistent if
data was declared in the same line as db and dbx, given that they are
declared in the same line.

BR, Jarkko

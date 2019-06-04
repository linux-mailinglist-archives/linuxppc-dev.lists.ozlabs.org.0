Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A9E33D5C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 05:01:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HxXb2Nv4zDqZH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 13:01:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HxWM4SRCzDqDX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 13:00:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="CvqDMeQ8"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 45HxWM2Gb4z9s3Z;
 Tue,  4 Jun 2019 13:00:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1559617247;
 bh=VUd9GWQtgbkgeyYLimUbt7j45REwwm+8dxNtJyVqgXY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=CvqDMeQ8WkPPfnPpux0tIsEjkVV6wnsDzvKOW8dBg9ZAO4T7+/30AIpxUkGr3xgTF
 11AYzBEIbI19P1Ya/5A0Yoy8V1xs+106iRjZfGugawF/JYr4gSh5E0+s464cpaCPEk
 d/HJhe7SuENcanWd/6G71VVXHnAQl8PZOYO+pdI7RIAWmeYlliRDyKnjIxo85ieYfN
 XNvSBc0zxxRQko2NPpVpIINKcrhSO7Cv1ZUaooCr+UW/85ZFl/jkABx+0ugq+lW2tL
 GDtWiRQH60LKO/Z136utEkBVjDzbMox7/brBKSTyCHvaxnetfctVvOy6u6VlSJvBQ2
 pFJs8onZOXz+A==
Received: by neuling.org (Postfix, from userid 1000)
 id 4A3F12A56C6; Tue,  4 Jun 2019 13:00:47 +1000 (AEST)
Message-ID: <9bd5f8b9795417d40332320dec2c256ef342c026.camel@neuling.org>
Subject: Re: [PATCH v4 2/2] powerpc: Fix compile issue with force DAWR
From: Michael Neuling <mikey@neuling.org>
To: Christoph Hellwig <hch@infradead.org>
Date: Tue, 04 Jun 2019 13:00:47 +1000
In-Reply-To: <20190529062842.GA4787@infradead.org>
References: <20190529020115.14201-1-mikey@neuling.org>
 <20190529020115.14201-2-mikey@neuling.org>
 <20190529062842.GA4787@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
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
Cc: Mathieu Malaterre <malat@debian.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I agree with all the below and will address in v5.

Mikey

On Tue, 2019-05-28 at 23:28 -0700, Christoph Hellwig wrote:
> > +config PPC_DAWR
> > +	bool
> > +	default n
>=20
> "default n" is the default default.  No need to write this line.
>=20
> > +++ b/arch/powerpc/kernel/dawr.c
> > @@ -0,0 +1,100 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +//
> > +// DAWR infrastructure
> > +//
> > +// Copyright 2019, Michael Neuling, IBM Corporation.
>=20
> Normal top of file header should be /* */, //-style comments are only
> for the actual SPDX heder line.
>=20
> > +	/* Send error to user if they hypervisor won't allow us to write DAWR=
 */
> > +	if ((!dawr_force_enable) &&
> > +	    (firmware_has_feature(FW_FEATURE_LPAR)) &&
> > +	    (set_dawr(&null_brk) !=3D H_SUCCESS))
>=20
> None of the three inner brace sets here are required, and the code
> becomes much easier to read without them.
>=20
> > +		return -1;
>=20
> What about returning a proper error code?
>=20
> > +static int __init dawr_force_setup(void)
> > +{
> > +	dawr_force_enable =3D false;
>=20
> This variable already is initialized to alse by default, so this line
> is not required.
>=20
> > +	if (PVR_VER(mfspr(SPRN_PVR)) =3D=3D PVR_POWER9) {
> > +		/* Turn DAWR off by default, but allow admin to turn it on */
> > +		dawr_force_enable =3D false;
>=20
> .. and neither is this one.
>=20


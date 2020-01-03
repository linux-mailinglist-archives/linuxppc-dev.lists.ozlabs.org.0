Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5712E12F20A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 01:15:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47plmd4P5NzDqCh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2020 11:15:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47plkh0bxhzDqC4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2020 11:14:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="h1uglhkd"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47plkg43mvz9sRR; Fri,  3 Jan 2020 11:14:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578010443;
 bh=5ck4UGB8KqQpCo97JI7IveB9WYYOzESxhBwJFNwBvLY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h1uglhkdA3kQxDBCjIZZFVVRqRyp9UHq459i2pkDPC3oScuYzazSFv/jDcD767BBd
 /QDbPPFwROm292vz4/MN5k8k0bf/hsz9wLMcSzdKSH8i/0IG9mS7y+/StV/augc+Ec
 xvFNyUp4X+mgAlMy1Z2jcIuE6X7brXDbzs+jmqhg=
Date: Fri, 3 Jan 2020 11:08:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH kernel v2 4/4] powerpc/pseries/svm: Allow IOMMU to work
 in SVM
Message-ID: <20200103000849.GL2098@umbus>
References: <20191216041924.42318-1-aik@ozlabs.ru>
 <20191216041924.42318-5-aik@ozlabs.ru>
 <20200102222106.GB5556@oc0525413822.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xb8pJpF45Qg/t7GZ"
Content-Disposition: inline
In-Reply-To: <20200102222106.GB5556@oc0525413822.ibm.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Michael Anderson <andmike@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Xb8pJpF45Qg/t7GZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2020 at 02:21:06PM -0800, Ram Pai wrote:
> On Mon, Dec 16, 2019 at 03:19:24PM +1100, Alexey Kardashevskiy wrote:
> > H_PUT_TCE_INDIRECT uses a shared page to send up to 512 TCE to
> > a hypervisor in a single hypercall.
>=20
> Actually H_PUT_TCE_INDIRECT never used shared page.  It would have
> used shared pages if the 'shared-page' solution was accepted. :)

Well, it depends what you mean by "shared".  In the non-PEF case we do
use a shared page in the sense that it is accessed by both guest and
hypervisor.  It's just not shared in the PEF sense.

> > This does not work for secure VMs
> > as the page needs to be shared or the VM should use H_PUT_TCE instead.
>=20
> Maybe you should say something like this.. ?
>=20
> H_PUT_TCE_INDIRECT does not work for secure VMs, since the page
> containing the TCE entries is not accessible to the hypervisor.
>=20
> >=20
> > This disables H_PUT_TCE_INDIRECT by clearing the FW_FEATURE_PUT_TCE_IND
> > feature bit so SVMs will map TCEs using H_PUT_TCE.
> >=20
> > This is not a part of init_svm() as it is called too late after FW
> > patching is done and may result in a warning like this:
> >=20
> > [    3.727716] Firmware features changed after feature patching!
> > [    3.727965] WARNING: CPU: 0 PID: 1 at (...)arch/powerpc/lib/feature-=
fixups.c:466 check_features+0xa4/0xc0
> >=20
> > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>=20
>=20
> Reviewed-by: Ram Pai <linuxram@us.ibm.com>
>=20
>=20
> > ---
> > Changes:
> > v2
> > * new in the patchset
> > ---
> >  arch/powerpc/platforms/pseries/firmware.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/p=
latforms/pseries/firmware.c
> > index d3acff23f2e3..3e49cc23a97a 100644
> > --- a/arch/powerpc/platforms/pseries/firmware.c
> > +++ b/arch/powerpc/platforms/pseries/firmware.c
> > @@ -22,6 +22,7 @@
> >  #include <asm/firmware.h>
> >  #include <asm/prom.h>
> >  #include <asm/udbg.h>
> > +#include <asm/svm.h>
> >=20
> >  #include "pseries.h"
> >=20
> > @@ -101,6 +102,12 @@ static void __init fw_hypertas_feature_init(const =
char *hypertas,
> >  		}
> >  	}
> >=20
> > +	if (is_secure_guest() &&
> > +	    (powerpc_firmware_features & FW_FEATURE_PUT_TCE_IND)) {
> > +		powerpc_firmware_features &=3D ~FW_FEATURE_PUT_TCE_IND;
> > +		pr_debug("SVM: disabling PUT_TCE_IND firmware feature\n");
> > +	}
> > +
> >  	pr_debug(" <- fw_hypertas_feature_init()\n");
> >  }
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Xb8pJpF45Qg/t7GZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4Ohg8ACgkQbDjKyiDZ
s5KZ4RAAzqervXpX+K7aujIQAYsyYPI1nL3KdfIiEWInO8pk8PWXp/zxUiqSq5ai
HISi4AdrduTKLdNBHN1dEnq3OzwioA3dxLwiYC4XAq+Y84hr2wGMp0oXW687IsDg
8kILH0yb9nWTBKFoAfm821paykZoODfXm4WBeLmf39SvmD6ssnqPelKY3m2xoNox
1NqyBWnqYMD43r5f/lkRdEAZDjgc/MrIq2SvUqMpk/GeCBSoaokiukq8K9ZtYLiC
cX4chgSpskdC7PQW53yMblBZWI3DuQNS8J6J2ulsmVCK6QAId/KH10nZ5IGljTgS
J1agmUCkS0McwhvqVi98hA0gt9sCCOXuMLh9pHEaVzM+3JGqF3ivisSUCHAwKZBh
ioGKcymRg/FYfWm5cvGh4FhB4NH25T89SPFoJQe6KzYzWNXMxFQK9aWgXydOe93O
/MoMNEgzntFQUJQvuw6Quhq2ER26UF4peFbjS/llrXTr+oYr3TgpkH87LxSv/8/H
0xH3JdO+nvioLDKJU5DPmY9yMH3R2w71UKkB+9lyCtURyUb9qtQu8V7/b+7OEf6w
MEeS/nLtKw9bWafFKUcg0LM2s3Pzp2rOUViHbZqN9NL+6H6LwePSWf3yQsN70C3p
7xEYxA79hQYoemaX62mHMbRN/+gaa/SQT/7BnRAUHEVrnSFhmFs=
=z38/
-----END PGP SIGNATURE-----

--Xb8pJpF45Qg/t7GZ--

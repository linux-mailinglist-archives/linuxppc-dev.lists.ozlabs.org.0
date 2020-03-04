Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AC3179CDB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 01:31:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xs9s5rsgzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 11:31:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Xs8452rrzDqQ0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 11:29:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=fVDV3f2o; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48Xs836Hz7z9sRR; Thu,  5 Mar 2020 11:29:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583368179;
 bh=5xu/dzFuNwVikXTzBhBcxMlmER91thjs/7c43G7N2qU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fVDV3f2oU8QzPzeza4hCjA/gjhFcU6eNxr/IRVoMZyAXS0yz7FClzew+zjwmG5VC4
 gdqdOiyO4viO1+SiCAzLFrhyF1EF0YcJ4X+u5ZIAwCbo8Hw5Y+RG5wJO7ZrYKfYh/z
 zZAdyemXORp2N+u1MYOKRV7DGImEv8/J6z0kq9WI=
Date: Thu, 5 Mar 2020 10:55:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>
Subject: Re: [RFC PATCH v1] powerpc/prom_init: disable XIVE in Secure VM.
Message-ID: <20200304235545.GE593957@umbus.fritz.box>
References: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
 <20200302233240.GB35885@umbus.fritz.box>
 <8f0c3d41-d1f9-7e6d-276b-b95238715979@fr.ibm.com>
 <20200303170205.GA5416@oc0525413822.ibm.com>
 <20200303184520.632be270@bahia.home>
 <20200303185645.GB5416@oc0525413822.ibm.com>
 <20200304115948.7b2dfe10@bahia.home>
 <20200304153727.GH5416@oc0525413822.ibm.com>
 <08269906-db11-b80c-0e67-777ab0aaa9bd@fr.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Content-Disposition: inline
In-Reply-To: <08269906-db11-b80c-0e67-777ab0aaa9bd@fr.ibm.com>
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, Ram Pai <linuxram@us.ibm.com>,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2020 at 04:56:09PM +0100, C=E9dric Le Goater wrote:
> [ ... ]
>=20
> > (1) applied the patch which shares the EQ-page with the hypervisor.
> > (2) set "kernel_irqchip=3Doff"
> > (3) set "ic-mode=3Dxive"
>=20
> you don't have to set the interrupt mode. xive should be negotiated
> by default.
>=20
> > (4) set "svm=3Don" on the kernel command line.
> > (5) no changes to the hypervisor and ultravisor.
> >=20
> > And Boom it works!.   So you were right.
>=20
> Excellent.
> =20
> > I am sending out the patch for (1) above ASAP.
>=20
> Next step, could you please try to do the same with the TIMA and ESB pfn ?
> and use KVM.

I'm a bit confused by this.  Aren't the TIMA and ESB pages essentially
IO pages, rather than memory pages from the guest's point of view?  I
assume only memory pages are protected with PEF - I can't even really
see what protecting an IO page would even mean.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5gP/8ACgkQbDjKyiDZ
s5JaxxAAnwIyf0WXC5YzeSjk1V+AVuxL+cTigsJ+1YnlFgSAXo34iO5iCZbKag92
Kz7HmDKLZwtomQ2WFrauUcg32Ui2e5xnfExVEjVQl9rm+8SxF4htjORiCVCkvWXt
mnYEtW4u2nGtMKp90mKysXxKXC+mPAjq1vwgSl5/Jo6pLhpDvagUsxDH3pYDodlo
8ie2CkmOGDOTVmAD9S+cRn/n8DBz4mw82TaWoL2Njes6BqLbkxjjpFW4y7pojHW/
DHzq8f3q+qfoKG3DNwoLACvgTP5XLBlnqBJ0Sds5jmWz1wjHfQxcSP8Qn3g2H+DF
EcA7w64YHAtLzsOrcAxXSkrG5nowiE6sgSKDskVuBFH59lo+5RgaWEJCVO6Nc5sp
HriPGmRJAceJHtNTPF8sbcMAwNSwkfRYcpUTs4dmVUHUg1zfIsn0DorALL9/xy8a
w6yDVfgf6yQGlojatQ7Wz3a43s2JalFf/zCODealfJJlStlCeY5Uw1bX11WdLbJi
AnPygR6PS1FMbEUTM4BJkbICQ3rg2652IpsZd9rsHolEXk1yEpJlbQXpByUETsNq
8tqjzb04gm/a9wBgsKrU1p3hAFJ4sGPsoXj+u17iZfOs9Xb5I4i6YOgXv+6J0OYi
tjSW+Dmu8EImuTpULYbt1j1TjRU9oU/PzN5Jnzi/+uEakQxi3Nc=
=DN2A
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B78D215E56
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 09:39:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ys1F6L38zDqLS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 17:38:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.61.98; helo=8.mo177.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1804 seconds by postgrey-1.36 at bilbo;
 Tue, 07 May 2019 17:37:20 AEST
Received: from 8.mo177.mail-out.ovh.net (8.mo177.mail-out.ovh.net
 [46.105.61.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yrzN3cMBzDqCg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 17:37:16 +1000 (AEST)
Received: from player796.ha.ovh.net (unknown [10.109.159.222])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id E7361EE7BC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 09:01:51 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 65F0A561F73C;
 Tue,  7 May 2019 07:01:46 +0000 (UTC)
Date: Tue, 7 May 2019 09:01:45 +0200
From: Greg Kurz <groug@kaod.org>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Subject: Re: [PATCH] vfio-pci/nvlink2: Fix potential VMA leak
Message-ID: <20190507090145.4be12c82@bahia.lan>
In-Reply-To: <20190507014915.GA10274@tungsten.ozlabs.ibm.com>
References: <155568823785.601037.2151744205292679252.stgit@bahia.lan>
 <20190506155845.70f3b01d@x1.home>
 <20190507014915.GA10274@tungsten.ozlabs.ibm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/40jBTFpoOsFSSaNoBPfpNLC"; protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 3269331857217132982
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrjeelgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
 Alex Williamson <alex.williamson@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/40jBTFpoOsFSSaNoBPfpNLC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 May 2019 11:52:44 +1000
Sam Bobroff <sbobroff@linux.ibm.com> wrote:

> On Mon, May 06, 2019 at 03:58:45PM -0600, Alex Williamson wrote:
> > On Fri, 19 Apr 2019 17:37:17 +0200
> > Greg Kurz <groug@kaod.org> wrote:
> >  =20
> > > If vfio_pci_register_dev_region() fails then we should rollback
> > > previous changes, ie. unmap the ATSD registers.
> > >=20
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > --- =20
> >=20
> > Applied to vfio next branch for v5.2 with Alexey's R-b.  Thanks!
> >=20
> > Alex =20
>=20
> Should this have a fixes tag? e.g.:
> Fixes: 7f92891778df ("vfio_pci: Add NVIDIA GV100GL [Tesla V100 SXM2] subd=
river")
>=20

Oops... you're right.

Alex, can you add the above tag ?

> > >  drivers/vfio/pci/vfio_pci_nvlink2.c |    2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/drivers/vfio/pci/vfio_pci_nvlink2.c b/drivers/vfio/pci/v=
fio_pci_nvlink2.c
> > > index 32f695ffe128..50fe3c4f7feb 100644
> > > --- a/drivers/vfio/pci/vfio_pci_nvlink2.c
> > > +++ b/drivers/vfio/pci/vfio_pci_nvlink2.c
> > > @@ -472,6 +472,8 @@ int vfio_pci_ibm_npu2_init(struct vfio_pci_device=
 *vdev)
> > >  	return 0;
> > > =20
> > >  free_exit:
> > > +	if (data->base)
> > > +		memunmap(data->base);
> > >  	kfree(data);
> > > =20
> > >  	return ret;
> > >  =20
> >  =20


--Sig_/40jBTFpoOsFSSaNoBPfpNLC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAlzRLVkACgkQcdTV5YIv
c9ZGkA/+JZ5PaOPO7i+B9OrZ2lo2PBoFGqJDKD/7eIZh5y6gFUSxEq9SgINn+8gx
MyCzhiLHvVf0BXgkOqEuopploTNUxjQR1bg4JN6RigS1p29g4btDcpkUxcYVIm0E
pHoFxeOFMkTzVuBKY0x4qG0exONoCfWgdZOl1gK8dqudX6h9Emg7fcaJ1O94toOZ
PV2AQ0byBJn5L02oCCdCZOAaRJTKU3LoT0pZlYBtXXFxj/oFewEoGj2bYQBF00fR
NTUMhmU+TDJCIog3hcarH4xI28f42oOmpwWpDLWptPN2Pm0sIUHEkprrag5/jpI+
p9XfxNsCPGK1Y2yDyb38xFAmoDpUkI6P4rKUfgVm2YjzkLFzTSS1pSEE2A4hYDdE
IXTWFwzMz70wJLA4nlLd4vQYdJ03YH8X2vv8B0niH0jtvij3HIJSFYdn9t3T9dMd
3F60y15qKVoM8EYTarlRMDl0nX/5999A/FiWEaj/Kxjh2Fy8U4bdfPAZyvertETL
HIwJbSISfG0Rno53ROXeLR34L1sOkLran70bZYkr+eURURGAEzOaXvfxZcGLa2Km
+e/B9/1ymLIEPLqFURKu7mHqWw8AbUZfgnGdkJUttDRTh+RAbhUEmUT93JtSSl+J
H7s7qa8dFe6Y9v5nc1YglHJpkeSTJs8k8YJlhlvmCNfGPHxpLdE=
=x3tB
-----END PGP SIGNATURE-----

--Sig_/40jBTFpoOsFSSaNoBPfpNLC--

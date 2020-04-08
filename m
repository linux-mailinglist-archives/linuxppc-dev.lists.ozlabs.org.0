Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 302311A1BDF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 08:23:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xvNs18ljzDr0l
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 16:23:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xvMH5HBlzDqmj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 16:22:19 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03864a47133551
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 8 Apr 2020 02:22:16 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3091ykhcy3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 02:22:16 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 8 Apr 2020 07:21:46 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 Apr 2020 07:21:43 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0386L5um16974162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 06:21:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E2F2A405F;
 Wed,  8 Apr 2020 06:22:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5427A4068;
 Wed,  8 Apr 2020 06:22:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 06:22:09 +0000 (GMT)
Received: from osmium (unknown [9.163.60.137])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 653AEA01DF;
 Wed,  8 Apr 2020 16:22:01 +1000 (AEST)
Date: Wed, 8 Apr 2020 16:21:59 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 3/4] powerpc/eeh: Remove workaround from
 eeh_add_device_late()
References: <cover.1585544197.git.sbobroff@linux.ibm.com>
 <252491a9c3fb015383ac757220c5df43d168fe4e.1585544197.git.sbobroff@linux.ibm.com>
 <c7e81c27a6da9f7a4266cec9995b597bce4efc7b.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
In-Reply-To: <c7e81c27a6da9f7a4266cec9995b597bce4efc7b.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20040806-0020-0000-0000-000003C3C716
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040806-0021-0000-0000-0000221C88E8
Message-Id: <20200408062159.GB25852@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 clxscore=1011 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080043
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2020 at 05:08:32PM +1100, Oliver O'Halloran wrote:
> On Mon, 2020-03-30 at 15:56 +1100, Sam Bobroff wrote:
> > When EEH device state was released asynchronously by the device
> > release handler, it was possible for an outstanding reference to
> > prevent it's release and it was necessary to work around that if a
> > device was re-discovered at the same PCI location.
>=20
> I think this is a bit misleading. The main situation where you'll hit
> this hack is when recovering a device with a driver that doesn't
> implement the error handling callbacks. In that case the device is
> removed, reset, then re-probed by the PCI core, but we assume it's the
> same physical device so the eeh_device state remains active.
>=20
> If you actually changed the underlying device I suspect something bad
> would happen.

I'm not sure I understand. Isn't the case you're talking about caught by
the earlier check (just above the patch)?

	if (edev->pdev =3D=3D dev) {
		eeh_edev_dbg(edev, "Device already referenced!\n");
		return;
	}
>=20
> > Now that the state is released synchronously that is no longer
> > possible and the workaround is no longer necessary.
>=20
> You could probably fold this into the previous patch, but eh. You could
> probably fold this into the previous patch, but eh.

True.

> > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > ---
> >  arch/powerpc/kernel/eeh.c | 23 +----------------------
> >  1 file changed, 1 insertion(+), 22 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> > index c36c5a7db5ca..12c248a16527 100644
> > --- a/arch/powerpc/kernel/eeh.c
> > +++ b/arch/powerpc/kernel/eeh.c
> > @@ -1206,28 +1206,7 @@ void eeh_add_device_late(struct pci_dev *dev)
> >  		eeh_edev_dbg(edev, "Device already referenced!\n");
> >  		return;
> >  	}
> > -
> > -	/*
> > -	 * The EEH cache might not be removed correctly because of
> > -	 * unbalanced kref to the device during unplug time, which
> > -	 * relies on pcibios_release_device(). So we have to remove
> > -	 * that here explicitly.
> > -	 */
> > -	if (edev->pdev) {
> > -		eeh_rmv_from_parent_pe(edev);
> > -		eeh_addr_cache_rmv_dev(edev->pdev);
> > -		eeh_sysfs_remove_device(edev->pdev);
> > -
> > -		/*
> > -		 * We definitely should have the PCI device removed
> > -		 * though it wasn't correctly. So we needn't call
> > -		 * into error handler afterwards.
> > -		 */
> > -		edev->mode |=3D EEH_DEV_NO_HANDLER;
> > -
> > -		edev->pdev =3D NULL;
> > -		dev->dev.archdata.edev =3D NULL;
> > -	}
> > +	WARN_ON_ONCE(edev->pdev);
> > =20
> >  	if (eeh_has_flag(EEH_PROBE_MODE_DEV))
> >  		eeh_ops->probe(pdn, NULL);
>=20

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl6NbYcACgkQMX8w6AQl
/iIKGgf/TEeD8ylUlkjuZK/QdNsBFTQ7MNSsSAPmsN4R1C+F/2vvIFE57WxMZpjg
kl8vNfwV2pP6OnkhF9npe6rKoecv4AdXxa+6NL0aol6xh2nXBXvKzJY8or9w38mV
t7kjAlcroWnbVflb7xkrqhFc8B72Y2sdimYIp+Wd8hDmgqPKk2zJsXGphJ2TpOv8
AMy4hgHxgq0XU6VXM2ZzgV3uQtvJ1hsAayNBoe8UgN2JaEqQmgvggqi55qNIHfAm
OzyHZgDi3Z2E0uutLi9A5Nwsr1xJACHUbx0WyDMRf2DiWFXChqcyLPFBMIysSy9M
KgzoaxVcDiEF4VT/1cje2CLpJEuAxA==
=9l94
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--


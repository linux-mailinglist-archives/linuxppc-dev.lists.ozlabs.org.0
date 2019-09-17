Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A36B4530
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 03:17:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XQFp3csszF3l6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 11:17:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XQCw1p1JzF3j7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 11:15:55 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H1Cgf4054211
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:15:52 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v2g7ahxcp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:15:52 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 17 Sep 2019 02:15:50 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 02:15:47 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8H1FKLd35979556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 01:15:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1B1811C04C;
 Tue, 17 Sep 2019 01:15:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1955611C04A;
 Tue, 17 Sep 2019 01:15:46 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 01:15:46 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (unknown [9.81.192.242])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 946CAA019A;
 Tue, 17 Sep 2019 11:15:44 +1000 (AEST)
Date: Tue, 17 Sep 2019 11:15:43 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 07/14] powernv/eeh: Use generic code to handle hot resets
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-8-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Cgrdyab2wu3Akvjd"
Content-Disposition: inline
In-Reply-To: <20190903101605.2890-8-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19091701-0016-0000-0000-000002ACE097
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091701-0017-0000-0000-0000330D813C
Message-Id: <20190917011542.GG21303@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170012
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


--Cgrdyab2wu3Akvjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 08:15:58PM +1000, Oliver O'Halloran wrote:
> When we reset PCI devices managed by a hotplug driver the reset may
> generate spurious hotplug events that cause the PCI device we're resetting
> to be torn down accidently. This is a problem for EEH (when the driver is
> EEH aware) since we want to leave the OS PCI device state intact so that
> the device can be re-set without losing any resources (network, disks,
> etc) provided by the driver.
>=20
> Generic PCI code provides the pci_bus_error_reset() function to handle
> resetting a PCI Device (or bus) by using the reset method provided by the
> hotplug slot driver. We can use this function if the EEH core has
> requested a hot reset (common case) without tripping over the hotplug
> driver.

Could you explain a bit more about how this change solves the problem?
Is it that the hotplug driver's reset method doesn't cause spurious
hotplug events?

(Some other comments below)

>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> I know that include is a bit gross, but:
>=20
> a) We're already doing it in pci-ioda.c, and in pseries/pci.
> b) It's pci_bus_error_reset() isn't really a function that
>    should be provided to non-pci core code.
> ---
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 38 ++++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/=
platforms/powernv/eeh-powernv.c
> index 94e26d56ecd2..6bc24a47e9ef 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -34,6 +34,7 @@
> =20
>  #include "powernv.h"
>  #include "pci.h"
> +#include "../../../../drivers/pci/pci.h"
> =20
>  static int eeh_event_irq =3D -EINVAL;
> =20
> @@ -849,7 +850,7 @@ static int __pnv_eeh_bridge_reset(struct pci_dev *dev=
, int option)
>  	int aer =3D edev ? edev->aer_cap : 0;
>  	u32 ctrl;
> =20
> -	pr_debug("%s: Reset PCI bus %04x:%02x with option %d\n",
> +	pr_debug("%s: Secondary Reset PCI bus %04x:%02x with option %d\n",
>  		 __func__, pci_domain_nr(dev->bus),
>  		 dev->bus->number, option);
> =20
> @@ -907,6 +908,10 @@ static int pnv_eeh_bridge_reset(struct pci_dev *pdev=
, int option)
>  	if (!dn || !of_get_property(dn, "ibm,reset-by-firmware", NULL))
>  		return __pnv_eeh_bridge_reset(pdev, option);
> =20
> +	pr_debug("%s: FW reset PCI bus %04x:%02x with option %d\n",
> +		 __func__, pci_domain_nr(pdev->bus),
> +		 pdev->bus->number, option);
> +
>  	switch (option) {
>  	case EEH_RESET_FUNDAMENTAL:
>  		scope =3D OPAL_RESET_PCI_FUNDAMENTAL;
> @@ -1125,10 +1130,37 @@ static int pnv_eeh_reset(struct eeh_pe *pe, int o=
ption)
>  		return -EIO;
>  	}
> =20
> -	if (pci_is_root_bus(bus) ||
> -	    pci_is_root_bus(bus->parent))
> +	if (pci_is_root_bus(bus))
>  		return pnv_eeh_root_reset(hose, option);
> =20
> +	/*
> +	 * For hot resets try use the generic PCI error recovery reset
> +	 * functions. These correctly handles the case where the secondary
> +	 * bus is behind a hotplug slot and it will use the slot provided
> +	 * reset methods to prevent spurious hotplug events during the reset.
> +	 *
> +	 * Fundemental resets need to be handled internally to EEH since the
> +	 * PCI core doesn't really have a concept of a fundemental reset,
> +	 * mainly because there's no standard way to generate one. Only a
> +	 * few devices require an FRESET so it should be fine.
> +	 */
> +	if (option !=3D EEH_RESET_FUNDAMENTAL) {
> +		/*
> +		 * NB: Skiboot and pnv_eeh_bridge_reset() also no-op the
> +		 *     de-assert step. It's like the OPAL reset API was
> +		 *     poorly designed or something...
> +		 */
> +		if (option =3D=3D EEH_RESET_DEACTIVATE)
> +			return 0;

It looks like this will prevent pnv_eeh_root_reset(bus->parent) (below)
=66rom being called for EEH_RESET_DEACTIVATE, when it was before the
patch. Is that right?

> +
> +		rc =3D pci_bus_error_reset(bus->self);
> +		if (!rc)
> +			return 0;

Is it correct to fall through and try a different reset if this fails?

> +	}
> +
> +	/* otherwise, use the generic bridge reset. this might call into FW */
> +	if (pci_is_root_bus(bus->parent))
> +		return pnv_eeh_root_reset(hose, option);
>  	return pnv_eeh_bridge_reset(bus->self, option);
>  }
> =20
> --=20
> 2.21.0
>=20

--Cgrdyab2wu3Akvjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2AM7gACgkQMX8w6AQl
/iIvQQf7BuwlZCD66kbNGWi2i5K4lN+Um6oRtn5+COHfnjEGNy1i4XBi4TDGFnYR
1Nc6cuTfwyyME0DWDrfny3qy/A3mVVMz2U3dHEq16O1KoIDXpNeB+QdITUK9kKly
mLFemizD3aY7F3jW0+YvnOu3Nz/sW61VJ5XZOPzwZt1DlrueoMfB8xnLZ2/fIDIb
RGOWl2L/Xyt7wiFKQrAMmiEptzR26c6FbnQCWnYef9Q+bLexasojwmbwoHnG7Hvc
Kv6i9Mw/zy0d4seVfe2o8GLF/mMZ8o1/QOX+jtwU2nbm+cGpLAoKR+4FxLvGMyZL
lr8bIR6eAFl/kIJv0JfNMRjzGPPu7A==
=/Rug
-----END PGP SIGNATURE-----

--Cgrdyab2wu3Akvjd--


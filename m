Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5874B4525
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 03:09:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XQ4B4gRzzF3jT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 11:09:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XPzJ2KYVzF3gf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 11:05:00 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H11wiC054487
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:04:57 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2ms4140v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:04:57 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 17 Sep 2019 02:04:56 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 02:04:54 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8H14rXk49414196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 01:04:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 503E2A405F;
 Tue, 17 Sep 2019 01:04:53 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3809A4054;
 Tue, 17 Sep 2019 01:04:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 01:04:52 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (unknown [9.81.192.242])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 78172A019A;
 Tue, 17 Sep 2019 11:04:51 +1000 (AEST)
Date: Tue, 17 Sep 2019 11:04:50 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 06/14] powerpc/eeh: Remove stale CAPI comment
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-7-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CXFpZVxO6m2Ol4tQ"
Content-Disposition: inline
In-Reply-To: <20190903101605.2890-7-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19091701-4275-0000-0000-0000036754FA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091701-4276-0000-0000-00003879B86E
Message-Id: <20190917010449.GF21303@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170010
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
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--CXFpZVxO6m2Ol4tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 08:15:57PM +1000, Oliver O'Halloran wrote:
> Support for switching CAPI cards into and out of CAPI mode was removed a
> while ago. Drop the comment since it's no longer relevant.
>=20
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

LGTM
Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> ---
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/=
platforms/powernv/eeh-powernv.c
> index e7b867912f24..94e26d56ecd2 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -1125,13 +1125,6 @@ static int pnv_eeh_reset(struct eeh_pe *pe, int op=
tion)
>  		return -EIO;
>  	}
> =20
> -	/*
> -	 * If dealing with the root bus (or the bus underneath the
> -	 * root port), we reset the bus underneath the root port.
> -	 *
> -	 * The cxl driver depends on this behaviour for bi-modal card
> -	 * switching.
> -	 */
>  	if (pci_is_root_bus(bus) ||
>  	    pci_is_root_bus(bus->parent))
>  		return pnv_eeh_root_reset(hose, option);
> --=20
> 2.21.0
>=20

--CXFpZVxO6m2Ol4tQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2AMTEACgkQMX8w6AQl
/iKgNAf+OM2oEQWza/pmUNKu9hgpNhI+uSpe1gxgTr94kgtEAei85jt7EPubUCpH
XB+Ld/uMdmAjJfogrDMRcb0KRd0TUHi9bWDwQcqX592/gTgSlFVyTAQEqFJCkCDW
Cl22rNphX0twYFU4ykM4Pcitnc4QfDuqpbOFjTt4YbwRV+XtOqrHakCOnufXNKOO
Sy1ICQRy3ZUTtsU+xO+OQ/PmreefyGERZF0e4L2fXPHnsd2jvxawsISY2/Xk6yd/
f8uOD4s9j5XNY8YQQvgAoJ1a9P811t5skzrshkTZAOmtyWA2r3EULbBfQjxGs+EX
qqMZh8Gr8nJRDHhFXceVJ44ATyigHQ==
=9d9w
-----END PGP SIGNATURE-----

--CXFpZVxO6m2Ol4tQ--


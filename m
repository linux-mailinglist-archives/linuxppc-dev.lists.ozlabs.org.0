Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17860D86EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 05:46:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tJBJ1KYXzDqgj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 14:46:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tJ8947rxzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 14:44:40 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9G3fcoV122870
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 23:44:36 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vnu55rkm7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 23:44:35 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 16 Oct 2019 04:44:34 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 16 Oct 2019 04:44:32 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9G3iVkS36634808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Oct 2019 03:44:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 408CEA4051;
 Wed, 16 Oct 2019 03:44:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E489FA4057;
 Wed, 16 Oct 2019 03:44:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Oct 2019 03:44:30 +0000 (GMT)
Received: from osmium (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5D9C3A01B6;
 Wed, 16 Oct 2019 14:44:27 +1100 (AEDT)
Date: Wed, 16 Oct 2019 14:44:26 +1100
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/eeh: Only dump stack once if an MMIO loop is
 detected
References: <20191016012536.22588-1-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <20191016012536.22588-1-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19101603-0028-0000-0000-000003AA6B0A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101603-0029-0000-0000-0000246C8294
Message-Id: <20191016034426.GA19147@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-16_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910160032
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


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2019 at 12:25:36PM +1100, Oliver O'Halloran wrote:
> Many drivers don't check for errors when they get a 0xFFs response from an
> MMIO load. As a result after an EEH event occurs a driver can get stuck in
> a polling loop unless it some kind of internal timeout logic.
>=20
> Currently EEH tries to detect and report stuck drivers by dumping a stack
> trace after eeh_dev_check_failure() is called EEH_MAX_FAILS times on an
> already frozen PE. The value of EEH_MAX_FAILS was chosen so that a dump
> would occur every few seconds if the driver was spinning in a loop. This
> results in a lot of spurious stack traces in the kernel log.
>=20
> Fix this by limiting it to printing one stack trace for each PE freeze. If
> the driver is truely stuck the kernel's hung task detector is better suit=
ed
> to reporting the probelm anyway.
problem
>=20
> Cc: Sam Bobroff <sbobroff@linux.ibm.com>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Looks good to me (especially because if it's stuck in a loop the stack
trace is going to be pretty much the same every time). I tested it by
recovering a device that uses the mlx5_core driver.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
Tested-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
>  arch/powerpc/kernel/eeh.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index bc8a551013be..c35069294ecf 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -503,7 +503,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
>  	rc =3D 1;
>  	if (pe->state & EEH_PE_ISOLATED) {
>  		pe->check_count++;
> -		if (pe->check_count % EEH_MAX_FAILS =3D=3D 0) {
> +		if (pe->check_count =3D=3D EEH_MAX_FAILS) {
>  			dn =3D pci_device_to_OF_node(dev);
>  			if (dn)
>  				location =3D of_get_property(dn, "ibm,loc-code",
> --=20
> 2.21.0
>=20

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2mkhQACgkQMX8w6AQl
/iJduwf/SIpcUFp990hlMZ+h2pir29aWsP5yGLDD92J/S4Q5lE9fZqnGH4G+LwLR
ArbT0eCSiI/A74Ebkr4pmhX7sGOHhsEUj2zL4SE7V1lfaCHYFgXA3GmQ9OHfpVZO
O77oD2FJ9f9XPQ12Hg2Gc8CIj5c+/NLwxspmi8vHWIOg33PTJQTt8JGf4aOIVyb4
yU1YCxjIs2bGR5Hom+X3LvrON52053m9BEC0SLzClZt7Dj8YDp9lg7NFeHxGV1H8
jlUVk6AW2JRmKq7V780l+HCMIw7/kolQeFdcXX9wPUOpyLkICRyoW1XW4ECOT4Lv
XnWdB+kYTXco1jeG0U3eLBEC5XLEBA==
=hneS
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C93171B358C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 05:32:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496QwQ08PjzDr1x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 13:32:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 496Qtl1MhszDqx6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 13:30:37 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03M33HWM037161
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:30:34 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gfec8733-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:30:34 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 22 Apr 2020 04:29:57 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 22 Apr 2020 04:29:54 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03M3US8w61407296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Apr 2020 03:30:28 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A652F11C058;
 Wed, 22 Apr 2020 03:30:28 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1767E11C05C;
 Wed, 22 Apr 2020 03:30:28 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 Apr 2020 03:30:28 +0000 (GMT)
Received: from osmium (unknown [9.206.180.103])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 48ABFA01EB;
 Wed, 22 Apr 2020 13:30:22 +1000 (AEST)
Date: Wed, 22 Apr 2020 13:30:24 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/eeh: fix pseries_eeh_configure_bridge()
References: <cover.1587361657.git.sbobroff@linux.ibm.com>
 <074529df859e2aae5ee1683e567f708b65e3558d.1587361657.git.sbobroff@linux.ibm.com>
 <874ktc2z3j.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <874ktc2z3j.fsf@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20042203-0008-0000-0000-000003751A14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042203-0009-0000-0000-00004A96E1AA
Message-Id: <20200422033023.GA19544@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_10:2020-04-21,
 2020-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004220024
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 06:33:36PM -0500, Nathan Lynch wrote:
> Sam Bobroff <sbobroff@linux.ibm.com> writes:
> > If a device is hot unplgged during EEH recovery, it's possible for the
> > RTAS call to ibm,configure-pe in pseries_eeh_configure() to return
> > parameter error (-3), however negative return values are not checked
> > for and this leads to an infinite loop.
> >
> > Fix this by correctly bailing out on negative values.
> >
> > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/eeh_pseries.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerp=
c/platforms/pseries/eeh_pseries.c
> > index 893ba3f562c4..c4ef03bec0de 100644
> > --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> > +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> > @@ -605,7 +605,7 @@ static int pseries_eeh_configure_bridge(struct eeh_=
pe *pe)
> >  				config_addr, BUID_HI(pe->phb->buid),
> >  				BUID_LO(pe->phb->buid));
> > =20
> > -		if (!ret)
> > +		if (ret <=3D 0)
> >  			return ret;
>=20
> Note that this returns the firmware error value (e.g. -3 parameter
> error) without converting it to a Linux errno. Nothing checks the error
> value of this function as best I can tell, but -EINVAL would be better
> than an implicit -ESRCH here.

Right, it's never used but I agree. I'll change it for v3.

> And while this will behave correctly, the pr_warn() at the end of
> pseries_eeh_configure_bridge() hints that someone had the intention
> that this code should log a message on such an error:
>=20
> static int pseries_eeh_configure_bridge(struct eeh_pe *pe)
> {
> 	int config_addr;
> 	int ret;
> 	/* Waiting 0.2s maximum before skipping configuration */
> 	int max_wait =3D 200;
>=20
> 	/* Figure out the PE address */
> 	config_addr =3D pe->config_addr;
> 	if (pe->addr)
> 		config_addr =3D pe->addr;
>=20
> 	while (max_wait > 0) {
> 		ret =3D rtas_call(ibm_configure_pe, 3, 1, NULL,
> 				config_addr, BUID_HI(pe->phb->buid),
> 				BUID_LO(pe->phb->buid));
>=20
> 		if (!ret)
> 			return ret;
>=20
> 		/*
> 		 * If RTAS returns a delay value that's above 100ms, cut it
> 		 * down to 100ms in case firmware made a mistake.  For more
> 		 * on how these delay values work see rtas_busy_delay_time
> 		 */
> 		if (ret > RTAS_EXTENDED_DELAY_MIN+2 &&
> 		    ret <=3D RTAS_EXTENDED_DELAY_MAX)
> 			ret =3D RTAS_EXTENDED_DELAY_MIN+2;
>=20
> 		max_wait -=3D rtas_busy_delay_time(ret);
>=20
> 		if (max_wait < 0)
> 			break;
>=20
> 		rtas_busy_delay(ret);
> 	}
>=20
> 	pr_warn("%s: Unable to configure bridge PHB#%x-PE#%x (%d)\n",
> 		__func__, pe->phb->global_number, pe->addr, ret);
> 	return ret;
> }
>=20
> So perhaps the error path should be made to break out of the loop
> instead of returning. Or is the parameter error result simply
> uninteresting in this scenario?

Sounds reasonable to me, and given that the only way I know to trigger
the error path (see the commit message) is not going to be common, I
think a message is a good idea. (And, as one of the people likely to
debug a future issue here, I'll probably appreciate it.)

Cheers,
Sam.

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl6fukkACgkQMX8w6AQl
/iKFkAf+I4xQdT8cKyebBE8ofnDl4YSFvuzOcgEvMFVdnHy6MJfRokxsPrjNUErf
I+Q9jCXaRFgU13EKm5DbpDZ5fA1TiUyplhmfv5CqSdnZao/Kk//9ApB8XBzL47Tn
3sLVpqXzFE+XuX/BjP8WA2rvtA9E52B2jssz0LtxXMZHjKwQ/8a4PcgCHq1KTqtm
5EhbH19mWdKzZAqPjdKaUkveMprb6V2zk5OYDWi7FbV8QxOnKP7K4ZZ8p5IoPJJe
YBC6s9lp9YXKwQJjngujVTvjN44eACGKXge5oO7jwh9oBtv7u9DPG8ELT5VOGzoy
fnAUcj9tonOJgIWBPyhFV+Q6UaFNXg==
=NFVq
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--


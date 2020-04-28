Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BD71BB43B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:57:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5s611qKzDr2P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:56:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B5CB3KnTzDqWM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:27:33 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03S232Ib152071
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 22:27:29 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mguvfwvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 22:27:29 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03S238kX152323
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 22:27:29 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mguvfwux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 22:27:29 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03S2K7ZB014031;
 Tue, 28 Apr 2020 02:27:26 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 30mcu5n2s1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 02:27:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03S2QFPE656098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 02:26:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5A5BA4055;
 Tue, 28 Apr 2020 02:27:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92AB1A4040;
 Tue, 28 Apr 2020 02:27:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 02:27:23 +0000 (GMT)
Received: from osmium (unknown [9.206.152.45])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 706FFA01AE;
 Tue, 28 Apr 2020 12:27:17 +1000 (AEST)
Date: Tue, 28 Apr 2020 12:27:20 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v3 1/3] powerpc/rtas: Export rtas_error_rc
Message-ID: <20200428022719.GA28815@osmium>
References: <cover.1587704308.git.sbobroff@linux.ibm.com>
 <e9c245df4a0b1cd1f68171c81e0d9e64a13ab0e9.1587704308.git.sbobroff@linux.ibm.com>
 <874kt8lve8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <874kt8lve8.fsf@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_17:2020-04-27,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280014
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


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 11:07:43AM -0500, Nathan Lynch wrote:
> Sam Bobroff <sbobroff@linux.ibm.com> writes:
> > Export rtas_error_rc() so that it can be used by other users of
> > rtas_call() (which is already exported).
>=20
> This will do the right thing for your ibm,configure-pe use case in patch
> 2, but the -900x =3D> errno translations in rtas_error_rc() appear
> tailored for the indicator- and sensor-related calls that currently use
> it. From my reading of PAPR+, the meaning of a -900x RTAS status word
> depends on the call. For example, -9002 commonly means "not authorized",
> which we would typically translate to -EPERM, but rtas_error_rc() would
> translate it to -ENODEV.
>=20
> Also the semantics of -9001 as a return value seem to vary a bit.
>=20
> So I don't think rtas_error_rc() should be advertised as a generically
> useful facility in its current form.
>=20
> (I have had some thoughts about how firmware/hypervisor call status can
> be translated to meaningful Linux error values without tedious switch
> statements, which I'm happy to expand on if anyone is interested, but I
> don't want to hijack your submission for that discussion.)

Ah, interesting.

I'll do another version as you suggest.

Cheers,
Sam.

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl6nlH8ACgkQMX8w6AQl
/iKtowf8DYrHxzCoUjW3zXcK8sx/k0cDfWpW8TnxXcRXoYuT/qezxf4AXqpxIQrH
Mar/ro2cVsKYryC6xwp6FhdLYQ+zIKEy2/Rr3eIIfh+WcmYQswAtl8tXlWWxAQ8Z
yYJDoA26lgUnkW8uk2z9W1fKyLelyKi7Vl8LQGYYQfm01MJ/xwVNQ5wsjlCwCqUc
ODkHWp+XjGDab4m1apB/V7hXYQUUAKgffhYr7ni8waJ0DsCKX3d+oPfDZEP32pjz
NRtOMhTRAq6XePNgx9ACpPXcAMmcYHU4ckD4sdDq7t0ms6fd/MWGbaTNQGTn7O/u
eWy8QXeq41Jz+NDUO0CPc5pgK1LMDw==
=B5t4
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--


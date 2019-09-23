Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F11BBBB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 20:37:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cY2z2yNYzDqLg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 04:37:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cY0d1vmxzDqCx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 04:35:29 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NIRme7091354; Mon, 23 Sep 2019 14:35:26 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v72wrh5fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 14:35:26 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8NIVMc1031145;
 Mon, 23 Sep 2019 18:35:25 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 2v5bg73544-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 18:35:25 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NIZNdQ40042852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 18:35:23 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83E1ABE04F;
 Mon, 23 Sep 2019 18:35:23 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAAABBE051;
 Mon, 23 Sep 2019 18:35:22 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.184])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 18:35:22 +0000 (GMT)
Message-ID: <8da27002e60b1c974836fa418b2b54a6f38fcdde.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc: kvm: Reduce calls to get current->mm by
 storing the value locally
From: Leonardo Bras <leonardo@linux.ibm.com>
To: PaulMackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Sep 2019 15:35:21 -0300
In-Reply-To: <5af478e1da6c0b847fbaf3aff6ccce5720e8a23c.camel@linux.ibm.com>
References: <20190919222748.20761-1-leonardo@linux.ibm.com>
 <5af478e1da6c0b847fbaf3aff6ccce5720e8a23c.camel@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-a1Mf0lh3sh8GXIMVDSuA"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=818 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230159
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-a1Mf0lh3sh8GXIMVDSuA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-09-19 at 23:47 -0300, Leonardo Bras wrote:
> Hello Paul,=20
> I sent this patch, but I have a question:
>=20
> > +	mm =3D current->mm;
>=20
> Here, current->mm is not always the same as kvm->mm?=20
> Thanks


I have contacted Paul, who said it is equivalent. But I think I will
deal with that on another patch series, as it's another issue.

Could you please provide feedback on this patch?

Best regards,=20
Leonardo Bras

--=-a1Mf0lh3sh8GXIMVDSuA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2JEGkACgkQlQYWtz9S
ttQyKRAAxGmTSogSImTnITEp4Cq3rTR33mthlkoEl6yfulhu4l8UIk34zME+4AFf
GWb7Sd2we/IGxhxH0IM3JSj6qtUZOxeW1RgtNefYCrIx8/YEqm0e1nZBcGC90BVl
vdHCgjt5d4KKZxqcVW0eKqieSumTHTdomxS9ZLASrF9j0Ciep3ZF+C1aNC5SPdXh
MY9NqXFiHA9bgxydq3Icjw6+c8MHO+NXfx2vMaZG1jxfdbCYYi/b7/7w9AkMewtq
euhMIEkkpVU/fhyivmrNeihiLM7uVfDRfhzFJkNZN2j/tGdbmai4Zvc3RMaI7SNf
y7lC/sJx40J3pqkOVU01mwq79kIWCd0iLuNiIhky9G2b9Bgy4Q2FdSkMvpIr7xdd
niHA8r/n///sk/E9gPUL6sqqi1UXgLBLQCfTf4nlI5O5QQZUjjzwKxNGHKCvI/sF
8q+wKD3ttLCXG1UxsVtusaF6gizdC2C8o7Tng18XKdfsguvem1pQw3vMzsV+ANWj
4oRx8j0D5s8PVVxfzwyA+kLPWeXAeHPaEiKWnFXnxifdA7yB5iI4mABVye3P8p1K
6Dp4DgmCkDJsY3p9Hmbxn+poFpovucfUH/+qfTZCjAycz9cbGJoYNc3/FJgc22GN
kFNOLmKUkRs4M7lb544NbBWGTDUCuUcxvTtVIdPFGPzQZKj/ncE=
=ub7Y
-----END PGP SIGNATURE-----

--=-a1Mf0lh3sh8GXIMVDSuA--


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B76BBBBC2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 21:20:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cZ0Y2f4XzDqJs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 05:20:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cYqh4kJ2zDqF5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 05:12:47 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NJCcUa070698; Mon, 23 Sep 2019 15:12:38 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v72wrj6gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 15:12:38 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8NJAU2E010098;
 Mon, 23 Sep 2019 19:12:32 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 2v5bg73f36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 19:12:32 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NJCV1l55181634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 19:12:31 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D623AC062;
 Mon, 23 Sep 2019 19:12:31 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D446FAC059;
 Mon, 23 Sep 2019 19:12:30 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.184])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 19:12:30 +0000 (GMT)
Message-ID: <9f635f0348bc29274cfca573f5cd297bcd50a8e0.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc: kvm: Reduce calls to get current->mm by
 storing the value locally
From: Leonardo Bras <leonardo@linux.ibm.com>
To: PaulMackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Sep 2019 16:12:26 -0300
In-Reply-To: <8da27002e60b1c974836fa418b2b54a6f38fcdde.camel@linux.ibm.com>
References: <20190919222748.20761-1-leonardo@linux.ibm.com>
 <5af478e1da6c0b847fbaf3aff6ccce5720e8a23c.camel@linux.ibm.com>
 <8da27002e60b1c974836fa418b2b54a6f38fcdde.camel@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-S9Il0xSlMXtX+sMnu/9N"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=848 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230164
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


--=-S9Il0xSlMXtX+sMnu/9N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-23 at 15:35 -0300, Leonardo Bras wrote:
> Could you please provide feedback on this patch?

I have done a very simple comparison with gcc disassemble:
By applying this patch, there was a reduction in the function size from
882 to 878 instructions.

--=-S9Il0xSlMXtX+sMnu/9N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2JGRoACgkQlQYWtz9S
ttRLoA//Zh5DTWvpKnXoQsuE35nXRS3iXFegz7gIAWIAXBbESJdsTECkQA+D98wu
81suJuR7/n0t2Mk4NIi0/TGTF4W+4CFZUisCSMjDF2vJxHJFMaPfMBhp6F75Czd8
s6Ee0bsGvqPf25VHo98gy/jZZK2/ngPjvxziLWZL6eYOYG+jt3oQpx2L8PtrAOP5
+eDSaIPCDOxkHDaduxf+Y8y4i1Mp8wI5E4t3zLsf+gZfsa7uL1hyL+kaazSoxGBY
K98hDFX9LG4Js2xOA81V3b/FKXQyvnwCmjK9QoyNYKOeE9DrQ4XBcvDyXkkltPJF
YR2setLxATXoytOtqU+jYz4qjsaJYXIL25eLZXA7IoXRexbBgZrqMQGMl/YTVwfm
S5sgIvxlHatXS88/k7F+KtEheLyHIsH4y0EclI4OJSCFrIFKIGwH8RGBjkuLm1/3
3ftcZBiPG1oxanK7qUY+Dr9qFaIOrqL24Ah+tsB+iRyVzdCm1euRakRp30Kzb+gx
BGWMekNJZ/2kakau8xn8alzm8P0k8Q1JzkRO/T0TEqGtlsaGAmUfD+aYFbigMmBt
EXtYsrLHcvovBSs/lbavZFhvzCna3t13rIJjm0G9vHdvjWpRd2eTjEz64C4hGFp8
aAFgmu6BPZCCDZNbYs94Pk+/nqzjYpq3JMoITHXswHl/N5u86Iw=
=x03n
-----END PGP SIGNATURE-----

--=-S9Il0xSlMXtX+sMnu/9N--


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF110B318
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 17:22:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NQzQ5TrGzDqx2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 03:22:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NQxK1XhlzDqwf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 03:20:52 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARGEEC6069557; Wed, 27 Nov 2019 11:20:43 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxqga9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 11:20:42 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xARGG1Ve002859;
 Wed, 27 Nov 2019 16:20:42 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 2wevd6yn7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 16:20:42 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xARGKf5S40829398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 16:20:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50202AC075;
 Wed, 27 Nov 2019 16:20:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F5F8AC06A;
 Wed, 27 Nov 2019 16:20:40 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.137])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 Nov 2019 16:20:40 +0000 (GMT)
Message-ID: <411c748246960afffca0eb286ec938559a196852.camel@linux.ibm.com>
Subject: Re: [PATCH v3 0/2] Replace current->mm by kvm->mm on powerpc/kvm
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 27 Nov 2019 13:20:36 -0300
In-Reply-To: <20191126223631.389779-1-leonardo@linux.ibm.com>
References: <20191126223631.389779-1-leonardo@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-3OQMnFYPQ7WcaTZttaSk"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_04:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=821
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270138
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-3OQMnFYPQ7WcaTZttaSk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Result of Travis-CI testing the change:
https://travis-ci.org/LeoBras/linux-ppc/builds/617712012

--=-3OQMnFYPQ7WcaTZttaSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl3eolQACgkQlQYWtz9S
ttQ7VQ/+PYOk1QHYIqz2IyCZceHcgPOmksF23eax+OWuyrGmQZ/zr+Cm81pBxuGw
QYdqIddtUZw9caS0mLayvf8luPFa5r4+4FLXCn+pHFLQG6GXKLYSXFNEujBaL+0o
bZQ+N1wMnvZSlIX2AlIE/kMsPOLhWRMzod+DlYmDZsV8cJn1xBYa8P5C/VSXIdL8
EmVQOrraDle33dNBxop28sf09sFdnNBUYMWP/rllJ6evVWrmATRjMbkco2HZpj6O
36CYbnI1CV5ETpjXxWQKLOy0WBPg021LJdedlqci3uRdwqxyFDyfwdaO9PNgDdNq
uypw+FLG7kAzcF4ePrCMUVknUmpTbiby8vw19gj2ekOskfNp6n5RRML7U4WIcFWE
3WzNnYks13zrvxr8ucLsoHUGqPOwJ1XIwbPo9PjN8ic9DAmQ/lWkW8SSzS2+BMWq
ekj1FEMA4Kn/35bh4m7lbKJkpamKVqMmeWCXb2Pe4DKwjyY1UCImnlQBQEO654qO
ompS7yuCUAhZ387iFxZ+GAyHBeg6XOg1sE2nEjPnYuVFXVMnkVHatsekNxyQQdgk
o1BlxhlBntj6LQBJ3lV5xSHRaVf4lDCe3p3AB7DJkXyHTpbXYnCPNOXNkCxWcqpj
vjbP95uPFEnqDI0nKIyfdEGQ/+E2HXuH80ugOQe/cXa2C3jYdGM=
=SLY2
-----END PGP SIGNATURE-----

--=-3OQMnFYPQ7WcaTZttaSk--


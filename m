Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F2C2350
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 16:31:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hlFf2j28zDqK1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 00:31:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hlBj3BywzDqK1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 00:28:45 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8UES0XW067295; Mon, 30 Sep 2019 10:28:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vbjvysrus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Sep 2019 10:28:04 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8UENktC053801;
 Mon, 30 Sep 2019 10:27:18 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vbjvysru8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Sep 2019 10:27:18 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8UEOthJ009512;
 Mon, 30 Sep 2019 14:27:17 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 2v9y57kc4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Sep 2019 14:27:17 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8UERGfb60031398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Sep 2019 14:27:16 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 684CCC6055;
 Mon, 30 Sep 2019 14:27:16 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBE02C605A;
 Mon, 30 Sep 2019 14:27:11 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.58])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 30 Sep 2019 14:27:11 +0000 (GMT)
Message-ID: <5d3ad682f5ef3a7f16fdda9bcd30fbf53194b393.camel@linux.ibm.com>
Subject: Re: [PATCH v4 03/11] mm/gup: Applies counting method to monitor
 gup_pgd_range
From: Leonardo Bras <leonardo@linux.ibm.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Date: Mon, 30 Sep 2019 11:27:10 -0300
In-Reply-To: <20190930110927.nanq2wynvfmq7dhc@box>
References: <20190927234008.11513-1-leonardo@linux.ibm.com>
 <20190927234008.11513-4-leonardo@linux.ibm.com>
 <20190930110927.nanq2wynvfmq7dhc@box>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-5QWWSZPLD+oFKjYyk88w"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-30_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909300151
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
Cc: Keith Busch <keith.busch@intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arch@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm-ppc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-5QWWSZPLD+oFKjYyk88w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-30 at 14:09 +0300, Kirill A. Shutemov wrote:
> On Fri, Sep 27, 2019 at 08:40:00PM -0300, Leonardo Bras wrote:
> > As decribed, gup_pgd_range is a lockless pagetable walk. So, in order t=
o
>      ^ typo
>=20
Fixed, thanks!

--=-5QWWSZPLD+oFKjYyk88w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2SEL4ACgkQlQYWtz9S
ttRgkRAAlYimCAeVA9cvc5HGNEVbfibfjFEgDVu7fY/HjI44ZGaauFSEvLDnnTcz
M4WLEbD8cZ/LBPDP06Q8FuNtSZi1Ov1xVCXB404DodiPDkJG/TyVfO5/E5MsT7tf
1qvSg8n53RfUxpN2WHNKg2eXLStcVwKmoS0otMxkIOPxTRGFk9PchNJ3F3QEQLYE
3JwfwBa8q1d79DY19qiJ2VyqQm5nAAojm1i5JcHEUdMcA/INJgamhRpa5R6vx6Ge
LZHOthO7x+H28Ip32KAmw5ISf8Q0AKEb0rLmIwkCUD0ecO0bp5D7F9KM/J5oBjKO
pkVyqy61ZSdeArRc1M5HoOdI+evIGKSNtDJglyKckC3/KiUfkALvrjNe/USc9j3s
DxvgKE2FNP+I6n2z0C2weHITU9EjKdqPSpVRzRBowUE8rw2o1d+oCurRiGI+Tgm8
z3NEGoIdJFEkmNIvmbDPrRsz6E9viESfOGju8U9Um2Cxr14FJ6xGjGCeGylfgDED
/L7nMZ12gv4DZoJp9UaLlau8hItsneS9ZVgvIEivPDWW+MmB3nN0SNhWjeP7VlMU
jfa8kXlgp+gtsUn+jdwqgSrWDmAN4K4QSrtl0QmWN5GjNSQMEWkm5Jdb3Dk2etmx
JgYiX4UH8m9pdwN6ILWOPT7RnqL1IuV39OvC5Uay30/nlL5roTM=
=65+f
-----END PGP SIGNATURE-----

--=-5QWWSZPLD+oFKjYyk88w--


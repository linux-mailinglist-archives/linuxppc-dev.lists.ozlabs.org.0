Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 785A5BBCC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 22:25:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cbRj2HK8zDqMG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:25:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cbPR2PP8zDqJL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 06:23:37 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NKLptd060389; Mon, 23 Sep 2019 16:23:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v72aqw6as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 16:23:20 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8NKM9tW063386;
 Mon, 23 Sep 2019 16:23:20 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v72aqw6ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 16:23:20 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8NKJKTN027588;
 Mon, 23 Sep 2019 20:23:18 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2v5bg6v1em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 20:23:18 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NKNGNj62259636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 20:23:16 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8847BE051;
 Mon, 23 Sep 2019 20:23:16 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BE51BE04F;
 Mon, 23 Sep 2019 20:23:08 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.184])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 20:23:08 +0000 (GMT)
Message-ID: <c64d34118542d5c2d31b8f6b7802d2a29dac71ef.camel@linux.ibm.com>
Subject: Re: [PATCH v2 11/11] powerpc/mm/book3s64/pgtable: Uses counting
 method to skip serializing
From: Leonardo Bras <leonardo@linux.ibm.com>
To: John Hubbard <jhubbard@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>
Date: Mon, 23 Sep 2019 17:23:03 -0300
In-Reply-To: <1568b3ef-cec9-bf47-edaa-c775c2f544fb@nvidia.com>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-12-leonardo@linux.ibm.com>
 <1b39eaa7-751d-40bc-d3d7-41aaa15be42a@nvidia.com>
 <24863d8904c6e05e5dd48cab57db4274675ae654.camel@linux.ibm.com>
 <4ea26ffb-ad03-bdff-7893-95332b22a5fd@nvidia.com>
 <18c5c378db98f223a0663034baa9fd6ce42f1ec7.camel@linux.ibm.com>
 <8706a1f1-0c5e-d152-938b-f355b9a5aaa8@nvidia.com>
 <dc9fad3577551d34ead36c0f7340a573086c0cab.camel@linux.ibm.com>
 <1568b3ef-cec9-bf47-edaa-c775c2f544fb@nvidia.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-rL8yHUayTEy37kqretQV"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230170
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
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Richard Fontana <rfontana@redhat.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 YueHaibing <yuehaibing@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Keith Busch <keith.busch@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-rL8yHUayTEy37kqretQV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-23 at 12:58 -0700, John Hubbard wrote:
>=20
> CPU 0                            CPU 1
> ------                         --------------
>                                READ(pte) (re-ordered at run time)
>                                atomic_inc(val) (no run-time memory barrie=
r!)
>                           =20
> pmd_clear(pte)
> if (val)
>     run_on_all_cpus(): IPI
>                                local_irq_disable() (also not a mem barrie=
r)
>=20
>                                if(pte)
>                                   walk page tables

Let me see if I can understand,
On most patches, it would be:

CPU 0                            CPU 1
------				--------------
				ptep =3D __find_linux_pte =20
				(re-ordered at run time)
				atomic_inc(val)=20
pmd_clear(pte)
smp_mb()
if (val)
    run_on_all_cpus(): IPI
                               local_irq_disable()=20

                               if(ptep)
                                  pte =3D *ptep;

Is that what you meant?



--=-rL8yHUayTEy37kqretQV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2JKacACgkQlQYWtz9S
ttQNQQ//YZoIqwIEI8Lrj+C7R1TaXBuOjUoK9YNDTE6IjHRf1s5nkhUpn68/joo+
VKKvccIS6lJFZOMq9cpBn8/UtitXlmTwmM3zmfSRzKjXQJZJk2IeioBlB5d16L9q
Y8IS8kojfI3DoDDF5XRGU+FQbwMUqTNkKpvWevAotkldLhE2ZvUkoJSEUM7X4MqQ
C67Pbbgpsz+q5ZcEW6JbAolW6/nQXYCevzRj8hJ1+inreFKp7KoiBsOebVvW4LMD
L6GhEJiKvgFK2HpqEECNApqDDFnPDh0CxELo/sf4J0eV5hVKSkZrpJaJBVUmCQ+9
Z6rn7BHQd/uM0P9bqWvv6+M+IVriOuwNZ/jRe312heD7IlWDccytoqRjo5xfuBUp
PTowmJ/zUUH7bpPEAnVP3qzEqyvMsUKiVuYK9Fxnfx+fMLVokjbXvosRoLJ8+I8d
71xd5iyjyIGRoxntKukRNpwrPoftF7dTVFHTpYwstM7FQXrGEex5wnnLwXGeOwUF
gevW1ayr2mu0u/TchxKO0tvCeu8gVnbiBmtEsJYIXMTAt8RGNqKBcekYnuFUAIuq
hF7Qg2DGeGlwjMwdpWZBNSBv8Fvq45Y/m0ggvH3Ey18WF3rwS9FDWbT/ix4PEJUC
x2GH0X9bTNwrhVLjwRPuHyOVMfulhA1DVbRq+H+/2cNXr6ewLNE=
=DGT/
-----END PGP SIGNATURE-----

--=-rL8yHUayTEy37kqretQV--


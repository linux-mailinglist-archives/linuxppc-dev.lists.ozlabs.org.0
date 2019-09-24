Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2589BD450
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 23:26:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dDly2Y81zDqRy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 07:26:54 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dDhb5PcmzDqcS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 07:23:59 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8OLMPiR010830; Tue, 24 Sep 2019 17:23:28 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7rb85yjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 17:23:28 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8OLNRxq013802;
 Tue, 24 Sep 2019 17:23:27 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7rb85yjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 17:23:27 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8OLJrQf003225;
 Tue, 24 Sep 2019 21:23:26 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 2v5bg7fxwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 21:23:26 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8OLNPd248234754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Sep 2019 21:23:25 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56D91112062;
 Tue, 24 Sep 2019 21:23:25 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53D94112061;
 Tue, 24 Sep 2019 21:23:22 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.184])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 24 Sep 2019 21:23:22 +0000 (GMT)
Message-ID: <3dc42edc28b11e4d5db385a54fb42504200419e5.camel@linux.ibm.com>
Subject: Re: [PATCH v2 11/11] powerpc/mm/book3s64/pgtable: Uses counting
 method to skip serializing
From: Leonardo Bras <leonardo@linux.ibm.com>
To: jhubbard@nvidia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 24 Sep 2019 18:23:18 -0300
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-c9PFKSXiDGZGWudXrzx9"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-24_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909240173
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
Cc: akpm@linux-foundation.org, arnd@arndb.de, rfontana@redhat.com,
 mahesh@linux.vnet.ibm.com, yuehaibing@huawei.com, npiggin@gmail.com,
 rppt@linux.ibm.com, keith.busch@intel.com, jgg@ziepe.ca, paulus@samba.org,
 aneesh.kumar@linux.ibm.com, gregkh@linuxfoundation.org, ganeshgr@linux.ibm.com,
 dan.j.williams@intel.com, ira.weiny@intel.com, tglx@linutronix.de,
 allison@lohutok.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-c9PFKSXiDGZGWudXrzx9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

John Hubbard <jhubbard@nvidia.com> writes:

>> Is that what you meant?
>
> Yes.
>

I am still trying to understand this issue.

I am also analyzing some cases where interrupt disable is not done
before the lockless pagetable walk (patch 3 discussion).

But given I forgot to add the mm mailing list before, I think it would
be wiser to send a v3 and gather feedback while I keep trying to
understand how it works, and if it needs additional memory barrier here.

Thanks!

Leonardo Bras


--=-c9PFKSXiDGZGWudXrzx9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2KiUYACgkQlQYWtz9S
ttSspBAA11Z2a0/2zRU+xWPiaW6sFxxFjaFnFwvFxCB9wbsHmc9TUTKNZ1YwDd0s
cOn1DZpqeQvEgBNCRA0m3KEk6KGdYEcPnCrfd+bZEeowG9WvM4dB3GVhGhrb63yD
LxIbNPRw1fBQOzZiSjxPkYtqMPKieEBHI230yOC+PgUwlnu6J1BJ9APxYPl+x3Vd
U+7Unbd7yFGOZ8ZtqDKVEsy+a7k8Qn/n1sRSAHC+qpPgTXKrghXxVehoVseywjPD
58rBL6aRRxp5W7RI6Av2bE9JhF5fxQ1Js3w4jttv85W3JuSMyXYWZE74bN9WBA23
tYfFTIrOXaFg1fujMOTIj5Dl1rorrf3fKemdcPk0FQqdDcZoXOIInSdsAKtZHKbH
/MRyk95m6wLL1QdkDMvToUdGejqE9BEAaDZql9fvrNUsjp4JF4/J/mcC4XiA1cb8
4xAzAdtT09J7wMREvDhOpDSYk4TXMiY4QhK5vsPOG06cgaRUhQtQ48V7x8APGBT0
DDhQdaon0nPLJmorR6BVzX0tQUlFveTpEh33AHDxvq9olohwJtGJV6lk/SMba+6x
T0TBVwjlnIgcaZ+/WXbayvdxQ6yg7EmC+YO7dVemRiorf8s0QpjtxPLrkRjM0bX2
aANgxH2XZDCog2WuIklRW2s1TEJJdZBcu7WXAwPgbecYNNuGtMs=
=Dohc
-----END PGP SIGNATURE-----

--=-c9PFKSXiDGZGWudXrzx9--


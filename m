Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82401BD3A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 22:34:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dCb74tKwzDqdl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 06:34:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dCY24YXyzDqZq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 06:32:22 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8OKRrN3038274; Tue, 24 Sep 2019 16:31:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7r3wmt3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 16:31:55 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8OKSTYN039974;
 Tue, 24 Sep 2019 16:31:55 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7r3wmt2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 16:31:55 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8OKPCcZ023570;
 Tue, 24 Sep 2019 20:31:54 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 2v5bg7fhnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 20:31:54 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8OKVqM618284982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Sep 2019 20:31:52 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BD89BE058;
 Tue, 24 Sep 2019 20:31:52 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38D13BE04F;
 Tue, 24 Sep 2019 20:31:47 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.184])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 24 Sep 2019 20:31:46 +0000 (GMT)
Message-ID: <a7f5734cc1de3ba3782dabb366caa4c90e722d23.camel@linux.ibm.com>
Subject: Re: [PATCH v2 00/11] Introduces new count-based method for
 monitoring lockless pagetable wakls
From: Leonardo Bras <leonardo@linux.ibm.com>
To: jhubbard@nvidia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 24 Sep 2019 17:31:43 -0300
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-AKm3Fei0Y8ziaORrkknA"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-24_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909240167
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
Cc: jgg@ziepe.ca, tglx@linutronix.de, arnd@arndb.de, gregkh@linuxfoundation.org,
 yuehaibing@huawei.com, keith.busch@intel.com, npiggin@gmail.com,
 rppt@linux.ibm.com, mahesh@linux.vnet.ibm.com, rfontana@redhat.com,
 paulus@samba.org, aneesh.kumar@linux.ibm.com, ganeshgr@linux.ibm.com,
 akpm@linux-foundation.org, ira.weiny@intel.com, dan.j.williams@intel.com,
 allison@lohutok.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-AKm3Fei0Y8ziaORrkknA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

John Hubbard <jhubbard@nvidia.com> writes:
> Also, which tree do these patches apply to, please?=20

I will send a v3 that applies directly over v5.3, and make sure to
include mm mailing list.

Thanks!

--=-AKm3Fei0Y8ziaORrkknA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2KfS8ACgkQlQYWtz9S
ttTENg/9FbAdcMFasHr8pmLuLDrBvsOuhxLszJIWJitmsTHx55F7Hj4FWPxaSsJ/
TypyRyQQq/2Nzy4VNFAZdNeVdUG5/LZHFcRhsgUSp3UXCyIw3y+MnY4DfNuG8ubY
29iQq07xRWPDn5ZBeUD8ogI2AIxd7CftPrWH1yezOWMH0IqI4z4rCaxbp73akwY3
suzvM5Re26oezZL2zftH0LVfPNIkIxQcDl/nz0uqcHGRxTKeVi/kGFdVMhPijfQT
OZfj4k1PulLZPqFHVKWHcBXOYzn4KpMICcIO6LAtdwNr45welm2wTewfmmCr2rLs
9O4jj2j6pqrhwCmRqIJ99bhpTOOMrujAiBYN1j/kVB3BJM9+It6oRqerPjFgI0T2
mamEx9eGW97AlhgNBcOFV0WhvuzTF7o307Dgj7Bu7zjNYKhL+tch9mfTMKZhttjs
adzxwHt7sflB7SiMA/hEr2y4JAWSY9kgO+M+kPdKdMMJ0/SAdq9wkUEs+HZltrzz
PPH35c4v6gzQwGwKgU81b/45t8Kq/A28QuNaOqBUWqnuyGYQNFFrpAPJN5up1Phe
YQVLV8vf5Uf0vp4bl3lrsjTdwq3cvHl2GvZ6pr2n7ecrYNp9GyU2O/PKS1V3573q
icpZIhhdVFdPbPyT7M29xoX8SeKRBoXnCBukYcfhpzS+scD6Iu4=
=CD2e
-----END PGP SIGNATURE-----

--=-AKm3Fei0Y8ziaORrkknA--


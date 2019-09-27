Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E3C0E4F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 01:27:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g7J14BpJzDr39
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 09:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g7G56GyWzDr1R
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 09:26:05 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8RNMM8a117362; Fri, 27 Sep 2019 19:25:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v8w27efrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 19:25:24 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8RNN1oe118011;
 Fri, 27 Sep 2019 19:25:23 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v8w27efrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 19:25:23 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8RNOwfV014224;
 Fri, 27 Sep 2019 23:25:23 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 2v5bg7v3r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 23:25:23 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8RNPMFX53871064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 23:25:22 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FDDDAE062;
 Fri, 27 Sep 2019 23:25:22 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAB83AE05C;
 Fri, 27 Sep 2019 23:25:18 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.58])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 23:25:18 +0000 (GMT)
Message-ID: <ed1a954a67de3b1fa66e921883153622f3446813.camel@linux.ibm.com>
Subject: Re: [PATCH v3 00/11] Introduces new count-based method for
 monitoring lockless pagetable walks
From: Leonardo Bras <leonardo@linux.ibm.com>
To: jhubbard@nvidia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
Date: Fri, 27 Sep 2019 20:25:15 -0300
In-Reply-To: <8fe1ee1abf52719e75902dc7d5cd1e91751eaba7.camel@linux.ibm.com>
References: <8fe1ee1abf52719e75902dc7d5cd1e91751eaba7.camel@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-MbHwrL3A6S40tAt0oPvi"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270202
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
Cc: keith.busch@intel.com, tglx@linutronix.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, yuehaibing@huawei.com, npiggin@gmail.com,
 rppt@linux.ibm.com, mahesh@linux.vnet.ibm.com, jgg@ziepe.ca, paulus@samba.org,
 aneesh.kumar@linux.ibm.com, ganeshgr@linux.ibm.com, akpm@linux-foundation.org,
 ira.weiny@intel.com, dan.j.williams@intel.com, allison@lohutok.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-MbHwrL3A6S40tAt0oPvi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 11:46 -0300, Leonardo Bras wrote:
> I am not sure if it would be ok to use irq_{save,restore} in real mode,
> I will do some more reading of the docs before addressing this.=20

It looks like it's unsafe to merge irq_{save,restore} in
{start,end}_lockless_pgtbl_walk(), due to a possible access of code
that is not accessible in real mode.

I am sending a v4 for the changes so far.
I will look forward for your feedback.

--=-MbHwrL3A6S40tAt0oPvi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2OmlsACgkQlQYWtz9S
ttQSdxAAxb2vcaIJh6GyRJa4P3h6d85JpvByKZBBiNvOp5Lol0AgvQ0skrphW2hM
0COavBu2j4C8+n6NhwOH1gbCZpup8sGrXc7bpMg7+WZ5uE4NyyeIlvUVgerTxrAI
MmHKILew1y5IqmcIGzea+AynytNb20c98joR2EbZ/7S3lruP93C5WLTgb586eHGi
oAtukVuDfOeeM4QzQh8OuT7pJLASLfUE+wBh4ZF25jlIx22TBKiP2k7yAIxOHCSM
bCUxHPinYhxA7IMKgJM98MWd4RsXRH8sQ5j0fajUwrWXqY3DzDu12OYd6KbgiBjG
J+L/UztjLHU0qrlvVwYYzz+y5e8ZbLro1hNlnbT9wsAhKmty0VkOlY1Ml6VH909g
2MTmldoUju1SAE61pMtCBnhGBhdXAU6H4M+H8Ry4Tj5C6TwtJlZ/WgVklxRqrdnN
6B4VsI3DumYzbwsX/Nra6rKLWPpFhK2QJ2KUMi303M9AfPEwjH2mu5fNxBauAOry
Frt17kk6bGWBZcehbkpx9jNxrxBisohc13LHz7o75zd8U5wvoYXLeRmTFXGPCY7M
fxo4s8pNXyEYyfFZ8i7HPXRML6RVQ6I8QqZjV/hhRxoVkipnVScFxgCuEUGdhTei
YnKQbPBBOI/lHVy16zst1+eW/fDo5CkAV003jZc4sIuAzvHjR24=
=RxjC
-----END PGP SIGNATURE-----

--=-MbHwrL3A6S40tAt0oPvi--


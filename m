Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96071B9864
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 22:22:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZlWW1B3lzF43F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 06:22:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZkyW6xlRzF3pD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 05:57:23 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KJqVpw055501; Fri, 20 Sep 2019 15:57:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v51uh8jv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 15:57:06 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8KJv6KE065468;
 Fri, 20 Sep 2019 15:57:06 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v51uh8ju4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 15:57:06 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8KJoH7a013688;
 Fri, 20 Sep 2019 19:57:04 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 2v3vc5rqxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 19:57:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8KJv2SX27394310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 19:57:02 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A23E57805E;
 Fri, 20 Sep 2019 19:57:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00CC57805C;
 Fri, 20 Sep 2019 19:56:57 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.184])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 20 Sep 2019 19:56:57 +0000 (GMT)
Message-ID: <56444e28eeb8e5ca7322112a7c8359d1d89ffe2d.camel@linux.ibm.com>
Subject: Re: [PATCH v2 00/11] Introduces new count-based method for
 monitoring lockless pagetable wakls
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Sep 2019 16:56:56 -0300
In-Reply-To: <20190920195047.7703-1-leonardo@linux.ibm.com>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-zBmeUsHIw6iPjGkcXUp7"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200162
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Keith Busch <keith.busch@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-zBmeUsHIw6iPjGkcXUp7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-20 at 16:50 -0300, Leonardo Bras wrote:
> *** BLURB HERE ***

Sorry, something gone terribly wrong with my cover letter.
I will try to find it and send here, or rewrite it.

Best regards,

--=-zBmeUsHIw6iPjGkcXUp7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2FLwgACgkQlQYWtz9S
ttS4pxAAyLJQGQqLn3/uCt8mF14TTKklTkgtYZYnjrUAkq41RmZdzGrnmqw2Doc6
a++i7yM121uUavh3aOJjh5lzFIg09k56oq6j0yKgbG6bFv78GxgHeoD18Cha6sma
H1GVGCBenJ5MlyVWRv5kMYVEzRJrQ0iB4x0mDeLHChjYOf6tvqlHTNfviTW5/vck
ZuMIrE1XYXjVRwyt6M5IX90gxpck15kz5e+thMr1a0RdXgCpIQSSYfrvcWfhYjQP
rrPooy7AFBb1HlMgkq9T3KNcvauier39RWnHqcoO6HC9hIW8GwDrA+oG0NhdU06z
u11JNHWp1o1K/cVpzpU5keDqUq6yypvoMrxsuqUHnc942ZP9TidK1x1BpxlbP/VR
o7aV7kXjmVPcdLbvzIAtitouyuerZApeC7kh7RcJ8/cz6FE6rQMAvpSc+rT+CJY2
3s/WH8YjND1+j1/1ronLW9wnFgC9/LFXkU1/uIFcZwLjv/PPVcvdXtuKkauCfByp
0M5qjbAKpQYmwGPda9i0M26JyUmIqeVv7XEqz6G3EXEpgJFPUU7YvmLtD6lHZr01
CenwanUxJqI+TCVm1L0dGFq0uhUMUR6BaDKMEtp5Kx5EZF1pXju/OPHMylsQSdHt
fN8APotYSE0C6exwJp6fV2sYVWzX9X1T1PItn7sZEyoj+fwL4qg=
=Fz6o
-----END PGP SIGNATURE-----

--=-zBmeUsHIw6iPjGkcXUp7--


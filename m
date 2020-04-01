Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A2C19AE94
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 17:09:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sqPF4GNGzDrBH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 02:09:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sqM02pqJzDr94
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 02:07:55 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031F4I9S075063; Wed, 1 Apr 2020 11:07:43 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 303uj4gujr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 11:07:43 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031F16GH031835;
 Wed, 1 Apr 2020 15:07:42 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 301x76t8nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 15:07:42 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031F7fWh45613404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 15:07:41 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60210AE05C;
 Wed,  1 Apr 2020 15:07:41 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AE29AE060;
 Wed,  1 Apr 2020 15:07:38 +0000 (GMT)
Received: from LeoBras (unknown [9.85.228.30])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 15:07:37 +0000 (GMT)
Message-ID: <33333c2ffe9fedbee252a1731d7c10cd3308252b.camel@linux.ibm.com>
Subject: Re: [RFC PATCH v2 1/1] powerpc/kernel: Enables memory hot-remove
 after reboot on pseries guests
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Allison Randal
 <allison@lohutok.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>, Thomas Gleixner
 <tglx@linutronix.de>, Michael Anderson <andmike@linux.ibm.com>, Mike
 Rapoport <rppt@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@c-s.fr>, bharata.rao@in.ibm.com
Date: Wed, 01 Apr 2020 12:07:33 -0300
In-Reply-To: <20200305233231.174082-1-leonardo@linux.ibm.com>
References: <20200305233231.174082-1-leonardo@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-VynV9rUX+88/vxShdVMp"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 mlxlogscore=829 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010130
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-VynV9rUX+88/vxShdVMp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-05 at 20:32 -0300, Leonardo Bras wrote:
> ---
> The new flag was already proposed on Power Architecture documentation,
> and it's waiting for approval.
>=20
> I would like to get your comments on this change, but it's still not
> ready for being merged.

New flag got approved on the documentation.
Please review this patch.

--=-VynV9rUX+88/vxShdVMp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6ErjUACgkQlQYWtz9S
ttTBKhAAlHs4fzgLuSqNlQADyKsBH7BIUd0lzkGIYBuyBmswiNXSgvCNjT6Dm5MX
o2xXMdLwhSyg4B82Vjt3ykc5OBqphBtF4X9FBGAag+D0FsodTkmSRIJZgM6uwbn+
RSboIpXmches0B9OLGCW286RWU1aVO2hIZqhWLgORNFsnH8zzYuYHDHhaJ8gXiOA
CrNn0IpTNtdjjsMkxtzoh3FTEgsafcQWmicMhPk3GK6SvF8BkB8xTyADqQgHV95r
5zscp72pYhEO86m1ZEJjUCEkoL4bLlrONeVDD5ZRAG95+Okf5Q6wYDC42rCYoHhH
CqMiLcfnBfow1DExc8nv8yIYGIaMitR2n27sGgzgg6l4CgYrZvHsMyQoxT5umXM7
7sFOsVNND4hnMGs5WEUm5SuSn03tYaV6e59WI8ihiqOk2wsuIqmtPxP7XyA3Aw7d
ocKqN9hajO2ylltq7NeTm1xitlWYShX+BZ0q9Z4/7iyk0Z57QRAi6GBHf+/jmCUc
o68jcF0CIVLZFK/FyXcNMV0ndd2g0Q5OqtJLTbujtV494clWOzTa4zYB/h0QnS49
MSElbBVgbD7JheuCSoHKj5KRL0QPHKAzmGydngqhJiV7ngC3CEbX1ddW5+euZuSb
Hxrrbj9KUDsNm9UoqX11MMzomkjYWZxQzJEcVv1eUXdm4t0NVBs=
=AaxG
-----END PGP SIGNATURE-----

--=-VynV9rUX+88/vxShdVMp--


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D885F161C56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 21:34:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LwhF1yz7zDqjj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 07:34:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LwfR6cWtzDqM6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 07:33:03 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01HKUCgs037248; Mon, 17 Feb 2020 15:32:41 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y6dnt08fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 15:32:41 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01HKUJ43038101;
 Mon, 17 Feb 2020 15:32:41 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y6dnt08fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 15:32:41 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01HKPSse024151;
 Mon, 17 Feb 2020 20:32:40 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 2y68964j7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 20:32:40 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01HKWeOV7406178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Feb 2020 20:32:40 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A311AE05C;
 Mon, 17 Feb 2020 20:32:40 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A18AAE05F;
 Mon, 17 Feb 2020 20:32:37 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.152])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 17 Feb 2020 20:32:36 +0000 (GMT)
Message-ID: <e09b8921d1aade7b9d2aace43fc357bdcd1001bd.camel@linux.ibm.com>
Subject: Re: [PATCH v6 03/11] powerpc/mm: Adds arch-specificic functions to
 track lockless pgtable walks
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton
 <akpm@linux-foundation.org>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Steven
 Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>, Mahesh
 Salgaonkar <mahesh@linux.vnet.ibm.com>, Balbir Singh
 <bsingharora@gmail.com>, Reza Arbab <arbab@linux.ibm.com>, Thomas Gleixner
 <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mike Rapoport
 <rppt@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>
Date: Mon, 17 Feb 2020 17:32:33 -0300
In-Reply-To: <efcf780cee767d0f4b06b56e216725c6bd8d60d4.camel@linux.ibm.com>
References: <20200206030900.147032-1-leonardo@linux.ibm.com>
 <20200206030900.147032-4-leonardo@linux.ibm.com>
 <1311ce1c-7e5a-f7c4-2ab2-c03e124ca1c1@c-s.fr>
 <efcf780cee767d0f4b06b56e216725c6bd8d60d4.camel@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-rjDDfaEpQyTkTpCEQ2uL"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_12:2020-02-17,
 2020-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002170168
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-rjDDfaEpQyTkTpCEQ2uL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-02-07 at 01:38 -0300, Leonardo Bras wrote:
> > Why not make them static inline just like the generic ones ?
> >=20
>=20
> Sure, can be done.  It would save some function calls.
> For that I will define the per-cpu variable in .c and declare it in .h
> All new function can be moved to .h, while changing adding the inline
> modifier.

Just tried doing that, but percpu stuff relies in paca definitions, and
this ends up creating some cyclic dependencies.

I could try to change that, but the amount of change is big and
probably should be dealt in another patchset.

--=-rjDDfaEpQyTkTpCEQ2uL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5K+GEACgkQlQYWtz9S
ttRsOg//QbdkYtnYqYavQzv828W7A3KiHEHqK77HtlTbJXOE5Vj9aU05HPZJp9XT
ck/HXYupAIcMq+qJ8tNQKbu0zHCHxQ4dk7BPRM8RP4dp/bDOGGXqmvJG0toVtumX
mTiJKUSaq7JeacS8xsx7hNZvLvHea/zagFha49BvLj6QajY+GU+CrpMJoaX1o/pc
2mWKJfpLvacLQBQGfKC+t81VKHZC2K2BWpGyS7/MLEw120/n+KQHqaekMcgSaqVU
lngRVDm4dHEZUZbOXjM3tyceMCTp5xTNv9+pS2friqkfXTomMS5ZuSW1O0i/A28m
0TBWXC+kcQq+Bi1IxIqEPYQ3xab6/Xoba11GWD1qzBiUwd/3Xg30bAB9LYJXMwiD
outVyh5BO6w8oSp1q5iHmt3raJLNTYYlG/SZzZCsCKXHr3EALNZvByETJ2j/oGdJ
dbpPDOxmE2jbWMtIBhdjRFBmfmAGCTgRLpCq0hngNPm2sdQTmr9+B5UcWNzJjuks
j1lDiMHOle78bT7GTYifJjVZrgBiB/JuToqBVzBIEgOBcGXiUXGUaDHgpNjKtH9d
MtbmDODl9st9czyK/edN39eHlz4jfK+Z87ZJQVZz93bEjaRI6pRbqgiTVudWGdMN
TISNtFVMgBbLWmgi8HOfs0zz4naMfcorqOhsTIi95qM8ygfs98s=
=rEX5
-----END PGP SIGNATURE-----

--=-rjDDfaEpQyTkTpCEQ2uL--


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 920A819CD5D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 01:09:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tdzv4mf0zDqNK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 10:09:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tdxg42cgzDrQB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 10:07:19 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032N5dOe061784; Thu, 2 Apr 2020 19:07:05 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304hjbtd3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 19:07:05 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 032N74eg068691;
 Thu, 2 Apr 2020 19:07:05 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304hjbtd2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 19:07:04 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 032N6GSv030635;
 Thu, 2 Apr 2020 23:07:04 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 301x777j8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 23:07:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032N72nt52560292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 23:07:02 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0963B78060;
 Thu,  2 Apr 2020 23:07:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 691807805C;
 Thu,  2 Apr 2020 23:06:48 +0000 (GMT)
Received: from LeoBras (unknown [9.85.174.86])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 23:06:47 +0000 (GMT)
Message-ID: <6b4a4a0d4f7af723d0a5a12f4267717a507ce3f0.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] powerpc/kernel: Enables memory hot-remove after
 reboot on pseries guests
From: Leonardo Bras <leonardo@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 02 Apr 2020 20:06:41 -0300
In-Reply-To: <CAOSf1CEihBDDRny5S_7TA5Cqbdgsh6zN=kdq83OSgaLbRphtrg@mail.gmail.com>
References: <20200402195156.626430-1-leonardo@linux.ibm.com>
 <CAOSf1CEihBDDRny5S_7TA5Cqbdgsh6zN=kdq83OSgaLbRphtrg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-LbIuD+NSE0mfSgDYZOtG"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_13:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=930
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020166
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-LbIuD+NSE0mfSgDYZOtG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Oliver, thank you for the feedback.
Comments inline:

On Fri, 2020-04-03 at 09:46 +1100, Oliver O'Halloran wrote:
>=20
> I don't really understand why the flag is needed at all. According to
> PAPR any memory provided by dynamic reconfiguration can be hot-removed
> so why aren't we treating all DR memory as hot removable? The only
> memory guaranteed to be there 100% of the time is what's in the
> /memory@0 node since that's supposed to cover the real mode area.

All LMBs are listed in DR memory, even the base memory.

The v1 of the patch would work this way, as qemu would configure it's
DR memory with (DRC_INVALID | RESERVED) flags and the hot-added memory
with (ASSIGNED) flag. Looking for assigned flag would be enough.

But as of today, PowerVM doesn't seem to work that way.=20
When you boot a PowerVM virtual machine with Linux, all memory is added
with the same flags (ASSIGNED).

To create a solution that doesn't break PowerVM, this new flag was made
necessary.

Best regards,
Leonardo Bras

--=-LbIuD+NSE0mfSgDYZOtG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6GcAEACgkQlQYWtz9S
ttSDaxAAleKBaZ21PxBQBe/pKqmPitbu7ok6nwICUsc9WhvezbRZQX/W9R3ghKQ6
+AcPpO4eVPq6K5kJDP8uPD2SxGGpYcwgDIrPlfInjdM00PzmujceFyAvglXGE6PB
9ZqAEsZsRNZIG5H1ge+H894jdLn+YMqQmO+tdNMyUqd/tSHh+FeXe9tvdM/KERo0
5OdDkFxUEsUD1W57uARIlM67J+/hKdAqgmr6rKnubQ42PsF4qkHussd9T79BiCeL
bEdrkwVKTA5vdrUQND1uzT9tS75lW3pwZNW/JtQmqZaMHri0S+zjlgkueSs/tUUo
X44fCVHs9xxZA0ZN3cQGnDWoASzn5WDvcSCKOhZYowGiSaHBfaoLkDhWBCmR9G+v
lPeGVRx3gLRU91NCPnGYCg4b1rrfGZeyQB8gq4cmA8ejzCbUTCI78ooO3rZwdnmT
evrLS4O3gDAfQXmkAMHYaz/ZV5Vvvc38psj5e7OMiCuxH5T52Fe34C/WWFZewZ9q
tSFP2wQ03SS/BRW5CYhztf3J112vDxfLTD0OnHLWboBAbAlQTR3O//flG6e5y3RA
0aMWA/4YzL0tB/+1/c+UO0Vwmv+GT3HICs8O7ctU2tnowJWk5tBuj1Oz1+Thvn+O
X/tnaZNnjPhv3Y3T0UBYWspFgpjEWqvBbJxhTxnN4TNFZQQsIrI=
=CQXD
-----END PGP SIGNATURE-----

--=-LbIuD+NSE0mfSgDYZOtG--


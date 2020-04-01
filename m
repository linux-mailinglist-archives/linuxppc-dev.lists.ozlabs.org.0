Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAA319B927
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 01:57:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t35b4vSKzDrHt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 10:57:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t3283r60zDrKq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 10:54:08 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031NYt6D027340; Wed, 1 Apr 2020 19:53:49 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 304gsstyww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 19:53:49 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031NpI4U002885;
 Wed, 1 Apr 2020 23:53:48 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 301x77nuq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 23:53:48 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031NrlTM57082224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 23:53:47 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC82E7805E;
 Wed,  1 Apr 2020 23:53:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EA327805F;
 Wed,  1 Apr 2020 23:53:40 +0000 (GMT)
Received: from LeoBras (unknown [9.85.162.156])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 23:53:39 +0000 (GMT)
Message-ID: <e304952f5177f85faff4560ded5aa1dad7af5fe2.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 01 Apr 2020 20:53:31 -0300
In-Reply-To: <20200401092618.GW20713@hirez.programming.kicks-ass.net>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
 <20200401092618.GW20713@hirez.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-KDf7FjQwdoNO4X4hfXtK"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 mlxlogscore=879 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010191
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Enrico Weigelt <info@metux.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-KDf7FjQwdoNO4X4hfXtK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter,=20

On Wed, 2020-04-01 at 11:26 +0200, Peter Zijlstra wrote:
> You might want to add a note to your asm/spinlock.h that you rely on
> spin_unlock() unconditionally clearing a lock.
>=20
> This isn't naturally true for all lock implementations. Consider ticket
> locks, doing a surplus unlock will wreck your lock state in that case.
> So anybody poking at the powerpc spinlock implementation had better know
> you rely on this.

Good idea. I will add this to my changes and generate a v4.

Thank you,

--=-KDf7FjQwdoNO4X4hfXtK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6FKXsACgkQlQYWtz9S
ttT6PRAAlfpMg9qZK9Q7d5BJCzhUZdsE2wsPmmI7ynbk+XKYd4VHECBE6Lf7u1t+
ShKanwxHRz0Bk1UxzP3UBLP5e7twvXcmgrZehNaT2kQd457B40Oli44JsBFZXsi4
inN/HVcPaI+c5imygIb9tlae7hNX6XBfdj0sH4uRXcgafm/dJIRzc8OHUrfPBh7G
GEDP72loBYwOqqt7n6nz03GCeHvV97Lq4frpx8fca70+u7+JH4gK9Hv21/gwuwSA
yfF6vgY4xBMN7aWpeE+lw1A0xVfQv4aw6d4SgkDVUKTPV1jhWP44EfURwcyRl7ID
OhOQ2ppYkuH7AIjCgaAYKClJ9JU/9TCRz2gJJ0/5ebZ6sPdD8fhcpz6WSQQMES6g
mxhjXi2uram2KPf6OCA2TIyxgkRsez8XODU6qqxhV9QPxJjt8x0KeL2oHkl1SU7U
H4u/ckxesRL0eFT/BbMCFaksPyQP9+GgzvRSPqueQHjjsqLf6zotwRCHVdF1diYg
7FWKuFfNLHz19aq7M427+AhNTXhkSqzE5c2qa6MU+DMc31r1XRTJ9nCGB0omQ7h6
NRaBkvn0ZXI0NlTBQXMVtrLfPJucsVM14PbTSgayttDQThAG9ulIHmeFsxQypTv/
pB6LDSZVOdhFNI+RX/hG6GVIXpBoz7yZxeExeFWEYjYoOqMkKu0=
=Ustc
-----END PGP SIGNATURE-----

--=-KDf7FjQwdoNO4X4hfXtK--


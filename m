Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA719C7AE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 19:11:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tV2S54k6zDr5N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 04:10:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tV0R3mB4zDrTf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 04:09:11 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032H2gAF092153; Thu, 2 Apr 2020 13:08:55 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303wrynd13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 13:08:55 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 032H3mV1095632;
 Thu, 2 Apr 2020 13:08:54 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303wrynd0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 13:08:54 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 032H0Lwx011743;
 Thu, 2 Apr 2020 17:08:53 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 301x775361-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 17:08:53 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032H8p0B48628054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 17:08:52 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2FCCBE04F;
 Thu,  2 Apr 2020 17:08:51 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2FABBE051;
 Thu,  2 Apr 2020 17:08:41 +0000 (GMT)
Received: from LeoBras (unknown [9.85.174.86])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 17:08:41 +0000 (GMT)
Message-ID: <f55a7b65a43cc9dc7b22385cf9960f8b11d5ce2e.camel@linux.ibm.com>
Subject: Re: [RFC PATCH v2 1/1] powerpc/kernel: Enables memory hot-remove
 after reboot on pseries guests
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Bharata B Rao <bharata.rao@gmail.com>
Date: Thu, 02 Apr 2020 14:08:33 -0300
In-Reply-To: <CAGZKiBp7qjH1gMOzRuPgX=qcrJs4b7UgBbfxjgzAEpQPZ0nhHQ@mail.gmail.com>
References: <20200305233231.174082-1-leonardo@linux.ibm.com>
 <33333c2ffe9fedbee252a1731d7c10cd3308252b.camel@linux.ibm.com>
 <CAGZKiBp7qjH1gMOzRuPgX=qcrJs4b7UgBbfxjgzAEpQPZ0nhHQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-i8f4uvi3v90YnGQFml2x"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_06:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004020133
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Anderson <andmike@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Bharata B Rao <bharata.rao@in.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-i8f4uvi3v90YnGQFml2x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bharata, thank you for reviewing and testing!

During review of this new flag, it was suggested to change it's name to
a better one (on platform's viewpoint).=20

So I will have to change the flag name from DRCONF_MEM_HOTPLUGGED to
DRCONF_MEM_HOTREMOVABLE.

Everything should work the same as today.

Best regards,
Leonardo

On Thu, 2020-04-02 at 14:44 +0530, Bharata B Rao wrote:
> Looks good to me, also tested with PowerKVM guests.
>=20
> Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>
>=20
> Regards,
> Bharata.

--=-i8f4uvi3v90YnGQFml2x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6GHBEACgkQlQYWtz9S
ttQyYQ/+NdgBvAI56SOX8dvJKl/WTvp1YhbL7cxesekY7fO6l7forA9sloAou3nc
lWl+m7utEqscJBpWY8zTNynIRxeFGjDX8eYLf7+kQj1KWow3PMuKsF2B67vny/G6
ge7wXd+xoPWXcuaaVIJ6p+ObHHRVdb7+fLDz+6DmbNvBn7d6+Q6BgLSRYSbm5eSm
y9wNpBrm7zBdSZ7cc5Ti+umbbMTwdyoatm6FDBKlDDFIP5sSIMoL4mmAOqgLnUsp
cqsafpvekvRsLy7/MUFHCPze4vyw046gbjqmqM8Ek+hUhXpKDm3/Sfy7whiaIzlx
bn5qRi7dZruQvY5FPM30EuOofNc8VLaE+mEZQKhf/DS5InWaiIcr315yd4ccTJ93
WoOTJgGfMgcteXY/GZ95VTajm2k52In92C9aT7kPseYcIvVhpj+o3VNCW+mTKFgI
sj4Wny1+beDCPZR/INod8Mdb5H3FeKfwPnrT8BbizSK9PW1WkeWCAFujznzjYo/j
R+mQ8yrv2i3YQFt+AU4OC9u7eaIBkY4HVwaiuyaD6RmiRR0yC1k6gD7sMaJwCo95
tRtZL2fpZUBhDhzD9oIgAsmUfYk0hw1cXKkbH6sCLycg75aza9aMilf1JEEcliH7
A59SBjaIPPhrf8BXKi3eHjLB6qbTEloeZoxRHPWB/3pNSfQXSwU=
=k2jJ
-----END PGP SIGNATURE-----

--=-i8f4uvi3v90YnGQFml2x--


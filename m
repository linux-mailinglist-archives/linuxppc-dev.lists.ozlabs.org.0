Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17986178B34
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 08:20:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XQJP3v8FzDqVR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 18:20:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XQGh72ZfzDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 18:18:52 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02479nn2143874; Wed, 4 Mar 2020 02:18:46 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj3erqu80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 02:18:45 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0247Ah4i002626;
 Wed, 4 Mar 2020 02:18:45 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj3erqu7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 02:18:45 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0247G3wu030502;
 Wed, 4 Mar 2020 07:18:44 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 2yffk711fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 07:18:44 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0247Ih6456230288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Mar 2020 07:18:43 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDF6FBE051;
 Wed,  4 Mar 2020 07:18:42 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33460BE056;
 Wed,  4 Mar 2020 07:18:39 +0000 (GMT)
Received: from LeoBras (unknown [9.85.177.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  4 Mar 2020 07:18:38 +0000 (GMT)
Message-ID: <621dd76a8e0b449db66ba2c3ad20fb2c743a1f1b.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/kernel: Enables memory hot-remove after
 reboot on pseries guests
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Bharata B Rao <bharata.rao@gmail.com>
Date: Wed, 04 Mar 2020 04:18:32 -0300
In-Reply-To: <CAGZKiBr=8i11YPDn+1y5j6YfGj+tVbbTKakoGje9QQ8TEw9g5g@mail.gmail.com>
References: <20200228060439.52749-1-leonardo@linux.ibm.com>
 <CAGZKiBr=8i11YPDn+1y5j6YfGj+tVbbTKakoGje9QQ8TEw9g5g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-sL1rgkZbhhqGAClQPGna"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_08:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 phishscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040055
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
Cc: ndfont@gmail.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 arbab@linux.ibm.com, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-sL1rgkZbhhqGAClQPGna
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bharata, thanks for this feedback!

On Wed, 2020-03-04 at 10:13 +0530, Bharata B Rao wrote:
> Hi,
>=20
> I tried this a few years back
> (https://patchwork.ozlabs.org/patch/800142/) and didn't pursue it
> further because at that time, it was felt that the approach might not
> work for PowerVM guests, because all the present memory except RMA
> gets marked as hot-pluggable by PowerVM. This discussion is not
> present in the above thread, but during my private discussions with
> Reza and Nathan, it was noted that making all that memory as MOVABLE
> is not preferable for PowerVM guests as we might run out of memory for
> kernel allocations.

Humm, this makes sense.
But with mu change, these pieces of memory only get into ZONE_MOVABLE
if the boot parameter 'movable_node' gets passed to guest kernel.=20

So, even if we are unable to sort out some flag combination that work
fine for both use-cases, if PowerVM don't pass 'movable_node' as boot
parameter to kernel, it will behave just as today.

What are your thoughts on that?

Best regards,

Leonardo Bras

--=-sL1rgkZbhhqGAClQPGna
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5fVkgACgkQlQYWtz9S
ttTcqw/+KygdoD/4CjbE1qeM/UgE8K0p7R0VEctB20M41BvMj0yC4c+sHA+CPbkW
o273+a2KeG6le9K5sp7Gy7ElrSqczN2AuInkYHJ2AezPBw4pDRGTBTp2a91ivGdf
DidQrsx856IW6qouXsqo1NOIwDicuuy12/HCGzqvkFGaY6/89FdihM5FbBTtQ8Ps
DRKJnOwhz5gr0vcYLHtJdfyzuzPM4VzFDIYmTH3+vLgfYvfQFt0S4RqmoEsI0AXR
+u33lx995GzsafkladGDNKbX/v/xt9MRImGdhuHKmH5+ccnR/GankA5W4mOR+hw/
1caHR2Sn5bXlHwtJjL9OslJmPfWIho8D/v9SmRfJIgfE0Br9hNMrl9ttB4V9LmUV
Oe9e3hyyR3F0fVpKLrYvA9KQJ7ocm3I1e2hEwxYphtDiasCVCCFHD/Ue2sHpaNc2
0TcoIsWifC1TBMq2pMWIRVlkdee0B1V6Sj1pmyoRpuH7ZweP41ge2aG4Yw7CDStd
TM7jngOQymRfgLrG1jjSnEjtCEG/ZPSXQVw39Ux7NXXUbEyuA07jYhVXON1J/qgl
kL2RklPet9fjO0UTBE1TKxDepUdGECZHENUZ4q4Bo7uafSDxWY/V6b7AJm7zFZcA
tTL7fYUiZbh9m7DzZZNLyVZXRt6BfMzPlgLjK8nEZXLbvF/n0zQ=
=A/1r
-----END PGP SIGNATURE-----

--=-sL1rgkZbhhqGAClQPGna--


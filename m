Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7461A1BEB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 08:35:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xvfC1NhmzDqWk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 16:35:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xvcK6rJ6zDqHJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 16:33:37 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0386W8Xb051945
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 8 Apr 2020 02:33:35 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3091y9sk2q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 02:33:35 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 8 Apr 2020 07:33:20 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 Apr 2020 07:33:18 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0386WPU826608014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 06:32:25 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3B17A4054;
 Wed,  8 Apr 2020 06:33:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92E20A405B;
 Wed,  8 Apr 2020 06:33:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 06:33:29 +0000 (GMT)
Received: from osmium (unknown [9.163.60.137])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 30E9BA01DF;
 Wed,  8 Apr 2020 16:33:21 +1000 (AEST)
Date: Wed, 8 Apr 2020 16:33:19 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 4/4] powerpc/eeh: Clean up edev cleanup for VFs
References: <cover.1585544197.git.sbobroff@linux.ibm.com>
 <d58f9ba966e402eca73bf437ee39e28007bf7d21.1585544197.git.sbobroff@linux.ibm.com>
 <8a83b90a0cf0889e1c58c33cd2946916a85c5752.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Content-Disposition: inline
In-Reply-To: <8a83b90a0cf0889e1c58c33cd2946916a85c5752.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20040806-0012-0000-0000-000003A07843
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040806-0013-0000-0000-000021DD9C24
Message-Id: <20200408063318.GC25852@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=796 suspectscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080047
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2020 at 04:45:47PM +1100, Oliver O'Halloran wrote:
> On Mon, 2020-03-30 at 15:56 +1100, Sam Bobroff wrote:
> > Because the bus notifier calls eeh_rmv_from_parent_pe() (via
> > eeh_remove_device()) when a VF is removed, the call in
> > remove_sriov_vf_pdns() is redundant.
>=20
> eeh_rmv_from_parent_pe() won't actually remove the device if the
> recovering flag is set on the PE. Are you sure we're not introducing a
> race here?
>=20

Ah, I assume you're referring to the difference between calling
eeh_remove_device() and directly calling eeh_rmv_from_parent_pe(), where
the behaviour for PE's with EEH_PE_KEEP set is subtly different.

I'll take a closer look at it and make sure to explain it better in v2.

--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl6NcCkACgkQMX8w6AQl
/iKV7Qf+PDgMRM3moiUk66UdwnKAx88jWrFydSFTq9u19MHWUtStzTCcyiGV32FF
8fq0yjjTbmtjpu+01l3SkzN+91ayjo0YdBaE2FXov0ZA2YZzu6g6SMvbedV6EZbE
paNewWfpMwN2IFeAqZPvP6VW8um/GcHNXcx4ziznFRTVfyIxhRkEhWfmMo7VeXwQ
EDTpNQj7pbnNITShXwqac0lfamsDhr2HJJ0V2b4xwWhlHRooufWfHHtedhKJA6k9
jni9p3T9Qky3ocxOWS40ku35FnzXC27otBFa4dmZvQS4Po4xm6XN9h9gOyYQB0r5
SJVXVgfq2ZF+lWHd/rm7mRCGQ98xkg==
=N/y4
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--


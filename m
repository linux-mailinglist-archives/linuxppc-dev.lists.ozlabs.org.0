Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58119F913
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 17:43:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wvvT2hRCzDqYk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 01:43:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wvsC3m8tzDr7b
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 01:41:18 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 036FYack057517; Mon, 6 Apr 2020 11:41:11 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 306n24eudc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 11:41:10 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 036FZV37015214;
 Mon, 6 Apr 2020 15:41:10 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 306hv5s2v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 15:41:10 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 036Ff9O254460904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Apr 2020 15:41:09 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 978E0AE062;
 Mon,  6 Apr 2020 15:41:09 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13345AE05F;
 Mon,  6 Apr 2020 15:41:07 +0000 (GMT)
Received: from LeoBras (unknown [9.85.165.246])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  6 Apr 2020 15:41:06 +0000 (GMT)
Message-ID: <6c09a6e1a1f790ad87a2591ff8f8a6e1c7d6b079.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] powerpc/kernel: Enables memory hot-remove after
 reboot on pseries guests
From: Leonardo Bras <leonardo@linux.ibm.com>
To: bharata@linux.ibm.com
Date: Mon, 06 Apr 2020 12:41:01 -0300
In-Reply-To: <20200403143831.GA12662@in.ibm.com>
References: <20200402195156.626430-1-leonardo@linux.ibm.com>
 <20200403143831.GA12662@in.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-9qOAwFiqOabJT4Un+oxn"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_08:2020-04-06,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=537
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=1 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060124
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
 Claudio Carvalho <cclaudio@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Allison Randal <allison@lohutok.net>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-9qOAwFiqOabJT4Un+oxn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bharata,

On Fri, 2020-04-03 at 20:08 +0530, Bharata B Rao wrote:
> The patch would be more complete with the following change that ensures
> that DRCONF_MEM_HOTREMOVABLE flag is set for non-boot-time hotplugged
> memory too. This will ensure that ibm,dynamic-memory-vN property
> reflects the right flags value for memory that gets hotplugged
> post boot.
>=20

You just sent that on a separated patchset, so I think it's dealt with.
Do you have any other comments on the present patch?

Best regards,

--=-9qOAwFiqOabJT4Un+oxn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6LTY0ACgkQlQYWtz9S
ttTE0xAAwC4OgrLJoU37JGHUVnbtvnDoM/soV+/MjQz128yoydIeASSL9FZJBa9I
py00+2vLjFXtLyOqv/JQPLaZmhwmNLJFgykmdVFM2zsM6pWIpASNZ86eSYhbzASn
iw4T38IYMp8BHgb7ajO8R5nUAmPZhDAZCjlXMGgsxOkxfP0Cn2nymoznQAoEy2zf
/Vlzs/8eDHNj6msFXEnTjXt4liG9jp6itoQaLQjGWiXDlAFPvXVcn5pxvu/culPU
sdWmwbo+PHJxEtAarZ95iJH8rbWgtJVUheGsyEILFojhk4yzKp2r5rq/JLMUy96+
3tfxUom7V3tqfEPvfrC5LzFx/Dxr/SPod9mEu6whjcJVK1QJW8s5CBgmA1XBLnWP
fSyUQNCMZCl2S7l1ucqqcNyDXDX3DSHYbbJVOcKkafIhczitLriRJR/fp43s6ysd
4RejaK1Eh+KRc2nkHGvah/p5X7io00fU6WQeXyQGz+EEvTZ7NeUSPV22VDnhfZXN
3v1chC7v8066KkU86fj8N0D//srfnkxEaA1jRgRQ6Sc4YkQPhuprrqqilsVo3dNP
onlowpsjXcMoKFckXYu4d2DC+n++Rb0q4fnX+sEHLAB3r+9LGLwL1yH13MVEI96Q
b/HOVSm2+hTWo/R294Z1YaCDHZjz2ez0gO8KDVitodS1ez3YV7Q=
=VJEq
-----END PGP SIGNATURE-----

--=-9qOAwFiqOabJT4Un+oxn--


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9C686809
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 15:12:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6P540V3Xz3f4k
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 01:12:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bI4IDCcs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bI4IDCcs;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6P483BWKz3bTB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 01:11:51 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311DY3v6038208;
	Wed, 1 Feb 2023 14:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=aDn96LlKb8K5QcSAFpamlmdy+JcfWMZa3JA8M+p7LXg=;
 b=bI4IDCcslIYPAM6zQTmXFe/jqKnZpAeL7EZIaK0CeLJf8cib7taBp2KCxPG7D87eOXl+
 +gZgqJlYIJw6Y7sH+llIIzky89JSOLRpsl7brxAk2pm1YSPeZt5Fxv7ctk71fhpMnW0d
 9Io/W+66PkdCsru7yz7muQE/sIcL8prf1fkpjt2iqpxCnB3VTV7qNJD0fyS8xlmNY2m+
 K92k70N9Mg3n+vgvXRBHE3B2SkhU5TgvJKdIhGzrLX+OBluUkh2sUf0KpxqKtPN6OZtg
 aGpcCjoKyY6Q1dWIFy6vvaKukknWvCkBUtW5PJ7JsSk0dIOEjKSnbHe1gz4J2mZ59+xH Wg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfs31s572-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 14:11:42 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VG30p0001561;
	Wed, 1 Feb 2023 14:11:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3ncvv6bj5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 14:11:38 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 311EBXKX45482332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 14:11:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA6FB2004D;
	Wed,  1 Feb 2023 14:11:33 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B25C20043;
	Wed,  1 Feb 2023 14:11:32 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.38.8])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 14:11:32 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH] powerpc/hv-24x7: Fix pvr check when setting interface
 version
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20230131184804.220756-1-kjain@linux.ibm.com>
Date: Wed, 1 Feb 2023 19:41:21 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <AEDF0612-3814-4FF2-A0CD-5688E496078A@linux.ibm.com>
References: <20230131184804.220756-1-kjain@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ufQXKnf-syMrEo0bKTqPgA6WlFtuyevg
X-Proofpoint-ORIG-GUID: ufQXKnf-syMrEo0bKTqPgA6WlFtuyevg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010120
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 01-Feb-2023, at 12:18 AM, Kajol Jain <kjain@linux.ibm.com> wrote:
>=20
> Commit ec3eb9d941a9 ("powerpc/perf: Use PVR rather than
> oprofile field to determine CPU version") added usage
> of pvr value instead of oprofile field to determine the
> platform. In hv-24x7 pmu driver code, pvr check uses PVR_POWER8
> when assigning the interface version for power8 platform.
> But power8 can also have other pvr values like PVR_POWER8E and
> PVR_POWER8NVL. Hence the interface version won't be set
> properly incase of PVR_POWER8E and PVR_POWER8NVL.
> Fix this issue by adding the checks for PVR_POWER8E and
> PVR_POWER8NVL as well.
>=20
> Fixes: ec3eb9d941a9 ("powerpc/perf: Use PVR rather than oprofile field =
to determine CPU version")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---

Thanks for the fix. Tested on Power8 successfully.
Tested-by: Sachin Sant <sachinp@linux.ibm.com>

> arch/powerpc/perf/hv-24x7.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 33c23225fd54..8c3253df133d 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -1727,7 +1727,8 @@ static int hv_24x7_init(void)
> }
>=20
> /* POWER8 only supports v1, while POWER9 only supports v2. */
> - if (PVR_VER(pvr) =3D=3D PVR_POWER8)
> + if (PVR_VER(pvr) =3D=3D PVR_POWER8 || PVR_VER(pvr) =3D=3D =
PVR_POWER8E ||
> + PVR_VER(pvr) =3D=3D PVR_POWER8NVL)

Do we really need the check for Power8NV?

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C6C810F96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 12:14:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nPfUOQvC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqtD056SZz3cQs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 22:14:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nPfUOQvC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqtCB1gwvz3bvJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 22:13:41 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BDAvr6h009251;
	Wed, 13 Dec 2023 11:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=k6CjTFXWJIr84RlryG2Liyz/KA4rVtYPBM7DanQdn2Q=;
 b=nPfUOQvCbOyYEPsZ4cgBY2jYNfv96Qy87JWyeZm5TTBhbxbLDDXsgRfnbGoVPYD5ET1x
 kCYgWoyZNWi3hLKb7r+9UXpwpevrZO6QhL1fPslD/Brg9q+2Uek9PrPPN5jXyKHymxCm
 RidAjj5xpnM7fhhkw/qftrGHifUmJtd0bMwyrt/NxyFO2RK8e8FSWq281fLoa1haQDDm
 0y3j3QesIb/fS6paJq/KzPohBuhSmRH18hA9c+WL4DeB3/VjUpgOhu038RK1IPD5Jvb+
 eFtehgrTuDU6tSZuxSWX2P5sU60BNvZi6aE8O1hPrQyNwnP6kcsUcVyuBskZRfYH3q+4 OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uybam8gnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 11:13:31 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BDAxAdD013077;
	Wed, 13 Dec 2023 11:13:30 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uybam8gn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 11:13:30 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BD9RqW4028217;
	Wed, 13 Dec 2023 11:13:30 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uw2xyrds7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 11:13:30 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BDBDSFG5308936
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Dec 2023 11:13:28 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EDA820043;
	Wed, 13 Dec 2023 11:13:28 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B43FA20040;
	Wed, 13 Dec 2023 11:13:27 +0000 (GMT)
Received: from localhost (unknown [9.195.46.83])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Dec 2023 11:13:27 +0000 (GMT)
Date: Wed, 13 Dec 2023 16:43:25 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] MAINTAINERS: powerpc: Add Aneesh & Naveen
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20231205051105.736470-1-mpe@ellerman.id.au>
In-Reply-To: <20231205051105.736470-1-mpe@ellerman.id.au>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1702465527.mteq3x5rrz.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vDHpy5ySFQry6vK2ugS3cFpYi0s3OEYL
X-Proofpoint-ORIG-GUID: mmdpQtEA9MFBc9hl3rKmVN4EmhvYyQ2n
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-13_03,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312130081
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
> Aneesh and Naveen are helping out with some aspects of upstream
> maintenance, add them as reviewers.
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Naveen N. Rao <naveen.n.rao@linux.ibm.com>

Thanks,
Naveen

>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea790149af79..562d048863ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12240,6 +12240,8 @@ LINUX FOR POWERPC (32-BIT AND 64-BIT)
>  M:	Michael Ellerman <mpe@ellerman.id.au>
>  R:	Nicholas Piggin <npiggin@gmail.com>
>  R:	Christophe Leroy <christophe.leroy@csgroup.eu>
> +R:	Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> +R:	Naveen N. Rao <naveen.n.rao@linux.ibm.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  S:	Supported
>  W:	https://github.com/linuxppc/wiki/wiki
> --=20
> 2.43.0
>=20
>=20

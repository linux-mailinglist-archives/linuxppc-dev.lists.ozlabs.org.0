Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 149708BDC9F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 09:45:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g1djQz+S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYVg84xXnz3cBG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 17:45:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g1djQz+S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYVfM6FK6z30gp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 17:44:27 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4477ReA6017047
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 May 2024 07:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=MTwRsfX7Iwucs0/4GVQ3DZAeGCn0Dnwdq2kFEslk1gI=;
 b=g1djQz+SXeRFeDxq8+w4Ww3FWyJKyeP5wvkSf1vb/ygpp9NXuA74isZx74+uQXP9hqMN
 rTqM6K3JEkvOVZZvHPks8ejKLoDbhNN5qZirxbOSsvAS+VZrVNcfqr6uL7iLZIWDoBpt
 1jE/PVaU3YKfq6021NgviORDm9fzryNJdL9Z1ptAQBcJnlRLRSnhaMHGLrJCuXtm9FOa
 iyeVpP32jK/GO8sDdCMcosFH8bRMhrBFwoaW80M92i+OO5j2Q3kFicq5cX5k+SWsLJdd
 1EZwheAagH5x19aT7tl3uHNw2WRIrRDnFjCnko2ODd7O98iPOT604R1G6hd1AVGghbHo Zw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xyfww81ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2024 07:44:25 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4474ldB2031316
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 May 2024 07:44:24 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xwybtw2pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2024 07:44:24 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4477iKTj57606430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 May 2024 07:44:22 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D7A920043
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 07:44:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F362320040
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 07:44:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 07:44:19 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.12.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 37991610A6;
	Tue,  7 May 2024 17:44:15 +1000 (AEST)
Message-ID: <3ac41ecada91562132d26d52a0076d1d3c3f7d56.camel@linux.ibm.com>
Subject: Re: [PATCH v1 1/9] selftests/powerpc/dexcr: Add -no-pie to hashchk
 tests
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 07 May 2024 17:44:13 +1000
In-Reply-To: <20240417112325.728010-2-bgray@linux.ibm.com>
References: <20240417112325.728010-1-bgray@linux.ibm.com>
	 <20240417112325.728010-2-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CekdrlIBtr3C198KLypObRW6jlE645y0
X-Proofpoint-ORIG-GUID: CekdrlIBtr3C198KLypObRW6jlE645y0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405070051
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2024-04-17 at 21:23 +1000, Benjamin Gray wrote:
> The hashchk tests want to verify that the hash key is changed over
> exec.
> It does so by calculating hashes at the same address across an exec.
> This is made simpler by disabling PIE functionality, so we can
> re-execute ourselves and be using the same addresses in the child.
>=20
> While -fno-pie is already added, -no-pie is also required.
>=20
> Fixes: ca64da7574f8 ("selftests/powerpc/dexcr: Add hashst/hashchk
> test")
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

This matches the gcc documentation.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Tested-by: Andrew Donnellan <ajd@linux.ibm.com>

>=20
> ---
>=20
> This is not related to features introduced in this series, just fixes
> the test added in the static DEXCR series.
> ---
> =C2=A0tools/testing/selftests/powerpc/dexcr/Makefile | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/testing/selftests/powerpc/dexcr/Makefile
> b/tools/testing/selftests/powerpc/dexcr/Makefile
> index 76210f2bcec3..829ad075b4a4 100644
> --- a/tools/testing/selftests/powerpc/dexcr/Makefile
> +++ b/tools/testing/selftests/powerpc/dexcr/Makefile
> @@ -3,7 +3,7 @@ TEST_GEN_FILES :=3D lsdexcr
> =C2=A0
> =C2=A0include ../../lib.mk
> =C2=A0
> -$(OUTPUT)/hashchk_test: CFLAGS +=3D -fno-pie $(call cc-option,-mno-
> rop-protect)
> +$(OUTPUT)/hashchk_test: CFLAGS +=3D -fno-pie -no-pie $(call cc-
> option,-mno-rop-protect)
> =C2=A0
> =C2=A0$(TEST_GEN_PROGS): ../harness.c ../utils.c ./dexcr.c
> =C2=A0$(TEST_GEN_FILES): ../utils.c ./dexcr.c

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

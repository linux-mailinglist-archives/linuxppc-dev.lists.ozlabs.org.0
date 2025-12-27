Return-Path: <linuxppc-dev+bounces-15017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D58DBCDF3F7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 05:24:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddTrv1288z2yHB;
	Sat, 27 Dec 2025 15:24:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766809455;
	cv=none; b=M8agZpkxcRqYklXH1yVq2kUTKITy+UysULMT2tt7CSY+COPIUDkX/6KAvVeMD8JEUqyNxS/YbTuJpYlHDtEwf6oazczBahnh9+OLW5XB1/XUdGGapLiGpnAHl9nrkIs3ofVEUcMX+i8hOC+SqzNmrQStE8Ca9hAiFhzTg/dDQkmjJ4zBXp3DlWz/Aib1qp7xWtkPTB1pGkts6Nmn07K8qCMf6kQNU3PWjZHjOgDpq8X/1utosf3M2eNzMqhvXEKOX1kn7bdQV3Z5Cs3nkPJgpPPLi0CmSP0VBINvXWY2/94LJOre99Zrf7oq49e4u+rHpH862Ws7Q8uPmIz7jSSgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766809455; c=relaxed/relaxed;
	bh=5DdEX1YTgIvPOO5WD2Py/Chq1JMntpY05upEK5RcVyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LOZvTvUU6s8YHR1kV+zG05HykJpK7QUnsvhdBUB5PiDCTsvUhKYUcrjKSfpydCojIXVXx4FgKn5m0fgEsmKQYAflRKllgVmrtECL2Ap2j89Ox9n6Q85zBrk8JCNPSo69chgMDAZP4QVX0/uxkyBqHO4ipjdxZTKPMMkn52axpL1nWJK6hzg6bLx/ZwRNgb1RvLX9boSmnPiuXTR2vEFiP77nxMt31ke8hl+0EcO2JsT78PhixMoc7NcDexpp9hhr3EcGpoVK5SKSICdHRF6R6Yl9vwJ0r4rzA3Ci+BvTMbWc8d7JLlrsB2T0UR50W4HzaG3x35zig4gA47DlGG99NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ne68CLsV; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ne68CLsV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddTrt2qygz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 15:24:14 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BR2l6Hq019812;
	Sat, 27 Dec 2025 04:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5DdEX1
	YTgIvPOO5WD2Py/Chq1JMntpY05upEK5RcVyA=; b=Ne68CLsVGwzXVKQlrOHXZG
	d7LdfBZ8oWn6WoW5eKHNWOAy2sdW+pUltiESMcfRzyUsmK0FVodSzmzQcN3O6c8w
	7ZC5lrsaJr65S9UWApJ0rouzc1ZllwOXz8cf3YZVTFDZww8FQ79msHtl1qIq/yfl
	aw0PVxcMf9oCu2vcw+zSGBP5nVUcVlXtonimfu/OatK3H5wHeaRRzTlXbfchmRWc
	eBRufYUBlEtBR5nfxVwXjA7CddJKksWJVx1XeJSXGR4XAa2G4AFkIq4Kp5GHsnE0
	vRaTr337mNllJly8OG7StcdD7p+wJewTUFjcP0I8bNUnU/l9vm4VDXXJPqjvZtqA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba6y385p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:24:05 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BR4O50F020353;
	Sat, 27 Dec 2025 04:24:05 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba6y385p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:24:05 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BR3eckk030236;
	Sat, 27 Dec 2025 04:24:04 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b66gyaq2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:24:03 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BR4O2ev42402210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 27 Dec 2025 04:24:02 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 033F720040;
	Sat, 27 Dec 2025 04:24:02 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B937D2004D;
	Sat, 27 Dec 2025 04:23:59 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.124.212.100])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 27 Dec 2025 04:23:59 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        Jan Stancek <jstancek@redhat.com>
Cc: npiggin@gmail.com, linux-kernel@vger.kernel.org, joe.lawrence@redhat.com,
        Christophe Leroy <chleroy@kernel.org>
Subject: Re: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check scripts
Date: Sat, 27 Dec 2025 09:53:58 +0530
Message-ID: <176680916367.22434.15161187191768680949.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
References: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9Cu8oygvYtFmEsOsWs8bAqnAwxjmsMmj
X-Proofpoint-ORIG-GUID: K2gUT1zeRXrKHY0F286Zf1Pi8LYZnnx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDAzNSBTYWx0ZWRfX4zeiVfpQfBa2
 izfmE8RAGcdPwl5CDALgRtYM6PMTg50f0WaoGoiSNu//911Xv7kROXRNPB6xewHemMZFp2M2AQg
 SneSEsrhv7DCzAe9QvKWj0FkMmJ2VW0GnQTFxW5Ccgbj6SceCk31J/tql+kcKLQzIfOfhtMaxbs
 LHusWfaAXfq5yaF88q2W4okNt7Hnsi2m2lIQ+J9kzhlX5DSB3pl6lVcBE14+GdvsJhtPIXf4Nny
 4g1F0gWtwSMUG40K1b24DxX9jZ13wfcVERwDEvdKpZHJVfk8v7/q3mY6I6oX5OsCibLRerMoHpV
 Yp7QSk5Ii2npO8NXNXSAQhh8x+vNAH0ER3bKELE5z5x6uCiRmLALXRszRuzPz1n4FPuy1SSNX0t
 2puX9ybUwQIBQ1vMa8Hc6bFaW2nOrWEKpaw7BD3/BoSp0/YK4cXkzVeLQL0dwHXyBOiezEM3pBM
 XsR/+F6Y+s7fDMrQbFQ==
X-Authority-Analysis: v=2.4 cv=Ht972kTS c=1 sm=1 tr=0 ts=694f5f65 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Vf-B5cKrQQ8z5h6RcZYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2512270035
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 23 Sep 2025 17:32:16 +0200, Jan Stancek wrote:
> 


Applied to powerpc/fixes.

[1/1] powerpc/tools: drop `-o pipefail` in gcc check scripts
      https://git.kernel.org/powerpc/c/f1164534ad62f0cc247d99650b07bd59ad2a49fd

cheers


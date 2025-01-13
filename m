Return-Path: <linuxppc-dev+bounces-5150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C71A0B761
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 13:47:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWsTx6hGcz3cXL;
	Mon, 13 Jan 2025 23:47:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736772437;
	cv=none; b=LVmg9iIWGTj5/ONob7VG0ixlpDg48QFcKyFHlOtBWLrlTirYdERY+OyB26bpUoPLeS3kaiJ4+tkL5Uol8u0Gi/QmFI1Reze1vx3vjihAmCbv8Q6HF7Ne6b0/9M0oySWeZEGMNtR5qYA00caYNnG5ajKiIhiHgvgHFWKrtOs4jtkBhunRg86HG9Z/pXCQUD9Gg1LRZniBUV/Bn+TsSEUGvo1XxSan0vtF0XjMREPQbynZMY8RM7GSVpffFYwG2KUE94RKfLLJh8A+8MYNxBzH7MmMKq6AMR3OKk/OSvKtFExM1oX/syXwFLjPSuFNJQ5g/5JiwDyy8Fh0VZ/qM/aKzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736772437; c=relaxed/relaxed;
	bh=Rn8AADiMEsd7zD/ZbBrlNQdZP2AUtpAmZZJseZrE/+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbXmPuPNbcjQaE46U0XiBdKNhA/dL9XkzjvwED67R0/mAnvU1EHG2auxRMC5tDMyLB8rG3Cu/rBVxgnVd+bd3orj7MkHhFaQZuV3kN2exWYGKP66nC44eoIBLyNp1JyNBfLFf4+dptKPlE2MZrLM/DdDHMk+J8Fbz3oqqWfmI9Kccp3dBrslaWsACLeZDdcOQZYsbuln30bRIjfNUlComTl7bM3T26Je5FPMT9CZXW6crWF/crylCB36B+T06WkIdIe0WK8MYhOtiAW9oD0gp2PqsaxmeB4jqWASBzg6sYzdQ8b5BBMibPnHOciJ0j/Ce/mgH+1vpTe1C8zRadVR8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AJkEJihL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AJkEJihL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWsTw5rkZz3c85
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 23:47:16 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D85qKv001370;
	Mon, 13 Jan 2025 12:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Rn8AAD
	iMEsd7zD/ZbBrlNQdZP2AUtpAmZZJseZrE/+8=; b=AJkEJihLye/AoPQonUQvoC
	mUgz7vNu8KpbPzYg83k4vAKPCFWIu55z0/KVv/k6Nr/CCPGCCImi8mHHcx9oSAnN
	Hxos2gdk727XUOehOxXzf3gn7rrdRm5zgqJTyDevlvCwP/R5YdlozCBueh8a9BZP
	knD8q59z5Rfxqme2q9kqqxgX5lPNVBZJpA+/5DcZgfiroXqkxtRh4ORgKnqW2crl
	6ZVkQ0oNJF7cko5QKZSQbSVoBYX9EVG8rJnEQvYJ6ThPGFavlYl+RXDk/aTYGdh+
	FniMKk+oM91eIm8Fwq4KzXZ3YFF2fRoiSC+QTR+1S4bAb0TkRG4zeTuh8csP57Fw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444y12h3ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:47:04 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50DA09ho016485;
	Mon, 13 Jan 2025 12:47:03 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4445p1du5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:47:03 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DCl1sn56492392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 12:47:01 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46E8B20043;
	Mon, 13 Jan 2025 12:47:01 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 156E220040;
	Mon, 13 Jan 2025 12:46:59 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.10.47])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 12:46:58 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] powerpc/prom_init: Use IS_ENABLED()
Date: Mon, 13 Jan 2025 18:16:56 +0530
Message-ID: <173677229439.52314.8846348433565338007.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218113159.422821-1-mpe@ellerman.id.au>
References: <20241218113159.422821-1-mpe@ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _G8_9YV3beqlphaH3x4qicZhr-EaNfw0
X-Proofpoint-GUID: _G8_9YV3beqlphaH3x4qicZhr-EaNfw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=660 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130105
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 18 Dec 2024 22:31:59 +1100, Michael Ellerman wrote:
> Use IS_ENABLED() for the device tree checks, so that more code is
> checked by the compiler without having to build all the different
> configurations.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/prom_init: Use IS_ENABLED()
      https://git.kernel.org/powerpc/c/200f22fa48a8c670a1ba66d18d810c51055e6ae9

Thanks


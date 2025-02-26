Return-Path: <linuxppc-dev+bounces-6485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A0A454A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 05:47:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2hlY464bz3blV;
	Wed, 26 Feb 2025 15:47:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740545225;
	cv=none; b=jb6QaNp8QivrLuH8qT1jDtPvBh3dEsv1tYk+TKhy3Xb9qXc0JNo0/w0r66Qri6eeXs7mrqJM5DsL8H152a+Hd5fkcgh1RaPB+evsoG7RA4C0EkGOV3YKNcyvBlRnkp4zCpLxTEL090oQjbpMoRXWHFrumXZc9+FluNZ3lyJVaROpRB0hjNEBCHbvvzJGk5/Ng6a4P3DAQtn12jBNAn7fTJ+ITQ728wuq0Rnu3tEAi6oZtEZD1v/4T3WIW5tC9JP7XKcrPUZEirYtarouLa3oj6+VYVS5CoYTdWgZn4aYtCzuEN8j4E7aipxtS/1IuyeiYU8kbgjANqNYx2FnsqgW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740545225; c=relaxed/relaxed;
	bh=QaFeSph5N0ebnv3LOYKdtqVg4TRqnBD3D85gZUv4cFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XNmIios3nyFIWO5VOkdOL+fkCIZVUAysOJgGsteWKQjsC70izX4LO8IKZSChROVdYEpU8An9M/C4Pprj+UeV4Nimwhobpvcb/4f1knBBdrOaKkNa/jJqWyTM0tIKY8fxnM6nvMqb7iQ/LEYkn9+c1a5jOrRwOBzssYNp53AQ3/y5FWITopURSy/fKYnB3lMZJ6UMjGE4iaVWZMghFZQhchZU3J0pNH1yFrQbF5RXjbQhl2U7JBi2xPvMVTAJ+cMIs9ic4LHFjlm/v/8mRIJexofWZWQYJdS2fXn+BxSWxdCDlipMF3eP/WUq2HgqdjacWAkllNSm3iITSC2ErOQx+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KSU1SiCY; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KSU1SiCY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2hlX75bcz3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 15:47:04 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q1ku9h012292;
	Wed, 26 Feb 2025 04:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QaFeSp
	h5N0ebnv3LOYKdtqVg4TRqnBD3D85gZUv4cFM=; b=KSU1SiCYz5NA0v+1jXayLd
	bF7nUKDwM4ibVE5Sn/bVV7rx9DTqZurP5+mNMoMqfj0ZrJ7/mn4XfeMYZwiLD42v
	iL+ySbXauSc7wUjGKPe8rz/CAkkS3btIv3SSytU6PEf/9rb2/j2oMJh4URoNghJQ
	AGxgW5BJEYJ/z2ey9zXjDA66OYu2wCP3foev10HTExGIZtizdkHSFMkgEwJDI8I4
	7DE7Jsf6IxJKHw1428N6yP+BGyoshT42jY4GipwA9H/T6JTd9nfu2sxKPac/WN3s
	ubOgGi/5l5OVJGk5ZrmPghO6T+q7aIfs0JV2Zf1b1bcT+QtvBpy6Q++WUdQ4wZ8Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5ms55q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:54 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51Q4VrWH010807;
	Wed, 26 Feb 2025 04:46:53 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5ms55k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:53 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q3N7iX012597;
	Wed, 26 Feb 2025 04:46:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44ys9yh151-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51Q4koRB43909584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 04:46:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 923AE2004B;
	Wed, 26 Feb 2025 04:46:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C30920040;
	Wed, 26 Feb 2025 04:46:47 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.65.188])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Feb 2025 04:46:46 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/vmlinux: Remove etext, edata and end
Date: Wed, 26 Feb 2025 10:16:45 +0530
Message-ID: <174054508251.1386382.1364395123476522030.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <d1686d36cdd6b9d681e7ee4dd677c386d43babb1.1736332415.git.christophe.leroy@csgroup.eu>
References: <d1686d36cdd6b9d681e7ee4dd677c386d43babb1.1736332415.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-ORIG-GUID: h1D-ohVbxAu52xu1TNcw9a_PFPCAZV83
X-Proofpoint-GUID: Ds3Kf2cycof3AF0ZlB0N86nAvM4Xneyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=700
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260033
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 08 Jan 2025 11:33:44 +0100, Christophe Leroy wrote:
> etext is not used anymore since commit 843a1ffaf6f2 ("powerpc/mm: use
> core_kernel_text() helper")
> 
> edata and end have not been used since the merge of arch/ppc/ and
> arch/ppc64/
> 
> Remove the three and remove macro PROVIDE32.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/vmlinux: Remove etext, edata and end
      https://git.kernel.org/powerpc/c/2c1cbbab626afd2e66ae980eabf610e660cd9126

Thanks


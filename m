Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 445168BFDF7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:07:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bh0ejsCi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZFmN6HKrz3cY2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:07:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bh0ejsCi;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZFlh39Nrz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:06:40 +1000 (AEST)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VZFlh34S6z4x1C
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:06:40 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VZFlh2kmpz4x0K; Wed,  8 May 2024 23:06:40 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bh0ejsCi;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VZFlg4jrRz4wd3;
	Wed,  8 May 2024 23:06:39 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 448Cwiml014019;
	Wed, 8 May 2024 13:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ytIISK4Bc/IuBOt3GOScBf74osEyv/yCW/QfZagz6+A=;
 b=Bh0ejsCiwS1f+BI9lq9oSNTDfPXd09CORQPT6/UerbVBbFtqg+2Jfb5n38jIyO0LIVIW
 USoMg5xgYqHEaFnmpTU3eWTlbPsSX8fbe+JfDfZdovHPy800F489IelcTw6/bme7ZqKt
 jx+9u1KV0pbyVr0oj4yxUHh84vBiPfgvdS3Gggic5X6yzrp3LgfZT276dO6h6xVBHbCM
 Q0NV9VLyy0Xzy8G7T572zdEm16IoiFf9HR0zdZmm2V0v8MpfYW5KN3Pfq0fgQjeYY4rB
 rGiteJBCpwI7VUho9NaizufOf97AxDy0Jmfxja9ysAeGBAQZz5G68iXH5g84JL8zlJw0 VQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y09tv013y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 13:06:37 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 448BcgBW003958;
	Wed, 8 May 2024 13:06:36 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xysgscsc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 13:06:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 448D6Uph49611158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 May 2024 13:06:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F53D2004B;
	Wed,  8 May 2024 13:06:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C80552004E;
	Wed,  8 May 2024 13:06:27 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.56.231])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 May 2024 13:06:27 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 0/2] powerpc: kexec fixes
Date: Wed,  8 May 2024 18:35:56 +0530
Message-ID: <20240508130558.1939304-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PMIFc0PpLcu6iqdiZqny5Dwq9jzGe9rc
X-Proofpoint-GUID: PMIFc0PpLcu6iqdiZqny5Dwq9jzGe9rc
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=629 phishscore=0
 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405080092
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch series fixes two kexec issues.

01/02: Update extra size calculation for kexec FDT to avoid kexec load
failure due to FDT_ERR_NOSPACE while including CPU nodes added post
boot and reserved memory ranges.

02/02: Fix update_cpus_node/core_64.c function to include missing device
nodes under /cpus node with device_type != "cpu".

Note: this patch series is rebased on top of the linux-next/master
to avoid the conflict with the below patch series:
https://lore.kernel.org/all/171509287314.62008.11812494124513471250.b4-ty@ellerman.id.au/

Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>

Sourabh Jain (2):
  powerpc/kexec_file: fix extra size calculation for kexec FDT
  powerpc/kexec_file: fix cpus node update to FDT

 arch/powerpc/include/asm/kexec.h  |  6 ++--
 arch/powerpc/kexec/core_64.c      | 53 +++++++++++++++++++++----------
 arch/powerpc/kexec/elf_64.c       | 12 +++++--
 arch/powerpc/kexec/file_load_64.c | 53 +++++++++++++------------------
 4 files changed, 70 insertions(+), 54 deletions(-)

-- 
2.44.0


Return-Path: <linuxppc-dev+bounces-7900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8CAA96C24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 15:11:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhjL50cDGz3bmk;
	Tue, 22 Apr 2025 23:11:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745327485;
	cv=none; b=bETfdz6moYYFpwiMjGbSioFcxtfKoZXG4f9rIyNZxSf6w/enXbYwSUmsy/HkTz8j7TDfomm7QbXeOl6hCaVQja9BRuGA0w1dqRg0I2pEFzl5YmXl+6wX4E51pVs1DauLOFZChQ2SqsV08bbBtIRpYruTFL3lDKemEaSZr7GDxprE2lAee00d77jtLi3/9kOvkyDOjfWUsAbZtDGtAfLA0tXvj4Ya88aCpAeOfqkF1C7/R/FrmeqZTTN4SuBi8+FbEcLr3Xy7Jk5LoPMc7hg0CAMKq8PHobyZ5cNVLyI4ieWweaiJobYhGBylpuy2T7wHXtHAW5S0BmjyCbaBsk9m1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745327485; c=relaxed/relaxed;
	bh=NFhGgD+bh+/u7NKJrybDxaC9hZpZ6BS2o8RNPUgX6Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eLWszADrHJTtW6NXU4wFuFje92SGgG899H0AcHXzg0+IvI3B+dbksyqXLtVIk8icViN9RnCmXA68D8H0ZjNlwRLNOVGJV+2YyO8uPICKkSb5JmmVuv2jaSZsRAKM+fpS1biiuvI0I0l1Hjlghx+u6ncP5HRwe7VWXcbkZyh1dtDhKKz39xCybeAAqCJXoBmMXOm73HSFa4as/0cBrw7KMl9xWLCKBZtO8IE57l8t8txGy+ZZqJT+WKJWM701zBmO04wf9m46WY+0lELSnG8CFzUO6FWzhS42Y0wVE1k3Hr6+L15X0Knzhmvq/nX0CqbmTWyVbcioAdLCm/X6TcNjfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cA+fOvcC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cA+fOvcC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhjL35WPyz304l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 23:11:23 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MA3xn1026063;
	Tue, 22 Apr 2025 13:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=NFhGgD+bh+/u7NKJrybDxaC9hZpZ6BS2o8RNPUgX6
	Uc=; b=cA+fOvcCrm1YJPFcLwFq3CBYpuVXhdgdAhqwd0D/Bm5lqsYCEJkql6tTp
	Xs8KQbbdjJnel92/YNN5ZaJJg4IXMr4miDeaTxA7DyTanpWY0HIIJkGRENo+i5/e
	6FI8BSk2y9HZa0jc3y67BjrBtRMwhm1sszOCPLthMLiddXtyMwZjDeo1EnYkJZN6
	vlH8rR3u5AuyFMRwyK4MkXH8E+kl3/6ssBdvqO2pLCwZUkj25hiUL1Xjz/DhqXD0
	UepCfBFDHnYs5kH9kUpcS+lzo4NBZjBkJNbUCdd4P0y1Y2REEd3CNkdObXrcEkok
	2Mp2C5r32OcdOg/kALnEcQA1dZTOA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46691hguvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:11 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53MDA5lh007338;
	Tue, 22 Apr 2025 13:11:10 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46691hguv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:10 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53MBYtXF015393;
	Tue, 22 Apr 2025 13:11:09 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464qnkjufn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:09 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MDB70Z53871062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 13:11:07 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E2FC20063;
	Tue, 22 Apr 2025 13:11:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E5F92005A;
	Tue, 22 Apr 2025 13:11:02 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.58.77])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 13:11:00 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@csgroup.eu
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 0/6] Fixes for shellcheck/sparse warnings 
Date: Tue, 22 Apr 2025 18:40:34 +0530
Message-ID: <20250422131040.374427-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=V7h90fni c=1 sm=1 tr=0 ts=6807956f cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=XR8D0OoHHMoA:10 a=n_g77fz-FBAD1igXfXEA:9
X-Proofpoint-ORIG-GUID: pu6qJqA_LxL1Vq5aLiDFGTkf9OYStI_w
X-Proofpoint-GUID: bU_ZO-hkfIMA5XND5WFqMFpAI-xiEp6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 mlxlogscore=571 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220098
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Patchset handles fixes for some of the sparse
and shellcheck warnings.

Madhavan Srinivasan (6):
  powerpc/kvm: Fix sparse warning
  powerpc/xmon: fix sparse warning "Using plain integer as NULL pointer"
  powerpc/perf:make isa207_pmu_format_group struct static
  powerpc: fix sparse warnings
  powerpc/prom_init: Fix shellcheck warnings
  powerpc/boot/install.sh: Fix shellcheck warnings

 arch/powerpc/boot/install.sh             | 14 +++++++-------
 arch/powerpc/kernel/btext.c              |  2 +-
 arch/powerpc/kernel/kvm.c                |  8 ++++----
 arch/powerpc/kernel/prom_init_check.sh   | 16 ++++++++--------
 arch/powerpc/kernel/setup-common.c       |  2 +-
 arch/powerpc/perf/isa207-common.c        |  2 +-
 arch/powerpc/platforms/powernv/opal.c    |  2 +-
 arch/powerpc/platforms/pseries/lparcfg.c |  2 +-
 arch/powerpc/xmon/ppc-opc.c              | 20 ++++++++++----------
 9 files changed, 34 insertions(+), 34 deletions(-)

-- 
2.49.0



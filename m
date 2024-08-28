Return-Path: <linuxppc-dev+bounces-663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 269679622D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 10:53:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtyqB50ksz2yft;
	Wed, 28 Aug 2024 18:52:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724835174;
	cv=none; b=libRwHPhiQSiJcyWXjQocyZG4saakaySyj08hokd3fEN39aZVNdxlKdGkEwmD+tUiw2BaBgGmalgR8+BJE6FwzDaFPGF17etn0V7R3IWXAGcaHwx2Fbg/DU5PsNmDdmYtThsC2ndiMx7XdUt8hFtu1vnN30hmc4T1L7bhF1tTyQw4oMCTCUm1O7EWsh+HReSqdBfWzXw1YtiRhjkwAdMt60XM7D9kp6T7l6YDkXQ/cVej1Wc/bkYDjoN4ZXl7mquJVtKtnH5I858xVDIgJbXYux/k8cYu3FbI+C08Cg2BKr9FRYVusXcC1kctQIpVybefZtp+TlDIObiC/X+e9GArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724835174; c=relaxed/relaxed;
	bh=qUPw0JPfXlNMAdR6fh/QhHIyN2/Nco0wODiHHw3qKV4=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details; b=aJ4XudHEZJb7IV2cj9BuaPe5yTNvp20ygtAJ//1xyp1dP7ZSdr9r2MZZGzAbhvSwhFsncoRswQ39QFmOoabNlcwN5f4M7SOLRs6iFmuMAgoKIYnKrz01yjmvkQrqb8S78XKQHqpVLbcZ+1KPQmR3pExr4d5nprjPwSNzPTS8Soar/Gi55MyZfKL4byIFm/VdRsU7xP/kNI7uBTF0XnMOtSW9ga4fw0gZ8V0Lvphh/iCg3IeHxm0LHlNj39psb1AAK2wgbhgbD5sYu58iTd81KJ4KLFaKED1Mv9FDoeZregx9X6wS+FfvDVF12iyXn7Gzxw4jbg76o2yP/HU+37sFLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tQE7KULx; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tQE7KULx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtyqB2RyXz2xpv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 18:52:54 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RM3LmE023813;
	Wed, 28 Aug 2024 08:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=qUPw0JPfXlNMA
	dR6fh/QhHIyN2/Nco0wODiHHw3qKV4=; b=tQE7KULxIMmzWg0pLooSfrpO+uAoZ
	+jy79kHZyJVTJFUv/M2Q1DTypN9REiaxE+XgsG1RjISJJ00QrjliN7jVp87q/xbV
	GR6+wCQ1oNXOqypxb/SDKW7a3lj8lgKsNjv/ybxAdgF0uKkwQY4aowd58mrNhr7X
	KHS/X8sBT8IzB/S0ASm1T688lESHrTrbXLi23/j9xlZ8JZa45inl41cez93mXfeI
	A+i8gjImh0rSXhLViDXn1H44F8sAnm2zNny6omnr7829oGgMfwlGmTvHusP/xQT7
	MCdvWcKqy1Q9Zflpi/A8my2QrlnBRw2XAMgqsGUPLRPBW5umOcK3/KrDg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8phxph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 08:52:46 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47S8qkRE009287;
	Wed, 28 Aug 2024 08:52:46 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8phxpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 08:52:46 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47S8imTE021761;
	Wed, 28 Aug 2024 08:52:45 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 417suuf0r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 08:52:45 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47S8qelD51839402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2024 08:52:40 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 671AD20043;
	Wed, 28 Aug 2024 08:52:40 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1045F20040;
	Wed, 28 Aug 2024 08:52:38 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.122.25])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Aug 2024 08:52:37 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v3 3/3] powerpc: Document details on H_HTM hcall
Date: Wed, 28 Aug 2024 14:22:23 +0530
Message-ID: <20240828085223.42177-3-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240828085223.42177-1-maddy@linux.ibm.com>
References: <20240828085223.42177-1-maddy@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ctfybHfk-VHliy5_IEsm5Sn09ZvE8WK5
X-Proofpoint-GUID: 25sZ8wOiL2wSmmkpYeGTgzvFciWstvU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408280060

Add documentation to 'papr_hcalls.rst' describing the
input, output and return values of the H_HTM hcall as
per the internal specification.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v2:
- No changes
Changelog v1:
- Updated commit message to include htmdump folder files 

 Documentation/arch/powerpc/papr_hcalls.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
index 80d2c0aadab5..805e1cb9bab9 100644
--- a/Documentation/arch/powerpc/papr_hcalls.rst
+++ b/Documentation/arch/powerpc/papr_hcalls.rst
@@ -289,6 +289,17 @@ to be issued multiple times in order to be completely serviced. The
 subsequent hcalls to the hypervisor until the hcall is completely serviced
 at which point H_SUCCESS or other error is returned by the hypervisor.
 
+**H_HTM**
+
+| Input: flags, target, operation (op), op-param1, op-param2, op-param3
+| Out: *dumphtmbufferdata*
+| Return Value: *H_Success,H_Busy,H_LongBusyOrder,H_Partial,H_Parameter,
+		 H_P2,H_P3,H_P4,H_P5,H_P6,H_State,H_Not_Available,H_Authority*
+
+H_HTM supports setup, configuration, control and dumping of Hardware Trace
+Macro (HTM) function and its data. HTM buffer stores tracing data for functions
+like core instruction, core LLAT and nest.
+
 References
 ==========
 .. [1] "Power Architecture Platform Reference"
-- 
2.45.2



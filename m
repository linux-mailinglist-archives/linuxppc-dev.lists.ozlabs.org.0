Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B1C294A12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 11:02:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGPdf1GhDzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 20:02:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qc2TU5LX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGPSD2FyjzDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 19:54:20 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L84CwA142643; Wed, 21 Oct 2020 04:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Mi6Y/iLFRZuOR/Eg+bdCn0++FplsZtBR991JzqLgUNk=;
 b=qc2TU5LXQo9WeAOLF8t0nFkeq5t8+FPo9H0k68ZIkmJDDHeZR9xZvaDJJB9B5CadDDmT
 GIgxgUJQzIhkSvFUVHkR45ZZs+Zn9iBDql0iJ9WSD6S5aTys1R3tlUVIi3eAb+kWx3n5
 uu6g98istYlv7/OIRzZBxO2hhU1oqDGP1CWa3Ko+WunN+EwGIbGaf2qL5/JaezXN7it2
 +S7OyiRcxzxcxDsVrByGHnjXrpNPTStdEwQ8Bv5Jl2+7trjDTmDRq5GDnKfixETlBMbQ
 wJizGscyRD/CbxVR4yeVGdPOUxJ4CPSVHmUbWoRSt3g3OICuyeQY2M3Dtgn7CXRbZMv+ ng== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34agp9j9m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 04:54:14 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09L8rkhd008754;
 Wed, 21 Oct 2020 08:54:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 347qvhc4hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 08:54:00 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09L8rwph27918768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Oct 2020 08:53:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17081A4065;
 Wed, 21 Oct 2020 08:53:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 871F6A405B;
 Wed, 21 Oct 2020 08:53:56 +0000 (GMT)
Received: from Madhavan.com (unknown [9.85.89.85])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Oct 2020 08:53:56 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 3/5] powerpc/perf: Use the address from SIAR register to set
 cpumode flags
Date: Wed, 21 Oct 2020 14:23:27 +0530
Message-Id: <20201021085329.384535-3-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201021085329.384535-1-maddy@linux.ibm.com>
References: <20201021085329.384535-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_03:2020-10-20,
 2020-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 mlxscore=0
 mlxlogscore=468 spamscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010210065
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

While setting the processor mode for any sample, `perf_get_misc_flags`
expects the privilege level to differentiate the userspace and kernel
address. On power10 DD1, there is an issue that causes [MSR_HV MSR_PR] bits
of Sampled Instruction Event Register (SIER) not to be set for marked
events. Hence add a check to use the address in Sampled Instruction Address
Register (SIAR) to identify the privilege level.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 3b62dbb94796..6be0349e01ad 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -250,10 +250,24 @@ static inline u32 perf_flags_from_msr(struct pt_regs *regs)
 static inline u32 perf_get_misc_flags(struct pt_regs *regs)
 {
 	bool use_siar = regs_use_siar(regs);
+	unsigned long mmcra = regs->dsisr;
+	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
 
 	if (!use_siar)
 		return perf_flags_from_msr(regs);
 
+	/*
+	 * Check the address in SIAR to identify the
+	 * privilege levels since the SIER[MSR_HV, MSR_PR]
+	 * bits are not set for marked events in power10
+	 * DD1.
+	 */
+	if (marked && (ppmu->flags & PPMU_P10_DD1)) {
+		if (is_kernel_addr(mfspr(SPRN_SIAR)))
+			return PERF_RECORD_MISC_KERNEL;
+		return PERF_RECORD_MISC_USER;
+	}
+
 	/*
 	 * If we don't have flags in MMCRA, rather than using
 	 * the MSR, we intuit the flags from the address in
-- 
2.26.2


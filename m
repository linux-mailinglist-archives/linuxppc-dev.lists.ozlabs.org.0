Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE3D2872EC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 12:58:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Spz19vlzDqJY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 21:58:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Fxi/vU3a; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6ShV4lrKzDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 21:52:26 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 098Adkcf093055; Thu, 8 Oct 2020 06:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=N2XvJ63KWPyhiX5rcSuFB4Km25S5ZapvWe0J/9I/PFc=;
 b=Fxi/vU3aMwZlOLXgrSouOD6DayV/QjPF7iItfFXb6KuOokr2pGdEfbxDNlFthKuitCfi
 sIF4LKR2NgB9413VV+GG9PBsWYmmFjbFnMgBzsZnvzb3VRJwYwviRlgP1YlqMJbndAAS
 UQ2s0gYcSGKrte/P3Khg0q5Yv6li+JwyYuI2+p2RyOIgqYbRhicru8keXPHNauFvLdnq
 sGDpuOAXj1TTYLocByPEFLfGO0GzVZg3jGwT8iDj6cXWea5k2tS7ZPjLtSoEW3gxCXGF
 hUJGW4VXyw1wWHogxNH+I+KoFdWfSDuUHqsFeLiIYng7//r4tjQnVxliXjgCh5aK5MV2 MQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341yb2bt36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 06:52:22 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 098AlLe8010519;
 Thu, 8 Oct 2020 10:52:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 33xgx85891-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 10:52:20 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 098AqIV023921056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 10:52:18 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E8E84C052;
 Thu,  8 Oct 2020 10:52:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8949E4C046;
 Thu,  8 Oct 2020 10:52:16 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.255.65])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Oct 2020 10:52:16 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 3/4] powerpc/perf: Use the address from SIAR register to set
 cpumode flags
Date: Thu,  8 Oct 2020 06:52:08 -0400
Message-Id: <1602154329-2092-4-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602154329-2092-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1602154329-2092-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_07:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=924 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010080077
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
Cc: mikey@neuling.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While setting the processor mode for any sample, `perf_get_misc_flags`
expects the privilege level to differentiate the userspace and kernel
address. On power10 DD1, there is an issue that causes [MSR_HV MSR_PR] bits
of Sampled Instruction Event Register (SIER) not to be set for marked
events. Hence add a check to use the address in Sampled Instruction Address
Register (SIAR) to identify the privilege level.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index d766090..c018004 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -250,11 +250,25 @@ static inline u32 perf_flags_from_msr(struct pt_regs *regs)
 static inline u32 perf_get_misc_flags(struct pt_regs *regs)
 {
 	bool use_siar = regs_use_siar(regs);
+	unsigned long mmcra = regs->dsisr;
+	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
 
 	if (!use_siar)
 		return perf_flags_from_msr(regs);
 
 	/*
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
+	/*
 	 * If we don't have flags in MMCRA, rather than using
 	 * the MSR, we intuit the flags from the address in
 	 * SIAR which should give slightly more reliable
-- 
1.8.3.1


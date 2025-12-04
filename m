Return-Path: <linuxppc-dev+bounces-14613-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8ABCA4D33
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:56:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhyL6hDMz2y0K;
	Fri, 05 Dec 2025 04:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870970;
	cv=none; b=AVFm2DuNFn2MLfYxE8TkR8zwiWxoNnjZcHpyE+7hpBENB0EHgGd0IBxN3hw9QUbr2KMnJZ6nLrKTI6dsp30tzC3lO5A4h8CXbtCldhRbNFAdZ/kq/KEbyTB66cTrQiX9H0VTLMop8FObOlQQYPM6K6prQkZhmU0vPxmtEuQqr7/jazYQeCxTpP2mR0QIwHwPP1nouvpwtRvuQ7bUf/L5RpuZJ7+Ne2MjXDpHXiAF6W4kHJnpuFwdMO7jJgc6mxy25BIUSlpElUdd9bXHZsJksTiEb5RMaQt0Drs238MfvdgfJ3RiBq7heMZTgi83X+oDMUYORDrcQZBd+kHPnrujig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870970; c=relaxed/relaxed;
	bh=ofdrv2HTyNhn9a94lvQbSf69S36F3l+q9KEMumrBl+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBCcRqwOYEKYioa+/E7gxmWDOFAyyCx9hCptrzeOmHX7KognqiL4xPTOl9Iy57rKjXxKhH40axVbwgsACS8/lE2BcCssrtbL4uLVRgtQDGNMMY3GIYFJFSvWyVM/4WzbLPttLUD1qN46XF3QzWgkYLIISwUsdisYD6HO07LaTETwAuYcsePElySlt6/eS5X0RIait63BBDb5Ytx7FhB+KY6mtxyHdjBgIoEcpiTcACJSFCUfJr2Hms8Xni2gKZQiYxrQf34l7KIECgGW1lFFO6cJLkTgmPJPkbhbYLefA+wGaA8D/lWRTtYhb7/KBZ3hTaVcoLODLhDFvQZ48gXoVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M71ttVib; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M71ttVib;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhyL0BsJz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:09 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4A5oDf018043;
	Thu, 4 Dec 2025 17:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ofdrv2HTyNhn9a94l
	vQbSf69S36F3l+q9KEMumrBl+U=; b=M71ttVibtm2D1LHW2cs88jdP6AJzzpsXr
	IT6cfto/fDmHDX4sW4jybmlbM7Ikf1nNbkugI3PaBtf77QDhOhJZnT10l7rc7YCo
	9B9/ue6hAEaO62o5xA9ZcXymkb/lxqPpA032YK0uqOI46jq8Inuf450z49wFg6Hc
	h0a/7QEa4kMpohg8ER8gAlajJuI+b5gM2xCCtgs8vFkyoUj2a9OU7azM87iqz3PU
	C5MB5rn6baScSreWfdRZF/PoKZCXocP960QcDvv/6gjhgFMYhdBriaaZ12ps9MEF
	ePNR3RBzhBehmLbFWtUyp/tiAylZ2nujICb5WFrtaGzgaTEh4EzzQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrg5s6ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:38 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4HqoSZ013939;
	Thu, 4 Dec 2025 17:55:37 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrg5s6cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:37 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4GAjZ7029361;
	Thu, 4 Dec 2025 17:55:36 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardv1rva5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:36 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4HtWHt32440644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:32 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 826952004B;
	Thu,  4 Dec 2025 17:55:32 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00E7220040;
	Thu,  4 Dec 2025 17:55:29 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:28 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Peter Zijlstra <peterz@infradead.org>
Cc: Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>,
        Thomas Huth <thuth@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        virtualization@lists.linux.dev, Yicong Yang <yangyicong@hisilicon.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 05/17] pseries/smp: Query and set entitlements
Date: Thu,  4 Dec 2025 23:23:53 +0530
Message-ID: <20251204175405.1511340-6-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251204175405.1511340-1-srikar@linux.ibm.com>
References: <20251204175405.1511340-1-srikar@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1Vrq_csNHCzp9xa2osFLtxs9Iw4Y1YK5
X-Authority-Analysis: v=2.4 cv=Ir0Tsb/g c=1 sm=1 tr=0 ts=6931cb1a cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=zmVj4zYWMFl_L39sl28A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX/rruhK4Cb7Ab
 VBYl60SFPuyS+jUyoUVb3pdstkli+caa3mouV9eVY+jsy39Yr5e7FzF0eBCnYHhwGalTHeuVlR8
 ejOpvHWr7c7kOYGVaVgRbN2fGoUAYraO77TapdqJffWSj1oyD33N/Wr0aoBvcPgxjzx04d2Uyfe
 NSfrzXVmm8OY+3o402Ae3fswkJ8JoEPcInnAqbd5Pgm23KxNShgrscGHiEYhy1ZXP7A2Nj2BBl1
 zgB/Kj4E7XDEcMb/yb2jC2KH39Rnb9AtgDceAlKcA+Sxd22V2h6rYRg62Qveb0lWIjHSUquf7MQ
 r8dTG0guRn7RfI0CfOKhfvRAluKt8KX9S0gUH56sLW26RPfW9LYuVReVIHZ+juxB14ixqBzHW0G
 hq/FelLaZTNeQnTR93got1ItaNs2eA==
X-Proofpoint-GUID: JidS4L2skuTXWOaUvwLPfOO1ck_2dd-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This defines num_available_cores callback for pseries.  On pseries system,
query the hypervisor for hard entitlement using H_GET_PPP hcall. At boot,
soft entitlement(available_cores) is set to the maximum number of virtual
cores in the shared LPAR. In subsequent changes, soft entitlement will be
updated based on steal time. If the number of virtual processors attached to
this LPAR changes, then update entitlements as required. Soft entitilement
will oscillate between hard entitilement and maximum virtual processors
available on the shared LPAR.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/smp.c | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index db99725e752b..a36153c959d0 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -42,6 +42,7 @@
 #include <asm/text-patching.h>
 #include <asm/svm.h>
 #include <asm/kvm_guest.h>
+#include <asm/hvcall.h>
 
 #include "pseries.h"
 
@@ -239,6 +240,40 @@ static __init void pSeries_smp_probe(void)
 	smp_ops->cause_ipi = dbell_or_ic_cause_ipi;
 }
 
+#ifdef CONFIG_PPC_SPLPAR
+static unsigned int max_virtual_cores __read_mostly;
+static unsigned int entitled_cores __read_mostly;
+static unsigned int available_cores;
+
+/* Get pseries soft entitlement limit */
+static unsigned int pseries_num_available_cores(void)
+{
+	unsigned int present_cores = num_present_cpus() / threads_per_core;
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+
+	if (!is_shared_processor() || is_kvm_guest())
+		return present_cores;
+
+	if (entitled_cores && max_virtual_cores == present_cores)
+		return available_cores;
+
+	if (plpar_hcall9(H_GET_PPP, retbuf))
+		return num_present_cpus() / threads_per_core;
+
+	entitled_cores = retbuf[0] / 100;
+	max_virtual_cores = present_cores;
+
+	if (!available_cores)
+		available_cores = max_virtual_cores;
+	else if (available_cores < entitled_cores)
+		available_cores = entitled_cores;
+	else if (available_cores > max_virtual_cores)
+		available_cores = max_virtual_cores;
+
+	return available_cores;
+}
+#endif
+
 static struct smp_ops_t pseries_smp_ops = {
 	.message_pass	= NULL,	/* Use smp_muxed_ipi_message_pass */
 	.cause_ipi	= NULL,	/* Filled at runtime by pSeries_smp_probe() */
@@ -248,6 +283,9 @@ static struct smp_ops_t pseries_smp_ops = {
 	.kick_cpu	= smp_pSeries_kick_cpu,
 	.setup_cpu	= smp_setup_cpu,
 	.cpu_bootable	= smp_generic_cpu_bootable,
+#ifdef CONFIG_PPC_SPLPAR
+	.num_available_cores = pseries_num_available_cores,
+#endif
 };
 
 /* This is called very early */
-- 
2.43.7



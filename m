Return-Path: <linuxppc-dev+bounces-14322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 977C3C6CE60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:23:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBHH6jLtz3c1Q;
	Wed, 19 Nov 2025 17:22:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533371;
	cv=none; b=XKvG2XMKLX54nuBxPdcX4n5bFKZStIcpW7fhgZi6YWe5gzCu/U5klAspi6m5Wi+JG/Rh7SGnvFqye4Y6plvoVuhOTOd7v7KTcouOV4Jn59OztswMCR8xzSNOBKJ/ooa6qqVQRztuKEVP5tyu1ymZSts9011VwnL6gxq0ZLsTDXlzgSoQ54Lty/rqEDNsQHXXxWVSroO5mNyNfyLvT3tlYdezevFiKh5YXS650j309s6WXZEtQm5h3DqXZMrKXPiSJkyu/VW/LWG7hVjRH/pxp/Lg3bElGfbWaLnGpvB1eCU77Q9vMu86sbSLGPQUPfzvQ1MTWwGBTdJ8/ofmNBDA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533371; c=relaxed/relaxed;
	bh=wOwoUo4qjbz//wAJI96uYffqcZQY/DCaFaTR3O887dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJlV0LCa5scBRNS2U0FwpH/QIsi3oXjjAZxxvANRuATTu+HYG38tdVa8SghrH23ZepQHbD0kYtq+6F5OAloprB3mJ6njIbDTHw8yHJoWhv1RTyRtuU17J3m62RwJ8zM2OihsVS/CNb6rJkvdq4KMCe3fbsA0XuikhkYBpCuvB2JBNiCpFwCYI6VL0euPc9oMqGxN4YWwuGem66kfS7B2JihseBBJYzzv+uPdLJpIXJvnhzFvM9Y9Hbpu6atMvtv8UxJEeDvS7LzyucQ50MNRhFVog9rt9lD0SEkm1GNt2kYnARiYcQn8fjPdPUVnToHBP+kfutcGU13cud1+f0Lkmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wtw4idbn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wtw4idbn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBHH0bj1z30TM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:50 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIH95Yx007244;
	Wed, 19 Nov 2025 06:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wOwoUo4qjbz//wAJI
	96uYffqcZQY/DCaFaTR3O887dM=; b=Wtw4idbn4IYj5jGfbb4fOYkFE1PIHnkWh
	1SvLlL2uuykmB5q21yUGvuysUV+SYX8Dn2iXGDveyq/LzTpE3Cwi7J9A+UzB4CuL
	aCB6HUQ0yLmyeXYSErWN5EHKAoG2z16IqmlM5J+8iYrOdse4W3d7MHRjZuV9k4PD
	g1jXCFPaR3hBGgIXxoaZ1ToqF+DuW5FWBSFYpXCrAx5JWxcAWvoXjFqr9foWoJjD
	bYyLr3AfCcWHHQAqcfzoXovEMifnrDPP8JB3wLpWjXSyh3rfQV0G2KCc96VeqahN
	ZyZTDB8sVRU0fzo8RtfUegfftyCjU54lVVO6i/jE67P9h1ILDKFTg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsp753-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:28 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6FcPM021942;
	Wed, 19 Nov 2025 06:22:27 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsp750-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ3nIk4022386;
	Wed, 19 Nov 2025 06:22:26 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4umy582-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:26 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6MMtG42533180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:22:22 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4A6020043;
	Wed, 19 Nov 2025 06:22:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDDBC20040;
	Wed, 19 Nov 2025 06:22:18 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:22:18 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 12/17] powerpc: method to initialize ec and vp cores
Date: Wed, 19 Nov 2025 11:50:55 +0530
Message-ID: <20251119062100.1112520-13-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119062100.1112520-1-sshegde@linux.ibm.com>
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: RcA5oI_GTH1HZ8tTpOCw9BrZ-01IWvyE
X-Authority-Analysis: v=2.4 cv=Rv3I7SmK c=1 sm=1 tr=0 ts=691d6224 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=hFzEoIDDEV05iifXiegA:9
X-Proofpoint-GUID: _YD4V2LkBDLl101SYN0komU049C5iWlc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX+KLvdG9ORbST
 E+g1yERHe1xU4vPcbdY6y7T6h8loNAy4QJMO90KuBGCj/bNrkJbwJqgHxScLR4YZ7XKyYFsFsMU
 5XdHcRSDd2hxM+QYeJW5kksU28pXhVXAkjT+bb77M/oEy7wZ0+MU4whjcz+Khm4x78RF5EHbFiF
 Uyv3cS/ew4EoURYVntzasDp0/yNZMf34BN2GjLWVqbDxwSpV+2Hy1mJx0TimlObatXfYyNeUeWz
 ycQfYdK+f1C0JZSNaXFBK8O6+2XLGWnpwt4+b8gLkb1q2vgRApKGatusrQvCR11RKdT/rIKQLEy
 Hku15Q/L39yc/wZMTB9hNnrExPTyHYEtudN99r1AgZID94/TUzdtJzGFBGaUL3AMf/Pv+G1xDxN
 1hdxOj634J3I4MCUvoBz+7V3Uc55Jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

During system init, capture the number of EC and VP cores on Shared
Processor LPARs(aka VM). (SPLPAR )

EC - Entitled Cores - Hypervisor(PowerVM) guarantees this many cores
worth of cycles.
VP - Virtual Processor Cores - Total logical cores present in the LPAR.
In SPLPAR's typically there is overcommit of vCPUs. i.e VP > EC.

These values will be used in subsequent patches to calculate number of
cores to use when there is steal time.

Note: DLPAR specific method need to call this again. Yet to be done.

Originally-by: Srikar Dronamraju <srikar@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/include/asm/smp.h        |  1 +
 arch/powerpc/kernel/smp.c             |  1 +
 arch/powerpc/platforms/pseries/lpar.c | 30 +++++++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index e41b9ea42122..5a52c6952195 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -266,6 +266,7 @@ extern char __secondary_hold;
 extern unsigned int booting_thread_hwid;
 
 extern void __early_start(void);
+void pseries_init_ec_vp_cores(void);
 #endif /* __ASSEMBLER__ */
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 68edb66c2964..5a3b52dd625b 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1732,6 +1732,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
 
 	dump_numa_cpu_topology();
 	build_sched_topology();
+	pseries_init_ec_vp_cores();
 }
 
 /*
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 6a415febc53b..935fced6e127 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -2029,3 +2029,33 @@ static int __init vpa_debugfs_init(void)
 }
 machine_arch_initcall(pseries, vpa_debugfs_init);
 #endif /* CONFIG_DEBUG_FS */
+
+#ifdef CONFIG_PARAVIRT
+
+static unsigned int virtual_procs __read_mostly;
+static unsigned int entitled_cores __read_mostly;
+static unsigned int available_cores;
+
+void pseries_init_ec_vp_cores(void)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
+	int ret;
+
+	if (available_cores && virtual_procs == num_present_cpus() / threads_per_core)
+		return;
+
+	/* Get EC values from hcall */
+	ret = plpar_hcall9(H_GET_PPP, retbuf);
+	WARN_ON_ONCE(ret != 0);
+	if (ret)
+		return;
+
+	entitled_cores = retbuf[0] / 100;
+	virtual_procs = num_present_cpus() / threads_per_core;
+
+	/* Initialize the available cores to all VP initially */
+	available_cores = max(entitled_cores, virtual_procs);
+}
+#else
+void pseries_init_ec_vp_cores(void) { return; }
+#endif
-- 
2.47.3



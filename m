Return-Path: <linuxppc-dev+bounces-14359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2ABC6E901
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:47:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLnd3tfmz3fFT;
	Wed, 19 Nov 2025 23:46:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556373;
	cv=none; b=coDoPxGfXz0UzTZX0mh+6CP0D3dFK7JPzgm0iZL8K232/P+bkEGNc0BN2iL6yTm4L09Lrh/XiCmo0E2P0pkW4L5uATJvkeQC2tTbXpVg6kiqXanw3SUn9/yDH+z7LsoTpHhbMuukIMJqzNj+WhZyX4QtfbcGOiKDcIb3RrQmbv4fatIqG2IppndWXOsRvzbwfBdhKY0zSqg44+im0h7Truy7OUxOe8u2wQoHPmF6wAVr76E7yA0WX/JDskUkcttfK6n3OOwauuN5COYqAvIyMvsEC8NgVEKTDpJ8K8BMQvwcd+jKdPv/YJ31ohyI8gJhuxyuEPjl6ejdIfvARcTxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556373; c=relaxed/relaxed;
	bh=wOwoUo4qjbz//wAJI96uYffqcZQY/DCaFaTR3O887dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2IhJWtoLtqkOnP4TewRI1KrIC5KNR9jkcidwHuO9o1wv28pmIPStk3YSkgZxcBKqz2wTYwp7aOxT+c8UussCfpEd2GDdlD6KoT0EVLP7YmqTPO3ieJhbSonWwrQ97By9dr7xQMNDoHTDRc/WMHkb37728nkvUyrtsN87x6KJeQjPXvTfzqfuFoHzIn2qS6ZOfU/AgTvFCAvQBdhole2+joDJ9IEY3xvMxgqN7iKyNJF7c4xYLM1Yp74qR73BCw89jf6Fr0WLW55LrfxUTgx9V+RjzW4wbvxhRQTHEvDg1+zFWAad51fA39UHC+LFlqSB5VTzaQRqm2H+aIR4FcFYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GKJNJrro; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GKJNJrro;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLnc5ZHjz3fDj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:46:12 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ8KJAS030703;
	Wed, 19 Nov 2025 12:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wOwoUo4qjbz//wAJI
	96uYffqcZQY/DCaFaTR3O887dM=; b=GKJNJrro4Z751pmBsy+oWNAw/xjoVwRST
	te4M1xAVtHWf/3P5E9+sBwc3bA0jXDEXmTsIVSlGjb01lPvwLmGrFIQIKkCS91RI
	WhkR6MT9LlzDSyN663Va3w0D3BKd5lsQ7OHF5ReNunKUjZs02NGVp1ntHNJyJ47f
	H6pt02YWt4niWhYQ2LUuJCxC5YpIFnKva3/rpXCIhj4MsMh0K8FBb17+9JZ3QifC
	yavHznUMyZS9AIwWeshP/7hNSgIv5Z9KwpK9NM4nf4ukLe7o0IeFhFLvexpKW0gT
	h2+qcau9qRn0WyZaSUDhFirR5V7HV0bBLq9bdlB0q42kCxBoG0mCg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw8fea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:57 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCRfJO009153;
	Wed, 19 Nov 2025 12:45:56 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjw8fe6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:56 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJCYSgb007031;
	Wed, 19 Nov 2025 12:45:55 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af62jgea2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCjqQx33620294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:52 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFD9E20043;
	Wed, 19 Nov 2025 12:45:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C738D20040;
	Wed, 19 Nov 2025 12:45:47 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:47 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 12/17] powerpc: method to initialize ec and vp cores
Date: Wed, 19 Nov 2025 18:14:44 +0530
Message-ID: <20251119124449.1149616-13-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119124449.1149616-1-sshegde@linux.ibm.com>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691dbc05 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=hFzEoIDDEV05iifXiegA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX+GJMTnqKLGzA
 coTy7docKH4tBCiB2HvYpjD4bSxnaADX5/blRyjFKGDjsO4Kt/CTR0z3NAZvGKu5CGnl7xr15fp
 7jdsSdm7QLl51oHfVSs8PQW354c7RmarekwP9QmJc+h3wacIh4bop1vJGHwXDH2ttaV4+UIyHJl
 0GOB1cPo52UmS7GqOaOKeszVSNaYJ7ShgE5N6xdLiR39u3oCogaFMhNA9IEnvQC2FXncAITlQ2c
 vobOMTLFRW2rLWpxM1tDqyve2CCX080NQt6KaW0YVjbQqXMRclnw84xJi5wYZRWBjW0+3fUKYUH
 nQH5avikRe09YA8OOmcSh6lUL8fj4J0dmdvnUqZc6TRZL3DHisCwSxzwJDy1+HfY4GvHKMlhKZS
 bhHFDy8lSQShmqM1x/7mVhqEHBjNPw==
X-Proofpoint-GUID: AuGDugIJ0Mb3tRw58kt_0IQAl-bdggFu
X-Proofpoint-ORIG-GUID: K61qosmFdGtY06M47nbeyG0mlm1oQdDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
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



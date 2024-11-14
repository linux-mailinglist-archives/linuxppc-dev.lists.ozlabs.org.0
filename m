Return-Path: <linuxppc-dev+bounces-3172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEE19C8541
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 09:50:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xpv4s0vVRz2ypV;
	Thu, 14 Nov 2024 19:50:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731574253;
	cv=none; b=HoAfdJqsc+kMTgGKelDM6arWojHbjKKgOoVRsT67vlekW6nJSiJSpAK1pOQXV6hqksWWCgFIAZqsjQpfQAW+N91zcxrKiAzde1AQ19sW2oiH65uu6X66IPRmVMeotwkx2sEbD/Sg4ps6HviY9vwbQjPggCiKWjAD2rXTIUIPgWPmKvcXC0FW2KU7OF+J0+PW2RYSuL0gv5nymF7UbCEAMGXo3k1rRJ2bYeRVQaAk7SAiRWlfwyTiZJYBb4Wu5reWLFtLF124FyhtdOfqIF61m4IRr5Tk2/kts4kAYt8gFOEAf6T5D69CfZLEzbjA+cRJsyzBw6lm16gL18Z020h4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731574253; c=relaxed/relaxed;
	bh=ELkof2PiSVln1EcDwzuMJK2QV+4Zo2YPwe//gRAwQyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ew6+7HZz/zJYHjWIqeh50zG6U4Hgxj62zJbJaVP9Ez5cCV0/cLb7FDducPUvR/lif7QgLlMDxX0dFwAtwBpJLzn7OLtvLlm4ZLsado0gPvdM9m1tggSY9crMfHfZhwnCM4v2w5SctO6QBNCRPfd02PuEu5uI6F4xlvdJgtIiZhKNiWz24lrkpwDCddaVKjSxnBQAqc2EMIEoWm1VJsn+U02QD4ghQ74hgGuigbADp1YVR0Cvc9BO6GzpJVnoo9hTDlfEkcWCUqbJ7uVw5eiL63tNH5bwrAlOqFIqlxMC6IRkJQZd65eCxIrhDnrxZ//OCFbkmYjPlBG/LabT3oofWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sz99PODo; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sz99PODo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xpv4q2dhDz2ynL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 19:50:50 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6e2PN002177;
	Thu, 14 Nov 2024 08:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ELkof2PiSVln1EcDwzuMJK2QV+4Zo2YPwe//gRAwQ
	yw=; b=sz99PODoyVvp7pQ+dRIbqxvdy67/EE/hJmNBvL1FM/mq/X98XRW4fk2BY
	6KUne+fpSkXS+WwH0GSgtWy2QyMWdbUzIiK16U6yeiGoR0aOcorJugB02eRc5o7M
	22NGSFHxGZGoQ0770sCY1TAR8ZlkhflJGdLGGPKnjonbOtqw/KD1WTX51OKKTzZt
	U7rYS+sci3ukG3bkbjRMI2JlVRjR0AlHHiXVsxsLn5WfbbK6HxCM4d4Nj6C6EcTz
	dh28ddvhi4Dg1dJNxNkeFLWFYntjXJjg7ctOJbln+3GiBdDaG9jLnPkGPsovy+FI
	GpeQAKMbqaGuNjKetNo1CynPDxtkg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42wc4s90dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 08:50:43 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AE8oKOL020216;
	Thu, 14 Nov 2024 08:50:42 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42wc4s90de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 08:50:42 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADNBcI8010514;
	Thu, 14 Nov 2024 08:50:41 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42tj2s81pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 08:50:41 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AE8obKb51184116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Nov 2024 08:50:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED7902004B;
	Thu, 14 Nov 2024 08:50:36 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24A1420043;
	Thu, 14 Nov 2024 08:50:34 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.39.126])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Nov 2024 08:50:33 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, disgoel@linux.ibm.com,
        hbathini@linux.ibm.com, adubey@linux.ibm.com, gautam@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Amit Machhiwal <amachhiw@linux.ibm.com>
Subject: [PATCH v2] powerpc/kvm: Fix typo in the kvm functions
Date: Thu, 14 Nov 2024 14:20:20 +0530
Message-ID: <20241114085020.1147912-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
X-Proofpoint-GUID: yqhisDeqyWFdh94OjWDw3CTCOvnS5d6x
X-Proofpoint-ORIG-GUID: FploZy_ECxRphi9DMk_n4xyg2xFdWnvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411140065
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Fix typo in the following kvm function names from:

kmvhv_counters_tracepoint_regfunc -> kvmhv_counters_tracepoint_regfunc
kmvhv_counters_tracepoint_unregfunc -> kvmhv_counters_tracepoint_unregfunc

Fixes: e1f288d2f9c6 ("KVM: PPC: Book3S HV nestedv2: Add support for reading VPA counters for pseries guests")
Reported-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Reviewed-by: Amit Machhiwal <amachhiw@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
Changelog:

v1 -> v2
- Added Reviewed-by tag from Ritesh and Amit.

 arch/powerpc/include/asm/kvm_book3s_64.h | 4 ++--
 arch/powerpc/kvm/book3s_hv.c             | 4 ++--
 arch/powerpc/kvm/trace_hv.h              | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 2ef9a5f4e5d1..11065313d4c1 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -684,8 +684,8 @@ int kvmhv_nestedv2_set_ptbl_entry(unsigned long lpid, u64 dw0, u64 dw1);
 int kvmhv_nestedv2_parse_output(struct kvm_vcpu *vcpu);
 int kvmhv_nestedv2_set_vpa(struct kvm_vcpu *vcpu, unsigned long vpa);
 
-int kmvhv_counters_tracepoint_regfunc(void);
-void kmvhv_counters_tracepoint_unregfunc(void);
+int kvmhv_counters_tracepoint_regfunc(void);
+void kvmhv_counters_tracepoint_unregfunc(void);
 int kvmhv_get_l2_counters_status(void);
 void kvmhv_set_l2_counters_status(int cpu, bool status);
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index ba0492f9de65..c36d036d7155 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4154,7 +4154,7 @@ void kvmhv_set_l2_counters_status(int cpu, bool status)
 		lppaca_of(cpu).l2_counters_enable = 0;
 }
 
-int kmvhv_counters_tracepoint_regfunc(void)
+int kvmhv_counters_tracepoint_regfunc(void)
 {
 	int cpu;
 
@@ -4164,7 +4164,7 @@ int kmvhv_counters_tracepoint_regfunc(void)
 	return 0;
 }
 
-void kmvhv_counters_tracepoint_unregfunc(void)
+void kvmhv_counters_tracepoint_unregfunc(void)
 {
 	int cpu;
 
diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
index 77ebc724e6cd..35fccaa575cc 100644
--- a/arch/powerpc/kvm/trace_hv.h
+++ b/arch/powerpc/kvm/trace_hv.h
@@ -538,7 +538,7 @@ TRACE_EVENT_FN_COND(kvmppc_vcpu_stats,
 	TP_printk("VCPU %d: l1_to_l2_cs_time=%llu ns l2_to_l1_cs_time=%llu ns l2_runtime=%llu ns",
 		__entry->vcpu_id,  __entry->l1_to_l2_cs,
 		__entry->l2_to_l1_cs, __entry->l2_runtime),
-	kmvhv_counters_tracepoint_regfunc, kmvhv_counters_tracepoint_unregfunc
+	kvmhv_counters_tracepoint_regfunc, kvmhv_counters_tracepoint_unregfunc
 );
 #endif
 #endif /* _TRACE_KVM_HV_H */
-- 
2.43.5



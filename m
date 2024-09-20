Return-Path: <linuxppc-dev+bounces-1491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D03A97D4E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 13:38:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X99Pk0PJLz2yQG;
	Fri, 20 Sep 2024 21:38:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726832314;
	cv=none; b=APcnDnTqkf4CtY5f4TiRfuthkbcrUWx2H0uga+mXXer5idRGUwdrBOlRUyhv0BEBC7NkirGduY8Ww36mpkzINymWoBHVuPWRnfmiigG40L857QnHno1SDTMYgPHqNxpzgxb0FZZK+GLoxrGDkrSvwIQ+9t9R8aK+6qlEz6YjXC4/+Vpen4MYz0CIxt7p1v/o99PPUyKqYNRUMQjeaZU70rLscb8zR+CZSNSjwcoS1u+cyaS3/Xr5g5bVvfIBwbSOTHpOM6Ozn0PYDU2TbW+RV7Kb8gBbiDVLRDRxy6XgqX6QMd9JD9tJlkrb0vFIwVUiod+4hNR1SGe++mbi52crzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726832314; c=relaxed/relaxed;
	bh=jTQ1/fgycFakBw9xilUSDQoHjuZqzEMXpkxSoYEwSj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dTHeZAS3aO2gnYrhuJzrFV4rhJAxBkyMEDnrvzsOuwv61qxbeOrH5vT+q9OPAO7zCt5TLiLhknKS+YhaiTQynP3F0SxHv6S86f4196QzrkfL5csjp+ZyNgSzKPK7ItIVFG/2+LsAvGWnr5OCN5b+oYfG/PH4Ca9Px3EEY19WPWetDxfaBwh8dv4Hgc39XEcheiniarr+NJyDrHnh6xvJfNn0yKHV/R45CHXd8unH50IqePieDsvKE7rZGauRT9aNklsJ7Vw3s3OPE45j0O7jc6cfIr/7i3gt1ykwZ26y0tJ9BsBi7HuPTLO5Yzp8AdsxIzum7nrkYIq5TyPUazROSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g+DPdPah; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g+DPdPah;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X99Pj1PN2z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 21:38:32 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JNIFe9006840;
	Fri, 20 Sep 2024 11:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=jTQ1/fgycFakBw9xilUSDQoHju
	ZqzEMXpkxSoYEwSj4=; b=g+DPdPahrevWQN/BaP3INWC5KhZMVFx1AdHS3pfqin
	2JZD2Y4f7mgYy/RpocZXkuc9pnLceierqpoDWiDU2a5M+U4yaSr+2TFn37/mMonJ
	h3bdgOAPmhT65A5MbF7PqOJ2cIzAcTuGBYdGd0heXIS6PGtsQAvxEeRD+VKjZ57h
	S5+l06wlgYBcj4ocvHwiFp30P6YRfi/Q/rNL5tpO1tu+gVpaUqMnypblIqtdgFNf
	xFP8ELlEoVwe1isLdSDnAfTgJyR5xYgZxKyqQY52zZhesr2In+Dtgj1r2HD8QGwT
	hGysUCtnMuyZNBavglnilrPBDHj+SPHhPjnWYrsOsjBg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uds4cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 11:38:25 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48K8cUUh030649;
	Fri, 20 Sep 2024 11:38:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41npanpwe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 11:38:23 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48KBcINt42074616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Sep 2024 11:38:18 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B553B20040;
	Fri, 20 Sep 2024 11:38:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 654A720043;
	Fri, 20 Sep 2024 11:38:16 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.0.34])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Sep 2024 11:38:16 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
        disgoel@linux.ibm.com, hbathini@linux.ibm.com, adubey@linux.ibm.com,
        gautam@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: kjain@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/kvm: Fix typo in the kvm functions
Date: Fri, 20 Sep 2024 17:08:01 +0530
Message-ID: <20240920113801.424651-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
X-Proofpoint-GUID: ZeY0fT3LsnyUQFaMhxpAuSygAkRvTfxu
X-Proofpoint-ORIG-GUID: ZeY0fT3LsnyUQFaMhxpAuSygAkRvTfxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-20_05,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=955
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200081

Fix typo in the following kvm function names from:

kmvhv_counters_tracepoint_regfunc -> kvmhv_counters_tracepoint_regfunc
kmvhv_counters_tracepoint_unregfunc -> kvmhv_counters_tracepoint_unregfunc

Fixes: e1f288d2f9c6 ("KVM: PPC: Book3S HV nestedv2: Add support for reading VPA counters for pseries guests")
Reported-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
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



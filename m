Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AED7C4950
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:42:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cvKaqnNv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S51r80lrLz3vpc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 16:42:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cvKaqnNv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S51kQ3zfbz3c54
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 16:37:34 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B5Piqm015860
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yNjzfNOJyPd2iN/C57+kUosWGcH7uef0vv48udHzY4s=;
 b=cvKaqnNv1eL5nPkBG5fLf+5peJ43ElbCMWudwHAKI/OwRTxnRfl6JC1X8tVnmX/BCXRQ
 qIg6pCCOfPpyGtu3PHngVuMNTUiVld3fab2lS75A8hIaV0Bd31K9z6NYGaVcjlpVEp0q
 sf/xZALGNWciXiD1jbBjUsX1oUi619AZ86tWkNMtnHdxxI+y3kNpuVct8Gaf+FnsW4xq
 E8fmINC1sFp49S1W8XyUofUIJ93MeYTpNaY/jzriOOk8EXsfbUhdIoSsRnA863LM54jw
 SI3s51ptx2sEtIXY8DfeXELo+nIv/MRIiTUAUYojJlj+gYIc1widGSjCzwSZFKEIpg+0 3Q== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnnhw8bpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:32 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39B3ur3N001170
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkkvjwgpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39B5bTih11469316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DD9B20040
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CD3820043
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 81E2960635;
	Wed, 11 Oct 2023 16:37:24 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/12] powerpc: Remove extern from function implementations
Date: Wed, 11 Oct 2023 16:37:04 +1100
Message-ID: <20231011053711.93427-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011053711.93427-1-bgray@linux.ibm.com>
References: <20231011053711.93427-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wQpRWVG1fxTfWrNP9NkKDTLmPvDD2231
X-Proofpoint-GUID: wQpRWVG1fxTfWrNP9NkKDTLmPvDD2231
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_02,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110048
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparse reports several function implementations annotated with extern.
This is clearly incorrect, likely just copied from an actual extern
declaration in another file.

Fix the sparse warnings by removing extern.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/iommu.c      | 8 ++++----
 arch/powerpc/kernel/traps.c      | 4 ++--
 arch/powerpc/kvm/book3s_64_vio.c | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 14251bc5219e..3e28579f7c62 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1074,10 +1074,10 @@ int iommu_tce_check_gpa(unsigned long page_shift, unsigned long gpa)
 }
 EXPORT_SYMBOL_GPL(iommu_tce_check_gpa);
 
-extern long iommu_tce_xchg_no_kill(struct mm_struct *mm,
-		struct iommu_table *tbl,
-		unsigned long entry, unsigned long *hpa,
-		enum dma_data_direction *direction)
+long iommu_tce_xchg_no_kill(struct mm_struct *mm,
+			    struct iommu_table *tbl,
+			    unsigned long entry, unsigned long *hpa,
+			    enum dma_data_direction *direction)
 {
 	long ret;
 	unsigned long size = 0;
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 64ff37721fd0..12d128238cfe 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -157,7 +157,7 @@ static int die_owner = -1;
 static unsigned int die_nest_count;
 static int die_counter;
 
-extern void panic_flush_kmsg_start(void)
+void panic_flush_kmsg_start(void)
 {
 	/*
 	 * These are mostly taken from kernel/panic.c, but tries to do
@@ -170,7 +170,7 @@ extern void panic_flush_kmsg_start(void)
 	bust_spinlocks(1);
 }
 
-extern void panic_flush_kmsg_end(void)
+void panic_flush_kmsg_end(void)
 {
 	kmsg_dump(KMSG_DUMP_PANIC);
 	bust_spinlocks(0);
diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 93b695b289e9..15200d766fc5 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -77,8 +77,8 @@ static void kvm_spapr_tce_liobn_put(struct kref *kref)
 	call_rcu(&stit->rcu, kvm_spapr_tce_iommu_table_free);
 }
 
-extern void kvm_spapr_tce_release_iommu_group(struct kvm *kvm,
-		struct iommu_group *grp)
+void kvm_spapr_tce_release_iommu_group(struct kvm *kvm,
+				       struct iommu_group *grp)
 {
 	int i;
 	struct kvmppc_spapr_tce_table *stt;
@@ -105,8 +105,8 @@ extern void kvm_spapr_tce_release_iommu_group(struct kvm *kvm,
 	rcu_read_unlock();
 }
 
-extern long kvm_spapr_tce_attach_iommu_group(struct kvm *kvm, int tablefd,
-		struct iommu_group *grp)
+long kvm_spapr_tce_attach_iommu_group(struct kvm *kvm, int tablefd,
+				      struct iommu_group *grp)
 {
 	struct kvmppc_spapr_tce_table *stt = NULL;
 	bool found = false;
-- 
2.39.2


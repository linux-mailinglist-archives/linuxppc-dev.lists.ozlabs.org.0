Return-Path: <linuxppc-dev+bounces-5299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EA0A1263F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 15:40:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY7vn6Qxlz3bd2;
	Thu, 16 Jan 2025 01:40:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736952037;
	cv=none; b=faeqch6hwJg4GN2TS40F/oZ8htiMMA3HdTusafc917kz/lCSI2MhSx8+GKVIThNQS8HS+21JOiU1yFvrFeqFGFZORv12ei1joceoJk1WG2Su6hvTUkma8MWqpHrZm7G86H24Bv1PycQM+FZiTLMzjyeE0pgYNGAMx8IqTTBghjWuiQm4UuRNRAIyRSFkl4d5Lgouil2fsyrwQBgGo4Je0hTOBLN/MaiS8Gmt1QtmpMNrs9B6cBjC4yjRlA4ZEP5ohRErP2lE7SI+Kes2tEZLEIKW/DtkQk8WYwGPB76Q635r3XdK9Rqc75RjEySJzOXMIR5jB9sR2G4iFJXP7rQmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736952037; c=relaxed/relaxed;
	bh=tlXKaSEkpPN95aRVtsqo4dTAoEIhvpeOu83lqneYylY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1NByXrgrTFHgj6vlKwmj3nrPyoQNHCisoPW7OWg7HsWKHArT6/srlF1N5u5nbEZH3vEZ7NGN9nmqvSl3cwDyyoPdfzW3p8snmIUVp4W9A00H3Q9clXPYCr9R8fsVxtp0xj4py/q8e4pUeVzgxph7MlULRD2L3ru7/z/LPcXoVsh8fdfJSDmweAa6AdxJj0Sn443Zh1tHpqS3iQ2CNxELmUqldblHtznU4co3caDeGc+7wuRIN8qDNC3fElLqu8oP2f7Snvib1RCc7unGLK47rGPrDcMS753SRfPeRbHYZWhhbi47pLh7TB/maHohbEBqbCJqCVEm5fursoXhIbBtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jYpr2Dj2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jYpr2Dj2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY7vn1vnHz30Dw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 01:40:37 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FE6HOY022130;
	Wed, 15 Jan 2025 14:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tlXKaSEkpPN95aRVt
	sqo4dTAoEIhvpeOu83lqneYylY=; b=jYpr2Dj2zM23FqsOdxolIiX6+PmfHyEr5
	EG5SHsfXHNuB3CTaRDYMRP1nAJjtbMDyt9oS5tNYF9TAkW+raZCHDKdfT/q4CnZF
	VQQ5RsqbwA0IjRFBi5LFjvx4YSk5Ii3cO5hJra21eGLNWMX9hwUCFhOWOxPp8tcB
	89U5Z3C63MJFZ4naSW3FoVVBnyIOdshp1IXXACgX3C6Gpn/rAVXmKU+Ov9IaQWA5
	m2zMVCnbMd3LysOErki9i6wtvepgzNYzIUbP3A/SxPlsjiTV5nxvp80itFhtobZ5
	u+s3yQgkTjGG891rTHdhI/kmLyzoScLq+NPb1a1Vt77fLIy0A/emA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 446eg5r6e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:40:29 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50FEZJZD028671;
	Wed, 15 Jan 2025 14:40:28 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 446eg5r6e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:40:28 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50FBeclv001089;
	Wed, 15 Jan 2025 14:40:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44456k0hcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:40:27 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50FEeO4054788530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 14:40:24 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6869F20043;
	Wed, 15 Jan 2025 14:40:24 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B138920040;
	Wed, 15 Jan 2025 14:40:20 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.24.117])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 15 Jan 2025 14:40:20 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 15 Jan 2025 20:10:19 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com
Subject: [PATCH v2 6/6] kvm powerpc/book3s-hv-pmu: Add perf-events for Hostwide counters
Date: Wed, 15 Jan 2025 20:09:47 +0530
Message-ID: <20250115143948.369379-7-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115143948.369379-1-vaibhav@linux.ibm.com>
References: <20250115143948.369379-1-vaibhav@linux.ibm.com>
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
X-Proofpoint-GUID: Uogkg42FCU1rqIOyDqtQTkwcqaugRvG1
X-Proofpoint-ORIG-GUID: 0SbFgFNfu5Z_duYw56oS9XWYoGnlxbXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_05,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Update 'book3s_hv_pmu.c' to add five new perf-events mapped to the five
Hostwide counters. Since these newly introduced perf events are at system
wide scope and can be read from any L1-Lpar CPU, 'kvmppv_pmu's scope and
capabilities are updated appropriately.

Also introduce two new helpers. First is kvmppc_update_l0_stats() that uses
the infrastructure introduced in previous patches to issues the
H_GUEST_GET_STATE hcall L0-PowerVM to fetch guest-state-buffer holding the
latest values of these counters which is then parsed and 'l0_stats'
variable updated.

Second helper is kvmppc_pmu_event_update() which is called from
'kvmppv_pmu' callbacks and uses kvmppc_update_l0_stats() to update
'l0_stats' and the update the 'struct perf_event's event-counter.

Some minor updates to kvmppc_pmu_{add, del, read}() to remove some debug
scaffolding code.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_pmu.c | 92 +++++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_pmu.c b/arch/powerpc/kvm/book3s_hv_pmu.c
index 0107ed3b03e3..4c14c5885269 100644
--- a/arch/powerpc/kvm/book3s_hv_pmu.c
+++ b/arch/powerpc/kvm/book3s_hv_pmu.c
@@ -30,6 +30,11 @@
 #include "asm/guest-state-buffer.h"
 
 enum kvmppc_pmu_eventid {
+	KVMPPC_EVENT_HOST_HEAP,
+	KVMPPC_EVENT_HOST_HEAP_MAX,
+	KVMPPC_EVENT_HOST_PGTABLE,
+	KVMPPC_EVENT_HOST_PGTABLE_MAX,
+	KVMPPC_EVENT_HOST_PGTABLE_RECLAIM,
 	KVMPPC_EVENT_MAX,
 };
 
@@ -51,8 +56,14 @@ static DEFINE_SPINLOCK(lock_l0_stats);
 /* GSB related structs needed to talk to L0 */
 static struct kvmppc_gs_msg *gsm_l0_stats;
 static struct kvmppc_gs_buff *gsb_l0_stats;
+static struct kvmppc_gs_parser gsp_l0_stats;
 
 static struct attribute *kvmppc_pmu_events_attr[] = {
+	KVMPPC_PMU_EVENT_ATTR(host_heap, KVMPPC_EVENT_HOST_HEAP),
+	KVMPPC_PMU_EVENT_ATTR(host_heap_max, KVMPPC_EVENT_HOST_HEAP_MAX),
+	KVMPPC_PMU_EVENT_ATTR(host_pagetable, KVMPPC_EVENT_HOST_PGTABLE),
+	KVMPPC_PMU_EVENT_ATTR(host_pagetable_max, KVMPPC_EVENT_HOST_PGTABLE_MAX),
+	KVMPPC_PMU_EVENT_ATTR(host_pagetable_reclaim, KVMPPC_EVENT_HOST_PGTABLE_RECLAIM),
 	NULL,
 };
 
@@ -61,7 +72,7 @@ static const struct attribute_group kvmppc_pmu_events_group = {
 	.attrs = kvmppc_pmu_events_attr,
 };
 
-PMU_FORMAT_ATTR(event, "config:0");
+PMU_FORMAT_ATTR(event, "config:0-5");
 static struct attribute *kvmppc_pmu_format_attr[] = {
 	&format_attr_event.attr,
 	NULL,
@@ -78,6 +89,79 @@ static const struct attribute_group *kvmppc_pmu_attr_groups[] = {
 	NULL,
 };
 
+/*
+ * Issue the hcall to get the L0-host stats.
+ * Should be called with l0-stat lock held
+ */
+static int kvmppc_update_l0_stats(void)
+{
+	int rc;
+
+	/* With HOST_WIDE flags guestid and vcpuid will be ignored */
+	rc = kvmppc_gsb_recv(gsb_l0_stats, KVMPPC_GS_FLAGS_HOST_WIDE);
+	if (rc)
+		goto out;
+
+	/* Parse the guest state buffer is successful */
+	rc = kvmppc_gse_parse(&gsp_l0_stats, gsb_l0_stats);
+	if (rc)
+		goto out;
+
+	/* Update the l0 returned stats*/
+	memset(&l0_stats, 0, sizeof(l0_stats));
+	rc = kvmppc_gsm_refresh_info(gsm_l0_stats, gsb_l0_stats);
+
+out:
+	return rc;
+}
+
+/* Update the value of the given perf_event */
+static int kvmppc_pmu_event_update(struct perf_event *event)
+{
+	int rc;
+	u64 curr_val, prev_val;
+	unsigned long flags;
+	unsigned int config = event->attr.config;
+
+	/* Ensure no one else is modifying the l0_stats */
+	spin_lock_irqsave(&lock_l0_stats, flags);
+
+	rc = kvmppc_update_l0_stats();
+	if (!rc) {
+		switch (config) {
+		case KVMPPC_EVENT_HOST_HEAP:
+			curr_val = l0_stats.guest_heap;
+			break;
+		case KVMPPC_EVENT_HOST_HEAP_MAX:
+			curr_val = l0_stats.guest_heap_max;
+			break;
+		case KVMPPC_EVENT_HOST_PGTABLE:
+			curr_val = l0_stats.guest_pgtable_size;
+			break;
+		case KVMPPC_EVENT_HOST_PGTABLE_MAX:
+			curr_val = l0_stats.guest_pgtable_size_max;
+			break;
+		case KVMPPC_EVENT_HOST_PGTABLE_RECLAIM:
+			curr_val = l0_stats.guest_pgtable_reclaim;
+			break;
+		default:
+			rc = -ENOENT;
+			break;
+		}
+	}
+
+	spin_unlock_irqrestore(&lock_l0_stats, flags);
+
+	/* If no error than update the perf event */
+	if (!rc) {
+		prev_val = local64_xchg(&event->hw.prev_count, curr_val);
+		if (curr_val > prev_val)
+			local64_add(curr_val - prev_val, &event->count);
+	}
+
+	return rc;
+}
+
 static int kvmppc_pmu_event_init(struct perf_event *event)
 {
 	unsigned int config = event->attr.config;
@@ -100,15 +184,19 @@ static int kvmppc_pmu_event_init(struct perf_event *event)
 
 static void kvmppc_pmu_del(struct perf_event *event, int flags)
 {
+	/* Do nothing */
 }
 
 static int kvmppc_pmu_add(struct perf_event *event, int flags)
 {
+	if (flags & PERF_EF_START)
+		return kvmppc_pmu_event_update(event);
 	return 0;
 }
 
 static void kvmppc_pmu_read(struct perf_event *event)
 {
+	kvmppc_pmu_event_update(event);
 }
 
 /* Return the size of the needed guest state buffer */
@@ -292,6 +380,8 @@ static struct pmu kvmppc_pmu = {
 	.read = kvmppc_pmu_read,
 	.attr_groups = kvmppc_pmu_attr_groups,
 	.type = -1,
+	.scope = PERF_PMU_SCOPE_SYS_WIDE,
+	.capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT,
 };
 
 int kvmppc_register_pmu(void)
-- 
2.47.1



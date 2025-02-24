Return-Path: <linuxppc-dev+bounces-6418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2495A4203C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 14:16:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1h7x0MrMz306x;
	Tue, 25 Feb 2025 00:16:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740402973;
	cv=none; b=eTWzdJ5h9o+y2fR9W9dJtfSbuKv3tKBYApx4Okoiedhq553uuJdNEmoKeJby+XDvnVxuOmGEgJ9r1HA9h3bdV5dcIa6Hm3toGcZWxqs3A9wtjhIvXmZlP4tsHB9WlHDpMCbn+yzD1gh0mGLCLzH9/n8wsCAbE5jkkUDI9QCGoeEk2+UAsrZ7/M5ysQ6SoHckrVdUJseyUXFVQid/vOLIfXMbcSk3BbXyjY+cQrPg5ZnvbcIjHipyZaEPUQnn7w0QOn9V6ArnsmYsmWYMlDyKAeTdx+HYH5bEwkGt1ORYfu/xwuW4r/t63spNkvONGF2WoLehPCAI7C6UkoWGAISGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740402973; c=relaxed/relaxed;
	bh=dl8SVrboKeq7aVBmGcjGeRBoprOgzGNH8j+Ms0bo3U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gMZbMvNTbj78LhLMGcionnFm5Qzf6ZaKCOnzm+T+1XbK4qt0dCZ/rvuXG08tlH/XE+94MQNX3L7Y50fenSx+a0BmhXuqUxqRf5i2+ulWBAAwL0lh7Gl6d+WdkK+WEgrU8OFZbVo0BKDcRWjRScr2QBtHCJyRyQyA4pZsjEA2umgUemfbSpG0PcQdO3cRQw46xfIc+pvTr9r7Q+MjPQNssBVYCifzhsY8kyTTtyWuYF3nhdWnJvXkIK5sRW5ixMcxJ90K2F/fCM+ond0jl7aH+647hklilcQt02XxMujCXMUe7qqGxU9fwB03uWg7PMGphcoYhmY1rYC5o+BoaMW1MA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kjD9BgzA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kjD9BgzA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1h7w2QWvz305X
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 00:16:12 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O2DRd5020490;
	Mon, 24 Feb 2025 13:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dl8SVrboKeq7aVBmG
	cjGeRBoprOgzGNH8j+Ms0bo3U0=; b=kjD9BgzA4ZsJHde1fK+2yuwhh6iiGMN4n
	ugON0CSjbqvBvsEIkRwu5rK0JTa1oEBrH9iTLgIx8V65vm8fR7wSciW3JCBrtVTm
	BOzXbdO3+pRE5P873mZ0Gi/M4ZTnCMKfmvr2nvYMUr5NThAxXBK4mW9nAH2lhXSF
	4oRW1hmI6pQbvfKGq188/7Be0vDMPhGxnYhy6YuV1uva+3F9B/fYzOg8qsQZcvbA
	JuotoojsHXTSyErca8XLdvP+KlH8dtr8EK5ndQQbLMY8U0sbmyngOvOhRcfIMcVU
	jXGsZzw3aWRV1pdhGODRcc9aAH73tTUdYVFaeRO2gmVTiS9SJQT+g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450cta33un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:16:05 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51OD8RcV011551;
	Mon, 24 Feb 2025 13:16:05 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450cta33ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:16:05 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51OCToUA026304;
	Mon, 24 Feb 2025 13:16:04 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44yswn78mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:16:04 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51ODG03O54264272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 13:16:00 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B09720043;
	Mon, 24 Feb 2025 13:16:00 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF2E220040;
	Mon, 24 Feb 2025 13:15:55 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.210.32])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 24 Feb 2025 13:15:55 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 24 Feb 2025 18:45:54 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: [PATCH v4 5/6] powerpc/kvm-hv-pmu: Implement GSB message-ops for hostwide counters
Date: Mon, 24 Feb 2025 18:45:19 +0530
Message-ID: <20250224131522.77104-6-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224131522.77104-1-vaibhav@linux.ibm.com>
References: <20250224131522.77104-1-vaibhav@linux.ibm.com>
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
X-Proofpoint-GUID: P4UZNuUXTap0MBNtkOmZlADgKOMHNFzf
X-Proofpoint-ORIG-GUID: DYLTagw-olg6GQgzfr7rYL1-7tVCym-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_05,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240095
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Implement and setup necessary structures to send a prepolulated
Guest-State-Buffer(GSB) requesting hostwide counters to L0-PowerVM and have
the returned GSB holding the values of these counters parsed. This is done
via existing GSB implementation and with the newly added support of
Hostwide elements in GSB.

The request to L0-PowerVM to return Hostwide counters is done using a
pre-allocated GSB named 'gsb_l0_stats'. To be able to populate this GSB
with the needed Guest-State-Elements (GSIDs) a instance of 'struct
kvmppc_gs_msg' named 'gsm_l0_stats' is introduced. The 'gsm_l0_stats' is
tied to an instance of 'struct kvmppc_gs_msg_ops' named  'gsb_ops_l0_stats'
which holds various callbacks to be compute the size ( hostwide_get_size()
), populate the GSB ( hostwide_fill_info() ) and
refresh ( hostwide_refresh_info() ) the contents of
'l0_stats' that holds the Hostwide counters returned from L0-PowerVM.

To protect these structures from simultaneous access a spinlock
'lock_l0_stats' has been introduced. The allocation and initialization of
the above structures is done in newly introduced kvmppc_init_hostwide() and
similarly the cleanup is performed in newly introduced
kvmppc_cleanup_hostwide().

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

---
Changelog

v3->v4:
* Minor tweaks to code and patch description since this code is now being
built as a kernel module.
* Introduced kvmppc_events_sysfs_show() as power_events_sysfs_show() is not
exported to modules.

v2->v3:
Removed a redundant branch in kvmppc_init_hostwide() [Gautam]

v1->v2:
* Added error handling to hostwide_fill_info() [Gautam]
---
 arch/powerpc/perf/kvm-hv-pmu.c | 208 +++++++++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/arch/powerpc/perf/kvm-hv-pmu.c b/arch/powerpc/perf/kvm-hv-pmu.c
index c154f54e09e2..ed371454f7b5 100644
--- a/arch/powerpc/perf/kvm-hv-pmu.c
+++ b/arch/powerpc/perf/kvm-hv-pmu.c
@@ -27,10 +27,41 @@
 #include <asm/plpar_wrappers.h>
 #include <asm/firmware.h>
 
+#include "asm/guest-state-buffer.h"
+
 enum kvmppc_pmu_eventid {
 	KVMPPC_EVENT_MAX,
 };
 
+#define KVMPPC_PMU_EVENT_ATTR(_name, _id) \
+	PMU_EVENT_ATTR_ID(_name, kvmppc_events_sysfs_show, _id)
+
+static ssize_t kvmppc_events_sysfs_show(struct device *dev,
+					struct device_attribute *attr,
+					char *page)
+{
+	struct perf_pmu_events_attr *pmu_attr;
+
+	pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr);
+	return sprintf(page, "event=0x%02llx\n", pmu_attr->id);
+}
+
+/* Holds the hostwide stats */
+static struct kvmppc_hostwide_stats {
+	u64 guest_heap;
+	u64 guest_heap_max;
+	u64 guest_pgtable_size;
+	u64 guest_pgtable_size_max;
+	u64 guest_pgtable_reclaim;
+} l0_stats;
+
+/* Protect access to l0_stats */
+static DEFINE_SPINLOCK(lock_l0_stats);
+
+/* GSB related structs needed to talk to L0 */
+static struct kvmppc_gs_msg *gsm_l0_stats;
+static struct kvmppc_gs_buff *gsb_l0_stats;
+
 static struct attribute *kvmppc_pmu_events_attr[] = {
 	NULL,
 };
@@ -90,6 +121,176 @@ static void kvmppc_pmu_read(struct perf_event *event)
 {
 }
 
+/* Return the size of the needed guest state buffer */
+static size_t hostwide_get_size(struct kvmppc_gs_msg *gsm)
+
+{
+	size_t size = 0;
+	const u16 ids[] = {
+		KVMPPC_GSID_L0_GUEST_HEAP,
+		KVMPPC_GSID_L0_GUEST_HEAP_MAX,
+		KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE,
+		KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX,
+		KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(ids); i++)
+		size += kvmppc_gse_total_size(kvmppc_gsid_size(ids[i]));
+	return size;
+}
+
+/* Populate the request guest state buffer */
+static int hostwide_fill_info(struct kvmppc_gs_buff *gsb,
+			      struct kvmppc_gs_msg *gsm)
+{
+	int rc = 0;
+	struct kvmppc_hostwide_stats  *stats = gsm->data;
+
+	/*
+	 * It doesn't matter what values are put into request buffer as
+	 * they are going to be overwritten anyways. But for the sake of
+	 * testcode and symmetry contents of existing stats are put
+	 * populated into the request guest state buffer.
+	 */
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_HEAP))
+		rc = kvmppc_gse_put_u64(gsb,
+					KVMPPC_GSID_L0_GUEST_HEAP,
+					stats->guest_heap);
+
+	if (!rc && kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_HEAP_MAX))
+		rc = kvmppc_gse_put_u64(gsb,
+					KVMPPC_GSID_L0_GUEST_HEAP_MAX,
+					stats->guest_heap_max);
+
+	if (!rc && kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE))
+		rc = kvmppc_gse_put_u64(gsb,
+					KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE,
+					stats->guest_pgtable_size);
+	if (!rc &&
+	    kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX))
+		rc = kvmppc_gse_put_u64(gsb,
+					KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX,
+					stats->guest_pgtable_size_max);
+	if (!rc &&
+	    kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM))
+		rc = kvmppc_gse_put_u64(gsb,
+					KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM,
+					stats->guest_pgtable_reclaim);
+
+	return rc;
+}
+
+/* Parse and update the host wide stats from returned gsb */
+static int hostwide_refresh_info(struct kvmppc_gs_msg *gsm,
+				 struct kvmppc_gs_buff *gsb)
+{
+	struct kvmppc_gs_parser gsp = { 0 };
+	struct kvmppc_hostwide_stats *stats = gsm->data;
+	struct kvmppc_gs_elem *gse;
+	int rc;
+
+	rc = kvmppc_gse_parse(&gsp, gsb);
+	if (rc < 0)
+		return rc;
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_HEAP);
+	if (gse)
+		stats->guest_heap = kvmppc_gse_get_u64(gse);
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
+	if (gse)
+		stats->guest_heap_max = kvmppc_gse_get_u64(gse);
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
+	if (gse)
+		stats->guest_pgtable_size = kvmppc_gse_get_u64(gse);
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
+	if (gse)
+		stats->guest_pgtable_size_max = kvmppc_gse_get_u64(gse);
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
+	if (gse)
+		stats->guest_pgtable_reclaim = kvmppc_gse_get_u64(gse);
+
+	return 0;
+}
+
+/* gsb-message ops for setting up/parsing */
+static struct kvmppc_gs_msg_ops gsb_ops_l0_stats = {
+	.get_size = hostwide_get_size,
+	.fill_info = hostwide_fill_info,
+	.refresh_info = hostwide_refresh_info,
+};
+
+static int kvmppc_init_hostwide(void)
+{
+	int rc = 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&lock_l0_stats, flags);
+
+	/* already registered ? */
+	if (gsm_l0_stats) {
+		rc = 0;
+		goto out;
+	}
+
+	/* setup the Guest state message/buffer to talk to L0 */
+	gsm_l0_stats = kvmppc_gsm_new(&gsb_ops_l0_stats, &l0_stats,
+				      GSM_SEND, GFP_KERNEL);
+	if (!gsm_l0_stats) {
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	/* Populate the Idents */
+	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP);
+	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
+	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
+	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
+	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
+
+	/* allocate GSB. Guest/Vcpu Id is ignored */
+	gsb_l0_stats = kvmppc_gsb_new(kvmppc_gsm_size(gsm_l0_stats), 0, 0,
+				      GFP_KERNEL);
+	if (!gsb_l0_stats) {
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	/* ask the ops to fill in the info */
+	rc = kvmppc_gsm_fill_info(gsm_l0_stats, gsb_l0_stats);
+
+out:
+	if (rc) {
+		if (gsm_l0_stats)
+			kvmppc_gsm_free(gsm_l0_stats);
+		if (gsb_l0_stats)
+			kvmppc_gsb_free(gsb_l0_stats);
+		gsm_l0_stats = NULL;
+		gsb_l0_stats = NULL;
+	}
+	spin_unlock_irqrestore(&lock_l0_stats, flags);
+	return rc;
+}
+
+static void kvmppc_cleanup_hostwide(void)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&lock_l0_stats, flags);
+
+	if (gsm_l0_stats)
+		kvmppc_gsm_free(gsm_l0_stats);
+	if (gsb_l0_stats)
+		kvmppc_gsb_free(gsb_l0_stats);
+	gsm_l0_stats = NULL;
+	gsb_l0_stats = NULL;
+
+	spin_unlock_irqrestore(&lock_l0_stats, flags);
+}
+
 /* L1 wide counters PMU */
 static struct pmu kvmppc_pmu = {
 	.module = THIS_MODULE,
@@ -109,6 +310,10 @@ static int __init kvmppc_register_pmu(void)
 
 	/* only support events for nestedv2 right now */
 	if (kvmhv_is_nestedv2()) {
+		rc = kvmppc_init_hostwide();
+		if (rc)
+			goto out;
+
 		/* Setup done now register the PMU */
 		pr_info("Registering kvm-hv pmu");
 
@@ -118,12 +323,15 @@ static int __init kvmppc_register_pmu(void)
 					       -1) : 0;
 	}
 
+out:
 	return rc;
 }
 
 static void __exit kvmppc_unregister_pmu(void)
 {
 	if (kvmhv_is_nestedv2()) {
+		kvmppc_cleanup_hostwide();
+
 		if (kvmppc_pmu.type != -1)
 			perf_pmu_unregister(&kvmppc_pmu);
 
-- 
2.48.1



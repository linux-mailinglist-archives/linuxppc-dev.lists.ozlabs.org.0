Return-Path: <linuxppc-dev+bounces-5821-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC5A27606
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 16:36:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnSBY3z6Yz2yb9;
	Wed,  5 Feb 2025 02:36:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738683365;
	cv=none; b=Bn1N6IjJpSA2xdwudedL3I6wnm5o8rEExX3CZ6cePgb/yapmfvCskoztgUanvHdoroHQAFQItwhrbNCrsK55XhjcQhcwuHXgeoOIlnfC89Bh61S/NdH0leKKPc4Vt2RjmoJA0XKC+p8Zc9pGw+syplutLsnj0TDMFJ1b8Qphn78trCW2AyxfCEMxxK+sRiweNSIHsgKRafbgzDc8JDgBS5nzkC9mF1M7pWn8NQaf3TaBdNwyAn70PgTkwuR0TLzFLUyEU5MPbZn8Oiu/UsG+tnHKSbwGKovCfgqIQp3Qfn9oYaUj7mzeAnkalW0c2HRkocTiTRtNP6ea/ik06+U7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738683365; c=relaxed/relaxed;
	bh=zXfTgOKl+DjPA2fGZqnU5gjDzW6o4ycWla1wGPd4ezU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDHwM8Yp3XYHmgZWyYsKsWKAMbvByY3ZskdWjnovarfPyAKuW7/3tBWPC/0NpqyPRSaXzJisuuEFMK7LmsIFQx0ipr8/Ub6gMFuhbxRK5WZ3NqEijX+5jvQf6e/iXW06gAs+QtePHOjmDq4gN/G5w4R5quMssiyG31Hexi0XAI+Pk1x+VUAvPfYHJ+9hHJYqlZmb+Zp+nYE/9/eOD77hrEgw4UY3e/ZkUflJwV/n/JHhIAU5KTfIdvGqmoddIoMLhdJ04lbKRDjyVOPv0DBmu0DTNQLm+S0QllHXZbIy+C/4W2B7fRVzU0oJy8J64pNI+8u09VM5Dm+kKoY1gWiFMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=azqw3Oa5; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=azqw3Oa5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnSBS6Zbkz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 02:36:00 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514FXdmX032006;
	Tue, 4 Feb 2025 15:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=zXfTgOKl+DjPA2fGZqnU5gjDzW6o4ycWla1wGPd4e
	zU=; b=azqw3Oa5q8o1X/nBXtGEEsJNZdCTR9WQitfn0dD7G4qvSsRE+/Ef2LXQ9
	czp+vcuR9TYje0sU+Z1Z47BoWr4telC69U6mBjaOl+MScv4I7MtwFTOJxDDAvNLj
	BqRqxxTBag/vGXmBq/nvl3KRMp59hl2lObRizkHjhdwLuG0AlcggHqDeMOnXrbeG
	uJnbmbxjYyscsGq71y1KvUdaDvYq+HFBaP22jU50Nh5mHQDrR7fisg2rZPw6jKlN
	iw/xkGZYFJstDtNrZz/XF/MDtP1GUtFhybSibkp+7+zgfOGzw4eiSd8q1VaBD8S4
	Yq83sJTBIYm4R1VMawQJLWwU7bQjQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44k9r0ucwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 15:35:50 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 514CWJdI024492;
	Tue, 4 Feb 2025 15:35:49 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxxn466k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 15:35:49 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 514FZi6U45220110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 15:35:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 553DE20170;
	Tue,  4 Feb 2025 15:35:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98FA52016D;
	Tue,  4 Feb 2025 15:35:30 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.20.128])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue,  4 Feb 2025 15:35:30 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Tue, 04 Feb 2025 21:05:29 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, atrajeev@linux.vnet.ibm.com,
        kjain@linux.ibm.com, disgoel@linux.ibm.com, hbathini@linux.ibm.com,
        adubey@linux.ibm.com, gautam@linux.ibm.com
Subject: [PATCH] powerpc/perf: Fix ref-counting on the PMU 'vpa_pmu'
Date: Tue,  4 Feb 2025 21:05:26 +0530
Message-ID: <20250204153527.125491-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-ORIG-GUID: j8VMVzV3XjJOM6tez38eW0nLfH7Sx5HE
X-Proofpoint-GUID: j8VMVzV3XjJOM6tez38eW0nLfH7Sx5HE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_07,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040120
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 176cda0619b6 ("powerpc/perf: Add perf interface to expose vpa
counters") introduced 'vpa_pmu' to expose Book3s-HV nested APIv2 provided
L1<->L2 context switch latency counters to L1 user-space via
perf-events. However the newly introduced PMU named 'vpa_pmu' doesn't
assign ownership of the PMU to the module 'vpa_pmu'. Consequently the
module 'vpa_pmu' can be unloaded while one of the perf-events are still
active, which can lead to kernel oops and panic of the form below on a
Pseries-LPAR:

BUG: Kernel NULL pointer dereference on read at 0x00000058
<snip>
 NIP [c000000000506cb8] event_sched_out+0x40/0x258
 LR [c00000000050e8a4] __perf_remove_from_context+0x7c/0x2b0
 Call Trace:
 [c00000025fc3fc30] [c00000025f8457a8] 0xc00000025f8457a8 (unreliable)
 [c00000025fc3fc80] [fffffffffffffee0] 0xfffffffffffffee0
 [c00000025fc3fcd0] [c000000000501e70] event_function+0xa8/0x120
<snip>
 Kernel panic - not syncing: Aiee, killing interrupt handler!

Fix this by adding the module ownership to 'vpa_pmu' so that the module
'vpa_pmu' is ref-counted and prevented from being unloaded when perf-events
are initialized.

Fixes: 176cda0619b6 ("powerpc/perf: Add perf interface to expose vpa counters")
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/perf/vpa-pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/perf/vpa-pmu.c b/arch/powerpc/perf/vpa-pmu.c
index 6a5bfd2a13b5..840733468959 100644
--- a/arch/powerpc/perf/vpa-pmu.c
+++ b/arch/powerpc/perf/vpa-pmu.c
@@ -156,6 +156,7 @@ static void vpa_pmu_del(struct perf_event *event, int flags)
 }
 
 static struct pmu vpa_pmu = {
+	.module		= THIS_MODULE,
 	.task_ctx_nr	= perf_sw_context,
 	.name		= "vpa_pmu",
 	.event_init	= vpa_pmu_event_init,
-- 
2.48.1



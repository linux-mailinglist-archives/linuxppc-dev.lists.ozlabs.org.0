Return-Path: <linuxppc-dev+bounces-6224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749F7A37638
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2025 18:13:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ywsn92Zycz2yFP;
	Mon, 17 Feb 2025 04:13:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739725997;
	cv=none; b=LMYWOCa+9JPP4ini94X5gHiLhR/TE5NV+8NQOXDXTQ05jnFi+lBNG1/NZniaTrRoyJAgO4NcqBwTvsDbYG9bKqvjsIIf/ipe04RmanniUy7WP3id9vi+xgqnMYNS1jRJzSWWPR+IdKWVViZDKanrTRbHWdo8mctCEAy2evG/CD5Jnirq1FGdFTLSFIoLR/vx6qqRQO1vdaOjd9s3mPHXYq1/vhWEJ3zcfPdNm1YbNlvYgW2MMIqJ5VfFYD2mNxUWyShGLGeT3K9aL9KR5teg8AFy77TuwcF/knuBtA81tM+2WnIvUv5T++F5o2fajyt5IKyG3tyHTvbnyOsQA4aWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739725997; c=relaxed/relaxed;
	bh=fA+5p/QTwb9VhPa2FqZwuO4IThHRd2HorNt38exahFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fzCyPE9IlGO4wuq9uP788RkWOyCerJswNhiMZdQZ1d+x3B7eqwQZ+2icjulnNWXMuy6TDismG2FS4RnDHDP3R9d3SWlgaMoack5SlOpwy7RTrsSkE7Rcxl5L1kOy4DZeEUeGjmDPPl6QsjQy6ZeX9/WiN9K40YPyQRpiJY3y0xQ+qe0+C0QnlZBF+Ru3vQFkAEz5fM+yJd5ymx/nRTOeU92VaZKRxRoJZL5dgIBQBjwO4wLlRXBZSArmH/qBtrHNQOQ4OPlifozEhoarzSIKD13ToORvdkbymUMtqiRvON5f4Ogwl4pFOZxRSGcgPsakJJGZcFalMqr2z7Xjx+KvyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rUJzuaQm; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rUJzuaQm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ywsn83nnfz2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 04:13:16 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51GAtqom010436;
	Sun, 16 Feb 2025 17:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=fA+5p/QTwb9VhPa2F
	qZwuO4IThHRd2HorNt38exahFE=; b=rUJzuaQmyQKOWJzPcQpTFXlz88a1RAjFC
	rS0Wwfi7nY78EMw3LGk8n5HMunL0WW92RcwZSHviGFzd+HIjng5FwA6cbsPScQhM
	7Fyu543mU/twxM9IGL2jrwxZQtzpScOmQFrYXYe3F73njCBmddx4SAnxfwbRoxDD
	HPUeslK91dBiDfXhUo0kAHiJ/tE+XkHXgFUdm9opvbDaDp03PgqEVS71jwzpx800
	73GFxkjRTOwNH+G4mup3TDyvs35x6t2TTIrGzV6USYSOh0YF9bYsAgvpXBALrgb8
	Fh7FIxrMRs0yTIzkN5DdgGfN/HJeObzoQ27VxwFyYlf3sWzVcy1uA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44u6uytcup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:13:05 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51GHD4R5026075;
	Sun, 16 Feb 2025 17:13:05 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44u6uytcuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:13:04 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51GClX8c032435;
	Sun, 16 Feb 2025 17:13:04 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u6rkjew6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:13:04 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51GHD08H30540528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 16 Feb 2025 17:13:00 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CF3A20040;
	Sun, 16 Feb 2025 17:13:00 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9053E20049;
	Sun, 16 Feb 2025 17:12:56 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.47.251])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 16 Feb 2025 17:12:56 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 4/4] powerpc/perf/vpa-pmu: Avoid loading vpa-pmy driver during dump kernel
Date: Sun, 16 Feb 2025 22:42:26 +0530
Message-ID: <20250216171226.432906-4-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250216171226.432906-1-maddy@linux.ibm.com>
References: <20250216171226.432906-1-maddy@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: Xf2reVFHc2sc1aHiFqzIVyz7SYU46Nd5
X-Proofpoint-GUID: mllFJYC_0641mJmtsC8MBnvfMAEDq9OC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-16_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502160154
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

vpa-pmu driver is used to collect latency metrics for host to guest
or guest to host context switches in a PowerVM KVM guest scenario.
This may not be used during the dump kernel, avoid loading it

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/perf/vpa-pmu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/perf/vpa-pmu.c b/arch/powerpc/perf/vpa-pmu.c
index 6a5bfd2a13b5..f7f72b976c1d 100644
--- a/arch/powerpc/perf/vpa-pmu.c
+++ b/arch/powerpc/perf/vpa-pmu.c
@@ -10,6 +10,8 @@
 #include <linux/perf_event.h>
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s_64.h>
+#include <asm/fadump.h>
+#include <asm/kexec.h>
 
 #define MODULE_VERS "1.0"
 #define MODULE_NAME "pseries_vpa_pmu"
@@ -183,6 +185,9 @@ static int __init pseries_vpa_pmu_init(void)
 	if (!firmware_has_feature(FW_FEATURE_LPAR) || is_kvm_guest())
 		return -ENODEV;
 
+	if (is_kdump_kernel() || is_fadump_active())
+		return 0;
+
 	perf_pmu_register(&vpa_pmu, vpa_pmu.name, -1);
 	pr_info("Virtual Processor Area PMU registered.\n");
 
-- 
2.47.0



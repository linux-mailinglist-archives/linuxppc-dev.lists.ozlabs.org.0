Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D32D1D44
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:23:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqdBM6ZWrzDqWf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:23:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NEPyqWQK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcV61njYzDqVN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:14 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LeLCD130739
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WpJqQaSGqBWGkQ5b09EpbYN2V+pBQI2ei6abmiLRIYY=;
 b=NEPyqWQKOLp/S4TgC+9XTDwNToOtX81Io4jEMI/72Y8r/8Bz8bcpvRrtUa5FPNQ1Vbnu
 +bBG02upYKfV5UYasNDSKL0NA81bdjF0VkVNbp9gqnQKMMvEBZZUkirgzsSbpWMRdS1H
 8/KNK1SVTANypmAijxwHR2iorKYuCJSu9VL0bFQueyZk75x2n/dQlUjiolE1mzTTR5e9
 QUXc8XEjDIQkMuZGnz6Hak/nnrpQ6XI2UXmnuZexE6+ttaLOl523Nw16L41gz77xJtTw
 zk00sO32nzV/mlm6yHoXBXBgj9WTkui3ZxYcln0UBLMAcfzF2ofumF7obxsmEakELG21 jQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s0mxa2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:12 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LkuMT026702
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:11 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3581u97qp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:11 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqAki30933482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:10 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAD1FAC05B;
 Mon,  7 Dec 2020 21:52:10 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CF1DAC059;
 Mon,  7 Dec 2020 21:52:10 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:10 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 13/28] powerpc/pseries/mobility: signal suspend
 cancellation to platform
Date: Mon,  7 Dec 2020 15:51:45 -0600
Message-Id: <20201207215200.1785968-14-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=956 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=1 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070140
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If we're returning an error to user space, use H_VASI_SIGNAL to send a
cancellation request to the platform. This isn't strictly required but
it communicates that Linux will not attempt to complete the suspend,
which allows the various entities involved to promptly end the
operation in progress.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 5a3951626a96..f234a7ed87aa 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -513,6 +513,35 @@ static int do_join(void *arg)
 	return ret;
 }
 
+/*
+ * Abort reason code byte 0. We use only the 'Migrating partition' value.
+ */
+enum vasi_aborting_entity {
+	ORCHESTRATOR        = 1,
+	VSP_SOURCE          = 2,
+	PARTITION_FIRMWARE  = 3,
+	PLATFORM_FIRMWARE   = 4,
+	VSP_TARGET          = 5,
+	MIGRATING_PARTITION = 6,
+};
+
+static void pseries_cancel_migration(u64 handle, int err)
+{
+	u32 reason_code;
+	u32 detail;
+	u8 entity;
+	long hvrc;
+
+	entity = MIGRATING_PARTITION;
+	detail = abs(err) & 0xffffff;
+	reason_code = (entity << 24) | detail;
+
+	hvrc = plpar_hcall_norets(H_VASI_SIGNAL, handle,
+				  H_VASI_SIGNAL_CANCEL, reason_code);
+	if (hvrc)
+		pr_err("H_VASI_SIGNAL error: %ld\n", hvrc);
+}
+
 static int pseries_migrate_partition(u64 handle)
 {
 	atomic_t counter = ATOMIC_INIT(0);
@@ -525,6 +554,8 @@ static int pseries_migrate_partition(u64 handle)
 	ret = stop_machine(do_join, &counter, cpu_online_mask);
 	if (ret == 0)
 		post_mobility_fixup();
+	else
+		pseries_cancel_migration(handle, ret);
 
 	return ret;
 }
-- 
2.28.0


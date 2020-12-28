Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 031102E353D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Dec 2020 09:53:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4BD51QkDzDqDZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Dec 2020 19:53:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ETcFxcoX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4BBc0nmRzDqBv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Dec 2020 19:52:23 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BS8nvvb069862; Mon, 28 Dec 2020 03:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lm/14L4B31f/728y9VwO7J3Q9JvfcFXzNDDqbk+7ydc=;
 b=ETcFxcoXSN7/bcZsGEMQMtpcPVI9FXS8A4QjXS2rc07b9wxhRNE2Lo1cELMO2VPJsYRe
 Tr8KbPD3J+pcYu0+aEW2F6DBlQqHBFmQO7yrdRw/iyKZesOVhtNQQAHPHrP/Es/IlIh/
 VMropwGlXCmKcW/QYY/yQbiMIed4ut5PQZeYH9s+PQHBfu2iXyenQttqckVUMpgnUcUE
 89GAdEVhi/X3HS1yVNQ6KMaMkpPmJoa3Fcoq1EA21IZcYQaY7LNuiT4f82cOD2ujGSaD
 ZSCjQcVOakbCuNapuSJDRkUyuHLLMa+Xa9zpQO7MaQ/Y5PuEjmXxFw2ySyb5Po40O73u nw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35qc6rr0rs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Dec 2020 03:52:17 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BS8lnLj024100;
 Mon, 28 Dec 2020 08:52:15 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 35nvt80xds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Dec 2020 08:52:14 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BS8qCYm44499234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Dec 2020 08:52:12 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B70E211C04A;
 Mon, 28 Dec 2020 08:52:12 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02CD611C04C;
 Mon, 28 Dec 2020 08:52:11 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.39.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 28 Dec 2020 08:52:10 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc/perf/hv-24x7: Dont create sysfs event files for
 dummy events
Date: Mon, 28 Dec 2020 14:22:04 +0530
Message-Id: <20201228085204.18026-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-28_07:2020-12-24,
 2020-12-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012280047
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
Cc: kjain@linux.ibm.com, suka@us.ibm.com, maddy@linux.vnet.ibm.com,
 atrajeev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hv_24x7 performance monitoring unit creates list of supported events
from the event catalog obtained via HCALL. hv_24x7 catalog could also
contain invalid or dummy events with names like RESERVED*.
These events does not have any hardware counters backing them.
So patch adds a check to string compare the event names
to filter out them.

Result in power9 machine:

Before this patch:
.....
  hv_24x7/PM_XLINK2_OUT_ODD_CYC,chip=?/              [Kernel PMU event]
  hv_24x7/PM_XLINK2_OUT_ODD_DATA_COUNT,chip=?/       [Kernel PMU event]
  hv_24x7/PM_XLINK2_OUT_ODD_TOTAL_UTIL,chip=?/       [Kernel PMU event]
  hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT,chip=?/         [Kernel PMU event]
  hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT_MISS,chip=?/    [Kernel PMU event]
  hv_24x7/PM_XTS_ATSD_SENT,chip=?/                   [Kernel PMU event]
  hv_24x7/PM_XTS_ATSD_TLBI_RCV,chip=?/               [Kernel PMU event]
  hv_24x7/RESERVED_NEST1,chip=?/                     [Kernel PMU event]
  hv_24x7/RESERVED_NEST10,chip=?/                    [Kernel PMU event]
  hv_24x7/RESERVED_NEST11,chip=?/                    [Kernel PMU event]
  hv_24x7/RESERVED_NEST12,chip=?/                    [Kernel PMU event]
  hv_24x7/RESERVED_NEST13,chip=?/                    [Kernel PMU event]
......

Dmesg:
[    0.000362] printk: console [hvc0] enabled
[    0.815452] hv-24x7: read 1530 catalog entries, created 537 event attrs
(0 failures), 275 descs

After this patch:
......
  hv_24x7/PM_XLINK2_OUT_ODD_AVLBL_CYC,chip=?/        [Kernel PMU event]
  hv_24x7/PM_XLINK2_OUT_ODD_CYC,chip=?/              [Kernel PMU event]
  hv_24x7/PM_XLINK2_OUT_ODD_DATA_COUNT,chip=?/       [Kernel PMU event]
  hv_24x7/PM_XLINK2_OUT_ODD_TOTAL_UTIL,chip=?/       [Kernel PMU event]
  hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT,chip=?/         [Kernel PMU event]
  hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT_MISS,chip=?/    [Kernel PMU event]
  hv_24x7/PM_XTS_ATSD_SENT,chip=?/                   [Kernel PMU event]
  hv_24x7/PM_XTS_ATSD_TLBI_RCV,chip=?/               [Kernel PMU event]
  hv_24x7/TOD,chip=?/                                [Kernel PMU event]
......

Demsg:
[    0.000357] printk: console [hvc0] enabled
[    0.808592] hv-24x7: read 1530 catalog entries, created 509 event attrs
(0 failures), 275 descs

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-24x7.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

---
Changelog
v2 -> v3
- Removed "FREE_" check from "ignore_event".

v1 -> v2
- Include "RESERVED*" as part of the invalid event check as
  suggested by Madhavan Srinivasan
- Add new helper function "ignore_event" to check invalid/dummy
  events as suggested by Michael Ellerman
- Remove pr_info to print each invalid event as suggested by
  Michael Ellerman
---
diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 6e7e820508df..2f32b532b359 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -764,6 +764,14 @@ static ssize_t catalog_event_len_validate(struct hv_24x7_event_data *event,
 	return ev_len;
 }
 
+/*
+ * Return true incase of invalid or dummy events with names like RESERVED*
+ */
+static bool ignore_event(const char *name)
+{
+	return (!strncmp(name, "RESERVED", 8)) ? true : false;
+}
+
 #define MAX_4K (SIZE_MAX / 4096)
 
 static int create_events_from_catalog(struct attribute ***events_,
@@ -894,6 +902,10 @@ static int create_events_from_catalog(struct attribute ***events_,
 
 		name = event_name(event, &nl);
 
+		if (ignore_event(name)) {
+			junk_events++;
+			continue;
+		}
 		if (event->event_group_record_len == 0) {
 			pr_devel("invalid event %zu (%.*s): group_record_len == 0, skipping\n",
 					event_idx, nl, name);
@@ -955,6 +967,9 @@ static int create_events_from_catalog(struct attribute ***events_,
 			continue;
 
 		name  = event_name(event, &nl);
+		if (ignore_event(name))
+			continue;
+
 		nonce = event_uniq_add(&ev_uniq, name, nl, event->domain);
 		ct    = event_data_to_attrs(event_idx, events + event_attr_ct,
 					    event, nonce);
-- 
2.27.0


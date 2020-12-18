Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A062DE0B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 11:02:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cy4DS3rZNzDqKW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 21:02:48 +1100 (AEDT)
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
 header.s=pp1 header.b=k65nPqUK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cy4Bt2Lz5zDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 21:01:25 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BI9pLwK161672; Fri, 18 Dec 2020 05:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tWk5GqnwzLpNwCI7f111niVOmx7X8CaydgaUmuWFM9E=;
 b=k65nPqUKsLUdfKyZD8a+N2RMqFdruwWB/Hl82PxcMOJcOuWaqUX3yZNWXfK7P1hJVMKy
 os3voMg4njqgx5aNxC+XbyXmxYS0c0U58VZbyvYQb6GSQ/h6OwIz7uJ3Vg4RYvtdQjPf
 qRE3Sh2axrIDsHa2kqCkJymMa9dfaDDEz5LiR+LP2kBS3+7RvUJ3J0q3/hIZ3MVcwUqG
 26I00gNEavUHYj3a5rxPolR8dyjaCBPxrIbVOs2plff2KYV1Sye8MNq1L4VkL2Sprdpv
 0/pFGaqSDmlVN6C9iUm4pM32pB8QBbkPM4CpRA+oYSN7priMIJxAwXhWaWFcstiYnQB7 ew== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35gt5n86mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 05:01:19 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BI9vm9U020027;
 Fri, 18 Dec 2020 10:01:16 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 35cng867ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 10:01:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BIA1EJM45941110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 10:01:14 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 656D552076;
 Fri, 18 Dec 2020 10:01:14 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.198.66])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EC3DB52078;
 Fri, 18 Dec 2020 10:01:12 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/perf/hv-24x7: Dont create sysfs event files for
 dummy events
Date: Fri, 18 Dec 2020 15:31:00 +0530
Message-Id: <20201218100100.1166111-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_05:2020-12-18,
 2020-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180069
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
contain invalid or dummy events (with names like FREE_* or CPM_FREE_*
and RESERVED*). These events do not have any hardware counters
backing them. So patch adds a check to string compare the event names
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
 arch/powerpc/perf/hv-24x7.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

---
Changelog
v1 -> v2
- Include "RESERVED*" as part of the invalid event check as
  suggested by Madhavan Srinivasan
- Add new helper function "ignore_event" to check invalid/dummy
  events as suggested by Michael Ellerman
- Remove pr_info to print each invalid event as suggested by
  Michael Ellerman
---
diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 6e7e820508df..1a6004d88f98 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -764,6 +764,16 @@ static ssize_t catalog_event_len_validate(struct hv_24x7_event_data *event,
 	return ev_len;
 }
 
+/*
+ * Return true incase of invalid or dummy events with names like FREE_* or CPM_FREE_*
+ * and RESERVED*
+ */
+static bool ignore_event(const char *name)
+{
+	return (strstr(name, "FREE_") || !strncmp(name, "RESERVED", 8)) ?
+			true : false;
+}
+
 #define MAX_4K (SIZE_MAX / 4096)
 
 static int create_events_from_catalog(struct attribute ***events_,
@@ -894,6 +904,10 @@ static int create_events_from_catalog(struct attribute ***events_,
 
 		name = event_name(event, &nl);
 
+		if (ignore_event(name)) {
+			junk_events++;
+			continue;
+		}
 		if (event->event_group_record_len == 0) {
 			pr_devel("invalid event %zu (%.*s): group_record_len == 0, skipping\n",
 					event_idx, nl, name);
@@ -955,6 +969,9 @@ static int create_events_from_catalog(struct attribute ***events_,
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


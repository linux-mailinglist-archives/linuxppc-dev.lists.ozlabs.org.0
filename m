Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB282DD07A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 12:37:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxVNY1MYBzDqTJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 22:37:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SA/NWuFm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxVJN6Q2jzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 22:34:09 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BHBWDpm014233; Thu, 17 Dec 2020 06:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=sD0/bJGaQNhvpmduiEa9jmNhI2dYNQMxJFGLEi2uvdA=;
 b=SA/NWuFm9X9WZ1vtxZxnSrxMKTP/mcQJqK80q3tZGfE9wfbO/RS++E+9iFYRIR1Nutli
 vrkOdCQ5SZEplg8QwUByuu9Mpd0LZfuA8RAXbEVKm9EHWqvRxq/Y31Pt56A7WPu0/2i8
 WMd8BSe3YJ+0LOq0eD7vY9b7Ri97u7W8/88MSPF+5BGIW92fjf1uaSkHR3uq6G3nkM3Q
 6CmlWD31s1rGNVrM2dr3yrt6SqUpC2B9oIHKePpS03yP8rnXHrBR6SWTkriVwAIxtoG0
 XgUNAmsyqfAw8YLrPBPOxFGGWHIGL9aCvzzLk1e3rwrVkJPZ3XQnAxOBJTiHrki4vbER 5A== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35g5ukh9vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 06:34:01 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BHBNKBZ012484;
 Thu, 17 Dec 2020 11:33:59 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 35cng8fu21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 11:33:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BHBWffU12779934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 11:32:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0C8911C06C;
 Thu, 17 Dec 2020 11:32:41 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C911011C069;
 Thu, 17 Dec 2020 11:32:39 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.209.142])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Dec 2020 11:32:39 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/perf/hv-24x7: Dont create sysfs event files for dummy
 events
Date: Thu, 17 Dec 2020 17:02:30 +0530
Message-Id: <20201217113230.1069882-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_07:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170080
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
contain invalid or dummy events (with names like FREE_  or CPM_FREE_ so
on). These events does not have any hardware counters backing them.
So patch adds a check to string compare the event names to filter
out them.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-24x7.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 6e7e820508df..c3252d8a7818 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -894,6 +894,11 @@ static int create_events_from_catalog(struct attribute ***events_,
 
 		name = event_name(event, &nl);
 
+		if (strstr(name, "FREE_")) {
+			pr_info("invalid event %zu (%.*s)\n", event_idx, nl, name);
+			junk_events++;
+			continue;
+		}
 		if (event->event_group_record_len == 0) {
 			pr_devel("invalid event %zu (%.*s): group_record_len == 0, skipping\n",
 					event_idx, nl, name);
@@ -955,6 +960,9 @@ static int create_events_from_catalog(struct attribute ***events_,
 			continue;
 
 		name  = event_name(event, &nl);
+		if (strstr(name, "FREE_"))
+			continue;
+
 		nonce = event_uniq_add(&ev_uniq, name, nl, event->domain);
 		ct    = event_data_to_attrs(event_idx, events + event_attr_ct,
 					    event, nonce);
-- 
2.26.2


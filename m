Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E571879AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 07:31:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hNcJ6ZZmzDqcH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 17:31:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hNSK0sQWzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 17:24:48 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02H6LRpS143340
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:24:46 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yrsdrw719-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:24:46 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Tue, 17 Mar 2020 06:24:44 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Mar 2020 06:24:38 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02H6ObxF55050296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 06:24:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ABC611C064;
 Tue, 17 Mar 2020 06:24:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E2E411C054;
 Tue, 17 Mar 2020 06:24:29 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.63.85])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 06:24:29 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 sukadev@linux.vnet.ibm.com
Subject: [PATCH v5 03/11] powerpc/perf/hv-24x7: Fix inconsistent output values
 incase multiple hv-24x7 events run
Date: Tue, 17 Mar 2020 11:53:25 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200317062333.14555-1-kjain@linux.ibm.com>
References: <20200317062333.14555-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031706-0008-0000-0000-0000035E870D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031706-0009-0000-0000-00004A7FDC8B
Message-Id: <20200317062333.14555-4-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_01:2020-03-12,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 adultscore=0 malwarescore=0 mlxlogscore=776 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003170024
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, kjain@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 2b206ee6b0df ("powerpc/perf/hv-24x7: Display change in counter
values")' added to print _change_ in the counter value rather then raw
value for 24x7 counters. Incase of transactions, the event count
is set to 0 at the beginning of the transaction. It also sets
the event's prev_count to the raw value at the time of initialization.
Because of setting event count to 0, we are seeing some weird behaviour,
whenever we run multiple 24x7 events at a time.

For example:

command#: ./perf stat -e "{hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/,
			   hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=1/}"
	  		   -C 0 -I 1000 sleep 100

     1.000121704                120 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/
     1.000121704                  5 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=1/
     2.000357733                  8 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/
     2.000357733                 10 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=1/
     3.000495215 18,446,744,073,709,551,616 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/
     3.000495215 18,446,744,073,709,551,616 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=1/
     4.000641884                 56 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/
     4.000641884 18,446,744,073,709,551,616 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=1/
     5.000791887 18,446,744,073,709,551,616 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/

Getting these large values in case we do -I.

As we are setting event_count to 0, for interval case, overall event_count is not
coming in incremental order. As we may can get new delta lesser then previous count.
Because of which when we print intervals, we are getting negative value which create
these large values.

This patch removes part where we set event_count to 0 in function
'h_24x7_event_read'. There won't be much impact as we do set event->hw.prev_count
to the raw value at the time of initialization to print change value.

With this patch
In power9 platform

command#: ./perf stat -e "{hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/,
		           hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=1/}"
			   -C 0 -I 1000 sleep 100

     1.000117685                 93 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/
     1.000117685                  1 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=1/
     2.000349331                 98 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/
     2.000349331                  2 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=1/
     3.000495900                131 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/
     3.000495900                  4 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=1/
     4.000645920                204 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/
     4.000645920                 61 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=1/
     4.284169997                 22 hv_24x7/PM_MCS01_128B_RD_DISP_PORT01,chip=0/

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Suggested-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/hv-24x7.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 573e0b309c0c..48e8f4b17b91 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -1400,16 +1400,6 @@ static void h_24x7_event_read(struct perf_event *event)
 			h24x7hw = &get_cpu_var(hv_24x7_hw);
 			h24x7hw->events[i] = event;
 			put_cpu_var(h24x7hw);
-			/*
-			 * Clear the event count so we can compute the _change_
-			 * in the 24x7 raw counter value at the end of the txn.
-			 *
-			 * Note that we could alternatively read the 24x7 value
-			 * now and save its value in event->hw.prev_count. But
-			 * that would require issuing a hcall, which would then
-			 * defeat the purpose of using the txn interface.
-			 */
-			local64_set(&event->count, 0);
 		}
 
 		put_cpu_var(hv_24x7_reqb);
-- 
2.18.1


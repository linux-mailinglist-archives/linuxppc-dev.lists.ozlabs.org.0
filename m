Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC911C6F1A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 13:18:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HDc24fclzDqwM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 21:18:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HDNZ1FMfzDqf9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 21:08:29 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 046AVsPb063193; Wed, 6 May 2020 07:08:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30u8t6thvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 07:08:21 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 046AlsVg112151;
 Wed, 6 May 2020 07:08:21 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30u8t6thth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 07:08:20 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 046B5UO0018882;
 Wed, 6 May 2020 11:08:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 30s0g5s05x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 11:08:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 046B8Fdk10617292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 May 2020 11:08:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E9C0A4057;
 Wed,  6 May 2020 11:08:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8612FA4055;
 Wed,  6 May 2020 11:08:11 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.39.184])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 May 2020 11:08:11 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 suka@us.ibm.com
Subject: [PATCH v8 5/5] powerpc/hv-24x7: Update post_mobility_fixup() to
 handle migration
Date: Wed,  6 May 2020 16:37:37 +0530
Message-Id: <20200506110737.14904-6-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200506110737.14904-1-kjain@linux.ibm.com>
References: <20200506110737.14904-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-06_03:2020-05-05,
 2020-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005060079
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com, jmario@redhat.com,
 peterz@infradead.org, gregkh@linuxfoundation.org, mpetlan@redhat.com,
 alexander.shishkin@linux.intel.com, ak@linux.intel.com,
 yao.jin@linux.intel.com, anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 jolsa@kernel.org, namhyung@kernel.org, mingo@kernel.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Function 'read_sys_info_pseries()' is added to get system parameter
values like number of sockets and chips per socket.
and it gets these details via rtas_call with token
"PROCESSOR_MODULE_INFO".

Incase lpar migrate from one system to another, system
parameter details like chips per sockets or number of sockets might
change. So, it needs to be re-initialized otherwise, these values
corresponds to previous system values.
This patch adds a call to 'read_sys_info_pseries()' from
'post-mobility_fixup()' to re-init the physsockets and physchips values

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index b571285f6c14..0fb8f1e6e9d2 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -42,6 +42,12 @@ struct update_props_workarea {
 #define MIGRATION_SCOPE	(1)
 #define PRRN_SCOPE -2
 
+#ifdef CONFIG_HV_PERF_CTRS
+void read_sys_info_pseries(void);
+#else
+static inline void read_sys_info_pseries(void) { }
+#endif
+
 static int mobility_rtas_call(int token, char *buf, s32 scope)
 {
 	int rc;
@@ -371,6 +377,16 @@ void post_mobility_fixup(void)
 	/* Possibly switch to a new RFI flush type */
 	pseries_setup_rfi_flush();
 
+	/*
+	 * In case an Lpar migrates from one system to another, system
+	 * parameter details like chips per sockets, cores per chip and
+	 * number of sockets details might change.
+	 * So, they needs to be re-initialized otherwise the
+	 * values will correspond to the previous system.
+	 * Call read_sys_info_pseries() to reinitialise the values.
+	 */
+	read_sys_info_pseries();
+
 	return;
 }
 
-- 
2.18.2


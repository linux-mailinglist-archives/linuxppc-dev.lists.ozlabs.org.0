Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD726195198
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 07:50:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pXYq1PBkzDqWk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 17:50:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pXGs1DFvzDr4d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 17:37:56 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02R6XFEx185689
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 02:37:54 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywek0k9cq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 02:37:54 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Fri, 27 Mar 2020 06:37:31 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Mar 2020 06:37:25 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02R6bUHl47054950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 06:37:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B72C52059;
 Fri, 27 Mar 2020 06:37:30 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.85.82])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3122D5204F;
 Fri, 27 Mar 2020 06:37:23 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 sukadev@linux.vnet.ibm.com
Subject: [PATCH v7 5/5] powerpc/hv-24x7: Update post_mobility_fixup() to
 handle migration
Date: Fri, 27 Mar 2020 12:06:42 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200327063642.26175-1-kjain@linux.ibm.com>
References: <20200327063642.26175-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032706-0016-0000-0000-000002F8F1FF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032706-0017-0000-0000-0000335CA191
Message-Id: <20200327063642.26175-6-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-27_01:2020-03-26,
 2020-03-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=475
 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003270059
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

Function 'read_sys_info_pseries()' is added to get system parameter
values like number of sockets and chips per socket.
and it gets these details via rtas_call with token
"PROCESSOR_MODULE_INFO".

Incase lpar migrate from one system to another, system
parameter details like chips per sockets or number of sockets might
change. So, it needs to be re-initialized otherwise, these values
corresponds to previous system values.
This patch adds a call to 'read_sys_info_pseries()' from
'post-mobility_fixup()' to re-init the physsockets and physchips values.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index b571285f6c14..226accd6218b 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -371,6 +371,18 @@ void post_mobility_fixup(void)
 	/* Possibly switch to a new RFI flush type */
 	pseries_setup_rfi_flush();
 
+	/*
+	 * Incase lpar migrate from one system to another, system
+	 * parameter details like chips per sockets and number of sockets
+	 * might change. So, it needs to be re-initialized otherwise these
+	 * values corresponds to previous system.
+	 * Here, adding a call to read_sys_info_pseries() declared in
+	 * platforms/pseries/pseries.h to re-init the physsockets and
+	 * physchips value.
+	 */
+	if (IS_ENABLED(CONFIG_HV_PERF_CTRS) && IS_ENABLED(CONFIG_PPC_RTAS))
+		read_sys_info_pseries();
+
 	return;
 }
 
-- 
2.18.1


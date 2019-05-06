Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D7147C6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 11:48:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yHwy5RqszDqNB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 19:48:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yHrV5pJCzDqKR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 19:44:26 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x469hM7Z107062
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 May 2019 05:44:24 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2saggen0pk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2019 05:44:22 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Mon, 6 May 2019 10:44:18 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 10:44:17 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x469iFYP60293276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 09:44:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F6C84204B;
 Mon,  6 May 2019 09:44:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAB5E42042;
 Mon,  6 May 2019 09:44:12 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.199.155.34])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 May 2019 09:44:12 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, Mingming Cao <mingming.cao@ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [RFC PATCH 2/6] powerpc/pseries: Do not save the previous DTL mask
 value
Date: Mon,  6 May 2019 15:13:45 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050609-0028-0000-0000-0000036AC516
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050609-0029-0000-0000-0000242A392B
Message-Id: <53c0d3a2b10326b20705407aaaea61dcc6d83ca1.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=861 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060085
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is enabled, we always initialize
DTL enable mask to DTL_LOG_PREEMPT (0x2). There are no other places
where the mask is changed. As such, when reading the DTL log buffer
through debugfs, there is no need to save and restore the previous mask
value.

We don't need to save and restore the earlier mask value if
CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is not enabled. So, remove the field
from the structure as well.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/dtl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index 051ea2de1e1a..fb05804adb2f 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -55,7 +55,6 @@ struct dtl_ring {
 	struct dtl_entry *write_ptr;
 	struct dtl_entry *buf;
 	struct dtl_entry *buf_end;
-	u8	saved_dtl_mask;
 };
 
 static DEFINE_PER_CPU(struct dtl_ring, dtl_rings);
@@ -105,7 +104,6 @@ static int dtl_start(struct dtl *dtl)
 	dtlr->write_ptr = dtl->buf;
 
 	/* enable event logging */
-	dtlr->saved_dtl_mask = lppaca_of(dtl->cpu).dtl_enable_mask;
 	lppaca_of(dtl->cpu).dtl_enable_mask |= dtl_event_mask;
 
 	dtl_consumer = consume_dtle;
@@ -123,7 +121,7 @@ static void dtl_stop(struct dtl *dtl)
 	dtlr->buf = NULL;
 
 	/* restore dtl_enable_mask */
-	lppaca_of(dtl->cpu).dtl_enable_mask = dtlr->saved_dtl_mask;
+	lppaca_of(dtl->cpu).dtl_enable_mask = DTL_LOG_PREEMPT;
 
 	if (atomic_dec_and_test(&dtl_count))
 		dtl_consumer = NULL;
-- 
2.21.0


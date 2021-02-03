Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96530D5A1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 09:56:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVwWt2gMDzDwy3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 19:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C+V1UFzD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVwVZ5LXGzDwlg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 19:55:02 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1138bxCi146086; Wed, 3 Feb 2021 03:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=Afwl5Q2gkFlUBN/dM6JCMYjVZDAfQoPApOvJIFg/hcY=;
 b=C+V1UFzDWUOsuM1rODpKe1hfYRHwCC+xyR6/nKrrLMNr5unwn8iQGB2GrBFQ3ueH4nU0
 6MDO8uECbvjWc25p1fKpG0hlV6piYyCY6IPFeDAHaNlk086YPy5CulYCQtIzv1fsRhKb
 U0uDRBWGEjLToW/CxLwhf5PRUh9fVb9y+ZcfefsCybql8/PWT2Whk0z3WPCqv07BogIB
 XJm9nCQrZsVFL7SlE68mNI5B3MeyekAEkCTrHua3QRkDh4bJHmHHo8A5PqLDDdQMmMwD
 kcVD3Q+RQupJRSvBifs11/tTG8cZteCF5dcJbFE4lrW9PtyOEF5+0DMbEcFkZJzDQqwq wg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fqt29gtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 03:54:53 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1138qDvL006818;
 Wed, 3 Feb 2021 08:54:50 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 36cy381x0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 08:54:50 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1138smvY41353570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 08:54:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 487704C046;
 Wed,  3 Feb 2021 08:54:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D92CC4C04A;
 Wed,  3 Feb 2021 08:54:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.230.139])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Feb 2021 08:54:45 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Record counter overflow always if SAMPLE_IP is
 unset
Date: Wed,  3 Feb 2021 03:54:44 -0500
Message-Id: <1612342484-1404-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_03:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 malwarescore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030053
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While sampling for marked events, currently we record the sample only
if the SIAR valid bit of Sampled Instruction Event Register (SIER) is
set. SIAR_VALID bit is used for fetching the instruction address from
Sampled Instruction Address Register(SIAR). But there are some usecases,
where the user is interested only in the PMU stats at each counter
overflow and the exact IP of the overflow event is not required.
Dropping SIAR invalid samples will fail to record some of the counter
overflows in such cases.

Example of such usecase is dumping the PMU stats (event counts)
after some regular amount of instructions/events from the userspace
(ex: via ptrace). Here counter overflow is indicated to userspace via
signal handler, and captured by monitoring and enabling I/O
signaling on the event file descriptor. In these cases, we expect to
get sample/overflow indication after each specified sample_period.

Perf event attribute will not have PERF_SAMPLE_IP set in the
sample_type if exact IP of the overflow event is not requested. So
while profiling if SAMPLE_IP is not set, just record the counter overflow
irrespective of SIAR_VALID check.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 28206b1fe172..bb4828a05e4d 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2166,10 +2166,16 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 	 * address even when freeze on supervisor state (kernel) is set in
 	 * MMCR2. Check attr.exclude_kernel and address to drop the sample in
 	 * these cases.
+	 *
+	 * If address is not requested in the sample
+	 * via PERF_SAMPLE_IP, just record that sample
+	 * irrespective of SIAR valid check.
 	 */
-	if (event->attr.exclude_kernel && record)
-		if (is_kernel_addr(mfspr(SPRN_SIAR)))
+	if (event->attr.exclude_kernel && record) {
+		if (is_kernel_addr(mfspr(SPRN_SIAR)) && (event->attr.sample_type & PERF_SAMPLE_IP))
 			record = 0;
+	} else if (!record && !(event->attr.sample_type & PERF_SAMPLE_IP))
+		record = 1;
 
 	/*
 	 * Finally record data if requested.
-- 
1.8.3.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6A14045C2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 08:44:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4qHL39BGz2ygB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 16:44:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bTs8+T2I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bTs8+T2I; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4qGc6czDz2xr3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Sep 2021 16:43:51 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1896YXxJ038779; Thu, 9 Sep 2021 02:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=SAFVYrvO7XhAlvD1QXYCtVsegFrP1kW4t7gztd+tL+8=;
 b=bTs8+T2IRZ/rSPvS1/23lVV4GnBXkarMSU7RegNFL3RPu5z9L1ujBF6NHFA7Nf9EKNCW
 eAGhbjOP6kJcE67lPoG2+BeHAnHWbJntlYJe0rrSYf1lmf0A6WCqCMd7y95I17kxOql/
 oWGTwuGF1/O2yYP8qDRPaSadQ0wfbo+tFpWxH0EWRoSD1+a1Tfiu2dS8iNpUvQKsEayr
 bIxRoiMU3HuXu2tV68mdgr7ZEkW8N4PTuZ4bNiFO1ZeiESQuau3qrMu2/GXJi14UJTsY
 1OqD917gO/YwLM9blyoX3o8IqOWNgPzj/L+O+xwd/zXKRx2KiGYVO3CL6YLlx29bpwC8 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ay7s3e3g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 02:43:44 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1896ZkCO044299;
 Thu, 9 Sep 2021 02:43:44 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ay7s3e3fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 02:43:44 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1896hWIG013922;
 Thu, 9 Sep 2021 06:43:42 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3axcnpgy64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 06:43:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1896dI9V49742122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Sep 2021 06:39:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 761004C058;
 Thu,  9 Sep 2021 06:43:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FB724C05C;
 Thu,  9 Sep 2021 06:43:36 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown
 [9.43.69.11]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Sep 2021 06:43:35 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/mce: Fix access error in mce handler
Date: Thu,  9 Sep 2021 12:13:30 +0530
Message-Id: <20210909064330.312432-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tIhp3t5BEjdb2BZWLOT3HqNG1iFPZnFV
X-Proofpoint-ORIG-GUID: 2BpsFLRE3D-5VGA6WO7VstxwBSShdXA-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-09_01:2021-09-07,
 2021-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109090037
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We queue an irq work for deferred processing of mce event
in realmode mce handler, where translation is disabled.
Queuing of the work may result in accessing memory outside
RMO region, such access needs the translation to be enabled
for an LPAR running with hash mmu else the kernel crashes.

After enabling translation in mce_handle_error() we used to
leave it enabled to avoid crashing here, but now with the
commit 74c3354bc1d89 ("powerpc/pseries/mce: restore msr before
returning from handler") we are restoring the MSR to disable
translation.

Hence to fix this enable the translation before queuing the work.

Without this change following trace is seen on injecting SLB
multihit in an LPAR running with hash mmu.

Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
CPU: 5 PID: 1883 Comm: insmod Tainted: G        OE     5.14.0-mce+ #137
NIP:  c000000000735d60 LR: c000000000318640 CTR: 0000000000000000
REGS: c00000001ebff9a0 TRAP: 0300   Tainted: G       OE      (5.14.0-mce+)
MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 28008228  XER: 00000001
CFAR: c00000000031863c DAR: c00000027fa8fe08 DSISR: 40000000 IRQMASK: 0
GPR00: c0000000003186d0 c00000001ebffc40 c000000001b0df00 c0000000016337e8
GPR04: c0000000016337e8 c00000027fa8fe08 0000000000000023 c0000000016337f0
GPR08: 0000000000000023 c0000000012ffe08 0000000000000000 c008000001460240
GPR12: 0000000000000000 c00000001ec9a900 c00000002ac4bd00 0000000000000000
GPR16: 00000000000005a0 c0080000006b0000 c0080000006b05a0 c000000000ff3068
GPR20: c00000002ac4bbc0 0000000000000001 c00000002ac4bbc0 c008000001490298
GPR24: c008000001490108 c000000001636198 c008000001470090 c008000001470058
GPR28: 0000000000000510 c008000001000000 c008000008000019 0000000000000019
NIP [c000000000735d60] llist_add_batch+0x0/0x40
LR [c000000000318640] __irq_work_queue_local+0x70/0xc0
Call Trace:
[c00000001ebffc40] [c00000001ebffc0c] 0xc00000001ebffc0c (unreliable)
[c00000001ebffc60] [c0000000003186d0] irq_work_queue+0x40/0x70
[c00000001ebffc80] [c00000000004425c] machine_check_queue_event+0xbc/0xd0
[c00000001ebffcf0] [c00000000000838c] machine_check_early_common+0x16c/0x1f4

Fixes: 74c3354bc1d89 ("powerpc/pseries/mce: restore msr before returning from handler")
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
v2: Change in commit message.
---
 arch/powerpc/kernel/mce.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 47a683cd00d2..9d1e39d42e3e 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -249,6 +249,7 @@ void machine_check_queue_event(void)
 {
 	int index;
 	struct machine_check_event evt;
+	unsigned long msr;
 
 	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
 		return;
@@ -262,8 +263,19 @@ void machine_check_queue_event(void)
 	memcpy(&local_paca->mce_info->mce_event_queue[index],
 	       &evt, sizeof(evt));
 
-	/* Queue irq work to process this event later. */
-	irq_work_queue(&mce_event_process_work);
+	/* Queue irq work to process this event later. Before
+	 * queuing the work enable translation for non radix LPAR,
+	 * as irq_work_queue may try to access memory outside RMO
+	 * region.
+	 */
+	if (!radix_enabled() && firmware_has_feature(FW_FEATURE_LPAR)) {
+		msr = mfmsr();
+		mtmsr(msr | MSR_IR | MSR_DR);
+		irq_work_queue(&mce_event_process_work);
+		mtmsr(msr);
+	} else {
+		irq_work_queue(&mce_event_process_work);
+	}
 }
 
 void mce_common_process_ue(struct pt_regs *regs,
-- 
2.31.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA71B2C4493
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:59:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch5F15bD0zDqW2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 02:59:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JxWAQatY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch52F0NkbzDqxF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:50:28 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APFY40D067302
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 10:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IXyk38sedyH69jxxFuK2yvCTw2jjReVgCc5ILb4wwX0=;
 b=JxWAQatY3Yr4+H00+K+LxdszG/JtmSlAFI2GS9JitHGShQEHbkYkns1RurUhrxxmFD3u
 XpkAZgY91OcMgK/kC9smff/Wu/w7WZ7erzjevsHuOI+HMvAuC6wo31yu+NimtbcsjdL6
 vaSdLUdxT2F2T4Eg+YyhWg4mvk8tI95bTd4gpN/Pb/30msMMPoBXIFAnuUQdMYPC1qb5
 UEv4ttJD6K1i122PcgnQAGv28atnxamFPM9GwywKbkXNQSQPnx1A8zDWJRJXB3OtfZjr
 ODNc7n6Oa8An2oosXGl9iaJMvQ7FQ8jINBW2OTYNST7o1vMdo6lr27nGAzth//TeIJUY Ww== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351swrrjmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 10:50:25 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APFWF2j014145
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:50:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 34xt5hcu75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 15:50:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0APFoFfD6816266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 15:50:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00A894205C;
 Wed, 25 Nov 2020 15:50:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C55C54204B;
 Wed, 25 Nov 2020 15:50:14 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.171.47.8])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 15:50:14 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH V4 5/5] ocxl: Add new kernel traces
Date: Wed, 25 Nov 2020 16:50:13 +0100
Message-Id: <20201125155013.39955-6-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125155013.39955-1-clombard@linux.vnet.ibm.com>
References: <20201125155013.39955-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_09:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=969 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011250098
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add specific kernel traces which provide information on mmu notifier and on
pages range.

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 drivers/misc/ocxl/link.c  |  4 +++
 drivers/misc/ocxl/trace.h | 64 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 129d4eddc4d2..ab039c115381 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -499,6 +499,7 @@ static void invalidate_range(struct mmu_notifier *mn,
 	unsigned long addr, pid, page_size = PAGE_SIZE;
 
 	pid = mm->context.id;
+	trace_ocxl_mmu_notifier_range(start, end, pid);
 
 	spin_lock(&link->atsd_lock);
 	for (addr = start; addr < end; addr += page_size)
@@ -590,6 +591,7 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 			/* Use MMIO registers for the TLB Invalidate
 			 * operations.
 			 */
+			trace_ocxl_init_mmu_notifier(pasid, mm->context.id);
 			mmu_notifier_register(&pe_data->mmu_notifier, mm);
 		}
 	}
@@ -725,6 +727,8 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
 	} else {
 		if (pe_data->mm) {
 			if (link->arva) {
+				trace_ocxl_release_mmu_notifier(pasid,
+								pe_data->mm->context.id);
 				mmu_notifier_unregister(&pe_data->mmu_notifier,
 							pe_data->mm);
 				spin_lock(&link->atsd_lock);
diff --git a/drivers/misc/ocxl/trace.h b/drivers/misc/ocxl/trace.h
index 17e21cb2addd..a33a5094ff6c 100644
--- a/drivers/misc/ocxl/trace.h
+++ b/drivers/misc/ocxl/trace.h
@@ -8,6 +8,70 @@
 
 #include <linux/tracepoint.h>
 
+
+TRACE_EVENT(ocxl_mmu_notifier_range,
+	TP_PROTO(unsigned long start, unsigned long end, unsigned long pidr),
+	TP_ARGS(start, end, pidr),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, start)
+		__field(unsigned long, end)
+		__field(unsigned long, pidr)
+	),
+
+	TP_fast_assign(
+		__entry->start = start;
+		__entry->end = end;
+		__entry->pidr = pidr;
+	),
+
+	TP_printk("start=0x%lx end=0x%lx pidr=0x%lx",
+		__entry->start,
+		__entry->end,
+		__entry->pidr
+	)
+);
+
+TRACE_EVENT(ocxl_init_mmu_notifier,
+	TP_PROTO(int pasid, unsigned long pidr),
+	TP_ARGS(pasid, pidr),
+
+	TP_STRUCT__entry(
+		__field(int, pasid)
+		__field(unsigned long, pidr)
+	),
+
+	TP_fast_assign(
+		__entry->pasid = pasid;
+		__entry->pidr = pidr;
+	),
+
+	TP_printk("pasid=%d, pidr=0x%lx",
+		__entry->pasid,
+		__entry->pidr
+	)
+);
+
+TRACE_EVENT(ocxl_release_mmu_notifier,
+	TP_PROTO(int pasid, unsigned long pidr),
+	TP_ARGS(pasid, pidr),
+
+	TP_STRUCT__entry(
+		__field(int, pasid)
+		__field(unsigned long, pidr)
+	),
+
+	TP_fast_assign(
+		__entry->pasid = pasid;
+		__entry->pidr = pidr;
+	),
+
+	TP_printk("pasid=%d, pidr=0x%lx",
+		__entry->pasid,
+		__entry->pidr
+	)
+);
+
 DECLARE_EVENT_CLASS(ocxl_context,
 	TP_PROTO(pid_t pid, void *spa, int pasid, u32 pidr, u32 tidr),
 	TP_ARGS(pid, spa, pasid, pidr, tidr),
-- 
2.28.0


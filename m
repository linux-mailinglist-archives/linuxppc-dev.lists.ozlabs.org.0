Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B6E2BB193
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 18:41:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cd3l71M5DzDr5j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 04:41:55 +1100 (AEDT)
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
 header.s=pp1 header.b=CpHgF24t; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cd3Xf3wZjzDqyg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 04:32:50 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKHVpl4113104
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 12:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fGAWWpqe2pBHHZE76vRWMk9oRF+2PEXdWvWPPpMzQEg=;
 b=CpHgF24t2EoPStjKafiy2pgXQEpFZoNiYNKSYF3OPGXvyBDymq3VDGILkfBDImxVR3lV
 UMKeQsBbuo2uAXp0UKMLgZesUoLwGWRNt4sbWN8hqSVAFCh5BCAjDJhWWmUasqEXJr77
 zROmLFlgEg8xfF6MpQOWg4BS/8IZO3Bd34mXUs92ROn0NrSzHCG9bW90sLEmxqTHoP4n
 jBcqZqhi5JF08BkLXWtYahO3474tVRMW7FbjtC/SjI0c6EvWcxDq+YYi9c28mpe7/u+c
 N44l/pnPLlILJivCeNqwh+Z0n7sPiQo0Lp9s8q448ZeSI0Y6pL/MdtXq0g/ogCPer47t dA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xg9fmtt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 12:32:48 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKHVlY8014617
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 17:32:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 34weby1whv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 17:32:46 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKHWhmp56754476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 17:32:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37F01A4053;
 Fri, 20 Nov 2020 17:32:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF6D9A404D;
 Fri, 20 Nov 2020 17:32:42 +0000 (GMT)
Received: from lombard-p52.ibmuc.com (unknown [9.171.3.40])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Nov 2020 17:32:42 +0000 (GMT)
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Subject: [PATCH V2 5/5] ocxl: Add new kernel traces
Date: Fri, 20 Nov 2020 18:32:41 +0100
Message-Id: <20201120173241.59229-6-clombard@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
References: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_09:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200116
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

Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
---
 drivers/misc/ocxl/link.c  |  4 +++
 drivers/misc/ocxl/trace.h | 64 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 100bdfe9ec37..2e0eb46d032e 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -496,6 +496,7 @@ static void invalidate_range(struct mmu_notifier *mn,
 	unsigned long addr, pid, page_size = PAGE_SIZE;
 
 	pid = mm->context.id;
+	trace_ocxl_mmu_notifier_range(start, end, pid);
 
 	spin_lock(&link->atsd_lock);
 	for (addr = start; addr < end; addr += page_size)
@@ -587,6 +588,7 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 			/* Use MMIO registers for the TLB Invalidate
 			 * operations.
 			 */
+			trace_ocxl_init_mmu_notifier(pasid, mm->context.id);
 			mmu_notifier_register(&pe_data->mmu_notifier, mm);
 		}
 	}
@@ -722,6 +724,8 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
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


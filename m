Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F48019B7E1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 23:46:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t0BZ5RhrzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 08:46:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48szsl6xlXzDr4t
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 08:31:39 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031L4IeJ066515; Wed, 1 Apr 2020 17:31:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304sws8v54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:31:22 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 031L5wLl071050;
 Wed, 1 Apr 2020 17:31:21 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304sws8v4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:31:21 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031LUZKo021308;
 Wed, 1 Apr 2020 21:31:20 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 301x76w07x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 21:31:20 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031LVK5q55443832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 21:31:20 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FD23112063;
 Wed,  1 Apr 2020 21:31:20 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F085A112062;
 Wed,  1 Apr 2020 21:31:18 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 21:31:18 +0000 (GMT)
Subject: [PATCH v9 10/13] powerpc/vas: Print CRB and FIFO values
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1585775978.10664.438.camel@hbabu-laptop>
References: <1585775978.10664.438.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2020 14:30:33 -0700
Message-ID: <1585776633.10664.454.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004010170
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
Cc: mikey@neuling.org, srikar@linux.vnet.ibm.com, frederic.barrat@fr.ibm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, clg@kaod.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Dump FIFO entries if could not find send window and print CRB
for debugging.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index b6bec64..25db70b 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -26,6 +26,28 @@
  */
 #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
 
+static void dump_crb(struct coprocessor_request_block *crb)
+{
+	struct data_descriptor_entry *dde;
+	struct nx_fault_stamp *nx;
+
+	dde = &crb->source;
+	pr_devel("SrcDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
+		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
+		dde->count, dde->index, dde->flags);
+
+	dde = &crb->target;
+	pr_devel("TgtDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
+		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
+		dde->count, dde->index, dde->flags);
+
+	nx = &crb->stamp.nx;
+	pr_devel("NX Stamp: PSWID 0x%x, FSA 0x%llx, flags 0x%x, FS 0x%x\n",
+		be32_to_cpu(nx->pswid),
+		be64_to_cpu(crb->stamp.nx.fault_storage_addr),
+		nx->flags, nx->fault_status);
+}
+
 /*
  * Update the CSB to indicate a translation error.
  *
@@ -148,6 +170,23 @@ static void update_csb(struct vas_window *window,
 			pid_vnr(pid), rc);
 }
 
+static void dump_fifo(struct vas_instance *vinst, void *entry)
+{
+	unsigned long *end = vinst->fault_fifo + vinst->fault_fifo_size;
+	unsigned long *fifo = entry;
+	int i;
+
+	pr_err("Fault fifo size %d, Max crbs %d\n", vinst->fault_fifo_size,
+			vinst->fault_fifo_size / CRB_SIZE);
+
+	/* Dump 10 CRB entries or until end of FIFO */
+	pr_err("Fault FIFO Dump:\n");
+	for (i = 0; i < 10*(CRB_SIZE/8) && fifo < end; i += 4, fifo += 4) {
+		pr_err("[%.3d, %p]: 0x%.16lx 0x%.16lx 0x%.16lx 0x%.16lx\n",
+			i, fifo, *fifo, *(fifo+1), *(fifo+2), *(fifo+3));
+	}
+}
+
 /*
  * Process valid CRBs in fault FIFO.
  * NX process user space requests, return credit and update the status
@@ -233,6 +272,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
 				vinst->vas_id, vinst->fault_fifo, fifo,
 				vinst->fault_crbs);
 
+		dump_crb(crb);
 		window = vas_pswid_to_window(vinst,
 				be32_to_cpu(crb->stamp.nx.pswid));
 
@@ -245,6 +285,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
 			 * But we should not get here.
 			 * TODO: Disable IRQ.
 			 */
+			dump_fifo(vinst, (void *)entry);
 			pr_err("VAS[%d] fault_fifo %p, fifo %p, pswid 0x%x, fault_crbs %d bad CRB?\n",
 				vinst->vas_id, vinst->fault_fifo, fifo,
 				be32_to_cpu(crb->stamp.nx.pswid),
-- 
1.8.3.1




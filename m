Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFFBFE4A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 19:13:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F6092wcvzF4f3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 05:12:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F5y52M2dzF0RM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 05:11:07 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFI8759081693
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 13:11:04 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w9nur1dur-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 13:11:03 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Fri, 15 Nov 2019 18:11:02 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Nov 2019 18:10:59 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAFIAwZo10485950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 18:10:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4DAEA4055;
 Fri, 15 Nov 2019 18:10:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADDDAA404D;
 Fri, 15 Nov 2019 18:10:58 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.70.126])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Nov 2019 18:10:58 +0000 (GMT)
Subject: [PATCH] powerpc/xive: Drop extern qualifiers from header function
 prototypes
From: Greg Kurz <groug@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 15 Nov 2019 19:10:58 +0100
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19111518-0008-0000-0000-0000032F8EB0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111518-0009-0000-0000-00004A4EA2A5
Message-Id: <157384145834.181768.944827793193636924.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_05:2019-11-15,2019-11-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1034
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=2 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150162
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
Cc: trivial@kernel.org, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As reported by ./scripts/checkpatch.pl --strict:

CHECK: extern prototypes should be avoided in .h files

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/include/asm/xive.h |   92 ++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
index 24cdf97376c4..93f982dbb3d4 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -87,56 +87,56 @@ extern bool __xive_enabled;
 
 static inline bool xive_enabled(void) { return __xive_enabled; }
 
-extern bool xive_spapr_init(void);
-extern bool xive_native_init(void);
-extern void xive_smp_probe(void);
-extern int  xive_smp_prepare_cpu(unsigned int cpu);
-extern void xive_smp_setup_cpu(void);
-extern void xive_smp_disable_cpu(void);
-extern void xive_teardown_cpu(void);
-extern void xive_shutdown(void);
-extern void xive_flush_interrupt(void);
+bool xive_spapr_init(void);
+bool xive_native_init(void);
+void xive_smp_probe(void);
+int  xive_smp_prepare_cpu(unsigned int cpu);
+void xive_smp_setup_cpu(void);
+void xive_smp_disable_cpu(void);
+void xive_teardown_cpu(void);
+void xive_shutdown(void);
+void xive_flush_interrupt(void);
 
 /* xmon hook */
-extern void xmon_xive_do_dump(int cpu);
-extern int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d);
+void xmon_xive_do_dump(int cpu);
+int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d);
 
 /* APIs used by KVM */
-extern u32 xive_native_default_eq_shift(void);
-extern u32 xive_native_alloc_vp_block(u32 max_vcpus);
-extern void xive_native_free_vp_block(u32 vp_base);
-extern int xive_native_populate_irq_data(u32 hw_irq,
-					 struct xive_irq_data *data);
-extern void xive_cleanup_irq_data(struct xive_irq_data *xd);
-extern u32 xive_native_alloc_irq(void);
-extern void xive_native_free_irq(u32 irq);
-extern int xive_native_configure_irq(u32 hw_irq, u32 target, u8 prio, u32 sw_irq);
-
-extern int xive_native_configure_queue(u32 vp_id, struct xive_q *q, u8 prio,
-				       __be32 *qpage, u32 order, bool can_escalate);
-extern void xive_native_disable_queue(u32 vp_id, struct xive_q *q, u8 prio);
-
-extern void xive_native_sync_source(u32 hw_irq);
-extern void xive_native_sync_queue(u32 hw_irq);
-extern bool is_xive_irq(struct irq_chip *chip);
-extern int xive_native_enable_vp(u32 vp_id, bool single_escalation);
-extern int xive_native_disable_vp(u32 vp_id);
-extern int xive_native_get_vp_info(u32 vp_id, u32 *out_cam_id, u32 *out_chip_id);
-extern bool xive_native_has_single_escalation(void);
-
-extern int xive_native_get_queue_info(u32 vp_id, uint32_t prio,
-				      u64 *out_qpage,
-				      u64 *out_qsize,
-				      u64 *out_qeoi_page,
-				      u32 *out_escalate_irq,
-				      u64 *out_qflags);
-
-extern int xive_native_get_queue_state(u32 vp_id, uint32_t prio, u32 *qtoggle,
-				       u32 *qindex);
-extern int xive_native_set_queue_state(u32 vp_id, uint32_t prio, u32 qtoggle,
-				       u32 qindex);
-extern int xive_native_get_vp_state(u32 vp_id, u64 *out_state);
-extern bool xive_native_has_queue_state_support(void);
+u32 xive_native_default_eq_shift(void);
+u32 xive_native_alloc_vp_block(u32 max_vcpus);
+void xive_native_free_vp_block(u32 vp_base);
+int xive_native_populate_irq_data(u32 hw_irq,
+				  struct xive_irq_data *data);
+void xive_cleanup_irq_data(struct xive_irq_data *xd);
+u32 xive_native_alloc_irq(void);
+void xive_native_free_irq(u32 irq);
+int xive_native_configure_irq(u32 hw_irq, u32 target, u8 prio, u32 sw_irq);
+
+int xive_native_configure_queue(u32 vp_id, struct xive_q *q, u8 prio,
+				__be32 *qpage, u32 order, bool can_escalate);
+void xive_native_disable_queue(u32 vp_id, struct xive_q *q, u8 prio);
+
+void xive_native_sync_source(u32 hw_irq);
+void xive_native_sync_queue(u32 hw_irq);
+bool is_xive_irq(struct irq_chip *chip);
+int xive_native_enable_vp(u32 vp_id, bool single_escalation);
+int xive_native_disable_vp(u32 vp_id);
+int xive_native_get_vp_info(u32 vp_id, u32 *out_cam_id, u32 *out_chip_id);
+bool xive_native_has_single_escalation(void);
+
+int xive_native_get_queue_info(u32 vp_id, uint32_t prio,
+			       u64 *out_qpage,
+			       u64 *out_qsize,
+			       u64 *out_qeoi_page,
+			       u32 *out_escalate_irq,
+			       u64 *out_qflags);
+
+int xive_native_get_queue_state(u32 vp_id, uint32_t prio, u32 *qtoggle,
+				u32 *qindex);
+int xive_native_set_queue_state(u32 vp_id, uint32_t prio, u32 qtoggle,
+				u32 qindex);
+int xive_native_get_vp_state(u32 vp_id, u64 *out_state);
+bool xive_native_has_queue_state_support(void);
 
 #else
 


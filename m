Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5637BDD6CF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 07:56:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wBwf5lw5zDqQ9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 16:56:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wBsJ0yzFzDqQx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 16:53:23 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9J5Hnv9016784; Sat, 19 Oct 2019 01:53:16 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vqren5hpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 01:53:16 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9J5JSIC011137;
 Sat, 19 Oct 2019 05:53:15 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 2vqt4615wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 05:53:15 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9J5rFj544368142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Oct 2019 05:53:15 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12799AE05F;
 Sat, 19 Oct 2019 05:53:15 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96F41AE05C;
 Sat, 19 Oct 2019 05:53:14 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 19 Oct 2019 05:53:14 +0000 (GMT)
Subject: [RFC PATCH 02/13] powerpc/vas: Define nx_fault_stamp in
 coprocessor_request_block
From: Haren Myneni <haren@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Oct 2019 22:52:59 -0700
Message-ID: <1571464379.24387.27.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-19_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=881 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910190051
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
Cc: sukadev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Kernel sets fault address and status in CRB for NX page fault on user
space address after processing page fault. User space gets the signal
and handles the fault mentioned in CRB by bringing the page in to
memory and send NX request again.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/include/asm/icswx.h | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/icswx.h b/arch/powerpc/include/asm/icswx.h
index 9872f85..4015ed4 100644
--- a/arch/powerpc/include/asm/icswx.h
+++ b/arch/powerpc/include/asm/icswx.h
@@ -108,6 +108,21 @@ struct data_descriptor_entry {
 	__be64 address;
 } __packed __aligned(DDE_ALIGN);
 
+/* 4.3.2 NX-stamped Fault CRB */
+
+#define NX_STAMP_ALIGN          (0x10)
+
+#define NX_STAMP_ACCESS_MASK    (0x01)
+#define NX_STAMP_ACCESS_READ    0
+#define NX_STAMP_ACCESS_WRITE   1
+
+struct nx_fault_stamp {
+        __be64 fault_storage_addr;
+        __be16 reserved;
+        __u8   flags;
+        __u8   fault_status;
+        __be32 pswid;
+} __packed __aligned(NX_STAMP_ALIGN);
 
 /* Chapter 6.5.2 Coprocessor-Request Block (CRB) */
 
@@ -135,11 +150,26 @@ struct coprocessor_request_block {
 
 	struct coprocessor_completion_block ccb;
 
-	u8 reserved[48];
+        union {
+                struct nx_fault_stamp nx;
+                u8 reserved[16];
+        } stamp;
+
+	u8 reserved[32];
 
 	struct coprocessor_status_block csb;
 } __packed __aligned(CRB_ALIGN);
 
+#define crb_csb_addr(c)		__be64_to_cpu(c->csb_addr)
+#define crb_nx_fault_addr(c)	__be64_to_cpu(c->stamp.nx.fault_storage_addr)
+#define crb_nx_flags(c)		c->stamp.nx.flags
+#define crb_nx_fault_status(c)	c->stamp.nx.fault_status
+
+static inline uint32_t crb_nx_pswid(struct coprocessor_request_block *crb)
+{
+	return __be32_to_cpu(crb->stamp.nx.pswid);
+}
+
 
 /* RFC02167 Initiate Coprocessor Instructions document
  * Chapter 8.2.1.1.1 RS
-- 
1.8.3.1




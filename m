Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D846A7AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:50:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nzGr2NDgzDqKM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:50:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nyvC2pGPzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nyvB6m7kz8t9P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nyvB66gCz9sNC; Tue, 16 Jul 2019 21:33:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45nyvB2LmSz9s7T
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:33:10 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMH1b015268
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:08 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tscttjjms-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:08 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:33:06 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:33:04 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6GBX3Hk39453144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:33:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 084904203F;
 Tue, 16 Jul 2019 11:33:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77F184204B;
 Tue, 16 Jul 2019 11:33:01 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:33:01 +0000 (GMT)
Subject: [PATCH v4 09/25] opal: add MPIPL interface definitions
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:03:00 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0028-0000-0000-00000384AD57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0029-0000-0000-00002444CE69
Message-Id: <156327678066.27462.4240233280721704438.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160145
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/opal-api.h        |   50 +++++++++++++++++++++++++++-
 arch/powerpc/include/asm/opal.h            |    6 +++
 arch/powerpc/platforms/powernv/opal-call.c |    3 ++
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 383242e..c8a5665 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -208,7 +208,10 @@
 #define OPAL_HANDLE_HMI2			166
 #define	OPAL_NX_COPROC_INIT			167
 #define OPAL_XIVE_GET_VP_STATE			170
-#define OPAL_LAST				170
+#define OPAL_MPIPL_UPDATE			173
+#define OPAL_MPIPL_REGISTER_TAG			174
+#define OPAL_MPIPL_QUERY_TAG			175
+#define OPAL_LAST				175
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
@@ -980,6 +983,50 @@ struct opal_sg_list {
 };
 
 /*
+ * Firmware-Assisted Dump (FADump) using MPIPL
+ */
+
+/* MPIPL update operations */
+enum opal_mpipl_ops {
+	OPAL_MPIPL_ADD_RANGE			= 0,
+	OPAL_MPIPL_REMOVE_RANGE			= 1,
+	OPAL_MPIPL_REMOVE_ALL			= 2,
+	OPAL_MPIPL_FREE_PRESERVED_MEMORY	= 3,
+};
+
+/*
+ * Each tag maps to a metadata type. Use these tags to register/query
+ * corresponding metadata address with/from OPAL.
+ */
+enum opal_mpipl_tags {
+	OPAL_MPIPL_TAG_CPU		= 0,
+	OPAL_MPIPL_TAG_OPAL		= 1,
+	OPAL_MPIPL_TAG_KERNEL		= 2,
+	OPAL_MPIPL_TAG_BOOT_MEM		= 3,
+};
+
+/* Preserved memory details */
+struct opal_mpipl_region {
+	__be64	src;
+	__be64	dest;
+	__be64	size;
+};
+
+/* FADump structure format version */
+#define MPIPL_FADUMP_VERSION			0x01
+
+/* Metadata provided by OPAL. */
+struct opal_mpipl_fadump {
+	u8				version;
+	u8				reserved[7];
+	__be32				crashing_pir;
+	__be32				cpu_data_version;
+	__be32				cpu_data_size;
+	__be32				region_cnt;
+	struct opal_mpipl_region	region[];
+} __attribute__((packed));
+
+/*
  * Dump region ID range usable by the OS
  */
 #define OPAL_DUMP_REGION_HOST_START		0x80
@@ -1059,6 +1106,7 @@ enum {
 	OPAL_REBOOT_NORMAL		= 0,
 	OPAL_REBOOT_PLATFORM_ERROR	= 1,
 	OPAL_REBOOT_FULL_IPL		= 2,
+	OPAL_REBOOT_MPIPL		= 3,
 };
 
 /* Argument to OPAL_PCI_TCE_KILL */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 57bd029..878110a 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -39,6 +39,12 @@ int64_t opal_npu_spa_clear_cache(uint64_t phb_id, uint32_t bdfn,
 				uint64_t PE_handle);
 int64_t opal_npu_tl_set(uint64_t phb_id, uint32_t bdfn, long cap,
 			uint64_t rate_phys, uint32_t size);
+
+int64_t opal_mpipl_update(enum opal_mpipl_ops op, u64 src,
+			  u64 dest, u64 size);
+int64_t opal_mpipl_register_tag(enum opal_mpipl_tags tag, uint64_t addr);
+int64_t opal_mpipl_query_tag(enum opal_mpipl_tags tag, uint64_t *addr);
+
 int64_t opal_console_write(int64_t term_number, __be64 *length,
 			   const uint8_t *buffer);
 int64_t opal_console_read(int64_t term_number, __be64 *length,
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 29ca523..fc8cc7c 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -287,3 +287,6 @@ OPAL_CALL(opal_pci_set_pbcq_tunnel_bar,		OPAL_PCI_SET_PBCQ_TUNNEL_BAR);
 OPAL_CALL(opal_sensor_read_u64,			OPAL_SENSOR_READ_U64);
 OPAL_CALL(opal_sensor_group_enable,		OPAL_SENSOR_GROUP_ENABLE);
 OPAL_CALL(opal_nx_coproc_init,			OPAL_NX_COPROC_INIT);
+OPAL_CALL(opal_mpipl_update,			OPAL_MPIPL_UPDATE);
+OPAL_CALL(opal_mpipl_register_tag,		OPAL_MPIPL_REGISTER_TAG);
+OPAL_CALL(opal_mpipl_query_tag,			OPAL_MPIPL_QUERY_TAG);


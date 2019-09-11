Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD1AB0018
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:32:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T5VW27TMzF3PM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:32:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4ZT3kCqzF334
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:50:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4ZT2W4wz8vLW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:50:25 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4ZT1pW5z9sNF; Thu, 12 Sep 2019 00:50:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46T4ZS5p5Pz9s4Y
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:50:24 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgwgG101671
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:50:23 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy0uj5dyu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:50:22 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:50:20 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:50:17 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEoFww29098172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:50:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77DFE52054;
 Wed, 11 Sep 2019 14:50:15 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9260E52051;
 Wed, 11 Sep 2019 14:50:13 +0000 (GMT)
Subject: [PATCH v6 13/36] opal: add MPIPL interface definitions
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:20:12 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0028-0000-0000-0000039B0A1E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0029-0000-0000-0000245D7214
Message-Id: <156821340710.5656.10071829040515662624.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

MPIPL is Memory Preserving IPL supported from POWER9. This enables the
kernel to reset the system with memory 'preserved'. Also, it supports
copying memory from a source address to some destination address during
MPIPL boot. Add MPIPL interface definitions here to leverage these f/w
features in adding FADump support for PowerNV platform.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Changelog update.
  * Make sure asm/opal-api.h stays consistent with skiboot's opal-api.h


 arch/powerpc/include/asm/opal-api.h        |   44 +++++++++++++++++++++++++++-
 arch/powerpc/include/asm/opal.h            |    5 +++
 arch/powerpc/platforms/powernv/opal-call.c |    3 ++
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 383242e..3c39e7f 100644
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
@@ -1059,6 +1062,7 @@ enum {
 	OPAL_REBOOT_NORMAL		= 0,
 	OPAL_REBOOT_PLATFORM_ERROR	= 1,
 	OPAL_REBOOT_FULL_IPL		= 2,
+	OPAL_REBOOT_MPIPL		= 3,
 };
 
 /* Argument to OPAL_PCI_TCE_KILL */
@@ -1135,6 +1139,44 @@ enum {
 #define OPAL_PCI_P2P_LOAD		0x2
 #define OPAL_PCI_P2P_STORE		0x4
 
+/* MPIPL update operations */
+enum opal_mpipl_ops {
+	OPAL_MPIPL_ADD_RANGE			= 0,
+	OPAL_MPIPL_REMOVE_RANGE			= 1,
+	OPAL_MPIPL_REMOVE_ALL			= 2,
+	OPAL_MPIPL_FREE_PRESERVED_MEMORY	= 3,
+};
+
+/* Tag will point to various metadata area. Kernel will
+ * use tag to get metadata value.
+ */
+enum opal_mpipl_tags {
+	OPAL_MPIPL_TAG_CPU	= 0,
+	OPAL_MPIPL_TAG_OPAL	= 1,
+	OPAL_MPIPL_TAG_KERNEL	= 2,
+	OPAL_MPIPL_TAG_BOOT_MEM	= 3,
+};
+
+/* Preserved memory details */
+struct opal_mpipl_region {
+	__be64	src;
+	__be64	dest;
+	__be64	size;
+};
+
+/* Structure version */
+#define OPAL_MPIPL_VERSION		0x01
+
+struct opal_mpipl_fadump {
+	u8	version;
+	u8	reserved[7];
+	__be32	crashing_pir;	/* OPAL crashing CPU PIR */
+	__be32	cpu_data_version;
+	__be32	cpu_data_size;
+	__be32	region_cnt;
+	struct	opal_mpipl_region region[];
+} __packed;
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __OPAL_API_H */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 57bd029..c3e4904 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -39,6 +39,7 @@ int64_t opal_npu_spa_clear_cache(uint64_t phb_id, uint32_t bdfn,
 				uint64_t PE_handle);
 int64_t opal_npu_tl_set(uint64_t phb_id, uint32_t bdfn, long cap,
 			uint64_t rate_phys, uint32_t size);
+
 int64_t opal_console_write(int64_t term_number, __be64 *length,
 			   const uint8_t *buffer);
 int64_t opal_console_read(int64_t term_number, __be64 *length,
@@ -297,6 +298,10 @@ int opal_sensor_group_clear(u32 group_hndl, int token);
 int opal_sensor_group_enable(u32 group_hndl, int token, bool enable);
 int opal_nx_coproc_init(uint32_t chip_id, uint32_t ct);
 
+s64 opal_mpipl_update(enum opal_mpipl_ops op, u64 src, u64 dest, u64 size);
+s64 opal_mpipl_register_tag(enum opal_mpipl_tags tag, u64 addr);
+s64 opal_mpipl_query_tag(enum opal_mpipl_tags tag, u64 *addr);
+
 s64 opal_signal_system_reset(s32 cpu);
 s64 opal_quiesce(u64 shutdown_type, s32 cpu);
 
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


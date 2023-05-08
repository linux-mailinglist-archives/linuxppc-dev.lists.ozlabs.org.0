Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B97806FB3A8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 17:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFQ2y4bKNz3fWH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 01:20:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KQNGZltZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jpn@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KQNGZltZ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFCVB32KCz3c96
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 17:24:50 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3486rhaQ001769;
	Mon, 8 May 2023 07:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VbjvJo7V4eX/WHFQfr5tKi4S5WnHGvyQcKTwHmScYMg=;
 b=KQNGZltZi81o/Y5pO8gVQBmsxRbZIhpXmpcZsoZ/o9WpzsWjHDXjb3P0QKrfbRafy/VK
 3Olg7zagZRBwlRJ8alLU/oFN1mODMiXvy3TMEG1K97OKLPUMAueV6CEQQbScKB6m+eie
 VaZQGaonYkZAfNFacPN5ZOn/tByV2EFlkE+me9TaNyptK0mzO3rHjC+h5zvN6CvCXrGU
 7ZOmwCyt3SvRx+sKsQaoAP2GJYujvfxpDn7sSY974b9DDf0JkTUJXMZsjNl/NzlgOAKJ
 ywstc5m6kt1Br+iiTxClICaAbELBlWrWP7BXG2GwWvalY69rduOFg2oOnKmjPp2mkVTT oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qev7agxyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 07:24:47 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 348714mZ030831;
	Mon, 8 May 2023 07:24:47 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qev7agxxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 07:24:46 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3483TLM3003399;
	Mon, 8 May 2023 07:24:45 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3qdeh6gsnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 07:24:44 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3487Oejk6685290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 07:24:40 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6FA120049;
	Mon,  8 May 2023 07:24:40 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C485020043;
	Mon,  8 May 2023 07:24:34 +0000 (GMT)
Received: from pwon.ibmuc.com (unknown [9.177.74.71])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 May 2023 07:24:34 +0000 (GMT)
From: Jordan Niethe <jpn@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v1 4/5] powerpc: Add helper library for Guest State Buffers
Date: Mon,  8 May 2023 17:23:31 +1000
Message-Id: <20230508072332.2937883-5-jpn@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230508072332.2937883-1-jpn@linux.vnet.ibm.com>
References: <20230508072332.2937883-1-jpn@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vPFbtDZiQdnF8m2z2cjs6V9K-srWN-HN
X-Proofpoint-GUID: hxMvruVLzBdPIXu6ZQLNE1MNdwkP1FUV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080049
X-Mailman-Approved-At: Tue, 09 May 2023 01:16:28 +1000
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
Cc: Jordan Niethe <jpn@linux.vnet.ibm.com>, mikey@neuling.org, sbhat@linux.ibm.com, kautuk.consul.1980@gmail.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The new PAPR nested guest API introduces the concept of a Guest State
Buffer for communication about L2 guests between L1 and L0 hosts.

In the new API, the L0 manages the L2 on behalf of the L1. This means
that if the L1 needs to change L2 state (e.g. GPRs, SPRs, partition
table...), it must request the L0 perform the modification. If the
nested host needs to read L2 state likewise this request must
go through the L0.

The Guest State Buffer is a Type-Length-Value style data format defined
in the PAPR which assigns all relevant partition state a unique
identity. Unlike a typical TLV format the length is redundant as the
length of each identity is fixed but is included for checking
correctness.

A guest state buffer consists of an element count followed by a stream
of elements, where elements are composed of an ID number, data length,
then the data:

  Header:

   <---4 bytes--->
  +----------------+-----
  | Element Count  | Elements...
  +----------------+-----

  Element:

   <----2 bytes---> <-2 bytes-> <-Length bytes->
  +----------------+-----------+----------------+
  | Guest State ID |  Length   |      Data      |
  +----------------+-----------+----------------+

Guest State IDs have other attributes defined in the PAPR such as
whether they are per thread or per guest, or read-only.

Introduce a library for using guest state buffers. This includes support
for actions such as creating buffers, adding elements to buffers,
reading the value of elements and parsing buffers. This will be used
later by the PAPR nested guest support.

Signed-off-by: Jordan Niethe <jpn@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/guest-state-buffer.h | 1001 +++++++++++++++++
 arch/powerpc/lib/Makefile                     |    3 +-
 arch/powerpc/lib/guest-state-buffer.c         |  560 +++++++++
 arch/powerpc/lib/test-guest-state-buffer.c    |  334 ++++++
 4 files changed, 1897 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/guest-state-buffer.h
 create mode 100644 arch/powerpc/lib/guest-state-buffer.c
 create mode 100644 arch/powerpc/lib/test-guest-state-buffer.c

diff --git a/arch/powerpc/include/asm/guest-state-buffer.h b/arch/powerpc/include/asm/guest-state-buffer.h
new file mode 100644
index 000000000000..332669302a0b
--- /dev/null
+++ b/arch/powerpc/include/asm/guest-state-buffer.h
@@ -0,0 +1,1001 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Interface based on include/net/netlink.h
+ */
+#ifndef _ASM_POWERPC_GUEST_STATE_BUFFER_H
+#define _ASM_POWERPC_GUEST_STATE_BUFFER_H
+
+#include <linux/gfp.h>
+#include <linux/bitmap.h>
+#include <asm/plpar_wrappers.h>
+
+/**************************************************************************
+ * Guest State Buffer Constants
+ **************************************************************************/
+#define GSID_BLANK			0x0000
+
+#define GSID_HOST_STATE_SIZE		0x0001 /* Size of Hypervisor Internal Format VCPU state */
+#define GSID_RUN_OUTPUT_MIN_SIZE	0x0002 /* Minimum size of the Run VCPU output buffer */
+#define GSID_LOGICAL_PVR		0x0003 /* Logical PVR */
+#define GSID_TB_OFFSET			0x0004 /* Timebase Offset */
+#define GSID_PARTITION_TABLE		0x0005 /* Partition Scoped Page Table */
+#define GSID_PROCESS_TABLE		0x0006 /* Process Table */
+
+#define GSID_RUN_INPUT			0x0C00 /* Run VCPU Input Buffer */
+#define GSID_RUN_OUTPUT			0x0C01 /* Run VCPU Out Buffer */
+#define GSID_VPA			0x0C02 /* HRA to Guest VCPU VPA */
+
+#define GSID_GPR0	0x1000
+#define GSID_GPR1	0x1001
+#define GSID_GPR2	0x1002
+#define GSID_GPR3	0x1003
+#define GSID_GPR4	0x1004
+#define GSID_GPR5	0x1005
+#define GSID_GPR6	0x1006
+#define GSID_GPR7	0x1007
+#define GSID_GPR8	0x1008
+#define GSID_GPR9	0x1009
+#define GSID_GPR10	0x100A
+#define GSID_GPR11	0x100B
+#define GSID_GPR12	0x100C
+#define GSID_GPR13	0x100D
+#define GSID_GPR14	0x100E
+#define GSID_GPR15	0x100F
+#define GSID_GPR16	0x1010
+#define GSID_GPR17	0x1011
+#define GSID_GPR18	0x1012
+#define GSID_GPR19	0x1013
+#define GSID_GPR20	0x1014
+#define GSID_GPR21	0x1015
+#define GSID_GPR22	0x1016
+#define GSID_GPR23	0x1017
+#define GSID_GPR24	0x1018
+#define GSID_GPR25	0x1019
+#define GSID_GPR26	0x101A
+#define GSID_GPR27	0x101B
+#define GSID_GPR28	0x101C
+#define GSID_GPR29	0x101D
+#define GSID_GPR30	0x101E
+#define GSID_GPR31	0x101F
+#define GSID_HDEC_EXPIRY_TB 0x1020
+#define GSID_NIA	0x1021
+#define GSID_MSR	0x1022
+#define GSID_LR		0x1023
+#define GSID_XER	0x1024
+#define GSID_CTR	0x1025
+#define GSID_CFAR	0x1026
+#define GSID_SRR0	0x1027
+#define GSID_SRR1	0x1028
+#define GSID_DAR	0x1029
+#define GSID_DEC_EXPIRY_TB	0x102A
+#define GSID_VTB	0x102B
+#define GSID_LPCR	0x102C
+#define GSID_HFSCR	0x102D
+#define GSID_FSCR	0x102E
+#define GSID_FPSCR	0x102F
+#define GSID_DAWR0	0x1030
+#define GSID_DAWR1	0x1031
+#define GSID_CIABR	0x1032
+#define GSID_PURR	0x1033
+#define GSID_SPURR	0x1034
+#define GSID_IC		0x1035
+#define GSID_SPRG0	0x1036
+#define GSID_SPRG1	0x1037
+#define GSID_SPRG2	0x1038
+#define GSID_SPRG3	0x1039
+#define GSID_PPR	0x103A
+#define GSID_MMCR0	0x103B
+#define GSID_MMCR1	0x103C
+#define GSID_MMCR2	0x103D
+#define GSID_MMCR3	0x103E
+#define GSID_MMCRA	0x103F
+#define GSID_SIER	0x1040
+#define GSID_SIER2	0x1041
+#define GSID_SIER3	0x1042
+#define GSID_BESCR	0x1043
+#define GSID_EBBHR	0x1044
+#define GSID_EBBRR	0x1045
+#define GSID_AMR	0x1046
+#define GSID_IAMR	0x1047
+#define GSID_AMOR	0x1048
+#define GSID_UAMOR	0x1049
+#define GSID_SDAR	0x104A
+#define GSID_SIAR	0x104B
+#define GSID_DSCR	0x104C
+#define GSID_TAR	0x104D
+#define GSID_DEXCR	0x104E
+#define GSID_HDEXCR	0x104F
+#define GSID_HASHKEYR	0x1050
+#define GSID_HASHPKEYR	0x1051
+#define GSID_CTRL	0x1052
+
+#define GSID_CR		0x2000
+#define GSID_PIDR	0x2001
+#define GSID_DSISR	0x2002
+#define GSID_VSCR	0x2003
+#define GSID_VRSAVE	0x2004
+#define GSID_DAWRX0	0x2005
+#define GSID_DAWRX1	0x2006
+#define GSID_PMC1	0x2007
+#define GSID_PMC2	0x2008
+#define GSID_PMC3	0x2009
+#define GSID_PMC4	0x200A
+#define GSID_PMC5	0x200B
+#define GSID_PMC6	0x200C
+#define GSID_WORT	0x200D
+#define GSID_PSPB	0x200E
+
+#define GSID_VSRS0	0x3000
+#define GSID_VSRS1	0x3001
+#define GSID_VSRS2	0x3002
+#define GSID_VSRS3	0x3003
+#define GSID_VSRS4	0x3004
+#define GSID_VSRS5	0x3005
+#define GSID_VSRS6	0x3006
+#define GSID_VSRS7	0x3007
+#define GSID_VSRS8	0x3008
+#define GSID_VSRS9	0x3009
+#define GSID_VSRS10	0x300A
+#define GSID_VSRS11	0x300B
+#define GSID_VSRS12	0x300C
+#define GSID_VSRS13	0x300D
+#define GSID_VSRS14	0x300E
+#define GSID_VSRS15	0x300F
+#define GSID_VSRS16	0x3010
+#define GSID_VSRS17	0x3011
+#define GSID_VSRS18	0x3012
+#define GSID_VSRS19	0x3013
+#define GSID_VSRS20	0x3014
+#define GSID_VSRS21	0x3015
+#define GSID_VSRS22	0x3016
+#define GSID_VSRS23	0x3017
+#define GSID_VSRS24	0x3018
+#define GSID_VSRS25	0x3019
+#define GSID_VSRS26	0x301A
+#define GSID_VSRS27	0x301B
+#define GSID_VSRS28	0x301C
+#define GSID_VSRS29	0x301D
+#define GSID_VSRS30	0x301E
+#define GSID_VSRS31	0x301F
+#define GSID_VSRS32	0x3020
+#define GSID_VSRS33	0x3021
+#define GSID_VSRS34	0x3022
+#define GSID_VSRS35	0x3023
+#define GSID_VSRS36	0x3024
+#define GSID_VSRS37	0x3025
+#define GSID_VSRS38	0x3026
+#define GSID_VSRS39	0x3027
+#define GSID_VSRS40	0x3028
+#define GSID_VSRS41	0x3029
+#define GSID_VSRS42	0x302A
+#define GSID_VSRS43	0x302B
+#define GSID_VSRS44	0x302C
+#define GSID_VSRS45	0x302D
+#define GSID_VSRS46	0x302E
+#define GSID_VSRS47	0x302F
+#define GSID_VSRS48	0x3030
+#define GSID_VSRS49	0x3031
+#define GSID_VSRS50	0x3032
+#define GSID_VSRS51	0x3033
+#define GSID_VSRS52	0x3034
+#define GSID_VSRS53	0x3035
+#define GSID_VSRS54	0x3036
+#define GSID_VSRS55	0x3037
+#define GSID_VSRS56	0x3038
+#define GSID_VSRS57	0x3039
+#define GSID_VSRS58	0x303A
+#define GSID_VSRS59	0x303B
+#define GSID_VSRS60	0x303C
+#define GSID_VSRS61	0x303D
+#define GSID_VSRS62	0x303E
+#define GSID_VSRS63	0x303F
+
+#define GSID_HDAR	0xF000
+#define GSID_HDSISR	0xF001
+#define GSID_HEIR	0xF002
+#define GSID_ASDR	0xF003
+
+
+#define GSE_GUESTWIDE_START GSID_BLANK
+#define GSE_GUESTWIDE_END GSID_PROCESS_TABLE
+#define GSE_GUESTWIDE_COUNT (GSE_GUESTWIDE_END - GSE_GUESTWIDE_START + 1)
+
+#define GSE_META_START GSID_RUN_INPUT
+#define GSE_META_END GSID_VPA
+#define GSE_META_COUNT (GSE_META_END - GSE_META_START + 1)
+
+#define GSE_DW_REGS_START GSID_GPR0
+#define GSE_DW_REGS_END GSID_CTRL
+#define GSE_DW_REGS_COUNT (GSE_DW_REGS_END - GSE_DW_REGS_START + 1)
+
+#define GSE_W_REGS_START GSID_CR
+#define GSE_W_REGS_END GSID_PSPB
+#define GSE_W_REGS_COUNT (GSE_W_REGS_END - GSE_W_REGS_START + 1)
+
+#define GSE_VSRS_START GSID_VSRS0
+#define GSE_VSRS_END GSID_VSRS63
+#define GSE_VSRS_COUNT (GSE_VSRS_END - GSE_VSRS_START + 1)
+
+#define GSE_INTR_REGS_START GSID_HDAR
+#define GSE_INTR_REGS_END GSID_ASDR
+#define GSE_INTR_REGS_COUNT (GSE_INTR_REGS_END - GSE_INTR_REGS_START + 1)
+
+#define GSE_IDEN_COUNT                                              \
+	(GSE_GUESTWIDE_COUNT + GSE_META_COUNT + GSE_DW_REGS_COUNT + \
+	 GSE_W_REGS_COUNT + GSE_VSRS_COUNT + GSE_INTR_REGS_COUNT)
+
+
+/**
+ * Ranges of guest state buffer elements
+ */
+enum {
+	GS_CLASS_GUESTWIDE = 0x01,
+	GS_CLASS_META = 0x02,
+	GS_CLASS_DWORD_REG = 0x04,
+	GS_CLASS_WORD_REG = 0x08,
+	GS_CLASS_VECTOR = 0x10,
+	GS_CLASS_INTR = 0x20,
+};
+
+/**
+ * Types of guest state buffer elements
+ */
+enum {
+	GSE_BE32,
+	GSE_BE64,
+	GSE_VEC128,
+	GSE_PARTITION_TABLE,
+	GSE_PROCESS_TABLE,
+	GSE_BUFFER,
+	__GSE_TYPE_MAX,
+};
+
+/**
+ * Flags for guest state elements
+ */
+enum {
+	GS_FLAGS_WIDE = 0x01,
+};
+
+/**
+ * struct gs_part_table - deserialized partition table information element
+ * @address: start of the partition table
+ * @ea_bits: number of bits in the effective address
+ * @gpd_size: root page directory size
+ */
+struct gs_part_table {
+	u64 address;
+	u64 ea_bits;
+	u64 gpd_size;
+};
+
+/**
+ * struct gs_proc_table - deserialized process table information element
+ * @address: start of the process table
+ * @gpd_size: process table size
+ */
+struct gs_proc_table {
+	u64 address;
+	u64 gpd_size;
+};
+
+/**
+ * struct gs_buff_info - deserialized meta guest state buffer information
+ * @address: start of the guest state buffer
+ * @size: size of the guest state buffer
+ */
+struct gs_buff_info {
+	u64 address;
+	u64 size;
+};
+
+/**
+ * struct gs_header - serialized guest state buffer header
+ * @nelem: count of guest state elements in the buffer
+ * @data: start of the stream of elements in the buffer
+ */
+struct gs_header {
+	__be32 nelems;
+	char data[];
+} __packed;
+
+/**
+ * struct gs_elem - serialized guest state buffer element
+ * @iden: Guest State ID
+ * @len: length of data
+ * @data: the guest state buffer element's value
+ */
+struct gs_elem {
+	__be16 iden;
+	__be16 len;
+	char data[];
+} __packed;
+
+/**
+ * struct gs_buff - a guest state buffer with metadata.
+ * @capacity: total length of the buffer
+ * @len: current length of the elements and header
+ * @guest_id: guest id associated with the buffer
+ * @vcpu_id: vcpu_id associated with the buffer
+ * @hdr: the serialised guest state buffer
+ */
+struct gs_buff {
+	size_t capacity;
+	size_t len;
+	unsigned long guest_id;
+	unsigned long vcpu_id;
+	struct gs_header *hdr;
+};
+
+/**
+ * struct gs_bitmap - a bitmap for element ids
+ * @bitmap: a bitmap large enough for all Guest State IDs
+ */
+struct gs_bitmap {
+/* private: */
+	DECLARE_BITMAP(bitmap, GSE_IDEN_COUNT);
+};
+
+/**
+ * struct gs_parser - a map of element ids to locations in a buffer
+ * @iterator: bitmap used for iterating
+ * @gses: contains the pointers to elements
+ *
+ * A guest state parser is used for deserialising a guest state buffer.
+ * Given a buffer, it then allows looking up guest state elements using
+ * a guest state id.
+ */
+struct gs_parser {
+/* private: */
+	struct gs_bitmap iterator;
+	struct gs_elem *gses[GSE_IDEN_COUNT];
+};
+
+enum {
+	GSM_GUEST_WIDE = 0x1,
+	GSM_SEND = 0x2,
+	GSM_RECEIVE = 0x4,
+	GSM_GSB_OWNER = 0x8,
+};
+
+struct gs_msg;
+
+/**
+ * struct gs_msg_ops - guest state message behavior
+ * @get_size: maximum size required for the message data
+ * @fill_info: serializes to the guest state buffer format
+ * @refresh_info: dserializes from the guest state buffer format
+ */
+struct gs_msg_ops {
+	size_t (*get_size)(struct gs_msg *gsm);
+	int (*fill_info)(struct gs_buff *gsb, struct gs_msg *gsm);
+	int (*refresh_info)(struct gs_msg *gsm, struct gs_buff *gsb);
+};
+
+/**
+ * struct gs_msg - a guest state message
+ * @bitmap: the guest state ids that should be included
+ * @ops: modify message behavior for reading and writing to buffers
+ * @flags: guest wide or thread wide
+ * @data: location where buffer data will be written to or from.
+ *
+ * A guest state message is allows flexibility in sending in receiving data
+ * in a guest state buffer format.
+ */
+struct gs_msg {
+	struct gs_bitmap bitmap;
+	struct gs_msg_ops *ops;
+	unsigned long flags;
+	void *data;
+};
+
+/**************************************************************************
+ * Guest State IDs
+ **************************************************************************/
+
+u16 gsid_size(u16 iden);
+unsigned long gsid_flags(u16 iden);
+u64 gsid_mask(u16 iden);
+
+/**************************************************************************
+ * Guest State Buffers
+ **************************************************************************/
+struct gs_buff *gsb_new(size_t size, unsigned long guest_id,
+			unsigned long vcpu_id, gfp_t flags);
+void gsb_free(struct gs_buff *gsb);
+void *gsb_put(struct gs_buff *gsb, size_t size);
+
+/**
+ * gsb_header() - the header of a guest state buffer
+ * @gsb: guest state buffer
+ *
+ * Returns a pointer to the buffer header.
+ */
+static inline struct gs_header *gsb_header(struct gs_buff *gsb)
+{
+	return gsb->hdr;
+}
+
+/**
+ * gsb_data() - the elements of a guest state buffer
+ * @gsb: guest state buffer
+ *
+ * Returns a pointer to the first element of the buffer data.
+ */
+static inline struct gs_elem *gsb_data(struct gs_buff *gsb)
+{
+	return (struct gs_elem *)gsb_header(gsb)->data;
+}
+
+/**
+ * gsb_len() - the current length of a guest state buffer
+ * @gsb: guest state buffer
+ *
+ * Returns the length including the header of a buffer.
+ */
+static inline size_t gsb_len(struct gs_buff *gsb)
+{
+	return gsb->len;
+}
+
+/**
+ * gsb_capacity() - the capacity of a guest state buffer
+ * @gsb: guest state buffer
+ *
+ * Returns the capacity of a buffer.
+ */
+static inline size_t gsb_capacity(struct gs_buff *gsb)
+{
+	return gsb->capacity;
+}
+
+/**
+ * gsb_paddress() - the physical address of buffer
+ * @gsb: guest state buffer
+ *
+ * Returns the physical address of the buffer.
+ */
+static inline u64 gsb_paddress(struct gs_buff *gsb)
+{
+	return __pa(gsb_header(gsb));
+}
+
+/**
+ * gsb_nelems() - the number of elements in a buffer
+ * @gsb: guest state buffer
+ *
+ * Returns the number of elements in a buffer
+ */
+static inline u32 gsb_nelems(struct gs_buff *gsb)
+{
+	return be32_to_cpu(gsb_header(gsb)->nelems);
+}
+
+/**
+ * gsb_reset() - empty a guest state buffer
+ * @gsb: guest state buffer
+ *
+ * Reset the number of elements and length of buffer to empty.
+ */
+static inline void gsb_reset(struct gs_buff *gsb)
+{
+	gsb_header(gsb)->nelems = cpu_to_be32(0);
+	gsb->len = sizeof(struct gs_header);
+}
+
+/**
+ * gsb_data_len() - the length of a buffer excluding the header
+ * @gsb: guest state buffer
+ *
+ * Returns the length of a buffer excluding the header
+ */
+static inline size_t gsb_data_len(struct gs_buff *gsb)
+{
+	return gsb->len - sizeof(struct gs_header);
+}
+
+/**
+ * gsb_data_cap() - the capacity of a buffer excluding the header
+ * @gsb: guest state buffer
+ *
+ * Returns the capacity of a buffer excluding the header
+ */
+static inline size_t gsb_data_cap(struct gs_buff *gsb)
+{
+	return gsb->capacity - sizeof(struct gs_header);
+}
+
+/**
+ * gsb_for_each_elem - iterate over the elements in a buffer
+ * @i: loop counter
+ * @pos: set to current element
+ * @gsb: guest state buffer
+ * @rem: initialized to buffer capacity, holds bytes currently remaining in stream
+ */
+#define gsb_for_each_elem(i, pos, gsb, rem)                       \
+	gse_for_each_elem(i, gsb_nelems(gsb), pos, gsb_data(gsb), \
+			  gsb_data_cap(gsb), rem)
+
+/**************************************************************************
+ * Guest State Elements
+ **************************************************************************/
+
+/**
+ * gse_iden() - guest state ID of element
+ * @gse: guest state element
+ *
+ * Return the guest state ID in host endianness.
+ */
+static inline u16 gse_iden(const struct gs_elem *gse)
+{
+	return be16_to_cpu(gse->iden);
+}
+
+/**
+ * gse_len() - length of guest state element data
+ * @gse: guest state element
+ *
+ * Returns the length of guest state element data
+ */
+static inline u16 gse_len(const struct gs_elem *gse)
+{
+	return be16_to_cpu(gse->len);
+}
+
+/**
+ * gse_total_len() - total length of guest state element
+ * @gse: guest state element
+ *
+ * Returns the length of the data plus the ID and size header.
+ */
+static inline u16 gse_total_len(const struct gs_elem *gse)
+{
+	return be16_to_cpu(gse->len) + sizeof(*gse);
+}
+
+/**
+ * gse_total_size() - space needed for a given data length
+ * @size: data length
+ *
+ * Returns size plus the space needed for the ID and size header.
+ */
+static inline u16 gse_total_size(u16 size)
+{
+	return sizeof(struct gs_elem) + size;
+}
+
+/**
+ * gse_data() - pointer to data of a guest state element
+ * @gse: guest state element
+ *
+ * Returns a pointer to the beginning of guest state element data.
+ */
+static inline void *gse_data(const struct gs_elem *gse)
+{
+	return (void *)gse->data;
+}
+
+/**
+ * gse_ok() - checks space exists for guest state element
+ * @gse: guest state element
+ * @remaining: bytes of space remaining
+ *
+ * Returns true if the guest state element can fit in remaining space.
+ */
+static inline bool gse_ok(const struct gs_elem *gse, int remaining)
+{
+	return remaining >= gse_total_len(gse);
+}
+
+/**
+ * gse_next() - iterate to the next guest state element in a stream
+ * @gse: stream of guest state elements
+ * @remaining: length of the guest element stream
+ *
+ * Returns the next guest state element in a stream of elements. The length of
+ * the stream is updated in remaining.
+ */
+static inline struct gs_elem *gse_next(const struct gs_elem *gse,
+				       int *remaining)
+{
+	int len = sizeof(*gse) + gse_len(gse);
+
+	*remaining -= len;
+	return (struct gs_elem *)(gse->data + gse_len(gse));
+}
+
+/**
+ * gse_for_each_elem - iterate over a stream of guest state elements
+ * @i: loop counter
+ * @max: number of elements
+ * @pos: set to current element
+ * @head: head of elements
+ * @len: length of the stream
+ * @rem: initialized to len, holds bytes currently remaining elements
+ */
+#define gse_for_each_elem(i, max, pos, head, len, rem)                  \
+	for (i = 0, pos = head, rem = len; gse_ok(pos, rem) && i < max; \
+	     pos = gse_next(pos, &(rem)), i++)
+
+int __gse_put(struct gs_buff *gsb, u16 iden, u16 size, const void *data);
+int gse_parse(struct gs_parser *gsp, struct gs_buff *gsb);
+
+/**
+ * gse_put_be32() - add a be32 guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: big endian value
+ */
+static inline int gse_put_be32(struct gs_buff *gsb, u16 iden, __be32 val)
+{
+	__be32 tmp;
+
+	tmp = val;
+	return __gse_put(gsb, iden, sizeof(__be32), &tmp);
+}
+
+/**
+ * gse_put_u32() - add a host endian 32bit int guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: host endian value
+ */
+static inline int gse_put_u32(struct gs_buff *gsb, u16 iden, u32 val)
+{
+	__be32 tmp;
+
+	tmp = cpu_to_be32(val);
+	return gse_put_be32(gsb, iden, tmp);
+}
+
+/**
+ * gse_put_be64() - add a be64 guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: big endian value
+ */
+static inline int gse_put_be64(struct gs_buff *gsb, u16 iden, __be64 val)
+{
+	__be64 tmp;
+
+	tmp = val;
+	return __gse_put(gsb, iden, sizeof(__be64), &tmp);
+}
+
+/**
+ * gse_put_u64() - add a host endian 64bit guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: host endian value
+ */
+static inline int gse_put_u64(struct gs_buff *gsb, u16 iden, u64 val)
+{
+	__be64 tmp;
+
+	tmp = cpu_to_be64(val);
+	return gse_put_be64(gsb, iden, tmp);
+}
+
+/**
+ * __gse_put_reg() - add a register type guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: host endian value
+ *
+ * Adds a register type guest state element. Uses the guest state ID for
+ * determining the length of the guest element. If the guest state ID has
+ * bits that can not be set they will be cleared.
+ */
+static inline int __gse_put_reg(struct gs_buff *gsb, u16 iden, u64 val)
+{
+	val &= gsid_mask(iden);
+	if (gsid_size(iden) == sizeof(u64))
+		return gse_put_u64(gsb, iden, val);
+
+	if (gsid_size(iden) == sizeof(u32)) {
+		u32 tmp;
+
+		tmp = (u32)val;
+		if (tmp != val)
+			return -EINVAL;
+
+		return gse_put_u32(gsb, iden, tmp);
+	}
+	return -EINVAL;
+}
+
+/**
+ * gse_put_vector128() - add a vector guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: 16 byte vector value
+ */
+static inline int gse_put_vector128(struct gs_buff *gsb, u16 iden,
+				    vector128 val)
+{
+	__be64 tmp[2];
+	union {
+		__vector128 v;
+		u64 dw[2];
+	} u;
+
+	u.v = val;
+	tmp[0] = cpu_to_be64(u.dw[TS_FPROFFSET]);
+	tmp[1] = cpu_to_be64(u.dw[TS_VSRLOWOFFSET]);
+	return __gse_put(gsb, iden, sizeof(tmp), &tmp);
+}
+
+/**
+ * gse_put_part_table() - add a partition table guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: partition table value
+ */
+static inline int gse_put_part_table(struct gs_buff *gsb, u16 iden,
+				     struct gs_part_table val)
+{
+	__be64 tmp[3];
+
+	tmp[0] = cpu_to_be64(val.address);
+	tmp[1] = cpu_to_be64(val.ea_bits);
+	tmp[2] = cpu_to_be64(val.gpd_size);
+	return __gse_put(gsb, GSID_PARTITION_TABLE, sizeof(tmp), &tmp);
+}
+
+/**
+ * gse_put_proc_table() - add a process table guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: process table value
+ */
+static inline int gse_put_proc_table(struct gs_buff *gsb, u16 iden,
+				     struct gs_proc_table val)
+{
+	__be64 tmp[2];
+
+	tmp[0] = cpu_to_be64(val.address);
+	tmp[1] = cpu_to_be64(val.gpd_size);
+	return __gse_put(gsb, GSID_PROCESS_TABLE, sizeof(tmp), &tmp);
+}
+
+/**
+ * gse_put_buff_info() - adds a GSB description guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: guest state buffer description value
+ */
+static inline int gse_put_buff_info(struct gs_buff *gsb, u16 iden,
+				    struct gs_buff_info val)
+{
+	__be64 tmp[2];
+
+	tmp[0] = cpu_to_be64(val.address);
+	tmp[1] = cpu_to_be64(val.size);
+	return __gse_put(gsb, iden, sizeof(tmp), &tmp);
+}
+
+int __gse_put(struct gs_buff *gsb, u16 iden, u16 size, const void *data);
+
+/**
+ * gse_get_be32() - return the data of a be32 element
+ * @gse: guest state element
+ */
+static inline __be32 gse_get_be32(const struct gs_elem *gse)
+{
+	return *(__be32 *)gse_data(gse);
+}
+
+/**
+ * gse_get_u32() - return the data of a be32 element in host endianness
+ * @gse: guest state element
+ */
+static inline u32 gse_get_u32(const struct gs_elem *gse)
+{
+	return be32_to_cpu(gse_get_be32(gse));
+}
+
+/**
+ * gse_get_be64() - return the data of a be64 element
+ * @gse: guest state element
+ */
+static inline __be64 gse_get_be64(const struct gs_elem *gse)
+{
+	return *(__be64 *)gse_data(gse);
+}
+
+/**
+ * gse_get_u64() - return the data of a be64 element in host endianness
+ * @gse: guest state element
+ */
+static inline u64 gse_get_u64(const struct gs_elem *gse)
+{
+	return be64_to_cpu(gse_get_be64(gse));
+}
+
+/**
+ * __gse_get_reg() - return the date of a register type guest state element
+ * @gse: guest state element
+ *
+ * Determine the element data size from its guest state ID and return the
+ * correctly sized value.
+ */
+static inline u64 __gse_get_reg(const struct gs_elem *gse)
+{
+	if (gse_len(gse) == sizeof(u64))
+		return gse_get_u64(gse);
+
+	if (gse_len(gse) == sizeof(u32)) {
+		u32 tmp;
+
+		tmp = gse_get_u32(gse);
+		return (u64)tmp;
+	}
+	return 0;
+}
+
+/**
+ * gse_get_vector128() - return the data of a vector element
+ * @gse: guest state element
+ */
+static inline vector128 gse_get_vector128(const struct gs_elem *gse)
+{
+	union {
+		__vector128 v;
+		u64 dw[2];
+	} u;
+	__be64 *src;
+
+	src = (__be64 *)gse_data(gse);
+	u.dw[TS_FPROFFSET] = be64_to_cpu(src[0]);
+	u.dw[TS_VSRLOWOFFSET] = be64_to_cpu(src[1]);
+	return u.v;
+}
+
+/**
+ * gse_put - add a guest state element to a buffer
+ * @gsb: guest state buffer to add to
+ * @iden: guest state identity
+ * @v: generic value
+ */
+#define gse_put(gsb, iden, v)					\
+	(_Generic((v),						\
+		  u64 : __gse_put_reg,				\
+		  long unsigned int : __gse_put_reg,		\
+		  u32 : __gse_put_reg,				\
+		  struct gs_buff_info : gse_put_buff_info,	\
+		  struct gs_proc_table : gse_put_proc_table,	\
+		  struct gs_part_table : gse_put_part_table,	\
+		  vector128 : gse_put_vector128)(gsb, iden, v))
+
+/**
+ * gse_get - return the data of a guest state element
+ * @gsb: guest state element to add to
+ * @v: generic value pointer to return in
+ */
+#define gse_get(gse, v)						\
+	(*v = (_Generic((v),					\
+			u64 * : __gse_get_reg,			\
+			unsigned long * : __gse_get_reg,	\
+			u32 * : __gse_get_reg,			\
+			vector128 * : gse_get_vector128)(gse)))
+
+/**************************************************************************
+ * Guest State Bitmap
+ **************************************************************************/
+
+bool gsbm_test(struct gs_bitmap *gsbm, u16 iden);
+void gsbm_set(struct gs_bitmap *gsbm, u16 iden);
+void gsbm_clear(struct gs_bitmap *gsbm, u16 iden);
+u16 gsbm_next(struct gs_bitmap *gsbm, u16 prev);
+
+/**
+ * gsbm_zero - zero the entire bitmap
+ * @gsbm: guest state buffer bitmap
+ */
+static inline void gsbm_zero(struct gs_bitmap *gsbm)
+{
+	bitmap_zero(gsbm->bitmap, GSE_IDEN_COUNT);
+}
+
+/**
+ * gsbm_fill - fill the entire bitmap
+ * @gsbm: guest state buffer bitmap
+ */
+static inline void gsbm_fill(struct gs_bitmap *gsbm)
+{
+	bitmap_fill(gsbm->bitmap, GSE_IDEN_COUNT);
+	clear_bit(0, gsbm->bitmap);
+}
+
+/**
+ * gsbm_for_each - iterate the present guest state IDs
+ * @gsbm: guest state buffer bitmap
+ * @iden: current guest state ID
+ */
+#define gsbm_for_each(gsbm, iden) \
+	for (iden = gsbm_next(gsbm, 0); iden != 0; iden = gsbm_next(gsbm, iden))
+
+
+/**************************************************************************
+ * Guest State Parser
+ **************************************************************************/
+
+void gsp_insert(struct gs_parser *gsp, u16 iden, struct gs_elem *gse);
+struct gs_elem *gsp_lookup(struct gs_parser *gsp, u16 iden);
+
+/**
+ * gsp_for_each - iterate the <guest state IDs, guest state element> pairs
+ * @gsp: guest state buffer bitmap
+ * @iden: current guest state ID
+ * @gse: guest state element
+ */
+#define gsp_for_each(gsp, iden, gse)                              \
+	for (iden = gsbm_next(&(gsp)->iterator, 0),               \
+	    gse = gsp_lookup((gsp), iden);                        \
+	     iden != 0; iden = gsbm_next(&(gsp)->iterator, iden), \
+	    gse = gsp_lookup((gsp), iden))
+
+/**************************************************************************
+ * Guest State Message
+ **************************************************************************/
+
+/**
+ * gsm_for_each - iterate the guest state IDs included in a guest state message
+ * @gsp: guest state buffer bitmap
+ * @iden: current guest state ID
+ * @gse: guest guest state element
+ */
+#define gsm_for_each(gsm, iden)                            \
+	for (iden = gsbm_next(&gsm->bitmap, 0); iden != 0; \
+	     iden = gsbm_next(&gsm->bitmap, iden))
+
+int gsm_init(struct gs_msg *mgs, struct gs_msg_ops *ops, void *data,
+	     unsigned long flags);
+
+struct gs_msg *gsm_new(struct gs_msg_ops *ops, void *data, unsigned long flags,
+		       gfp_t gfp_flags);
+void gsm_free(struct gs_msg *gsm);
+size_t gsm_size(struct gs_msg *gsm);
+int gsm_fill_info(struct gs_msg *gsm, struct gs_buff *gsb);
+int gsm_refresh_info(struct gs_msg *gsm, struct gs_buff *gsb);
+
+/**
+ * gsm_include - indicate a guest state ID should be included when serializing
+ * @gsm: guest state message
+ * @iden: guest state ID
+ */
+static inline void gsm_include(struct gs_msg *gsm, u16 iden)
+{
+	gsbm_set(&gsm->bitmap, iden);
+}
+
+/**
+ * gsm_includes - check if a guest state ID will be included when serializing
+ * @gsm: guest state message
+ * @iden: guest state ID
+ */
+static inline bool gsm_includes(struct gs_msg *gsm, u16 iden)
+{
+	return gsbm_test(&gsm->bitmap, iden);
+}
+
+/**
+ * gsm_includes - indicate all guest state IDs should be included when serializing
+ * @gsm: guest state message
+ * @iden: guest state ID
+ */
+static inline void gsm_include_all(struct gs_msg *gsm)
+{
+	gsbm_fill(&gsm->bitmap);
+}
+
+/**
+ * gsm_include - clear the guest state IDs that should be included when serializing
+ * @gsm: guest state message
+ */
+static inline void gsm_reset(struct gs_msg *gsm)
+{
+	gsbm_zero(&gsm->bitmap);
+}
+
+#endif /* _ASM_POWERPC_GUEST_STATE_BUFFER_H */
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index c4db459d304a..9e9e41aa8c3b 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -49,7 +49,8 @@ extra-$(CONFIG_PPC64)	+= crtsavres.o
 endif
 
 obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
-			       memcpy_power7.o restart_table.o
+			       memcpy_power7.o restart_table.o \
+			       guest-state-buffer.o test-guest-state-buffer.o
 
 obj64-y	+= copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
 	   memcpy_64.o copy_mc_64.o
diff --git a/arch/powerpc/lib/guest-state-buffer.c b/arch/powerpc/lib/guest-state-buffer.c
new file mode 100644
index 000000000000..35ecb37c95d7
--- /dev/null
+++ b/arch/powerpc/lib/guest-state-buffer.c
@@ -0,0 +1,560 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "asm/hvcall.h"
+#include <linux/log2.h>
+#include <asm/pgalloc.h>
+#include <asm/guest-state-buffer.h>
+
+static const u16 gse_iden_len[__GSE_TYPE_MAX] = {
+	[GSE_BE32] = sizeof(__be32),
+	[GSE_BE64] = sizeof(__be64),
+	[GSE_VEC128] = sizeof(vector128),
+	[GSE_PARTITION_TABLE] = sizeof(struct gs_part_table),
+	[GSE_PROCESS_TABLE] = sizeof(struct gs_proc_table),
+	[GSE_BUFFER] = sizeof(struct gs_buff_info),
+};
+
+/**
+ * gsb_new() - create a new guest state buffer
+ * @size: total size of the guest state buffer (includes header)
+ * @guest_id: guest_id
+ * @vcpu_id: vcpu_id
+ * @flags: GFP flags
+ *
+ * Returns a guest state buffer.
+ */
+struct gs_buff *gsb_new(size_t size, unsigned long guest_id,
+			unsigned long vcpu_id, gfp_t flags)
+{
+	struct gs_buff *gsb;
+
+	gsb = kzalloc(sizeof(*gsb), flags);
+	if (!gsb)
+		return NULL;
+
+	size = roundup_pow_of_two(size);
+	gsb->hdr = kzalloc(size, GFP_KERNEL);
+	if (!gsb->hdr)
+		goto free;
+
+	gsb->capacity = size;
+	gsb->len = sizeof(struct gs_header);
+	gsb->vcpu_id = vcpu_id;
+	gsb->guest_id = guest_id;
+
+	gsb->hdr->nelems = cpu_to_be32(0);
+
+	return gsb;
+
+free:
+	kfree(gsb);
+	return NULL;
+}
+EXPORT_SYMBOL(gsb_new);
+
+/**
+ * gsb_free() - free a guest state buffer
+ * @gsb: guest state buffer
+ */
+void gsb_free(struct gs_buff *gsb)
+{
+	kfree(gsb->hdr);
+	kfree(gsb);
+}
+EXPORT_SYMBOL(gsb_free);
+
+/**
+ * gsb_put() - allocate space in a guest state buffer
+ * @gsb: buffer to allocate in
+ * @size: amount of space to allocate
+ *
+ * Returns a pointer to the amount of space requested within the buffer and
+ * increments the count of elements in the buffer.
+ *
+ * Does not check if there is enough space in the buffer.
+ */
+void *gsb_put(struct gs_buff *gsb, size_t size)
+{
+	u32 nelems = gsb_nelems(gsb);
+	void *p;
+
+	p = (void *)gsb_header(gsb) + gsb_len(gsb);
+	gsb->len += size;
+
+	gsb_header(gsb)->nelems = cpu_to_be32(nelems + 1);
+	return p;
+}
+EXPORT_SYMBOL(gsb_put);
+
+static int gsid_class(u16 iden)
+{
+	if ((iden >= GSE_GUESTWIDE_START) && (iden <= GSE_GUESTWIDE_END))
+		return GS_CLASS_GUESTWIDE;
+
+	if ((iden >= GSE_META_START) && (iden <= GSE_META_END))
+		return GS_CLASS_META;
+
+	if ((iden >= GSE_DW_REGS_START) && (iden <= GSE_DW_REGS_END))
+		return GS_CLASS_DWORD_REG;
+
+	if ((iden >= GSE_W_REGS_START) && (iden <= GSE_W_REGS_END))
+		return GS_CLASS_WORD_REG;
+
+	if ((iden >= GSE_VSRS_START) && (iden <= GSE_VSRS_END))
+		return GS_CLASS_VECTOR;
+
+	if ((iden >= GSE_INTR_REGS_START) && (iden <= GSE_INTR_REGS_END))
+		return GS_CLASS_INTR;
+
+	return -1;
+}
+
+static int gsid_type(u16 iden)
+{
+	int type = -1;
+
+	switch (gsid_class(iden)) {
+	case GS_CLASS_GUESTWIDE:
+		switch (iden) {
+		case GSID_HOST_STATE_SIZE:
+		case GSID_RUN_OUTPUT_MIN_SIZE:
+		case GSID_TB_OFFSET:
+			type = GSE_BE64;
+			break;
+		case GSID_PARTITION_TABLE:
+			type = GSE_PARTITION_TABLE;
+			break;
+		case GSID_PROCESS_TABLE:
+			type = GSE_PROCESS_TABLE;
+			break;
+		case GSID_LOGICAL_PVR:
+			type = GSE_BE32;
+			break;
+		}
+		break;
+	case GS_CLASS_META:
+		switch (iden) {
+		case GSID_RUN_INPUT:
+		case GSID_RUN_OUTPUT:
+			type = GSE_BUFFER;
+			break;
+		case GSID_VPA:
+			type = GSE_BE64;
+			break;
+		}
+		break;
+	case GS_CLASS_DWORD_REG:
+		type = GSE_BE64;
+		break;
+	case GS_CLASS_WORD_REG:
+		type = GSE_BE32;
+		break;
+	case GS_CLASS_VECTOR:
+		type = GSE_VEC128;
+		break;
+	case GS_CLASS_INTR:
+		switch (iden) {
+		case GSID_HDAR:
+		case GSID_ASDR:
+			type = GSE_BE64;
+			break;
+		case GSID_HEIR:
+		case GSID_HDSISR:
+			type = GSE_BE32;
+			break;
+		}
+		break;
+	}
+
+	return type;
+}
+
+/**
+ * gsid_flags() - the flags for a guest state ID
+ * @iden: guest state ID
+ *
+ * Returns any flags for the guest state ID.
+ */
+unsigned long gsid_flags(u16 iden)
+{
+	unsigned long flags = 0;
+
+	switch (gsid_class(iden)) {
+	case GS_CLASS_GUESTWIDE:
+		flags = GS_FLAGS_WIDE;
+		break;
+	case GS_CLASS_META:
+	case GS_CLASS_DWORD_REG:
+	case GS_CLASS_WORD_REG:
+	case GS_CLASS_VECTOR:
+	case GS_CLASS_INTR:
+		break;
+	}
+
+	return flags;
+}
+
+/**
+ * gsid_size() - the size of a guest state ID
+ * @iden: guest state ID
+ *
+ * Returns the size of guest state ID.
+ */
+u16 gsid_size(u16 iden)
+{
+	int type;
+
+	type = gsid_type(iden);
+	if (type == -1)
+		return 0;
+
+	if (type >= __GSE_TYPE_MAX)
+		return 0;
+
+	return gse_iden_len[type];
+}
+
+/**
+ * gsid_mask() - the settable bits of a guest state ID
+ * @iden: guest state ID
+ *
+ * Returns a mask of settable bits for a guest state ID.
+ */
+u64 gsid_mask(u16 iden)
+{
+	u64 mask = ~0ull;
+
+	switch (iden) {
+	case GSID_LPCR:
+		mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER | LPCR_GTSE;
+		break;
+	case GSID_MSR:
+		mask = ~(MSR_HV | MSR_S | MSR_ME);
+		break;
+	}
+
+	return mask;
+}
+
+/**
+ * __gse_put() - add a guest state element to a buffer
+ * @gsb: buffer to the element to
+ * @iden: guest state ID
+ * @size: length of data
+ * @data: pointer to data
+ */
+int __gse_put(struct gs_buff *gsb, u16 iden, u16 size, const void *data)
+{
+	struct gs_elem *gse;
+	u16 total_size;
+
+	total_size = sizeof(*gse) + size;
+	if (total_size + gsb_len(gsb) > gsb_capacity(gsb))
+		return -ENOMEM;
+
+	if (gsid_size(iden) != size)
+		return -EINVAL;
+
+	gse = gsb_put(gsb, total_size);
+	gse->iden = cpu_to_be16(iden);
+	gse->len = cpu_to_be16(size);
+	memcpy(gse->data, data, size);
+
+	return 0;
+}
+EXPORT_SYMBOL(__gse_put);
+
+/**
+ * gse_parse() - create a parse map from a guest state buffer
+ * @gsp: guest state parser
+ * @gsb: guest state buffer
+ */
+int gse_parse(struct gs_parser *gsp, struct gs_buff *gsb)
+{
+	struct gs_elem *curr;
+	int rem, i;
+
+	gsb_for_each_elem(i, curr, gsb, rem) {
+		if (gse_len(curr) != gsid_size(gse_iden(curr)))
+			return -EINVAL;
+		gsp_insert(gsp, gse_iden(curr), curr);
+	}
+
+	if (gsb_nelems(gsb) != i)
+		return -EINVAL;
+	return 0;
+}
+EXPORT_SYMBOL(gse_parse);
+
+static inline int gse_flatten_iden(u16 iden)
+{
+	int bit = 0;
+	int class;
+
+	class = gsid_class(iden);
+
+	if (class == GS_CLASS_GUESTWIDE) {
+		bit += iden - GSE_GUESTWIDE_START;
+		return bit;
+	}
+
+	bit += GSE_GUESTWIDE_COUNT;
+
+	if (class == GS_CLASS_META) {
+		bit += iden - GSE_META_START;
+		return bit;
+	}
+
+	bit += GSE_META_COUNT;
+
+	if (class == GS_CLASS_DWORD_REG) {
+		bit += iden - GSE_DW_REGS_START;
+		return bit;
+	}
+
+	bit += GSE_DW_REGS_COUNT;
+
+	if (class == GS_CLASS_WORD_REG) {
+		bit += iden - GSE_W_REGS_START;
+		return bit;
+	}
+
+	bit += GSE_W_REGS_COUNT;
+
+	if (class == GS_CLASS_VECTOR) {
+		bit += iden - GSE_VSRS_START;
+		return bit;
+	}
+
+	bit += GSE_VSRS_COUNT;
+
+	if (class == GS_CLASS_INTR) {
+		bit += iden - GSE_INTR_REGS_START;
+		return bit;
+	}
+
+	return 0;
+}
+
+static inline u16 gse_unflatten_iden(int bit)
+{
+	u16 iden;
+
+	if (bit < GSE_GUESTWIDE_COUNT) {
+		iden = GSE_GUESTWIDE_START + bit;
+		return iden;
+	}
+	bit -= GSE_GUESTWIDE_COUNT;
+
+	if (bit < GSE_META_COUNT) {
+		iden = GSE_META_START + bit;
+		return iden;
+	}
+	bit -= GSE_META_COUNT;
+
+	if (bit < GSE_DW_REGS_COUNT) {
+		iden = GSE_DW_REGS_START + bit;
+		return iden;
+	}
+	bit -= GSE_DW_REGS_COUNT;
+
+	if (bit < GSE_W_REGS_COUNT) {
+		iden = GSE_W_REGS_START + bit;
+		return iden;
+	}
+	bit -= GSE_W_REGS_COUNT;
+
+	if (bit < GSE_VSRS_COUNT) {
+		iden = GSE_VSRS_START + bit;
+		return iden;
+	}
+	bit -= GSE_VSRS_COUNT;
+
+	if (bit < GSE_IDEN_COUNT) {
+		iden = GSE_INTR_REGS_START + bit;
+		return iden;
+	}
+
+	return 0;
+}
+
+/**
+ * gsp_insert() - add a mapping from an guest state ID to an element
+ * @gsp: guest state parser
+ * @iden: guest state id (key)
+ * @gse: guest state element (value)
+ */
+void gsp_insert(struct gs_parser *gsp, u16 iden, struct gs_elem *gse)
+{
+	int i;
+
+	i = gse_flatten_iden(iden);
+	gsbm_set(&gsp->iterator, iden);
+	gsp->gses[i] = gse;
+}
+EXPORT_SYMBOL(gsp_insert);
+
+/**
+ * gsp_lookup() - lookup an element from a guest state ID
+ * @gsp: guest state parser
+ * @iden: guest state ID (key)
+ *
+ * Returns the guest state element if present.
+ */
+struct gs_elem *gsp_lookup(struct gs_parser *gsp, u16 iden)
+{
+	int i;
+
+	i = gse_flatten_iden(iden);
+	return gsp->gses[i];
+}
+EXPORT_SYMBOL(gsp_lookup);
+
+/**
+ * gsbm_set() - set the guest state ID
+ * @gsbm: guest state bitmap
+ * @iden: guest state ID
+ */
+void gsbm_set(struct gs_bitmap *gsbm, u16 iden)
+{
+	set_bit(gse_flatten_iden(iden), gsbm->bitmap);
+}
+EXPORT_SYMBOL(gsbm_set);
+
+/**
+ * gsbm_clear() - clear the guest state ID
+ * @gsbm: guest state bitmap
+ * @iden: guest state ID
+ */
+void gsbm_clear(struct gs_bitmap *gsbm, u16 iden)
+{
+	clear_bit(gse_flatten_iden(iden), gsbm->bitmap);
+}
+EXPORT_SYMBOL(gsbm_clear);
+
+/**
+ * gsbm_test() - test the guest state ID
+ * @gsbm: guest state bitmap
+ * @iden: guest state ID
+ */
+bool gsbm_test(struct gs_bitmap *gsbm, u16 iden)
+{
+	return test_bit(gse_flatten_iden(iden), gsbm->bitmap);
+}
+EXPORT_SYMBOL(gsbm_test);
+
+/**
+ * gsbm_next() - return the next set guest state ID
+ * @gsbm: guest state bitmap
+ * @prev: last guest state ID
+ */
+u16 gsbm_next(struct gs_bitmap *gsbm, u16 prev)
+{
+	int bit, pbit;
+
+	pbit = prev ? gse_flatten_iden(prev) + 1 : 0;
+	bit = find_next_bit(gsbm->bitmap, GSE_IDEN_COUNT, pbit);
+
+	if (bit < GSE_IDEN_COUNT)
+		return gse_unflatten_iden(bit);
+	return 0;
+}
+EXPORT_SYMBOL(gsbm_next);
+
+/**
+ * gsm_init() - initialize a guest state message
+ * @gsm: guest state message
+ * @ops: callbacks
+ * @data: private data
+ * @flags: guest wide or thread wide
+ */
+int gsm_init(struct gs_msg *gsm, struct gs_msg_ops *ops, void *data,
+	     unsigned long flags)
+{
+	memset(gsm, 0, sizeof(*gsm));
+	gsm->ops = ops;
+	gsm->data = data;
+	gsm->flags = flags;
+
+	return 0;
+}
+EXPORT_SYMBOL(gsm_init);
+
+/**
+ * gsm_init() - creates a new guest state message
+ * @ops: callbacks
+ * @data: private data
+ * @flags: guest wide or thread wide
+ * @gfp_flags: GFP allocation flags
+ *
+ * Returns an initialized guest state message.
+ */
+struct gs_msg *gsm_new(struct gs_msg_ops *ops, void *data, unsigned long flags,
+		       gfp_t gfp_flags)
+{
+	struct gs_msg *gsm;
+
+	gsm = kzalloc(sizeof(*gsm), gfp_flags);
+	if (!gsm)
+		return NULL;
+
+	gsm_init(gsm, ops, data, flags);
+
+	return gsm;
+}
+EXPORT_SYMBOL(gsm_new);
+
+/**
+ * gsm_size() - creates a new guest state message
+ * @gsm: self
+ *
+ * Returns the size required for the message.
+ */
+size_t gsm_size(struct gs_msg *gsm)
+{
+	if (gsm->ops->get_size)
+		return gsm->ops->get_size(gsm);
+	return 0;
+}
+EXPORT_SYMBOL(gsm_size);
+
+/**
+ * gsm_free() - free guest state message
+ * @gsm: guest state message
+ *
+ * Returns the size required for the message.
+ */
+void gsm_free(struct gs_msg *gsm)
+{
+	kfree(gsm);
+}
+EXPORT_SYMBOL(gsm_free);
+
+/**
+ * gsm_fill_info() - serialises message to guest state buffer format
+ * @gsm: self
+ * @gsb: buffer to serialise into
+ */
+int gsm_fill_info(struct gs_msg *gsm, struct gs_buff *gsb)
+{
+	if (!gsm->ops->fill_info)
+		return -EINVAL;
+
+	gsb_reset(gsb);
+	return gsm->ops->fill_info(gsb, gsm);
+}
+EXPORT_SYMBOL(gsm_fill_info);
+
+/**
+ * gsm_fill_info() - deserialises from guest state buffer
+ * @gsm: self
+ * @gsb: buffer to serialise from
+ */
+int gsm_refresh_info(struct gs_msg *gsm, struct gs_buff *gsb)
+{
+	if (!gsm->ops->fill_info)
+		return -EINVAL;
+
+	return gsm->ops->refresh_info(gsm, gsb);
+}
+EXPORT_SYMBOL(gsm_refresh_info);
diff --git a/arch/powerpc/lib/test-guest-state-buffer.c b/arch/powerpc/lib/test-guest-state-buffer.c
new file mode 100644
index 000000000000..b6853462264a
--- /dev/null
+++ b/arch/powerpc/lib/test-guest-state-buffer.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/init.h>
+#include <linux/log2.h>
+
+#include <asm/guest-state-buffer.h>
+
+#define check(x)                                                               \
+	do {                                                                   \
+		if (!(x))                                                      \
+			pr_err("guest-state-buffer: test failed at line %d\n", \
+			       __LINE__);                                      \
+	} while (0)
+
+static void __init test_creating_buffer(void)
+{
+	struct gs_buff *gsb;
+	size_t size = 0x100;
+
+	gsb = gsb_new(size, 0, 0, GFP_KERNEL);
+	check(gsb);
+	if (!gsb)
+		return;
+	check(gsb->hdr);
+	if (!gsb->hdr)
+		return;
+	check(gsb->capacity == roundup_pow_of_two(size));
+	check(gsb->len == sizeof(__be32));
+
+	gsb_free(gsb);
+}
+
+static void __init test_adding_element(void)
+{
+	const struct gs_elem *head, *curr;
+	union {
+		__vector128 v;
+		u64 dw[2];
+	} u;
+	int rem;
+	struct gs_buff *gsb;
+	size_t size = 0x1000;
+	int i, rc;
+	u64 data;
+
+	gsb = gsb_new(size, 0, 0, GFP_KERNEL);
+	check(gsb);
+	if (!gsb)
+		return;
+
+	/* Single elements, direct use of __gse_put() */
+	data = 0xdeadbeef;
+	rc = __gse_put(gsb, GSID_GPR0, 8, &data);
+	check(rc >= 0);
+
+	head = gsb_data(gsb);
+	check(gse_iden(head) == GSID_GPR0);
+	check(gse_len(head) == 8);
+	data = 0;
+	memcpy(&data, gse_data(head), 8);
+	check(data == 0xdeadbeef);
+
+	/* Multiple elements, simple wrapper */
+	rc = gse_put_u64(gsb, GSID_GPR1, 0xcafef00d);
+	check(rc >= 0);
+
+	u.dw[0] = 0x1;
+	u.dw[1] = 0x2;
+	rc = gse_put_vector128(gsb, GSID_VSRS0, u.v);
+	check(rc >= 0);
+	u.dw[0] = 0x0;
+	u.dw[1] = 0x0;
+
+	gsb_for_each_elem(i, curr, gsb, rem) {
+		switch (i) {
+		case 0:
+			check(gse_iden(curr) == GSID_GPR0);
+			check(gse_len(curr) == 8);
+			check(gse_get_be64(curr) == 0xdeadbeef);
+			break;
+		case 1:
+			check(gse_iden(curr) == GSID_GPR1);
+			check(gse_len(curr) == 8);
+			check(gse_get_u64(curr) == 0xcafef00d);
+			break;
+		case 2:
+			check(gse_iden(curr) == GSID_VSRS0);
+			check(gse_len(curr) == 16);
+			u.v = gse_get_vector128(curr);
+			check(u.dw[0] == 0x1);
+			check(u.dw[1] = 0x2);
+			break;
+		}
+	}
+	check(i == 3);
+
+	gsb_reset(gsb);
+	check(gsb_nelems(gsb) == 0);
+	check(gsb_len(gsb) == sizeof(struct gs_header));
+
+	gsb_free(gsb);
+}
+
+static void __init test_gs_parsing(void)
+{
+	struct gs_elem *gse;
+	struct gs_parser gsp = { 0 };
+	struct gs_buff *gsb;
+	size_t size = 0x1000;
+	u64 tmp1, tmp2;
+
+	gsb = gsb_new(size, 0, 0, GFP_KERNEL);
+	check(gsb);
+	if (!gsb)
+		return;
+
+	tmp1 = 0xdeadbeefull;
+	gse_put(gsb, GSID_GPR0, tmp1);
+
+	check(gse_parse(&gsp, gsb) >= 0);
+
+	gse = gsp_lookup(&gsp, GSID_GPR0);
+	if (!gse)
+		return;
+	gse_get(gse, &tmp2);
+	check(tmp2 == 0xdeadbeefull);
+
+	gsb_free(gsb);
+}
+
+static void __init test_gs_bitmap(void)
+{
+	struct gs_bitmap gsbm = { 0 };
+	struct gs_bitmap gsbm1 = { 0 };
+	struct gs_bitmap gsbm2 = { 0 };
+	u16 iden;
+	int i, j;
+
+	i = 0;
+	for (u16 iden = GSID_HOST_STATE_SIZE;
+	     iden <= GSID_PROCESS_TABLE; iden++) {
+		gsbm_set(&gsbm, iden);
+		gsbm_set(&gsbm1, iden);
+		check(gsbm_test(&gsbm, iden));
+		gsbm_clear(&gsbm, iden);
+		check(!gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	for (u16 iden = GSID_RUN_INPUT; iden <= GSID_VPA;
+	     iden++) {
+		gsbm_set(&gsbm, iden);
+		gsbm_set(&gsbm1, iden);
+		check(gsbm_test(&gsbm, iden));
+		gsbm_clear(&gsbm, iden);
+		check(!gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	for (u16 iden = GSID_GPR0; iden <= GSID_CTRL;
+	     iden++) {
+		gsbm_set(&gsbm, iden);
+		gsbm_set(&gsbm1, iden);
+		check(gsbm_test(&gsbm, iden));
+		gsbm_clear(&gsbm, iden);
+		check(!gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	for (u16 iden = GSID_CR; iden <= GSID_PSPB; iden++) {
+		gsbm_set(&gsbm, iden);
+		gsbm_set(&gsbm1, iden);
+		check(gsbm_test(&gsbm, iden));
+		gsbm_clear(&gsbm, iden);
+		check(!gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	for (u16 iden = GSID_VSRS0; iden <= GSID_VSRS63;
+	     iden++) {
+		gsbm_set(&gsbm, iden);
+		gsbm_set(&gsbm1, iden);
+		check(gsbm_test(&gsbm, iden));
+		gsbm_clear(&gsbm, iden);
+		check(!gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	for (u16 iden = GSID_HDAR; iden <= GSID_ASDR;
+	     iden++) {
+		gsbm_set(&gsbm, iden);
+		gsbm_set(&gsbm1, iden);
+		check(gsbm_test(&gsbm, iden));
+		gsbm_clear(&gsbm, iden);
+		check(!gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	j = 0;
+	gsbm_for_each(&gsbm1, iden)
+	{
+		gsbm_set(&gsbm2, iden);
+		j++;
+	}
+	check(i == j);
+	check(!memcmp(&gsbm1, &gsbm2, sizeof(gsbm1)));
+}
+
+struct gs_msg_test1_data {
+	u64 a;
+	u32 b;
+	struct gs_part_table c;
+	struct gs_proc_table d;
+	struct gs_buff_info e;
+};
+
+static size_t __init test1_get_size(struct gs_msg *gsm)
+{
+	size_t size = 0;
+	u16 ids[] = {
+		GSID_PARTITION_TABLE,
+		GSID_PROCESS_TABLE,
+		GSID_RUN_INPUT,
+		GSID_GPR0,
+		GSID_CR,
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(ids); i++)
+		size += gse_total_size(gsid_size(ids[i]));
+	return size;
+}
+
+static int __init test1_fill_info(struct gs_buff *gsb, struct gs_msg *gsm)
+{
+	struct gs_msg_test1_data *data = gsm->data;
+
+	if (gsm_includes(gsm, GSID_GPR0))
+		gse_put(gsb, GSID_GPR0, data->a);
+
+	if (gsm_includes(gsm, GSID_CR))
+		gse_put(gsb, GSID_CR, data->b);
+
+	if (gsm_includes(gsm, GSID_PARTITION_TABLE))
+		gse_put(gsb, GSID_PARTITION_TABLE, data->c);
+
+	if (gsm_includes(gsm, GSID_PROCESS_TABLE))
+		gse_put(gsb, GSID_PARTITION_TABLE, data->d);
+
+	if (gsm_includes(gsm, GSID_RUN_INPUT))
+		gse_put(gsb, GSID_RUN_INPUT, data->e);
+
+	return 0;
+}
+
+static int __init test1_refresh_info(struct gs_msg *gsm, struct gs_buff *gsb)
+{
+	struct gs_parser gsp = { 0 };
+	struct gs_msg_test1_data *data = gsm->data;
+	struct gs_elem *gse;
+	int rc;
+
+	rc = gse_parse(&gsp, gsb);
+	if (rc < 0)
+		return rc;
+
+	gse = gsp_lookup(&gsp, GSID_GPR0);
+	if (gse)
+		gse_get(gse, &data->a);
+
+	gse = gsp_lookup(&gsp, GSID_CR);
+	if (gse)
+		gse_get(gse, &data->b);
+
+	return 0;
+}
+
+static struct gs_msg_ops gs_msg_test1_ops __initdata = {
+	.get_size = test1_get_size,
+	.fill_info = test1_fill_info,
+	.refresh_info = test1_refresh_info,
+};
+
+static void __init test_gs_msg(void)
+{
+	struct gs_msg_test1_data test1_data = {
+		.a = 0xdeadbeef,
+		.b = 0x1,
+	};
+	struct gs_msg *gsm;
+	struct gs_buff *gsb;
+
+	gsm = gsm_new(&gs_msg_test1_ops, &test1_data, GSM_SEND, GFP_KERNEL);
+	check(gsm);
+	if (!gsm)
+		return;
+
+	gsb = gsb_new(gsm_size(gsm), 0, 0, GFP_KERNEL);
+	check(gsb);
+	if (!gsb)
+		return;
+
+	gsm_include(gsm, GSID_PARTITION_TABLE);
+	gsm_include(gsm, GSID_PROCESS_TABLE);
+	gsm_include(gsm, GSID_RUN_INPUT);
+	gsm_include(gsm, GSID_GPR0);
+	gsm_include(gsm, GSID_CR);
+
+	gsm_fill_info(gsm, gsb);
+
+	memset(&test1_data, 0, sizeof(test1_data));
+
+	gsm_refresh_info(gsm, gsb);
+	check(test1_data.a == 0xdeadbeef);
+	check(test1_data.b == 0x1);
+
+	gsm_free(gsm);
+}
+
+
+static int __init test_guest_state_buffer(void)
+{
+	pr_info("Running guest state buffer self-tests ...\n");
+
+	test_creating_buffer();
+	test_adding_element();
+
+	test_gs_bitmap();
+	test_gs_parsing();
+
+	test_gs_msg();
+
+	return 0;
+}
+late_initcall(test_guest_state_buffer);
-- 
2.31.1


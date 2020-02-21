Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0536166E46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 05:14:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NylM1G6fzDrC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 15:14:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Nxll0kghzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 14:29:38 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01L3T542038245
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:29:35 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y8ubxhg8v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:29:35 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Fri, 21 Feb 2020 03:29:33 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Feb 2020 03:29:25 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01L3S9BZ49807518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 03:28:10 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D13D7A4064;
 Fri, 21 Feb 2020 03:28:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29246A4060;
 Fri, 21 Feb 2020 03:28:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 03:28:09 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3DEC4A03CC;
 Fri, 21 Feb 2020 14:28:03 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v3 12/27] powerpc/powernv/pmem: Add register addresses &
 status values to the header
Date: Fri, 21 Feb 2020 14:27:05 +1100
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221032720.33893-1-alastair@au1.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022103-4275-0000-0000-000003A3FE70
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022103-4276-0000-0000-000038B80C88
Message-Id: <20200221032720.33893-13-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_19:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=1 mlxlogscore=948
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210021
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alastair D'Silva <alastair@d-silva.org>

These values have been taken from the device specifications.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../platforms/powernv/pmem/ocxl_internal.h    | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
index 0faf3740e9b8..9cf3e42750e7 100644
--- a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
+++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
@@ -8,6 +8,78 @@
 
 #define LABEL_AREA_SIZE	(1UL << PA_SECTION_SHIFT)
 
+#define GLOBAL_MMIO_CHI		0x000
+#define GLOBAL_MMIO_CHIC	0x008
+#define GLOBAL_MMIO_CHIE	0x010
+#define GLOBAL_MMIO_CHIEC	0x018
+#define GLOBAL_MMIO_HCI		0x020
+#define GLOBAL_MMIO_HCIC	0x028
+#define GLOBAL_MMIO_IMA0_OHP	0x040
+#define GLOBAL_MMIO_IMA0_CFP	0x048
+#define GLOBAL_MMIO_IMA1_OHP	0x050
+#define GLOBAL_MMIO_IMA1_CFP	0x058
+#define GLOBAL_MMIO_ACMA_CREQO	0x100
+#define GLOBAL_MMIO_ACMA_CRSPO	0x104
+#define GLOBAL_MMIO_ACMA_CDBO	0x108
+#define GLOBAL_MMIO_ACMA_CDBS	0x10c
+#define GLOBAL_MMIO_NSCMA_CREQO	0x120
+#define GLOBAL_MMIO_NSCMA_CRSPO	0x124
+#define GLOBAL_MMIO_NSCMA_CDBO	0x128
+#define GLOBAL_MMIO_NSCMA_CDBS	0x12c
+#define GLOBAL_MMIO_CSTS	0x140
+#define GLOBAL_MMIO_FWVER	0x148
+#define GLOBAL_MMIO_CCAP0	0x160
+#define GLOBAL_MMIO_CCAP1	0x168
+
+#define GLOBAL_MMIO_CHI_ACRA	BIT_ULL(0)
+#define GLOBAL_MMIO_CHI_NSCRA	BIT_ULL(1)
+#define GLOBAL_MMIO_CHI_CRDY	BIT_ULL(4)
+#define GLOBAL_MMIO_CHI_CFFS	BIT_ULL(5)
+#define GLOBAL_MMIO_CHI_MA	BIT_ULL(6)
+#define GLOBAL_MMIO_CHI_ELA	BIT_ULL(7)
+#define GLOBAL_MMIO_CHI_CDA	BIT_ULL(8)
+#define GLOBAL_MMIO_CHI_CHFS	BIT_ULL(9)
+
+#define GLOBAL_MMIO_CHI_ALL	(GLOBAL_MMIO_CHI_ACRA | \
+				 GLOBAL_MMIO_CHI_NSCRA | \
+				 GLOBAL_MMIO_CHI_CRDY | \
+				 GLOBAL_MMIO_CHI_CFFS | \
+				 GLOBAL_MMIO_CHI_MA | \
+				 GLOBAL_MMIO_CHI_ELA | \
+				 GLOBAL_MMIO_CHI_CDA | \
+				 GLOBAL_MMIO_CHI_CHFS)
+
+#define GLOBAL_MMIO_HCI_ACRW				BIT_ULL(0)
+#define GLOBAL_MMIO_HCI_NSCRW				BIT_ULL(1)
+#define GLOBAL_MMIO_HCI_AFU_RESET			BIT_ULL(2)
+#define GLOBAL_MMIO_HCI_FW_DEBUG			BIT_ULL(3)
+#define GLOBAL_MMIO_HCI_CONTROLLER_DUMP			BIT_ULL(4)
+#define GLOBAL_MMIO_HCI_CONTROLLER_DUMP_COLLECTED	BIT_ULL(5)
+#define GLOBAL_MMIO_HCI_REQ_HEALTH_PERF			BIT_ULL(6)
+
+#define ADMIN_COMMAND_HEARTBEAT		0x00u
+#define ADMIN_COMMAND_SHUTDOWN		0x01u
+#define ADMIN_COMMAND_FW_UPDATE		0x02u
+#define ADMIN_COMMAND_FW_DEBUG		0x03u
+#define ADMIN_COMMAND_ERRLOG		0x04u
+#define ADMIN_COMMAND_SMART		0x05u
+#define ADMIN_COMMAND_CONTROLLER_STATS	0x06u
+#define ADMIN_COMMAND_CONTROLLER_DUMP	0x07u
+#define ADMIN_COMMAND_CMD_CAPS		0x08u
+#define ADMIN_COMMAND_MAX		0x08u
+
+#define STATUS_SUCCESS		0x00
+#define STATUS_MEM_UNAVAILABLE	0x20
+#define STATUS_BAD_OPCODE	0x50
+#define STATUS_BAD_REQUEST_PARM	0x51
+#define STATUS_BAD_DATA_PARM	0x52
+#define STATUS_DEBUG_BLOCKED	0x70
+#define STATUS_FAIL		0xFF
+
+#define STATUS_FW_UPDATE_BLOCKED 0x21
+#define STATUS_FW_ARG_INVALID	0x51
+#define STATUS_FW_INVALID	0x52
+
 struct ocxlpmem_function0 {
 	struct pci_dev *pdev;
 	struct ocxl_fn *ocxl_fn;
-- 
2.24.1


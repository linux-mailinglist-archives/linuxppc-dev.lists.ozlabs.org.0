Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2ED197431
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 08:01:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rMKm4zFLzDqV5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 17:01:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=d-silva.org (client-ip=66.55.73.32;
 helo=ushosting.nmnhosting.com; envelope-from=alastair@d-silva.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256
 header.s=201810a header.b=TXqe6QDq; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48rM7m416QzDqQt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 16:53:08 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id AF2322DC685E;
 Mon, 30 Mar 2020 16:52:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585547572;
 bh=DG24uTFgm3ncmUTPxNdi4/JJAgeS8enEWAzD03RxOZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TXqe6QDqrC9mr09B5wF/29o0TTisxmFcpb5xQh1cZb3/AR1YXvRJoY3sx1z5LcBrJ
 t+zJPG4Xc2mBEfI9YJ7ZlVHEqpnEIjgtG+oJxMMcOxiWX5uzkfFNWyD8/6zjasfBTB
 rqVrg2JP746Asy6Z/qaq9NMnTrtWQVnCkBaPFUTOag7RLSOQ+9ZtmG2HohPm8pWRHB
 SfhVnebyKrHl4UmR+bvyFhsVxhMHGgcIY7wtxBko3oFk4oPb63fkDyyLz5sSLjH2qY
 aTAC1kB9J2U44M2VoXiD8s9EsJGtTe8Fk/lfb3T6+EGaPceKk9iT6/jkKMukuv4Skj
 6/6s6vgnQWdmcMo5HODCL7TUdBesiiHnc2KpFVyZPTgZ6BNryXNj+mmuNJdV4HLtlr
 P3w8SP9EHHAq4QIMmgJXJfzAtLXITdqEcvLHiO7YX1AhrZqRQRzFTrYNI5c//gmrqg
 is5EJ/rlAXvxvbSgXvQ3fkGOdaje6XLIU1B/fA0oWC0K4UzVpxsgeva6a891KuU/qT
 5v1DJFbFVYhn/OiuiOgTT+XCkQnZ3c1Vs7td9zkVBOOqt56O61tzdqtWQdGqlJTOIw
 spFT5kwK2XD1UnFYSz49rNfHBpGn5H4Ezzhmxgd/eUnWxy+gjeNaS8tPjgnmay81N5
 9azCa0l7R+D6MSdd46z0bfig=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Al045934;
 Fri, 27 Mar 2020 18:12:17 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 12/25] nvdimm/ocxl: Add register addresses & status values
 to the header
Date: Fri, 27 Mar 2020 18:11:49 +1100
Message-Id: <20200327071202.2159885-13-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:17 +1100 (AEDT)
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

These values have been taken from the device specifications.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/nvdimm/ocxl/ocxlpmem.h | 73 ++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/nvdimm/ocxl/ocxlpmem.h b/drivers/nvdimm/ocxl/ocxlpmem.h
index 03fe7a264281..322387873b4b 100644
--- a/drivers/nvdimm/ocxl/ocxlpmem.h
+++ b/drivers/nvdimm/ocxl/ocxlpmem.h
@@ -8,6 +8,79 @@
 
 #define LABEL_AREA_SIZE	BIT_ULL(PA_SECTION_SHIFT)
 
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
+#define GLOBAL_MMIO_HCI_ACRW				BIT_ULL(0) // ACRW
+#define GLOBAL_MMIO_HCI_NSCRW				BIT_ULL(1) // NSCRW
+#define GLOBAL_MMIO_HCI_AFU_RESET			BIT_ULL(2) // AR
+#define GLOBAL_MMIO_HCI_FW_DEBUG			BIT_ULL(3) // FDE
+#define GLOBAL_MMIO_HCI_CONTROLLER_DUMP			BIT_ULL(4) // CD
+#define GLOBAL_MMIO_HCI_CONTROLLER_DUMP_COLLECTED	BIT_ULL(5) // CDC
+#define GLOBAL_MMIO_HCI_REQ_HEALTH_PERF			BIT_ULL(6) // CHPD
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
+#define STATUS_BLOCKED_BG_TASK	0x21
+#define STATUS_BAD_OPCODE	0x50
+#define STATUS_BAD_REQUEST_PARM	0x51
+#define STATUS_BAD_DATA_PARM	0x52
+#define STATUS_DEBUG_BLOCKED	0x70
+#define STATUS_FAIL		0xFF
+
+#define STATUS_FW_UPDATE_BLOCKED STATUS_BLOCKED_BG_TASK
+#define STATUS_FW_ARG_INVALID	STATUS_BAD_REQUEST_PARM
+#define STATUS_FW_INVALID	STATUS_BAD_DATA_PARM
+
 struct ocxlpmem {
 	struct device dev;
 	struct pci_dev *pdev;
-- 
2.24.1


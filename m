Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83787A2031
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 17:59:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K6k40JfczDrMD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 01:59:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K6XZ1Ry9zDrdZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 01:51:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46K6XY63L5z8x9M
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 01:51:09 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46K6XY4kPgz9sPW; Fri, 30 Aug 2019 01:51:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=maxiwell@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46K6XX5bytz9sDB;
 Fri, 30 Aug 2019 01:51:08 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7TFlssW044910; Thu, 29 Aug 2019 11:51:06 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2upfu0n5nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 11:51:06 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7TFp3O1012114;
 Thu, 29 Aug 2019 15:51:05 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 2ujvv6w8kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 15:51:05 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7TFp4bA18940378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 15:51:04 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D8E6AE060;
 Thu, 29 Aug 2019 15:51:04 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91758AE05F;
 Thu, 29 Aug 2019 15:51:01 +0000 (GMT)
Received: from maxibm.ibmuc.com (unknown [9.85.151.248])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 29 Aug 2019 15:51:01 +0000 (GMT)
From: "Maxiwell S. Garcia" <maxiwell@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 2/2] docs: powerpc: Add ELF note documentation
Date: Thu, 29 Aug 2019 12:50:21 -0300
Message-Id: <20190829155021.2915-3-maxiwell@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190829155021.2915-1-maxiwell@linux.ibm.com>
References: <20190829155021.2915-1-maxiwell@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=925 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908290168
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
Cc: linux-arch@vger.kernel.org, andmike@linux.ibm.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, cclaudio@linux.ibm.com,
 "Maxiwell S. Garcia" <maxiwell@linux.ibm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ELF note documentation describes the types and descriptors to be
used with the PowerPC namespace.

Signed-off-by: Maxiwell S. Garcia <maxiwell@linux.ibm.com>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
 Documentation/powerpc/elfnote.rst | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/powerpc/elfnote.rst

diff --git a/Documentation/powerpc/elfnote.rst b/Documentation/powerpc/elfnote.rst
new file mode 100644
index 000000000000..2a5c4beeb809
--- /dev/null
+++ b/Documentation/powerpc/elfnote.rst
@@ -0,0 +1,42 @@
+==========================
+ELF Note PowerPC Namespace
+==========================
+
+The PowerPC namespace in an ELF Note of the kernel binary is used to store
+capabilities and information which can be used by a bootloader or userland.
+
+Types and Descriptors
+---------------------
+
+The types to be used with the "PowerPC" namesapce are defined in the
+include/uapi/asm/elfnote.h
+
+	1) PPC_ELFNOTE_CAPABILITIES
+
+Define the capabilities supported/required by the kernel. This type uses a
+bitmap as "descriptor" field. Each bit is described below:
+
+- Ultravisor-capable bit (PowerNV only).
+
+	#define PPCCAP_ULTRAVISOR_BIT (1 << 0)
+
+	Indicate that the powerpc kernel binary knows how to run in an
+	ultravisor-enabled system.
+
+	In an ultravisor-enabled system, some machine resources are now controlled
+	by the ultravisor. If the kernel is not ultravisor-capable, but it ends up
+	being run on a machine with ultravisor, the kernel will probably crash
+	trying to access ultravisor resources. For instance, it may crash in early
+	boot trying to set the partition table entry 0.
+
+	In an ultravisor-enabled system, a bootloader could warn the user or prevent
+   	the kernel from being run if the PowerPC ultravisor capability doesn't exist
+	or the Ultravisor-capable bit is not set.
+
+References
+----------
+
+arch/powerpc/include/asm/elfnote.h
+arch/powerpc/kernel/note.S
+
+
-- 
2.20.1


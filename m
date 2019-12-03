Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AC010F5FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 04:54:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Rp5X2Mq9zDqBy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 14:54:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RnyQ5XTgzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 14:48:30 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB33kld8113791
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Dec 2019 22:48:26 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wm6mxtn8x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 22:48:26 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 3 Dec 2019 03:48:24 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Dec 2019 03:48:17 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB33mGp362390408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2019 03:48:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDB2B4203F;
 Tue,  3 Dec 2019 03:48:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 549B34204B;
 Tue,  3 Dec 2019 03:48:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Dec 2019 03:48:15 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 30B52A01B6;
 Tue,  3 Dec 2019 14:48:12 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v2 00/27] Add support for OpenCAPI SCM devices
Date: Tue,  3 Dec 2019 14:46:28 +1100
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120303-0008-0000-0000-0000033C0FDC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120303-0009-0000-0000-00004A5B2899
Message-Id: <20191203034655.51561-1-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_06:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=3 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912030032
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
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alastair D'Silva <alastair@d-silva.org>

This series adds support for OpenCAPI SCM devices, exposing
them as nvdimms so that we can make use of the existing
infrastructure.

V2:
  - "powerpc: Map & release OpenCAPI LPC memory"
      - Fix #if -> #ifdef
      - use pci_dev_id to get the bdfn
      - use __be64 to hold be data
      - indent check_hotplug_memory_addressable correctly 
      - Remove export of check_hotplug_memory_addressable
  - "ocxl: Conditionally bind SCM devices to the generic OCXL driver"
      - Improve patch description and remove redundant default
  - "nvdimm: Add driver for OpenCAPI Storage Class Memory"
      - Mark a few funcs as static as identified by the 0day bot
      - Add OCXL dependancies to OCXL_SCM
      - Use memcpy_mcsafe in scm_ndctl_config_read
      - Rename scm_foo_offset_0x00 to scm_foo_header_parse & add docs
      - Name DIMM attribs "ocxl" rather than "scm"
      - Split out into base + many feature patches
  - "powerpc: Enable OpenCAPI Storage Class Memory driver on bare metal"
      - Build DEV_DAX & friends as modules
  - "ocxl: Conditionally bind SCM devices to the generic OCXL driver"
      - Patch dropped (easy enough to maintain this out of tree for development)
  - "ocxl: Tally up the LPC memory on a link & allow it to be mapped"
      - Add a warning if an unmatched lpc_release is called
  - "ocxl: Add functions to map/unmap LPC memory"
      - Use EXPORT_SYMBOL_GPL


Alastair D'Silva (27):
  memory_hotplug: Add a bounds check to __add_pages
  nvdimm: remove prototypes for nonexistent functions
  powerpc: Add OPAL calls for LPC memory alloc/release
  mm/memory_hotplug: Allow check_hotplug_memory_addressable to be called
    from drivers
  powerpc: Map & release OpenCAPI LPC memory
  ocxl: Tally up the LPC memory on a link & allow it to be mapped
  ocxl: Add functions to map/unmap LPC memory
  ocxl: Save the device serial number in ocxl_fn
  ocxl: Free detached contexts in ocxl_context_detach_all()
  nvdimm: Add driver for OpenCAPI Storage Class Memory
  nvdimm/ocxl: Add register addresses & status values to header
  nvdimm/ocxl: Read the capability registers & wait for device ready
  nvdimm/ocxl: Add support for Admin commands
  nvdimm/ocxl: Add support for near storage commands
  nvdimm/ocxl: Register a character device for userspace to interact
    with
  nvdimm/ocxl: Implement the Read Error Log command
  nvdimm/ocxl: Add controller dump IOCTLs
  nvdimm/ocxl: Add an IOCTL to report controller statistics
  nvdimm/ocxl: Forward events to userspace
  nvdimm/ocxl: Add an IOCTL to request controller health & perf data
  nvdimm/ocxl: Support firmware update via sysfs
  nvdimm/ocxl: Implement the heartbeat command
  nvdimm/ocxl: Add debug IOCTLs
  nvdimm/ocxl: Implement Overwrite
  nvdimm/ocxl: Expose SMART data via ndctl
  powerpc: Enable OpenCAPI Storage Class Memory driver on bare metal
  MAINTAINERS: Add myself & nvdimm/ocxl to ocxl

 MAINTAINERS                                |    3 +
 arch/powerpc/configs/powernv_defconfig     |    4 +
 arch/powerpc/include/asm/opal-api.h        |    2 +
 arch/powerpc/include/asm/opal.h            |    3 +
 arch/powerpc/include/asm/pnv-ocxl.h        |    2 +
 arch/powerpc/platforms/powernv/ocxl.c      |   42 +
 arch/powerpc/platforms/powernv/opal-call.c |    2 +
 drivers/misc/ocxl/config.c                 |   50 +
 drivers/misc/ocxl/context.c                |    6 +-
 drivers/misc/ocxl/core.c                   |   60 +
 drivers/misc/ocxl/link.c                   |   60 +
 drivers/misc/ocxl/ocxl_internal.h          |   36 +
 drivers/nvdimm/Kconfig                     |    2 +
 drivers/nvdimm/Makefile                    |    2 +-
 drivers/nvdimm/nd-core.h                   |    4 -
 drivers/nvdimm/ocxl/Kconfig                |   21 +
 drivers/nvdimm/ocxl/Makefile               |    7 +
 drivers/nvdimm/ocxl/scm.c                  | 2220 ++++++++++++++++++++
 drivers/nvdimm/ocxl/scm_internal.c         |  238 +++
 drivers/nvdimm/ocxl/scm_internal.h         |  284 +++
 drivers/nvdimm/ocxl/scm_sysfs.c            |  163 ++
 include/linux/memory_hotplug.h             |    5 +
 include/misc/ocxl.h                        |   19 +
 include/uapi/nvdimm/ocxl-scm.h             |  127 ++
 mm/memory_hotplug.c                        |   21 +
 25 files changed, 3377 insertions(+), 6 deletions(-)
 create mode 100644 drivers/nvdimm/ocxl/Kconfig
 create mode 100644 drivers/nvdimm/ocxl/Makefile
 create mode 100644 drivers/nvdimm/ocxl/scm.c
 create mode 100644 drivers/nvdimm/ocxl/scm_internal.c
 create mode 100644 drivers/nvdimm/ocxl/scm_internal.h
 create mode 100644 drivers/nvdimm/ocxl/scm_sysfs.c
 create mode 100644 include/uapi/nvdimm/ocxl-scm.h

-- 
2.23.0


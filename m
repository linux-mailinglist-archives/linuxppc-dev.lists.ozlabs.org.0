Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD133DFEF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 10:05:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y5fY53HlzDqM7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 19:05:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y5N128D5zDqMN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 18:53:05 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9M7qwWB003900
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 03:53:03 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vsw33ha2x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 03:53:01 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clombard@linux.vnet.ibm.com>;
 Tue, 22 Oct 2019 08:52:51 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 22 Oct 2019 08:52:49 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9M7qmvO61603972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2019 07:52:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18DE911C04A;
 Tue, 22 Oct 2019 07:52:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D34A811C050;
 Tue, 22 Oct 2019 07:52:47 +0000 (GMT)
Received: from lombard-w541.nice-meridia.fr.ibm.com (unknown [9.134.167.65])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 22 Oct 2019 07:52:47 +0000 (GMT)
From: christophe lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com, groug@kaod.org
Subject: [PATCH 0/3] ocxl: Support for an 0penCAPI device in a QEMU guest.
Date: Tue, 22 Oct 2019 09:52:44 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19102207-0012-0000-0000-0000035B54F3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102207-0013-0000-0000-000021967EB5
Message-Id: <20191022075247.16266-1-clombard@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-22_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910220075
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds support for an 0penCAPI device in a QEMU guest.

It builds on top of the existing ocxl driver +
http://patchwork.ozlabs.org/patch/1177999/

The ocxl module registers either a pci driver or a platform driver, based on
the environment (bare-metal (powernv) or pseries).

Roughly 4/5 of the code is common between the 2 types of driver:
- PCI implementation
- mmio operations
- link management
- sysfs folders
- page fault and context handling

The differences in implementation are essentially based on the interact with
the opal api(s) defined in the host. Several hcalls have been defined
(extension of the PAPR) to:
- configure the Sceduled Process Area
- get specific AFU information
- allocated irq
- handle page fault and process element

When the code needs to call a platform-specific implementation, it does so
through an API. The powervn and pseries implementations each describe
their own definition. See struct ocxl_backend_ops.

It has been tested in a bare-metal and QEMU environment using the memcpy and
the AFP AFUs.

christophe lombard (3):
  ocxl: Introduce implementation-specific API
  ocxl: Add pseries-specific code
  powerpc/pseries: Fixup config space size of OpenCAPI devices

 arch/powerpc/platforms/pseries/pci.c |   9 +
 drivers/misc/ocxl/Makefile           |   3 +
 drivers/misc/ocxl/config.c           |   7 +-
 drivers/misc/ocxl/link.c             |  31 +-
 drivers/misc/ocxl/main.c             |   9 +
 drivers/misc/ocxl/ocxl_internal.h    |  25 ++
 drivers/misc/ocxl/powernv.c          |  88 ++++++
 drivers/misc/ocxl/pseries.c          | 450 +++++++++++++++++++++++++++
 8 files changed, 603 insertions(+), 19 deletions(-)
 create mode 100644 drivers/misc/ocxl/powernv.c
 create mode 100644 drivers/misc/ocxl/pseries.c

-- 
2.21.0


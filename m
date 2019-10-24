Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0ADE345A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 15:35:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zSsf4lMvzDqN7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 00:35:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zSjt6FzQzDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 00:28:16 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9ODK3wV028269
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 09:28:12 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vucef1j95-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 09:28:10 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <clombard@linux.vnet.ibm.com>;
 Thu, 24 Oct 2019 14:28:09 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 24 Oct 2019 14:28:07 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9ODS6bE50987024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 13:28:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED2BB11C054;
 Thu, 24 Oct 2019 13:28:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF6D511C04A;
 Thu, 24 Oct 2019 13:28:05 +0000 (GMT)
Received: from lombard-w541.ibmuc.com (unknown [9.145.180.183])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Oct 2019 13:28:05 +0000 (GMT)
From: christophe lombard <clombard@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com, aik@ozlabs.ru, groug@kaod.org, clg@kaod.org
Subject: [PATCH 0/2] vfio pci: Add support for OpenCAPI devices 
Date: Thu, 24 Oct 2019 15:28:03 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19102413-0020-0000-0000-0000037DDB9B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102413-0021-0000-0000-000021D422D1
Message-Id: <20191024132805.30701-1-clombard@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-24_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=776 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910240128
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

This series adds support for the OpenCAPI devices for vfio pci.

It builds on top of the existing ocxl driver +
http://patchwork.ozlabs.org/patch/1177999/

VFIO is a Linux kernel driver framework used by QEMU to make devices
directly assignable to virtual machines.

All OpenCAPI devices on the same PCI slot will all be grouped and
assigned to the same guest.

- Assume these are the devices you want to assign
 0007:00:00.0 Processing accelerators: IBM Device 062b
 0007:00:00.1 Processing accelerators: IBM Device 062b

- Two Devices in the group
$ ls /sys/bus/pci/devices/0007\:00\:00.0/iommu_group/devices/
 0007:00:00.0  0007:00:00.1

- Find vendor & device ID
$ lspci -n -s 0007:00:00
 0007:00:00.0 1200: 1014:062b
 0007:00:00.1 1200: 1014:062b

- Unbind from the current ocxl device driver if already loaded
$ rmmod ocxl

- Load vfio-pci if it's not already done.
$ modprobe vfio-pci

- Bind to vfio-pci
$ echo 1014 062b > /sys/bus/pci/drivers/vfio-pci/new_id

  This will result in a new device node "/dev/vfio/7", which will be
  use by QEMU to setup the devices for passthrough.

- Pass to qemu using -device vfio-pci
  -device vfio-pci,multifunction=on,host=0007:00:00.0,addr=2.0 -device
  vfio-pci,multifunction=on,host=0007:00:00.1,addr=2.1

It has been tested in a bare-metal and QEMU environment using the memcpy
and the AFP AFUs.

christophe lombard (2):
  powerpc/powernv: Register IOMMU group for OpenCAPI devices
  vfio/pci: Introduce OpenCAPI devices support.

 arch/powerpc/platforms/powernv/ocxl.c     | 164 ++++++++++---
 arch/powerpc/platforms/powernv/pci-ioda.c |  19 +-
 arch/powerpc/platforms/powernv/pci.h      |  13 +
 drivers/vfio/pci/Kconfig                  |   7 +
 drivers/vfio/pci/Makefile                 |   1 +
 drivers/vfio/pci/vfio_pci.c               |  19 ++
 drivers/vfio/pci/vfio_pci_ocxl.c          | 287 ++++++++++++++++++++++
 drivers/vfio/vfio.c                       |  25 ++
 include/linux/vfio.h                      |  13 +
 include/uapi/linux/vfio.h                 |  22 ++
 10 files changed, 530 insertions(+), 40 deletions(-)
 create mode 100644 drivers/vfio/pci/vfio_pci_ocxl.c

-- 
2.21.0


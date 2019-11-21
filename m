Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E489105384
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 14:51:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jgvh2ySmzDqM0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 00:51:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JgsQ3RfyzDr4r
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 00:49:29 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALDlpZ5065392
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 08:49:26 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wdu629fqe-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 08:49:25 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 21 Nov 2019 13:49:23 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 21 Nov 2019 13:49:20 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xALDnJtm55181546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Nov 2019 13:49:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F39152050;
 Thu, 21 Nov 2019 13:49:19 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E27D652051;
 Thu, 21 Nov 2019 13:49:18 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [PATCH v2 00/11] opencapi: enable card reset and link retraining
Date: Thu, 21 Nov 2019 14:49:07 +0100
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112113-0020-0000-0000-0000038CE3B1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112113-0021-0000-0000-000021E31DF0
Message-Id: <20191121134918.7155-1-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_03:2019-11-21,2019-11-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=934 phishscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911210125
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
Cc: groug@kaod.org, alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the linux part of the work to use the PCI hotplug framework to
control an opencapi card so that it can be reset and re-read after
flashing a new FPGA image. The changes required in skiboot are now
upstream. On an old skiboot, this series will do nothing.

A virtual PCI slot is created for the opencapi adapter and its state
can be controlled through the pnv-php hotplug driver:

  echo 0|1 > /sys/bus/pci/slots/OPENCAPI-<...>/power

Note that the power to the card is not really turned off, as the card
needs to stay on to be flashed with a new image. Instead the card is
in reset.

The first part of the series mostly deals with the pci/ioda state, as
the opencapi devices can now go away and the state needs to be cleaned
up.

The second part is modifications to the PCI hotplug driver on powernv,
so that a virtual slot is created for the opencapi adapters found in
the device tree.


Changelog:
v2:
 - rebase on latest kernel
 - clarify the ref counting done for NPU devices when the PE is setup
 - address comments from Andrew and Alastair


Frederic Barrat (11):
  powerpc/powernv/ioda: Fix ref count for devices with their own PE
  powerpc/powernv/ioda: Protect PE list
  powerpc/powernv/ioda: set up PE on opencapi device when enabling
  powerpc/powernv/ioda: Release opencapi device
  powerpc/powernv/ioda: Find opencapi slot for a device node
  pci/hotplug/pnv-php: Remove erroneous warning
  pci/hotplug/pnv-php: Improve error msg on power state change failure
  pci/hotplug/pnv-php: Register opencapi slots
  pci/hotplug/pnv-php: Relax check when disabling slot
  pci/hotplug/pnv-php: Wrap warnings in macro
  ocxl: Add PCI hotplug dependency to Kconfig

 arch/powerpc/include/asm/pnv-pci.h        |   1 +
 arch/powerpc/platforms/powernv/pci-ioda.c | 115 +++++++++++++++-------
 arch/powerpc/platforms/powernv/pci.c      |  24 +++--
 drivers/misc/ocxl/Kconfig                 |   1 +
 drivers/pci/hotplug/pnv_php.c             |  82 ++++++++-------
 5 files changed, 145 insertions(+), 78 deletions(-)

-- 
2.21.0


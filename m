Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01715891
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 06:34:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ymvw4q9KzDqQk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 14:34:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ymqY5jm2zDqK9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 14:30:17 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x474MI5k131613
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 May 2019 00:30:13 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sb2261ttw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 00:30:13 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 7 May 2019 05:30:12 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 May 2019 05:30:09 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x474U8GE55312512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 May 2019 04:30:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7894A4067;
 Tue,  7 May 2019 04:30:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E204A405B;
 Tue,  7 May 2019 04:30:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 May 2019 04:30:08 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B3984A01A2;
 Tue,  7 May 2019 14:30:06 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/6] 
Date: Tue,  7 May 2019 14:30:00 +1000
X-Mailer: git-send-email 2.19.0.2.gcad72f5712
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050704-0020-0000-0000-0000033A02BA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050704-0021-0000-0000-0000218C9B46
Message-Id: <cover.1557203383.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-07_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905070028
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
Cc: aik@ozlabs.ru, oohall@gmail.com, tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

Here is v2, addressing feedback from v1.

Original cover letter follows, slightly updated for v2:

This patch set adds support for EEH recovery of hot plugged devices on pSeries
machines. Specifically, devices discovered by PCI rescanning using
/sys/bus/pci/rescan, which includes devices hotplugged by QEMU's device_add
command. (Upstream Linux pSeries guests running under QEMU/KVM don't currently
use slot power control for hotplugging.)

As a side effect this also provides EEH support for devices removed by
/sys/bus/pci/devices/*/remove and re-discovered by writing to /sys/bus/pci/rescan,
on all platforms.

The approach I've taken is to use the fact that the existing
pcibios_bus_add_device() platform hooks (which are used to set up EEH on
Virtual Function devices (VFs)) are actually called for all devices, so I've
widened their scope and made other adjustments necessary to allow them to work
for hotplugged and boot-time devices as well.

Because some of the changes are in generic PowerPC code, it's
possible that I've disturbed something for another PowerPC platform. I've tried
to minimize this by leaving that code alone as much as possible and so there
are a few cases where eeh_add_device_{early,late}() or eeh_add_sysfs_files() is
called more than once. I think these can be looked at later, as duplicate calls
are not harmful.

The first patch is a rework of the pcibios_init reordering patch I posted
earlier, which I've included here because it's necessary for this set.

I have done some testing for PowerNV on Power9 using a modified pnv_php module
and some testing on pSeries with slot power control using a modified rpaphp
module, and the EEH-related parts seem to work.

Cheers,
Sam.

Patch set changelog follows:

Patch set v2: 
Patch 1/6: powerpc/64: Adjust order in pcibios_init()
Patch 2/6: powerpc/eeh: Clear stale EEH_DEV_NO_HANDLER flag
* Also clear EEH_DEV_NO_HANDLER in eeh_handle_special_event().
Patch 3/6 (was 4/8): powerpc/eeh: Improve debug messages around device addition
Patch 4/6 (was 6/8): powerpc/eeh: Initialize EEH address cache earlier
Patch 5/6 (was 3/8 and 7/8): powerpc/eeh: EEH for pSeries hot plug
- Dropped changes to the PowerNV PHB EEH flag, instead refactor just enough to
  use the existing flag from multiple places.
- Merge the little remaining work from the above change into the patch where
  it's used.
Patch 6/6 (was 5/8 and 8/8): powerpc/eeh: Refactor around eeh_probe_devices()
- As it's so small, merged the enablement message patch into this one (where it's used).
- Reworked enablement messages.

Patch set v1:
Patch 1/8: powerpc/64: Adjust order in pcibios_init()
Patch 2/8: powerpc/eeh: Clear stale EEH_DEV_NO_HANDLER flag
Patch 3/8: powerpc/eeh: Convert PNV_PHB_FLAG_EEH to global flag
Patch 4/8: powerpc/eeh: Improve debug messages around device addition
Patch 5/8: powerpc/eeh: Add eeh_show_enabled()
Patch 6/8: powerpc/eeh: Initialize EEH address cache earlier
Patch 7/8: powerpc/eeh: EEH for pSeries hot plug
Patch 8/8: powerpc/eeh: Remove eeh_probe_devices() and eeh_addr_cache_build()

Sam Bobroff (6):
  powerpc/64: Adjust order in pcibios_init()
  powerpc/eeh: Clear stale EEH_DEV_NO_HANDLER flag
  powerpc/eeh: Improve debug messages around device addition
  powerpc/eeh: Initialize EEH address cache earlier
  powerpc/eeh: EEH for pSeries hot plug
  powerpc/eeh: Refactor around eeh_probe_devices()

 arch/powerpc/include/asm/eeh.h               |  8 +--
 arch/powerpc/kernel/eeh.c                    | 33 ++++-----
 arch/powerpc/kernel/eeh_cache.c              | 29 +-------
 arch/powerpc/kernel/eeh_driver.c             | 11 ++-
 arch/powerpc/kernel/of_platform.c            |  3 +-
 arch/powerpc/kernel/pci-common.c             |  4 --
 arch/powerpc/kernel/pci_32.c                 |  4 ++
 arch/powerpc/kernel/pci_64.c                 | 12 +++-
 arch/powerpc/platforms/powernv/eeh-powernv.c | 57 ++++++++++-----
 arch/powerpc/platforms/pseries/eeh_pseries.c | 75 +++++++++++---------
 arch/powerpc/platforms/pseries/pci.c         |  3 +-
 11 files changed, 127 insertions(+), 112 deletions(-)

-- 
2.19.0.2.gcad72f5712


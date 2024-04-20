Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC98ABCFB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 22:02:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VMMqN1n23z3dVr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Apr 2024 06:02:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VMMpv0n3bz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Apr 2024 06:01:42 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id C6E382800C99F;
	Sat, 20 Apr 2024 22:01:24 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id BF393CC625; Sat, 20 Apr 2024 22:01:24 +0200 (CEST)
Message-ID: <cover.1713608122.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sat, 20 Apr 2024 22:00:00 +0200
Subject: [PATCH 0/6] Deduplicate string exposure in sysfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
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
Cc: Mark Rutland <mark.rutland@arm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, storagedev@microchip.com, Yicong Yang <yangyicong@hisilicon.com>, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Will Deacon <will@kernel.org>, Jijie Shao <shaojijie@huawei.com>, Khuong Dinh <khuong@os.amperecomputing.com>, Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, "Luke D. Jones" <luke@ljones.dev>, Nilesh Javali <njavali@marvell.com>, Ilpo Jaervinen <ilpo.jarvinen@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Hans de Goede <hdegoede@redhat.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, Azael Avalos <coproscefalo@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, linux-scsi@vger.kernel.org, "Martin K. Petersen" <mart
 in.petersen@oracle.com>, Don Brace <don.brace@microchip.com>, Bjorn Andersson <andersson@kernel.org>, Anil Gurumur thy <anil.gurumurthy@qlogic.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, GR-QLogic-Storage-Upstream@marvell.com, Shuai Xue <xueshuai@linux.alibaba.com>, Corentin Chary <corentin.chary@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce a generic ->show() callback to expose a string as a device
attribute in sysfs.  Deduplicate various identical callbacks across
the tree.

Result:  Minus 216 LoC, minus 1576 bytes vmlinux size (x86_64 allyesconfig).

This is a byproduct of my upcoming PCI device authentication v2 patches.


Lukas Wunner (6):
  driver core: Add device_show_string() helper for sysfs attributes
  hwmon: Use device_show_string() helper for sysfs attributes
  IB/qib: Use device_show_string() helper for sysfs attributes
  perf: Use device_show_string() helper for sysfs attributes
  platform/x86: Use device_show_string() helper for sysfs attributes
  scsi: Use device_show_string() helper for sysfs attributes

 arch/powerpc/perf/hv-24x7.c              | 10 ----
 arch/x86/events/intel/core.c             | 13 ++---
 drivers/base/core.c                      |  9 ++++
 drivers/hwmon/i5k_amb.c                  | 15 ++----
 drivers/hwmon/ibmpex.c                   | 14 ++----
 drivers/infiniband/hw/qib/qib.h          |  1 -
 drivers/infiniband/hw/qib/qib_driver.c   |  6 ---
 drivers/infiniband/hw/qib/qib_sysfs.c    | 10 +---
 drivers/perf/alibaba_uncore_drw_pmu.c    | 12 +----
 drivers/perf/arm-cci.c                   | 12 +----
 drivers/perf/arm-ccn.c                   | 11 +----
 drivers/perf/arm_cspmu/arm_cspmu.c       | 10 ----
 drivers/perf/arm_cspmu/arm_cspmu.h       |  7 +--
 drivers/perf/arm_dsu_pmu.c               | 11 +----
 drivers/perf/cxl_pmu.c                   | 13 +----
 drivers/perf/hisilicon/hisi_pcie_pmu.c   | 13 +----
 drivers/perf/hisilicon/hisi_uncore_pmu.c | 14 ------
 drivers/perf/hisilicon/hisi_uncore_pmu.h |  4 +-
 drivers/perf/hisilicon/hns3_pmu.c        | 12 +----
 drivers/perf/qcom_l3_pmu.c               | 11 +----
 drivers/perf/xgene_pmu.c                 | 11 +----
 drivers/platform/x86/asus-wmi.c          | 62 ++++++------------------
 drivers/platform/x86/thinkpad_acpi.c     | 10 +---
 drivers/platform/x86/toshiba_acpi.c      |  9 +---
 drivers/scsi/bfa/bfad_attr.c             | 28 +++--------
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c | 11 +----
 drivers/scsi/mvsas/mv_init.c             | 10 +---
 drivers/scsi/qla2xxx/qla_attr.c          | 11 +----
 drivers/scsi/smartpqi/smartpqi_init.c    | 11 ++---
 include/linux/device.h                   | 15 ++++++
 30 files changed, 85 insertions(+), 301 deletions(-)

-- 
2.43.0


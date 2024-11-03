Return-Path: <linuxppc-dev+bounces-2780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1249BA730
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 18:13:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhLlK2d4Mz2xpk;
	Mon,  4 Nov 2024 04:13:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730653981;
	cv=none; b=NlzlMG+NqdSP7ykl5brBNb4ycL+5hWqRclRNohOfDifrHm+2HY2rdaS2zi/Gu4A3EvS2bj5ijaOzgqWiejRhsO6d3qmyi6b3bUbG5FOo2ssLFFReyN2rL2kIRS2uWKZZ2muf09UUS/Kx/2Mc2q+oTvyEGAsWBIFcGroyxfi5nQxHbN6lB3BkdCRtRwFQHusoo1Dfrj8o9KzFo+4VqbizNcQb54fXmaufd4+l8yA6E/sL9zy3FoQ6A+iGf079FDaWZ/6r+vZwZmtcbuFu9ruUfBQbtR73DCM91+0CqwlBSOx63QtlUTPgnGphQeOR9Z9NZEHx6DcYfUL5xYoQp/GHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730653981; c=relaxed/relaxed;
	bh=tDW2z4TSp6shSOhGqnFgxSaHQROF10wcn3mHjP6pVTg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PPjmtHVsbpdiSqBK98QIr+H9pmQ6NsBt7GylE+zQFuq2dSQnaMiv0J32zNNRa92R53RXxVL2J/Z8pR+IT0Bp3vVm5aPdLU7Ivp+I6gEMqM288wLEGqbwCr3NqZL6kgHOf+egq8QevmYUglWRJSNOk1FPAIjnjgj265ZE+DdFaWchi8t+Sacfo9K8xSnCB0JD4dhgThQGssiaSYtqWeZW10JYEiR4jacSJJVgst2rGrO6yLtkfuyy14glspy/SmWJ8ZCorLWBthO5Mgm7laaC+TZCnyLN5gcaBd6CN43h7K0gwV1JfhQb2LdtZ6WjTrS8wfBSo2UdWXlU5sTYUeFSPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=LVkLlDoy; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=LVkLlDoy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 489 seconds by postgrey-1.37 at boromir; Mon, 04 Nov 2024 04:12:55 AEDT
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhLlC2bzgz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 04:12:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653478;
	bh=vLmXHFQrVeANwVFZr7GPEQiJDwV80UwagiHdL+WieYg=;
	h=From:Subject:Date:To:Cc:From;
	b=LVkLlDoyAjxSEKNfss+XSXyWYJJQzcZv2JQqsJCbi9rUIOTJ4RL7OxwixFQenCjjd
	 rlVUh9qqiGz1yV+aWCGMfosXXIgbUe7lyF1Ond/E8etyVdz8oI4rmOCryfvOvF9wdn
	 hyWkvUc8pYcWGzPC5QJ3hJWaxe+zEoDAAboNa6yg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 00/10] sysfs: constify struct bin_attribute (Part 1)
Date: Sun, 03 Nov 2024 17:03:29 +0000
Message-Id: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOGsJ2cC/22NQQ6CMBBFr2JmbU1bQasr72GIKTC1synaKSgh3
 N2KJm5cvp/89yZgjIQMx9UEEQdi6kIGvV5B4224oqA2M2ipCyW1ETyyY9F0gZOoKVxsSlFYKc1
 hVxjVyhry9RbR0XPRnqsPR7z32Z5+oydOXRyX9KDe67eyVf8rgxJSaG2UdXbvZFmeHkjM3Pjeb
 wImqOZ5fgH1E5+t0gAAAA==
X-Change-ID: 20241028-sysfs-const-bin_attr-a00896481d0b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "David E. Box" <david.e.box@linux.intel.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Logan Gunthorpe <logang@deltatee.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org, 
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=3861;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vLmXHFQrVeANwVFZr7GPEQiJDwV80UwagiHdL+WieYg=;
 b=Bvbt1J2LqQ69JnMU1VrxxAk0oh5wwQXMdeGiNk0LKpzFZww+HQ7ZSL0xtSH7vjejf+nvXyav9
 7mYQXMoReN6DBjpqywBjK9Kq5FxOhy2hVOb+j2ENGg6yuLHGvmQRl99
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

struct bin_attribute contains a bunch of pointer members, which when
overwritten by accident or malice can lead to system instability and
security problems.
Moving the definitions of struct bin_attribute to read-only memory
makes these modifications impossible.
The same change has been performed for many other structures in the
past. (struct class, struct ctl_table...)

For the structure definitions throughout the core to be moved to
read-only memory the following steps are necessary.

1) Change all callbacks invoked from the sysfs core to only pass const
   pointers
2) Adapt the sysfs core to only work in terms of const pointers
3) Adapt the sysfs core APIs to allow const pointers
4) Change all structure definitions through the core to const

This series provides the foundation for step 1) above.
It converts some callbacks in a single step to const and provides a
foundation for those callbacks where a single step is not possible.

Patches 1-5 change the bin_attribute callbacks of 'struct
attribute_group'. The remaining ones touch 'struct bin_attribute' itself.

The techniques employed by this series can later be reused for the
same change for other sysfs attributes.

This series is intended to be merged through the driver core tree.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Drop RFC state
- Refuse registration of attributes with both read/read_new or
  write/write_new
- Remove don't drop llseek() callback, as it is actually used.
  Instead also migrate it to "const".
- _Generic machinery: Simplify and make more robust against misuse
- Link to v1: https://lore.kernel.org/r/20241031-sysfs-const-bin_attr-v1-0-2281afa7f055@weissschuh.net

---
Thomas Weißschuh (10):
      sysfs: explicitly pass size to sysfs_add_bin_file_mode_ns()
      sysfs: introduce callback attribute_group::bin_size
      PCI/sysfs: Calculate bin_attribute size through bin_size()
      nvmem: core: calculate bin_attribute size through bin_size()
      sysfs: treewide: constify attribute callback of bin_is_visible()
      sysfs: treewide: constify attribute callback of bin_attribute::mmap()
      sysfs: treewide: constify attribute callback of bin_attribute::llseek()
      sysfs: implement all BIN_ATTR_* macros in terms of __BIN_ATTR()
      sysfs: bin_attribute: add const read/write callback variants
      driver core: Constify attribute arguments of binary attributes

 arch/alpha/kernel/pci-sysfs.c           |  6 +--
 drivers/base/node.c                     |  4 +-
 drivers/base/topology.c                 |  4 +-
 drivers/cxl/port.c                      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c |  2 +-
 drivers/infiniband/hw/qib/qib_sysfs.c   |  2 +-
 drivers/misc/ocxl/sysfs.c               |  2 +-
 drivers/mtd/spi-nor/sysfs.c             |  2 +-
 drivers/nvmem/core.c                    | 16 ++++--
 drivers/pci/p2pdma.c                    |  2 +-
 drivers/pci/pci-sysfs.c                 | 42 ++++++++-------
 drivers/pci/vpd.c                       |  2 +-
 drivers/platform/x86/amd/hsmp.c         |  2 +-
 drivers/platform/x86/intel/pmt/class.c  |  2 +-
 drivers/platform/x86/intel/sdsi.c       |  2 +-
 drivers/scsi/scsi_sysfs.c               |  2 +-
 drivers/uio/uio_hv_generic.c            |  2 +-
 drivers/usb/core/sysfs.c                |  2 +-
 fs/sysfs/file.c                         | 30 +++++++----
 fs/sysfs/group.c                        |  5 +-
 fs/sysfs/sysfs.h                        |  2 +-
 include/linux/sysfs.h                   | 94 ++++++++++++++++++++-------------
 22 files changed, 138 insertions(+), 91 deletions(-)
---
base-commit: 3e5e6c9900c3d71895e8bdeacfb579462e98eba1
change-id: 20241028-sysfs-const-bin_attr-a00896481d0b

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F354EB4EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 22:55:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KShfZ524Fz3c29
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 07:55:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=x/3PVpLY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=x/3PVpLY; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KShdw6y4Pz2xsG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 07:54:54 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id z16so16966923pfh.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 13:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=FDqhi0N/S/cUCLoAuboiyOBP3IQEQ1O6QqcgKgHDMTU=;
 b=x/3PVpLYjRnKwsaey2xougaew21RYo4GEuoyEXNrglvcGPfUh+vqthPJlK8+C2bTgd
 8IMQTz6lp1ZgXncGNdvSlXcRhEcstjb6VorrpPRbOp/t0HyM0LTjRzh5bRyXtvuo433s
 Or1qeAQH7BuLCtaKAaRBbLN0NO1o8aIwh9hcBCiqhksd6QZoCn7M+28UTb00TNrOsW4e
 X96Aj//eZ/TfBgpoel8d1ub+9aJsdZ/fBzuZP5e0dRYyqxdW0GdfkIuE/8uirSGD1dfk
 blTKmQGCEUVBvGIGXqfr4EQXMS/OOPijoAnAYxMAqoyD+VuClv5yU/a7zvGwdYqW7+OE
 Oe2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=FDqhi0N/S/cUCLoAuboiyOBP3IQEQ1O6QqcgKgHDMTU=;
 b=lZteLxOgwR2lYZmky3EFoUCq21ZizPVzpe1oV++PzBmgCz8bcuAVYZaKb0zmSRPPvE
 vR88dArE98/zFnIDlwBLIAlSL5VmaDJuaYjhejgrM7RQ2GVKNjI/5UTCLWVmf8eHGDuR
 OK2KjQiStm1N9sS9LVkUk7cSCnQGGKR2jgvD10SaB8xqeRZ1+W3dYaaJQuImjDuQy5aW
 SDjClfreYfZQl9QwpDNQ3EdgQAs9I36EEwb5sP/aczU3HH6nexBew9pzqnQfcoNFb/5V
 q4JUj4J+5RxNAUoIWZ7y8rrULvSX3Q6QilbwJjIsszmJEdkKh4F/BuJnV3CcnnKYEgyf
 TTyg==
X-Gm-Message-State: AOAM532n9wUS9UtwbRpNIxhL0xYlUDdT+uUQV5e2ANcY7DJXxer9YH/l
 t9Jel7kkduvFu5p6aqs63IisjcXUkJrOy13qmCMhHQ==
X-Google-Smtp-Source: ABdhPJwmS9mDmjkje+k3GsHwWgWBckFPeTJrJcGyj7bgk4ha15BJ4lDerfFVoIwXMu5O3fOv2UnxO/USzXRhOvcTnJw=
X-Received: by 2002:a05:6a02:283:b0:342:703e:1434 with SMTP id
 bk3-20020a056a02028300b00342703e1434mr3350486pgb.74.1648587292181; Tue, 29
 Mar 2022 13:54:52 -0700 (PDT)
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 29 Mar 2022 13:54:41 -0700
Message-ID: <CAPcyv4hydiSDFXVVBtYyuUgutTca6eL67s7txkSgzGzW1VGT0A@mail.gmail.com>
Subject: [GIT PULL] LIBNVDIMM update for v5.18
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Linus, please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
tags/libnvdimm-for-5.18

...to receive the libnvdimm update for this cycle which includes the
deprecation of block-aperture mode and a new perf events interface for
the papr_scm nvdimm driver. The perf events approach was acked by
PeterZ. You will notice the top commit is less than a week old as
linux-next exposure identified some build failure scenarios. Kajol
turned around a fix and it has appeared in linux-next with no
additional reports. Some other fixups for the removal of
block-aperture mode also generated some follow-on fixes from -next
exposure.

I am not aware of anything else outstanding, please pull.

---

The following changes since commit 754e0b0e35608ed5206d6a67a791563c631cec07:

  Linux 5.17-rc4 (2022-02-13 12:13:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
tags/libnvdimm-for-5.18

for you to fetch changes up to ada8d8d337ee970860c9844126e634df8076aa11:

  nvdimm/blk: Fix title level (2022-03-23 17:52:33 -0700)

----------------------------------------------------------------
libnvdimm for 5.18

- Add perf support for nvdimm events, initially only for 'papr_scm'
  devices.

- Deprecate the 'block aperture' support in libnvdimm, it only ever
  existed in the specification, not in shipping product.

----------------------------------------------------------------
Dan Williams (6):
      nvdimm/region: Fix default alignment for small regions
      nvdimm/blk: Delete the block-aperture window driver
      nvdimm/namespace: Delete blk namespace consideration in shared paths
      nvdimm/namespace: Delete nd_namespace_blk
      ACPI: NFIT: Remove block aperture support
      nvdimm/region: Delete nd_blk_region infrastructure

Kajol Jain (6):
      drivers/nvdimm: Add nvdimm pmu structure
      drivers/nvdimm: Add perf interface to expose nvdimm performance stats
      powerpc/papr_scm: Add perf interface support
      docs: ABI: sysfs-bus-nvdimm: Document sysfs event format entries
for nvdimm pmu
      drivers/nvdimm: Fix build failure when CONFIG_PERF_EVENTS is not set
      powerpc/papr_scm: Fix build failure when

Lukas Bulwahn (1):
      MAINTAINERS: remove section LIBNVDIMM BLK: MMIO-APERTURE DRIVER

Tom Rix (1):
      nvdimm/blk: Fix title level

 Documentation/ABI/testing/sysfs-bus-nvdimm |  35 ++
 Documentation/driver-api/nvdimm/nvdimm.rst | 406 +++++------------------
 MAINTAINERS                                |  11 -
 arch/powerpc/include/asm/device.h          |   5 +
 arch/powerpc/platforms/pseries/papr_scm.c  | 230 +++++++++++++
 drivers/acpi/nfit/core.c                   | 387 +---------------------
 drivers/acpi/nfit/nfit.h                   |   6 -
 drivers/nvdimm/Kconfig                     |  25 +-
 drivers/nvdimm/Makefile                    |   4 +-
 drivers/nvdimm/blk.c                       | 335 -------------------
 drivers/nvdimm/bus.c                       |   2 -
 drivers/nvdimm/dimm_devs.c                 | 204 +-----------
 drivers/nvdimm/label.c                     | 346 +-------------------
 drivers/nvdimm/label.h                     |   5 +-
 drivers/nvdimm/namespace_devs.c            | 506 ++---------------------------
 drivers/nvdimm/nd-core.h                   |  27 +-
 drivers/nvdimm/nd.h                        |  13 -
 drivers/nvdimm/nd_perf.c                   | 329 +++++++++++++++++++
 drivers/nvdimm/region.c                    |  31 +-
 drivers/nvdimm/region_devs.c               | 157 ++-------
 include/linux/libnvdimm.h                  |  24 --
 include/linux/nd.h                         |  78 +++--
 include/uapi/linux/ndctl.h                 |   2 -
 tools/testing/nvdimm/Kbuild                |   4 -
 tools/testing/nvdimm/config_check.c        |   1 -
 tools/testing/nvdimm/test/ndtest.c         |  67 +---
 tools/testing/nvdimm/test/nfit.c           |  23 --
 27 files changed, 833 insertions(+), 2430 deletions(-)
 delete mode 100644 drivers/nvdimm/blk.c
 create mode 100644 drivers/nvdimm/nd_perf.c

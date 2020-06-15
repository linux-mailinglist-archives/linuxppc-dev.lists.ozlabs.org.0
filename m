Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 655641F90B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 09:55:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lkBz0GpdzDqQh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 17:55:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ON12gpsw; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lhmY11m0zDqLB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:50:36 +1000 (AEST)
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF39D21473;
 Mon, 15 Jun 2020 06:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592203833;
 bh=d2J+ptwGTE+UKzRI7PSJpikOZrf3bjiPT/HuBsw4Rxw=;
 h=From:To:Cc:Subject:Date:From;
 b=ON12gpswpp91jF8gjz431ZuETSZLlqhTbUNoVJYQIPHXiMUQ/ptKfqtVgr+kFU8uj
 MWjcNEBacHTZ9AFG62MgPST5uq7xN4G4hTBj2jYyidBLosS3o4ADePk2d2mUPt09/g
 Vp2Bxwb8k1yB9HwaacRRZHFcIiUFiqWOvMaDROc4=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
 (envelope-from <mchehab@kernel.org>)
 id 1jkiwv-009o5P-NY; Mon, 15 Jun 2020 08:50:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 00/22] ReST conversion patches (final?)
Date: Mon, 15 Jun 2020 08:50:05 +0200
Message-Id: <cover.1592203650.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-pci@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Harry Wei <harryxiyou@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Alex Shi <alex.shi@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Javi Merino <javi.merino@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-crypto@vger.kernel.org,
 Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, tee-dev@lists.linaro.org,
 Vinod Koul <vkoul@kernel.org>, keyrings@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dmaengine@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Jens Wiklander <jens.wiklander@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jon,

That's my final(*) series of conversion patches from .txt to ReST.

(*) Well, running the script I'm using to check, I noticed a couple of new *.txt files.
If I have some time, I'll try to address those last pending things for v5.9.

Mauro Carvalho Chehab (22):
  docs: dt: convert booting-without-of.txt to ReST format
  docs: thermal: convert cpu-idle-cooling.rst to ReST
  docs: crypto: convert asymmetric-keys.txt to ReST
  docs: crypto: convert api-intro.txt to ReST format
  docs: crypto: convert async-tx-api.txt to ReST format
  docs: crypto: descore-readme.txt: convert to ReST format
  docs: misc-devices/spear-pcie-gadget.txt: convert to ReST
  docs: misc-devices/pci-endpoint-test.txt: convert to ReST
  docs: misc-devices/pci-endpoint-test.txt: convert to ReST
  docs: misc-devices/c2port.txt: convert to ReST format
  docs: misc-devices/bh1770glc.txt: convert to ReST
  docs: misc-devices/apds990x.txt: convert to ReST format
  docs: pci: endpoint/function/binding/pci-test.txt convert to ReST
  docs: arm64: convert perf.txt to ReST format
  docs: powerpc: convert vcpudispatch_stats.txt to ReST
  docs: sh: convert new-machine.txt to ReST
  docs: sh: convert register-banks.txt to ReST
  docs: trace: ring-buffer-design.txt: convert to ReST format
  docs: move other kAPI documents to core-api
  docs: move remaining stuff under Documentation/*.txt to
    Documentation/staging
  docs: staging: don't use literalinclude
  docs: staging: use small font for literal includes

 .../endpoint/function/binding/pci-test.rst    |  26 +
 .../endpoint/function/binding/pci-test.txt    |  19 -
 Documentation/PCI/endpoint/index.rst          |   2 +
 Documentation/admin-guide/sysctl/vm.rst       |   2 +-
 Documentation/arm/booting.rst                 |   2 +-
 Documentation/arm64/index.rst                 |   1 +
 Documentation/arm64/{perf.txt => perf.rst}    |   7 +-
 Documentation/core-api/index.rst              |   6 +
 .../{mailbox.txt => core-api/mailbox.rst}     |   0
 .../nommu-mmap.rst}                           |   0
 .../this_cpu_ops.rst}                         |   0
 .../unaligned-memory-access.rst               |   0
 .../crypto/{api-intro.txt => api-intro.rst}   | 186 ++--
 ...symmetric-keys.txt => asymmetric-keys.rst} |  91 +-
 .../{async-tx-api.txt => async-tx-api.rst}    | 253 +++---
 ...{descore-readme.txt => descore-readme.rst} | 152 +++-
 Documentation/crypto/index.rst                |   5 +
 ...-without-of.txt => booting-without-of.rst} | 299 ++++---
 Documentation/devicetree/index.rst            |   1 +
 Documentation/driver-api/dmaengine/client.rst |   2 +-
 .../driver-api/dmaengine/provider.rst         |   2 +-
 .../driver-api/thermal/cpu-idle-cooling.rst   |  14 +-
 Documentation/gpu/drm-mm.rst                  |   2 +-
 Documentation/index.rst                       |  13 +
 .../{ad525x_dpot.txt => ad525x_dpot.rst}      |  24 +-
 .../{apds990x.txt => apds990x.rst}            |  31 +-
 .../{bh1770glc.txt => bh1770glc.rst}          |  45 +-
 .../misc-devices/{c2port.txt => c2port.rst}   |  58 +-
 Documentation/misc-devices/index.rst          |   6 +
 .../misc-devices/pci-endpoint-test.rst        |  56 ++
 .../misc-devices/pci-endpoint-test.txt        |  41 -
 .../misc-devices/spear-pcie-gadget.rst        | 170 ++++
 .../misc-devices/spear-pcie-gadget.txt        | 130 ---
 Documentation/powerpc/index.rst               |   1 +
 ...patch_stats.txt => vcpudispatch_stats.rst} |  17 +-
 Documentation/security/keys/core.rst          |   2 +-
 Documentation/sh/index.rst                    |   6 +
 .../sh/{new-machine.txt => new-machine.rst}   | 195 +++--
 ...{register-banks.txt => register-banks.rst} |  13 +-
 .../{crc32.txt => staging/crc32.rst}          |   0
 Documentation/staging/index.rst               |  59 ++
 .../{kprobes.txt => staging/kprobes.rst}      |   0
 Documentation/{lzo.txt => staging/lzo.rst}    |   0
 .../remoteproc.rst}                           |   2 +-
 .../{rpmsg.txt => staging/rpmsg.rst}          |   0
 .../speculation.rst}                          |   8 +-
 .../static-keys.rst}                          |   0
 Documentation/{tee.txt => staging/tee.rst}    |   1 +
 Documentation/{xz.txt => staging/xz.rst}      |   0
 Documentation/trace/index.rst                 |   1 +
 Documentation/trace/kprobetrace.rst           |   2 +-
 ...ffer-design.txt => ring-buffer-design.rst} | 802 ++++++++++--------
 Documentation/translations/zh_CN/arm/Booting  |   2 +-
 MAINTAINERS                                   |  12 +-
 arch/Kconfig                                  |   2 +-
 arch/sh/Kconfig.cpu                           |   2 +-
 crypto/asymmetric_keys/asymmetric_type.c      |   2 +-
 crypto/asymmetric_keys/public_key.c           |   2 +-
 crypto/asymmetric_keys/signature.c            |   2 +-
 drivers/misc/Kconfig                          |   2 +-
 drivers/misc/ad525x_dpot.c                    |   2 +-
 include/crypto/public_key.h                   |   2 +-
 include/keys/asymmetric-parser.h              |   2 +-
 include/keys/asymmetric-subtype.h             |   2 +-
 include/keys/asymmetric-type.h                |   2 +-
 include/linux/jump_label.h                    |   2 +-
 init/Kconfig                                  |   2 +-
 lib/crc32.c                                   |   2 +-
 lib/lzo/lzo1x_decompress_safe.c               |   2 +-
 lib/xz/Kconfig                                |   2 +-
 mm/Kconfig                                    |   2 +-
 mm/nommu.c                                    |   2 +-
 samples/kprobes/kprobe_example.c              |   2 +-
 samples/kprobes/kretprobe_example.c           |   2 +-
 74 files changed, 1620 insertions(+), 1189 deletions(-)
 create mode 100644 Documentation/PCI/endpoint/function/binding/pci-test.rst
 delete mode 100644 Documentation/PCI/endpoint/function/binding/pci-test.txt
 rename Documentation/arm64/{perf.txt => perf.rst} (95%)
 rename Documentation/{mailbox.txt => core-api/mailbox.rst} (100%)
 rename Documentation/{nommu-mmap.txt => core-api/nommu-mmap.rst} (100%)
 rename Documentation/{this_cpu_ops.txt => core-api/this_cpu_ops.rst} (100%)
 rename Documentation/{process => core-api}/unaligned-memory-access.rst (100%)
 rename Documentation/crypto/{api-intro.txt => api-intro.rst} (70%)
 rename Documentation/crypto/{asymmetric-keys.txt => asymmetric-keys.rst} (91%)
 rename Documentation/crypto/{async-tx-api.txt => async-tx-api.rst} (55%)
 rename Documentation/crypto/{descore-readme.txt => descore-readme.rst} (81%)
 rename Documentation/devicetree/{booting-without-of.txt => booting-without-of.rst} (90%)
 rename Documentation/misc-devices/{ad525x_dpot.txt => ad525x_dpot.rst} (85%)
 rename Documentation/misc-devices/{apds990x.txt => apds990x.rst} (86%)
 rename Documentation/misc-devices/{bh1770glc.txt => bh1770glc.rst} (83%)
 rename Documentation/misc-devices/{c2port.txt => c2port.rst} (59%)
 create mode 100644 Documentation/misc-devices/pci-endpoint-test.rst
 delete mode 100644 Documentation/misc-devices/pci-endpoint-test.txt
 create mode 100644 Documentation/misc-devices/spear-pcie-gadget.rst
 delete mode 100644 Documentation/misc-devices/spear-pcie-gadget.txt
 rename Documentation/powerpc/{vcpudispatch_stats.txt => vcpudispatch_stats.rst} (94%)
 rename Documentation/sh/{new-machine.txt => new-machine.rst} (73%)
 rename Documentation/sh/{register-banks.txt => register-banks.rst} (88%)
 rename Documentation/{crc32.txt => staging/crc32.rst} (100%)
 create mode 100644 Documentation/staging/index.rst
 rename Documentation/{kprobes.txt => staging/kprobes.rst} (100%)
 rename Documentation/{lzo.txt => staging/lzo.rst} (100%)
 rename Documentation/{remoteproc.txt => staging/remoteproc.rst} (99%)
 rename Documentation/{rpmsg.txt => staging/rpmsg.rst} (100%)
 rename Documentation/{speculation.txt => staging/speculation.rst} (97%)
 rename Documentation/{static-keys.txt => staging/static-keys.rst} (100%)
 rename Documentation/{tee.txt => staging/tee.rst} (99%)
 rename Documentation/{xz.txt => staging/xz.rst} (100%)
 rename Documentation/trace/{ring-buffer-design.txt => ring-buffer-design.rst} (55%)

-- 
2.26.2



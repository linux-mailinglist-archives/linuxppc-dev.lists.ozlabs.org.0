Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9578E16231B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 10:12:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MFW32clNzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 20:12:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org; envelope-from=mchehab@bombadil.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=h/D+gqw5; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MFSp5gbCzDqXS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 20:10:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gtxCElNvSCXWFICx33F89B+eF/cQ+L9FjqnWYk2rKuI=; b=h/D+gqw5OmQpGOwUjnu/fi4+kH
 bT0h8EUVx9iIS8HNfPlJzJPk40KKUsFKNf009z67RPKZuDo+88sdToDM6wpb5+YlEa7V9G6OJvFol
 R8RQl98kwCpA4ooFYQSURvPloAPXb0/KOMWODRXhBfm93RtLstFP639AaaseMhA7rBw6OI8LTEr+J
 PXc4gR41BMqKLfnINKvS8pLmCqR3uXPMYK/daZvPEV9ynEWBeYzh1jVee6AgvUIOeV700uQ2EOPBg
 z3vWEhpNHMY0ljZor0m1CokA7zJdOq2gDEs8oPaHQ9a9htLoD+FYLhrx/s8ITQGSuGwynWgVTIITp
 vszoRJOw==;
Received: from x2f7fb70.dyn.telefonica.de ([2.247.251.112]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3ytq-00047E-Oc; Tue, 18 Feb 2020 09:10:39 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1j3j8V-000foa-PM; Mon, 17 Feb 2020 17:20:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 00/24] Manually convert  thermal,
 crypto and misc devices to ReST
Date: Mon, 17 Feb 2020 17:20:18 +0100
Message-Id: <cover.1581956285.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
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
 Catalin Marinas <catalin.marinas@arm.com>, linux-pci@vger.kernel.org,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Javi Merino <javi.merino@kernel.org>,
 Will Deacon <will@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Manually convert some files from thermal, crypto and misc-devices
to ReST format.

This patch is against linux-next 20200217 tag.

v2: 

- a small change at patch 2 to avoid uneeded whitespace changes;
- added 13 new patches at the end

Mauro Carvalho Chehab (24):
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
  docs: cpu-freq: convert index.txt to ReST
  docs: cpu-freq: convert amd-powernow.txt to ReST
  docs: cpu-freq: convert core.txt to ReST
  docs: cpu-freq: convert cpu-drivers.txt to ReST
  docs: cpu-freq: convert cpufreq-nforce2.txt to ReST
  docs: cpu-freq: convert cpufreq-stats.txt to ReST
  docs: cpu-freq: convert pcc-cpufreq.txt to ReST
  docs: powerpc: convert vcpudispatch_stats.txt to ReST
  docs: sh: convert new-machine.txt to ReST
  docs: sh: convert register-banks.txt to ReST
  docs: trace: ring-buffer-design.txt: convert to ReST format

 .../endpoint/function/binding/pci-test.rst    |  26 +
 .../endpoint/function/binding/pci-test.txt    |  19 -
 Documentation/PCI/endpoint/index.rst          |   2 +
 Documentation/arm64/index.rst                 |   1 +
 Documentation/arm64/{perf.txt => perf.rst}    |   7 +-
 .../{amd-powernow.txt => amd-powernow.rst}    |  12 +-
 Documentation/cpu-freq/{core.txt => core.rst} |  65 +-
 .../{cpu-drivers.txt => cpu-drivers.rst}      | 129 ++-
 ...pufreq-nforce2.txt => cpufreq-nforce2.rst} |  18 +-
 .../{cpufreq-stats.txt => cpufreq-stats.rst}  | 121 +--
 Documentation/cpu-freq/index.rst              |  42 +
 Documentation/cpu-freq/index.txt              |  56 --
 .../{pcc-cpufreq.txt => pcc-cpufreq.rst}      |  86 +-
 .../crypto/{api-intro.txt => api-intro.rst}   | 186 ++--
 ...symmetric-keys.txt => asymmetric-keys.rst} |  91 +-
 .../{async-tx-api.txt => async-tx-api.rst}    | 253 +++---
 ...{descore-readme.txt => descore-readme.rst} | 152 +++-
 Documentation/crypto/index.rst                |   5 +
 .../driver-api/thermal/cpu-idle-cooling.rst   |  18 +-
 Documentation/driver-api/thermal/index.rst    |   1 +
 Documentation/index.rst                       |   1 +
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
 Documentation/sh/index.rst                    |   6 +
 .../sh/{new-machine.txt => new-machine.rst}   | 193 +++--
 ...{register-banks.txt => register-banks.rst} |  12 +-
 Documentation/trace/index.rst                 |   1 +
 ...ffer-design.txt => ring-buffer-design.rst} | 802 ++++++++++--------
 37 files changed, 1603 insertions(+), 1281 deletions(-)
 create mode 100644 Documentation/PCI/endpoint/function/binding/pci-test.rst
 delete mode 100644 Documentation/PCI/endpoint/function/binding/pci-test.txt
 rename Documentation/arm64/{perf.txt => perf.rst} (95%)
 rename Documentation/cpu-freq/{amd-powernow.txt => amd-powernow.rst} (89%)
 rename Documentation/cpu-freq/{core.txt => core.rst} (69%)
 rename Documentation/cpu-freq/{cpu-drivers.txt => cpu-drivers.rst} (72%)
 rename Documentation/cpu-freq/{cpufreq-nforce2.txt => cpufreq-nforce2.rst} (55%)
 rename Documentation/cpu-freq/{cpufreq-stats.txt => cpufreq-stats.rst} (53%)
 create mode 100644 Documentation/cpu-freq/index.rst
 delete mode 100644 Documentation/cpu-freq/index.txt
 rename Documentation/cpu-freq/{pcc-cpufreq.txt => pcc-cpufreq.rst} (80%)
 rename Documentation/crypto/{api-intro.txt => api-intro.rst} (70%)
 rename Documentation/crypto/{asymmetric-keys.txt => asymmetric-keys.rst} (91%)
 rename Documentation/crypto/{async-tx-api.txt => async-tx-api.rst} (55%)
 rename Documentation/crypto/{descore-readme.txt => descore-readme.rst} (81%)
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
 rename Documentation/trace/{ring-buffer-design.txt => ring-buffer-design.rst} (55%)

-- 
2.24.1



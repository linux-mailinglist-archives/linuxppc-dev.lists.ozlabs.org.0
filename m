Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AECF1F9178
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 10:32:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ll1f2m7TzDqZQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 18:32:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=fkfERACX; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lhhm063lzDqKJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:47:17 +1000 (AEST)
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75D7A2074D;
 Mon, 15 Jun 2020 06:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592203635;
 bh=GF2Otkk8GeL8AnPZYKuZzCwG9PVKg5Z7DVVHgebQ7f0=;
 h=From:To:Cc:Subject:Date:From;
 b=fkfERACX/KYWbqRV8t7NVva9Lz8x+VqHnC1VM5w/C1EyVHebhNifzo3dQ171xOJrK
 ObPfrHwHwEruPskgn2YnHQnGtDn4XjWbifORQiGr9U4Hg5yLGrpHKAr1xeGQuJNFXe
 zUj9yUXIVup3rTuDe9+3oIQlqZcYnzoQlAjH9YrI=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
 (envelope-from <mchehab@kernel.org>)
 id 1jkith-009nlx-C3; Mon, 15 Jun 2020 08:47:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 00/29] Documentation fixes
Date: Mon, 15 Jun 2020 08:46:39 +0200
Message-Id: <cover.1592203542.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Jun 2020 18:30:38 +1000
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
Cc: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@samba.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 Mike Snitzer <snitzer@redhat.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, kasan-dev@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Alan Stern <stern@rowland.harvard.edu>,
 NXP Linux Team <linux-imx@nxp.com>, Boqun Feng <boqun.feng@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Eric Dumazet <edumazet@google.com>, keyrings@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Alasdair Kergon <agk@redhat.com>,
 Daniel Kiss <daniel.kiss@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Fabio Estevam <festevam@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 Andrea Parri <parri.andrea@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-gpio@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Tony Luck <tony.luck@intel.com>, dm-devel@redhat.com,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-renesas-soc@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, linux-pci@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>, linux-kselftest@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Haren Myneni <haren@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Jade Alglave <j.alglave@ucl.ac.uk>,
 Alexey Dobriyan <adobriyan@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Luc Maranget <luc.maranget@inria.fr>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Jan Kara <jack@suse.cz>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Daniel Lustig <dlustig@nvidia.com>,
 Chao Yu <chao@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Akira Shimahara <akira215corp@gmail.com>,
 linux-mips@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Borislav Petkov <bp@alien8.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jon,

That's a bunch of files I have to be applied on the top of v5.8-rc1 fixing
documentation warnings. I already removed some duplicated stuff.

Regards,
Mauro

Mauro Carvalho Chehab (29):
  mm: vmalloc.c: remove a kernel-doc annotation from a removed parameter
  net: dev: add a missing kernel-doc annotation
  net: netdevice.h: add a description for napi_defer_hard_irqs
  scripts/kernel-doc: parse __ETHTOOL_DECLARE_LINK_MODE_MASK
  net: pylink.h: add kernel-doc descriptions for new fields at
    phylink_config
  scripts/kernel-doc: handle function pointer prototypes
  fs: fs.h: fix a kernel-doc parameter description
  gpio: driver.h: fix kernel-doc markup
  kcsan: fix a kernel-doc warning
  rcu: fix some kernel-doc warnings
  fs: docs: f2fs.rst: fix a broken table
  dt: update a reference for reneases pcar file renamed to yaml
  dt: fix broken links due to txt->yaml renames
  dt: Fix broken references to renamed docs
  dt: fix reference to olpc,xo1.75-ec.txt
  selftests/vm/keys: fix a broken reference at protection_keys.c
  docs: hugetlbpage.rst: fix some warnings
  docs: powerpc: fix some issues at vas-api.rst
  docs: driver-model: remove a duplicated markup at driver.rst
  docs: watch_queue.rst: supress some Sphinx warnings and move to
    core-api
  docs: device-mapper: add dm-ebs.rst to an index file
  docs: it_IT: add two missing references
  docs: ABI: fix a typo when pointing to w1-generic.rst
  docs: fs: locking.rst: fix a broken table
  docs: add bus-virt-phys-mapping.txt to core-api
  docs: fix references for DMA*.txt files
  docs: dt: minor adjustments at writing-schema.rst
  docs: fs: proc.rst: fix a warning due to a merge conflict
  docs: fs: proc.rst: convert a new chapter to ReST

 .../ABI/testing/sysfs-driver-w1_therm         |   2 +-
 Documentation/PCI/pci.rst                     |   6 +-
 .../admin-guide/device-mapper/index.rst       |   1 +
 Documentation/admin-guide/mm/hugetlbpage.rst  |  25 ++-
 Documentation/block/biodoc.rst                |   2 +-
 .../bus-virt-phys-mapping.rst}                |   2 +-
 Documentation/core-api/dma-api.rst            |   6 +-
 Documentation/core-api/dma-isa-lpc.rst        |   2 +-
 Documentation/core-api/index.rst              |   2 +
 Documentation/{ => core-api}/watch_queue.rst  |  34 ++--
 .../bindings/arm/freescale/fsl,scu.txt        |   2 +-
 .../bindings/display/bridge/sii902x.txt       |   2 +-
 .../bindings/display/imx/fsl-imx-drm.txt      |   4 +-
 .../devicetree/bindings/display/imx/ldb.txt   |   4 +-
 .../display/rockchip/rockchip-drm.yaml        |   2 +-
 .../bindings/misc/olpc,xo1.75-ec.txt          |   2 +-
 .../bindings/net/mediatek-bluetooth.txt       |   2 +-
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt  |   2 +-
 .../bindings/sound/audio-graph-card.txt       |   2 +-
 .../bindings/sound/st,sti-asoc-card.txt       |   2 +-
 .../bindings/spi/qcom,spi-geni-qcom.txt       |   2 +-
 Documentation/devicetree/writing-schema.rst   |   9 +-
 .../driver-api/driver-model/driver.rst        |   2 -
 Documentation/driver-api/usb/dma.rst          |   6 +-
 Documentation/filesystems/f2fs.rst            | 150 ++++++++++++------
 Documentation/filesystems/locking.rst         |   6 +-
 Documentation/filesystems/proc.rst            |  46 +++---
 Documentation/memory-barriers.txt             |   6 +-
 Documentation/mips/ingenic-tcu.rst            |   2 +-
 Documentation/powerpc/vas-api.rst             |  23 ++-
 Documentation/security/keys/core.rst          |   2 +-
 .../it_IT/process/management-style.rst        |   2 +
 .../it_IT/process/submitting-patches.rst      |   2 +
 .../translations/ko_KR/memory-barriers.txt    |   6 +-
 MAINTAINERS                                   |   8 +-
 arch/ia64/hp/common/sba_iommu.c               |  12 +-
 arch/parisc/kernel/pci-dma.c                  |   2 +-
 arch/x86/include/asm/dma-mapping.h            |   4 +-
 arch/x86/kernel/amd_gart_64.c                 |   2 +-
 drivers/parisc/sba_iommu.c                    |  14 +-
 include/linux/dma-mapping.h                   |   2 +-
 include/linux/fs.h                            |   2 +-
 include/linux/gpio/driver.h                   |   2 +-
 include/linux/kcsan-checks.h                  |  10 +-
 include/linux/netdevice.h                     |   2 +
 include/linux/phylink.h                       |   4 +
 include/linux/rculist.h                       |   2 +-
 include/linux/watch_queue.h                   |   2 +-
 include/media/videobuf-dma-sg.h               |   2 +-
 init/Kconfig                                  |   2 +-
 kernel/dma/debug.c                            |   2 +-
 kernel/watch_queue.c                          |   2 +-
 mm/vmalloc.c                                  |   1 -
 net/core/dev.c                                |   1 +
 scripts/kernel-doc                            |   7 +
 tools/testing/selftests/vm/protection_keys.c  |   2 +-
 56 files changed, 282 insertions(+), 175 deletions(-)
 rename Documentation/{bus-virt-phys-mapping.txt => core-api/bus-virt-phys-mapping.rst} (99%)
 rename Documentation/{ => core-api}/watch_queue.rst (94%)

-- 
2.26.2



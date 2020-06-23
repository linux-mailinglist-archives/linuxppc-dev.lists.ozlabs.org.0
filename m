Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32931204B26
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 09:31:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rdJK1JG1zDqQb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 17:31:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=KWgMqyKu; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rcpQ40yDzDqJB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 17:09:18 +1000 (AEST)
Received: from mail.kernel.org (unknown [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7EB142083B;
 Tue, 23 Jun 2020 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592896156;
 bh=DtczuADBn02KNsKn1zVUGW/fHxjVGsLwEaVwTv2OO34=;
 h=From:To:Cc:Subject:Date:From;
 b=KWgMqyKu9lNxDusflmUU8a73weNV3oAx3KrcZnO4Y/lhfevMn1bMNCpUhSxBeEyyz
 pcn/hN/y/PImTIDe4xsgCUs6ENSQ7w680agTfK7sz218NqZd4wR1zbXl+csUuAuOTY
 COVy/oxbMdnsaSGsHyNVCdTR4ngUEXje5YAadfc4=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
 (envelope-from <mchehab@kernel.org>)
 id 1jnd3Q-003qib-Tq; Tue, 23 Jun 2020 09:09:12 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 00/15] Documentation fixes
Date: Tue, 23 Jun 2020 09:08:56 +0200
Message-Id: <cover.1592895969.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Jun 2020 17:29:26 +1000
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
Cc: linux-ia64@vger.kernel.org,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ram Pai <linuxram@us.ibm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Jan Kara <jack@suse.cz>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Will Deacon <will@kernel.org>, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Haren Myneni <haren@linux.ibm.com>, Russell King <linux@armlinux.org.uk>,
 kasan-dev@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-media@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Alexey Gladkov <gladkov.alexey@gmail.com>,
 Akira Shimahara <akira215corp@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jon,

As requested, this is a rebase of a previous series posted on Jan, 15.

Since then, several patches got merged via other trees or became
obsolete. There were also 2 patches before that fits better at the
ReST conversion patchset. So, I'll be sending it on another patch
series together with the remaining ReST conversions.

I also added reviews/acks received.

So, the series reduced from 29 to 15 patches.

Let's hope b4 would be able to properly handle this one.

Regards,
Mauro

Mauro Carvalho Chehab (15):
  mm: vmalloc.c: remove a kernel-doc annotation from a removed parameter
  net: dev: add a missing kernel-doc annotation
  net: netdevice.h: add a description for napi_defer_hard_irqs
  scripts/kernel-doc: parse __ETHTOOL_DECLARE_LINK_MODE_MASK
  net: pylink.h: add kernel-doc descriptions for new fields at
    phylink_config
  scripts/kernel-doc: handle function pointer prototypes
  fs: fs.h: fix a kernel-doc parameter description
  kcsan: fix a kernel-doc warning
  selftests/vm/keys: fix a broken reference at protection_keys.c
  docs: hugetlbpage.rst: fix some warnings
  docs: powerpc: fix some issues at vas-api.rst
  docs: driver-model: remove a duplicated markup at driver.rst
  docs: ABI: fix a typo when pointing to w1-generic.rst
  docs: fix references for DMA*.txt files
  docs: fs: proc.rst: convert a new chapter to ReST

 .../ABI/testing/sysfs-driver-w1_therm         |  2 +-
 Documentation/PCI/pci.rst                     |  6 +--
 Documentation/admin-guide/mm/hugetlbpage.rst  | 23 +++++++---
 Documentation/block/biodoc.rst                |  2 +-
 Documentation/bus-virt-phys-mapping.txt       |  2 +-
 Documentation/core-api/dma-api.rst            |  6 +--
 Documentation/core-api/dma-isa-lpc.rst        |  2 +-
 .../driver-api/driver-model/driver.rst        |  2 -
 Documentation/driver-api/usb/dma.rst          |  6 +--
 Documentation/filesystems/proc.rst            | 44 +++++++++----------
 Documentation/powerpc/vas-api.rst             | 23 +++++++---
 .../translations/ko_KR/memory-barriers.txt    |  6 +--
 arch/ia64/hp/common/sba_iommu.c               | 12 ++---
 arch/parisc/kernel/pci-dma.c                  |  2 +-
 arch/x86/include/asm/dma-mapping.h            |  4 +-
 arch/x86/kernel/amd_gart_64.c                 |  2 +-
 drivers/parisc/sba_iommu.c                    | 14 +++---
 include/linux/dma-mapping.h                   |  2 +-
 include/linux/fs.h                            |  2 +-
 include/linux/kcsan-checks.h                  | 10 +++--
 include/linux/netdevice.h                     |  2 +
 include/linux/phylink.h                       |  4 ++
 include/media/videobuf-dma-sg.h               |  2 +-
 kernel/dma/debug.c                            |  2 +-
 mm/vmalloc.c                                  |  1 -
 net/core/dev.c                                |  1 +
 scripts/kernel-doc                            |  7 +++
 tools/testing/selftests/vm/protection_keys.c  |  2 +-
 28 files changed, 114 insertions(+), 79 deletions(-)

-- 
2.26.2



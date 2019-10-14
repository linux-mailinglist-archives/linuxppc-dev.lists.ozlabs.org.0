Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F069AD6980
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 20:33:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sRz82cH9zDqv1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 05:33:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de;
 envelope-from=nsaenzjulienne@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sRwv1BYwzDqs1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 05:31:51 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5637BB6A;
 Mon, 14 Oct 2019 18:31:46 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, iommu@lists.linux-foundation.org
Subject: [PATCH RFC 0/5] ARM: Raspberry Pi 4 DMA support
Date: Mon, 14 Oct 2019 20:31:02 +0200
Message-Id: <20191014183108.24804-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
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
Cc: linux-s390@vger.kernel.org, f.fainelli@gmail.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, mbrugger@suse.com,
 wahrenst@gmx.net, linuxppc-dev@lists.ozlabs.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,
the Raspberry Pi 4 offers up to 4GB of memory, of which only the first
is DMA capable device wide. This forces us to use of bounce buffers,
which are currently not very well supported by ARM's custom DMA ops.
Among other things the current mechanism (see dmabounce.c) isn't
suitable for high memory. Instead of fixing it, this series introduces a
way of selecting dma-direct as the default DMA ops provider which allows
for the Raspberry Pi to make use of swiotlb.

Regards,
Nicolas

---

Nicolas Saenz Julienne (5):
  dma/direct: turn ARCH_ZONE_DMA_BITS into a variable
  ARM: introduce arm_dma_direct
  ARM: let machines select dma-direct over arch's DMA implementation
  dma/direct: check for overflows in ARM's dma_capable()
  ARM: bcm2711: use dma-direct

 arch/arm/include/asm/dma-direct.h  |  6 ++++++
 arch/arm/include/asm/dma-mapping.h |  3 ++-
 arch/arm/include/asm/dma.h         |  2 ++
 arch/arm/include/asm/mach/arch.h   |  1 +
 arch/arm/mach-bcm/Kconfig          |  1 +
 arch/arm/mach-bcm/bcm2711.c        |  1 +
 arch/arm/mm/dma-mapping.c          | 10 ++--------
 arch/arm/mm/init.c                 | 21 ++++++++++++++++++++-
 arch/arm64/include/asm/page.h      |  2 --
 arch/arm64/mm/init.c               |  9 +++++++--
 arch/powerpc/include/asm/page.h    |  9 ---------
 arch/powerpc/mm/mem.c              | 20 +++++++++++++++-----
 arch/s390/include/asm/page.h       |  2 --
 arch/s390/mm/init.c                |  1 +
 include/linux/dma-direct.h         |  2 ++
 kernel/dma/direct.c                | 13 ++++++-------
 16 files changed, 66 insertions(+), 37 deletions(-)

-- 
2.23.0


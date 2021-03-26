Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F420134A17F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 07:13:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6BWB004sz3c4J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 17:13:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2+gf1yHr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+31783f3a8021f30233dc+6424+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=2+gf1yHr; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6BVk083rz30hc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 17:13:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=vZFXjwDFBlt15FbbxH8vQOkVklkvteOsEp/Orr07Xyg=; b=2+gf1yHr8gEbFj+N4OJDIkdOzH
 1hQ95DPpzv3ZV+HEoKdNqXg1LoZ/CZVyfn4kmwrMnyoF92NltPaIDzQemqvl47ydc38iAx5Xc9duE
 SvWdyKp6ZrZRqD35Q0w0eC5i6W5jQZqmhSJlzxgBRvt1Rcmu1cPsyAvstO6ROjCwoO8am6QiSFLfu
 Cvgk+lZwd2qb8ecjiKy88HEl0TgZ2L3ZsqAH1s0jTYknSqwuCsSXU98JpAKH/rJyVYShCPQ0tPBaj
 0fr1QXjR0kY18M1p/JiD2YRtpSybZ04Y/KL2rwTFNYKARMEJBrr0cpVgB+98QT2re7IbJ76v2XQEt
 ZGzOfSzQ==;
Received: from [2001:4bb8:191:f692:97ff:1e47:aee2:c7e5] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lPfib-005AmU-19; Fri, 26 Mar 2021 06:13:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: remove the nvlink2 pci_vfio subdriver v2
Date: Fri, 26 Mar 2021 07:13:09 +0100
Message-Id: <20210326061311.1497642-1-hch@lst.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

the nvlink2 vfio subdriver is a weird beast.  It supports a hardware
feature without any open source component - what would normally be
the normal open source userspace that we require for kernel drivers,
although in this particular case user space could of course be a
kernel driver in a VM.  It also happens to be a complete mess that
does not properly bind to PCI IDs, is hacked into the vfio_pci driver
and also pulles in over 1000 lines of code always build into powerpc
kernels that have Power NV support enabled.  Because of all these
issues and the lack of breaking userspace when it is removed I think
the best idea is to simply kill.

Changes since v1:
 - document the removed subtypes as reserved
 - add the ACK from Greg

Diffstat:
 arch/powerpc/platforms/powernv/npu-dma.c     |  705 ---------------------------
 b/arch/powerpc/include/asm/opal.h            |    3 
 b/arch/powerpc/include/asm/pci-bridge.h      |    1 
 b/arch/powerpc/include/asm/pci.h             |    7 
 b/arch/powerpc/platforms/powernv/Makefile    |    2 
 b/arch/powerpc/platforms/powernv/opal-call.c |    2 
 b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
 b/arch/powerpc/platforms/powernv/pci.c       |   11 
 b/arch/powerpc/platforms/powernv/pci.h       |   17 
 b/arch/powerpc/platforms/pseries/pci.c       |   23 
 b/drivers/vfio/pci/Kconfig                   |    6 
 b/drivers/vfio/pci/Makefile                  |    1 
 b/drivers/vfio/pci/vfio_pci.c                |   18 
 b/drivers/vfio/pci/vfio_pci_private.h        |   14 
 b/include/uapi/linux/vfio.h                  |   38 -
 drivers/vfio/pci/vfio_pci_nvlink2.c          |  490 ------------------
 16 files changed, 12 insertions(+), 1511 deletions(-)

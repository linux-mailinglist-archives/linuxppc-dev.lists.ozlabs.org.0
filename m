Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3904295D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 19:37:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSmFS41FBz2yXM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 04:37:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UQY5fuae;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UQY5fuae; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSmDp5tMdz2xWx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 04:36:25 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so501145pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 10:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJzzZJUwpzeKQJlZIVOTzoqmYp8CWlcv3F3YYYU8MOg=;
 b=UQY5fuaeniwoPT/xwHQ3Ao7FeWJFVAhorTY5szyrGdLOGVxLcMbAyI4cuBXif1/HZV
 /PdEKOkP4XWO0c1FKucvGnQLn0BCRsberthTXZxRsm1u3v89wk2oZ3zOnqs9s4ya43NQ
 XWiezH28+9l/P3xR5zTpFmo1T95D98vsV/3nNl6990Qagg8v+WrADDXJx/HGiSOFn4hX
 5XoI5q9TiV72vLFs2lDVIeFnusAPqBeanD8oUQ+lBrDxUns/MCcRe2AdoX2SLgHAI4o/
 QqyEPf7f9Stid6ShIEinzes0Ri61q601MnMDe/BaR+6QaqRYYe4anDzLKd7yAt8ZQLMR
 cfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJzzZJUwpzeKQJlZIVOTzoqmYp8CWlcv3F3YYYU8MOg=;
 b=btrmRYtPkdDhFA4GOioEhArixXbdAX3kHj0UYT9Y9ko/cDjB624NWVi58p+scFihwo
 5BjGqsUhLpUBWaPCEBrdEyjbShdEfhrPehqDTuMpyGelRsiDvvtZ+VzRfbzd6XMe3H46
 zL1fsJb+3n9HO493x8ri3m0mVti9o1oNrxR1No6tHHO4gos8tHxM7SNapvXLJxG0NXtp
 9EJhwCQy4hhm31HTnf6JhrfLPvAPjr73YMFH6mQcG3SqtnOATCXoImDBwkjLXKy6ioAQ
 9VF6pQNZrR1DAFBY9XtNHulF4vKwXoD9wFhFnQN7QaUX/vsCg/0mT7QQMTuDXb0BqZ3+
 NkxQ==
X-Gm-Message-State: AOAM5323XCdksOP7GLsWFQr8axOBUTeReHYPEGVF4drNzfIw2hy5Bd8R
 JSHukcFdvDfrKjlS1OhmBEs=
X-Google-Smtp-Source: ABdhPJxbCg5k83AJkkf7TpRQJrReqilB+qCC+1rDSbSN1M5Qa0bgpA3LMBJFY9nGSbN5K03Q8ex3zQ==
X-Received: by 2002:a17:90b:1804:: with SMTP id
 lw4mr354756pjb.174.1633973781406; 
 Mon, 11 Oct 2021 10:36:21 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 z8sm8859954pgc.53.2021.10.11.10.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:36:20 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 00/22] PCI: Unify PCI error response checking
Date: Mon, 11 Oct 2021 23:05:47 +0530
Message-Id: <cover.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-mediatek@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the 
CPU read, so most hardware fabricates ~0 data.

This patch series adds PCI_ERROR_RESPONSE definition and other helper
defintion SET_PCI_ERROR_RESPONSE and RESPONSE_IS_PCI_ERROR and uses it
where appropriate to make these checks consistent and easier to find.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Patch 1:
  - Adds the PCI_ERROR_RESPONSE and other related defintions
  - All other patches are dependent on this patch. This patch needs to
    be applied first, before the others

Patch 2 - 13
  - Uses SET_PCI_ERROR_RESPONSE() when device is not found

Patch 14 - 19
  - Uses RESPONSE_IS_PCI_ERROR() to check the reads from hardware

Patch 20 - 22
  - Edits the comments to include PCI_ERROR_RESPONSE alsong with
    0xFFFFFFFF, so that it becomes easier to grep for faulty hardware
    reads.

Thanks,
Naveen

Naveen Naidu (22):
  [PATCH 1/22] PCI: Add PCI_ERROR_RESPONSE and it's related defintions
  [PATCH 2/22] PCI: Unify PCI error response checking
  [PATCH 3/22] PCI: thunder: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 4/22] PCI: iproc: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 5/22] PCI: mediatek: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 6/22] PCI: exynos: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 7/22] PCI: histb: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 8/22] PCI: kirin: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 9/22] PCI: aardvark: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 10/22] PCI: mvebu: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 11/22] PCI: altera: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 12/22] PCI: rcar: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 13/22] PCI: rockchip: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 14/22] PCI/ERR: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 15/22] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 16/22] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 17/22] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 18/22] PCI/PME: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 19/22] PCI: cpqphp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 20/22] PCI: keystone: Use PCI_ERROR_RESPONSE to specify hardware error
  [PATCH 21/22] PCI: hv: Use PCI_ERROR_RESPONSE to specify hardware read error
  [PATCH 22/22] PCI: xgene: Use PCI_ERROR_RESPONSE to specify hardware error

 drivers/pci/access.c                        | 22 ++++++++++-----------
 drivers/pci/controller/dwc/pci-exynos.c     |  2 +-
 drivers/pci/controller/dwc/pci-keystone.c   |  4 ++--
 drivers/pci/controller/dwc/pcie-histb.c     |  2 +-
 drivers/pci/controller/dwc/pcie-kirin.c     |  2 +-
 drivers/pci/controller/pci-aardvark.c       |  8 ++++----
 drivers/pci/controller/pci-hyperv.c         |  2 +-
 drivers/pci/controller/pci-mvebu.c          |  4 ++--
 drivers/pci/controller/pci-thunder-ecam.c   | 20 +++++++++----------
 drivers/pci/controller/pci-thunder-pem.c    |  2 +-
 drivers/pci/controller/pci-xgene.c          |  8 ++++----
 drivers/pci/controller/pcie-altera.c        |  2 +-
 drivers/pci/controller/pcie-iproc.c         |  2 +-
 drivers/pci/controller/pcie-mediatek.c      |  4 ++--
 drivers/pci/controller/pcie-rcar-host.c     |  2 +-
 drivers/pci/controller/pcie-rockchip-host.c |  2 +-
 drivers/pci/controller/vmd.c                |  2 +-
 drivers/pci/hotplug/cpqphp_ctrl.c           |  4 ++--
 drivers/pci/hotplug/pciehp_hpc.c            | 10 +++++-----
 drivers/pci/pci.c                           | 10 +++++-----
 drivers/pci/pcie/dpc.c                      |  4 ++--
 drivers/pci/pcie/pme.c                      |  4 ++--
 drivers/pci/probe.c                         | 10 +++++-----
 include/linux/pci.h                         |  9 +++++++++
 24 files changed, 75 insertions(+), 66 deletions(-)

-- 
2.25.1


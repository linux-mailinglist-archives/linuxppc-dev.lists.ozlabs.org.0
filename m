Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E35034BFE2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 01:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t0D17h5z302Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 10:56:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uXWQRahp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uXWQRahp; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7szp2Z42z2yRB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:56:03 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id z10so10906452qkz.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NUiuzRmCI317NNPwOQd3D4rWQdmGZHrpIjp/qwsCZIQ=;
 b=uXWQRahp3gbzRLIyyNL0YRXhVCZtEuZiHzn/PIsuzG8877k5bJgwYQURdeOdvHz4vf
 UtOWDRp8hFHb4tkPHczneiCk1Dp3BAPe8nPUJPWphJIe8eEQsUMHA9EhMcfHmCfBv63h
 Cc6qgUFx9EvyH/PxY7kVGPUt16C7C6GHqSlgWmk/W3Nlz01gtqMgxdPyzK93UMSj/j8K
 RPiLrdcZHQGN/UMvJlD5XTJKRT5dQdkBl2Ur7I1OR5KPUc6a7GsZQevDW3l5YxrmCI0z
 r1yTXrRR5jXQtJQZlSGfd5Ol7iXIub51CMMgWplOjMM8chkK0lsTJMIbROp7cwk4m0P1
 +qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NUiuzRmCI317NNPwOQd3D4rWQdmGZHrpIjp/qwsCZIQ=;
 b=JTGqMPVOXFxtxqSJCybk+qFsTu2dEZ2cm4p/qXE13EU9yNB1c/8G1h9+5oUPzRaE+v
 0C7xu/G+RgoDo/C8uAIjHnRBsq516KoA66lthrEyYmjv73PmZGJvclycmTcOVoH5zDNp
 mmnuJjGh5Vq53NJZkjkgDewL+JnGAfir83PRmQb9xhLqo6coG+tod9OpRWbZ5J4oEMHE
 o5XwD6bxvC4QVBwR6odFE0C7NfFU8H9NqUjAIhfCQBqDmQ1WeUJdQ2BL+k0ats4IF7hG
 fQP+Vx6Z/NqsH3uWGZF68Sa+s4kOsZHTrTziD0L7GNoXrjknZoP/pdKO6dul3PU3m3JE
 cvxQ==
X-Gm-Message-State: AOAM533KNVjvDQGTIvz0RH3k96IQ5RlbqZwcH0rwjPmd4wEqjLLeLyDU
 0jrTuNvr01hkvQsHMZPHlG8=
X-Google-Smtp-Source: ABdhPJyKaE6xu37zVH3z/CjmV3TkU5t17RBcANW7BpVJXHO+pgWwNEwtWueIieluVNk3R4I3c1/mYg==
X-Received: by 2002:a05:620a:cf4:: with SMTP id
 c20mr22554064qkj.134.1616975757870; 
 Sun, 28 Mar 2021 16:55:57 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:55:57 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 00/30] DMA: Mundane typo fixes
Date: Mon, 29 Mar 2021 05:22:56 +0530
Message-Id: <cover.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series fixes some trivial and rudimentary spellings in the COMMENT
sections.

Bhaskar Chowdhury (30):
  acpi-dma.c: Fix couple of typos
  altera-msgdma.c: Couple of typos fixed
  amba-pl08x.c: Fixed couple of typos
  bcm-sba-raid.c: Few typos fixed
  bcm2835-dma.c: Fix a typo
  idma64.c: Fix couple of typos
  iop-adma.c: Few typos fixed
  mv_xor.c: Fix a typo
  mv_xor.h: Fixed a typo
  mv_xor_v2.c: Fix a typo
  nbpfaxi.c: Fixed a typo
  of-dma.c: Fixed a typo
  s3c24xx-dma.c: Fix a typo
  Revert "s3c24xx-dma.c: Fix a typo"
  s3c24xx-dma.c: Few typos fixed
  st_fdma.h: Fix couple of typos
  ste_dma40_ll.h: Fix a typo
  tegra20-apb-dma.c: Fixed a typo
  xgene-dma.c: Few spello fixes
  at_hdmac.c: Quite a few spello fixes
  owl-dma.c: Fix a typo
  at_hdmac_regs.h: Couple of typo fixes
  dma-jz4780.c: Fix a typo
  Kconfig: Change Synopsys to Synopsis
  ste_dma40.c: Few spello fixes
  dw-axi-dmac-platform.c: Few typos fixed
  dpaa2-qdma.c: Fix a typo
  usb-dmac.c: Fix a typo
  edma.c: Fix a typo
  xilinx_dma.c: Fix a typo

 drivers/dma/Kconfig                            |  8 ++++----
 drivers/dma/acpi-dma.c                         |  4 ++--
 drivers/dma/altera-msgdma.c                    |  4 ++--
 drivers/dma/amba-pl08x.c                       |  4 ++--
 drivers/dma/at_hdmac.c                         | 14 +++++++-------
 drivers/dma/at_hdmac_regs.h                    |  4 ++--
 drivers/dma/bcm-sba-raid.c                     |  8 ++++----
 drivers/dma/bcm2835-dma.c                      |  2 +-
 drivers/dma/dma-jz4780.c                       |  2 +-
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  8 ++++----
 drivers/dma/idma64.c                           |  4 ++--
 drivers/dma/iop-adma.c                         |  6 +++---
 drivers/dma/mv_xor.c                           |  2 +-
 drivers/dma/mv_xor.h                           |  2 +-
 drivers/dma/mv_xor_v2.c                        |  2 +-
 drivers/dma/nbpfaxi.c                          |  2 +-
 drivers/dma/of-dma.c                           |  2 +-
 drivers/dma/owl-dma.c                          |  2 +-
 drivers/dma/s3c24xx-dma.c                      |  6 +++---
 drivers/dma/sh/shdmac.c                        |  2 +-
 drivers/dma/sh/usb-dmac.c                      |  2 +-
 drivers/dma/st_fdma.h                          |  4 ++--
 drivers/dma/ste_dma40.c                        | 10 +++++-----
 drivers/dma/ste_dma40_ll.h                     |  2 +-
 drivers/dma/tegra20-apb-dma.c                  |  2 +-
 drivers/dma/ti/edma.c                          |  2 +-
 drivers/dma/xgene-dma.c                        |  6 +++---
 drivers/dma/xilinx/xilinx_dma.c                |  2 +-
 28 files changed, 59 insertions(+), 59 deletions(-)

--
2.26.3


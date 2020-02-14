Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA515F9ED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 23:45:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K7ks0kpVzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 09:45:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K7hH19MLzDqkS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 09:43:26 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id h9so10652708otj.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 14:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :status:lines:content-transfer-encoding;
 bh=rq3LKz6Qv21BPshBMV9jA64F47XMwDC8GmDfOx2SUwI=;
 b=Refj0nPkYXJ8qJfXqEJZXRjDE+rBeivbv/buyqQvoohaTTpO2M8r/YV/pvwH+/Yha5
 D7oCc1WV/ks5p8RZcSAUZ4xbbX82RTDzVMxtiTzi7Gft+uzYTieG9jp+p7ufn9/v02cL
 w2vZH7pR5xJtXL4DgAjXj1X2QFDsnsGZ4ZJDnjKjde4XkAAJKtYlnE6Q79MbL5qx2Loy
 g9p2tuFzr995RdkULmfocifqUC6ma5TpNNu3gf4LbJROkCwT5O6m5jQY7Keoljs3Lz0x
 8/YI63DVHUPnGUI2nKLzmzz5Z8oRB6HqosC5R4fSjoyAGEr25/sqsrzbqnJo35V9dnRW
 acrQ==
X-Gm-Message-State: APjAAAV5Oeigj77ds5W5Mzqvjuw2MwjtMRQTYWaDaHfldEsPwljK9IdD
 n1LTjUd5nt6szlf50doNzw==
X-Google-Smtp-Source: APXvYqyjkrFek0FKSm2YZT2e5VwCtggk8npcE1g0DS4UcjouYnZL9AMLXRsMCqVmboLEhbs9res/3A==
X-Received: by 2002:a9d:6418:: with SMTP id h24mr4067374otl.172.1581720204183; 
 Fri, 14 Feb 2020 14:43:24 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id m69sm2453167otc.78.2020.02.14.14.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 14:43:23 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 0/7] of: Support multiple dma-ranges entries
Date: Fri, 14 Feb 2020 16:43:15 -0600
Message-Id: <20200214224322.20030-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Status: RO
Lines: 28
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
Cc: Michal Simek <monstr@monstr.eu>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DT DMA offset and mask/size setup for the DMA API only parses the 
first dma-ranges entry. This is not sufficient for some platforms. As we 
already support multiple ranges entries for the PCI specific parsing 
functions, let's refactor those to be general enough to handle both PCI 
and normal buses. Then we can have one instance of range parsing code by 
using it in of_dma_get_range().

Rob

Rob Herring (7):
  of/address: Move range parser code out of CONFIG_PCI
  microblaze: Drop using struct of_pci_range.pci_space field
  powerpc: Drop using struct of_pci_range.pci_space field
  of: Drop struct of_pci_range.pci_space field
  of/address: Rework of_pci_range parsing for non-PCI buses
  of/address: use range parser for of_dma_get_range
  of/address: Support multiple 'dma-ranges' entries

 arch/microblaze/pci/pci-common.c |   7 +-
 arch/powerpc/kernel/pci-common.c |   2 +-
 drivers/of/address.c             | 273 +++++++++++++++++--------------
 include/linux/of_address.h       |  13 +-
 4 files changed, 157 insertions(+), 138 deletions(-)


base-commit: bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
-- 
2.20.1


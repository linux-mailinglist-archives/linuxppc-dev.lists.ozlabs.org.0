Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC42155A2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 12:33:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0hkB56kyzDqMM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 20:33:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=refactormyself@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Un1Dczxg; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0hhF09gZzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 20:31:56 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id a6so40239242wrm.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jul 2020 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=725GRWR92GVu/uY+skCayJkzfF6wpN8gi25u6sbBLsE=;
 b=Un1DczxgaDXNy/iNKYqrzFqkEwbciUm9hIX6DAgKniHCGQpPx0i0K3bnrDlhDtMKpo
 q0wOCMtfekkjl30VXCGPsS+hG9TelNr4M22raZFCY1YiPTUCHKlv5LWhVJIM+61RAQ6C
 bDrbnuRbETSBP1g8ensB++LtXywT+9Xs/XqeqsRGcj7TONjuhlccD2V+j91UWsYqsQR0
 t8AEyBoLZqyZXcPNvyTwCbOJUrosIV2Lrrli2/uwd0o/Lszt5TsMCB32M+9pBeN/LFCg
 BB7qSYGi11M+hdSekGJ/YUGiTqShZAvFXAqHx7/fyWecZI12olWLwYnfCowTeNzfodkx
 70Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=725GRWR92GVu/uY+skCayJkzfF6wpN8gi25u6sbBLsE=;
 b=SUzWOPfBUNZ+9KgGLApYY7ivn4jz1N65K0AhTmKNLjymTK9s0IGvNwxiZXTvx/hO1Q
 3pLF/mLEr6L62abeJRFKpG7B9UNZFUlMc0FXohbFhmlvWo2aj9jDlb6Z5D+BsYIiPeA0
 AJt6SdeyDPVn/vo1JzyNxAL8bKjz1J9Us+hCn2Ap0quhegoYYBfHycJG7DMADANsL2a8
 4jsxRfIP13gONQi2A3lehH5QhBrvIGAXIQKY5IlU78WCZH36jVvsOkKgiLnR0XzM5EOE
 wac2r2D6jQCDcHTdxfDoxGt64vtxmYZG7FrscZg5AcLd/qRWYgmXHTu+8G9DwPBMIL61
 /FMg==
X-Gm-Message-State: AOAM531bh4zvjT1v2YuSlhz6Lt1NF0PcwpJXM/KpEhXUb1llBKxlwQ0k
 b8ScHokksE3SbeCd3/+Xm8c=
X-Google-Smtp-Source: ABdhPJwildPDtdFFvGu+6UipH246vuUUOhwlfa1qFX6Wd0FaSEnPrsMkjz6fL41zF5RaRLD9WT6dQg==
X-Received: by 2002:adf:ee4d:: with SMTP id w13mr19054078wro.245.1594031509940; 
 Mon, 06 Jul 2020 03:31:49 -0700 (PDT)
Received: from net.saheed (51B7C2DF.dsl.pool.telekom.hu. [81.183.194.223])
 by smtp.gmail.com with ESMTPSA id 22sm24216859wmb.11.2020.07.06.03.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 03:31:49 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Subject: [PATCH 0/11 RFC] PCI: Remove "*val = 0" from pcie_capability_read_*()
Date: Mon,  6 Jul 2020 11:31:10 +0200
Message-Id: <20200706093121.9731-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
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
Cc: , Mike Marciniszyn <mike.marciniszyn@intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	"Greg Kroah-Hartman linux-rdma @ vger . kernel . org" <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	Sam Bobroff <sbobroff@linux.ibm.com>,
	Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
	Dennis Dalessandro <dennis.dalessandro@intel.com>,
	skhan@linuxfoundation.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-kernel@vger.kernel.org, wunner.de@lists.ozlabs.org,
	linux-acpi@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
	linux-pci@vger.kernel.org, bjorn@helgaas.com,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-rdma@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

*** BLURB HERE ***

Bolarinwa Olayemi Saheed (9):
  IB/hfi1: Confirm that pcie_capability_read_dword() is successful
  misc: rtsx: Confirm that pcie_capability_read_word() is successful
  PCI/AER: Use error return value from pcie_capability_read_*()
  PCI/ASPM: Use error return value from pcie_capability_read_*()
  PCI: pciehp: Fix wrong failure check on pcie_capability_read_*()
  PCI: pciehp: Prevent wrong failure check on pcie_capability_read_*()
  PCI: pciehp: Make "Power On" the default in pciehp_get_power_status()
  PCI/ACPI: Prevent wrong failure check on pcie_capability_read_*()
  PCI: Prevent wrong failure check on pcie_capability_read_*()
  PCI: Remove "*val = 0" fom pcie_capability_read_*()

 
 drivers/infiniband/hw/hfi1/aspm.c | 7 ++++---
 drivers/misc/cardreader/rts5227.c | 5 +++--
 drivers/misc/cardreader/rts5249.c | 5 +++--
 drivers/misc/cardreader/rts5260.c | 5 +++--
 drivers/misc/cardreader/rts5261.c | 5 +++--
 drivers/pci/pcie/aer.c  |  5 +++--
 drivers/pci/pcie/aspm.c | 33 +++++++++++++++++----------------
 drivers/pci/hotplug/pciehp_hpc.c | 47 ++++++++++++++++----------------
 drivers/pci/pci-acpi.c           | 10 ++++---
 drivers/pci/probe.c              | 29 ++++++++++++--------
 drivers/pci/access.c | 14 --------------
 11 files changed, 82 insertions(+), 83 deletions(-)

-- 
2.18.2



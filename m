Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2482D214CCB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jul 2020 15:39:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B08tS6fzzzDqRc
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jul 2020 23:38:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BM8c7GPc; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B08qQ42qWzDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jul 2020 23:36:17 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id j18so36371500wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N1ClIyt3BvwxUJzyMG+CpDYXUXYxKceAdq5APlxmJJk=;
 b=BM8c7GPc1hon/3haCnsvSydzwjg9vYRFPH3yOnBbgjHhzGjZi+Ec/QTt39kDo/kUsp
 otLRuTSKGz5vyeDEIh7t0tqeyDhJ0qLzsf13igU7Tj5krwfeba2N6nw9PllHwWhZHW09
 SD/B7Qgn5qj/DH5BMoP3TwliabTUjjcqJLmPiUjUnMdL/ikpDfUD11jzGewT3wJGvPMb
 Itt9KNPqbpYchBFvbxypikB6ev3SY0AToqB9ofMVc+c4SjpOzF1Nq+WIER4PVumsWJLQ
 aypqkyF0l8UzTy2dmIvJAN/9rM5Vz6p/H6dQekcobFVlwMaYt+XKmYnoahrmpLh6GTuH
 k87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N1ClIyt3BvwxUJzyMG+CpDYXUXYxKceAdq5APlxmJJk=;
 b=s3GnWoO1Lv8Ol2mpWIlS61CW1586uNe1/JaTu9jjW/6bCG2YmLc3BVZVQJfe/sdZOg
 6k61BADWlgIDX6/xv67gTozdAACM8R24tSJYABuar9Lhcu3cpFuiLCcg0WFDZQn11+OP
 U3G3qEl6Ykx13uBV1jnp112EtzrY2+1xidJMfDSwtl+errqgTg7R540lIwgzM4RVLoSA
 nIyAvT+yg9TAqxuETTYCD6e2DsyixZr/2KiTnE6vxLp8RvaKGTvL6DKA5samrHzAj9zJ
 UGm4AVyUbp9ztwBR0cTco/rd6b15vsx9b86mDPq4Vsidf1D8I3p56kzF0VPKrcOK1G0V
 6uqg==
X-Gm-Message-State: AOAM5306z6+EJLXtY8YM2FT2fOZFQhats4Xk4g5z+ersm9V78RgRhI+O
 SkCQSiiKk0vBodyclKtEaJwGfKcC0KM=
X-Google-Smtp-Source: ABdhPJwYshGnGK0tsWVV6FfpZy0Na9INvpizu1VwBnXB7MCSI/4jRtU5XUe+F/7NwMD+jnOI/yMc0g==
X-Received: by 2002:a1c:bc8a:: with SMTP id m132mr43112216wmf.1.1593956170356; 
 Sun, 05 Jul 2020 06:36:10 -0700 (PDT)
Received: from localhost.ibm.com ([202.168.17.49])
 by smtp.gmail.com with ESMTPSA id m9sm19457903wml.45.2020.07.05.06.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 06:36:09 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/powernv: Make pnv_pci_sriov_enable() and friends
 static
Date: Sun,  5 Jul 2020 23:35:56 +1000
Message-Id: <20200705133557.443607-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kernel test robot noticed these are non-static which causes Clang to
print some warnings. These are called via ppc_md function pointers so
there's no need for them to be non-static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 73a63efcf855..c2d46d28114b 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1490,7 +1490,7 @@ static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
 	}
 }
 
-void pnv_pci_sriov_disable(struct pci_dev *pdev)
+static void pnv_pci_sriov_disable(struct pci_dev *pdev)
 {
 	struct pci_bus        *bus;
 	struct pci_controller *hose;
@@ -1600,7 +1600,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 	}
 }
 
-int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
+static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
 	struct pci_bus        *bus;
 	struct pci_controller *hose;
@@ -1715,7 +1715,7 @@ int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 	return ret;
 }
 
-int pnv_pcibios_sriov_disable(struct pci_dev *pdev)
+static int pnv_pcibios_sriov_disable(struct pci_dev *pdev)
 {
 	pnv_pci_sriov_disable(pdev);
 
@@ -1724,7 +1724,7 @@ int pnv_pcibios_sriov_disable(struct pci_dev *pdev)
 	return 0;
 }
 
-int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
+static int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
 	/* Allocate PCI data */
 	add_sriov_vf_pdns(pdev);
-- 
2.26.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B298B421A29
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:35:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNbBd4ctNz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:35:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Iw7vxd3n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Iw7vxd3n; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNT6527QSz2xbB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 05:00:44 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id j4so459104plx.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 11:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F/kZ/G80MyWYhdKVpqBk0C55lIN/V+L/Ury6/lN0H48=;
 b=Iw7vxd3nbj0C1OKCrJ5xQgex0PG/Kc/CV2C7tPUsGeWawiJ+Az940Wzu2Uy5AmVN11
 PYgVr1uisn3pGX1qacas8hTyKYIt8VOmZwZVG1gre/RBFwd13kU/cyjkN896O6+kWsOz
 aqNCYiEUv+Mql1+gA+oauHx8b4gKZ+g+6JhBQ6JHyELV/qC0+trpinxN3/Si0Y/WpNZt
 2otRHBRlasP0qjST8dSK+oXvQx3KF5hIWf8ATarS/AlOYRJtC3LVY4fzb8BFgrY3fyCZ
 NIsIQLmwRkYPqoZj9GvQx7bJRDS0HPeBuGYOOlPlfaxJXhpXhK3AX18GgU/JfHwFGscp
 c11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F/kZ/G80MyWYhdKVpqBk0C55lIN/V+L/Ury6/lN0H48=;
 b=3OxHyxWHgPQWhetAN3r4tnEN3E74xF+dz2oEn8RGqtTzdQbZyReheO/XW8KKHBrH+/
 CI8OF5MVec/QdzhG2OfvEMhO1hgYPXzJ2G1bxMQB6/BdRA+0j8ElOHB7X5n7exka6wxR
 Sr2kKVk1tYJnPDu6SLk0QxNahbtm1QHEAWBdV+dozWJ+B6LBF9xgcMCLCU1qaYCe/UOJ
 g8glHS+CDuyefAGJoKoqEVjUmnzohypBQC+3N3Dwga/S9QxUyDdgP91Qoe5I1p7AxXtV
 6Lf6lwuSTPuYxkYuSIqjWY4jFE/9Hgodvn7KcdJSMamH07EPEKKwabgK1IT3QRZnqUtX
 VrKA==
X-Gm-Message-State: AOAM530HwIbrpMJYfXDmKHqmY/FAcvo0fiJIQ185xttfowu/QmQehUQ5
 uuf8+8lk+pSWgbr3XYhMEWk=
X-Google-Smtp-Source: ABdhPJyjTQaAGxBR0yMHdOdR1pG5uX4ZqXJGgnNSDIvUGtfqSnjkdKem5NcrSNhG6aWIO723rBkbDw==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr32152882pjg.17.1633370439363; 
 Mon, 04 Oct 2021 11:00:39 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 z2sm3641004pfe.210.2021.10.04.11.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:00:38 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com, tsbogend@alpha.franken.de, ruscur@russell.cc,
 oohall@gmail.com
Subject: [PATCH 0/6] MIPS: OCTEON: Remove redundant AER code 
Date: Mon,  4 Oct 2021 23:29:26 +0530
Message-Id: <cover.1633369560.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Oct 2021 09:16:56 +1100
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

e8635b484f64 ("MIPS: Add Cavium OCTEON PCI support.") added MIPS
specific code to enable PCIe and AER error reporting (*irrespective
of CONFIG_PCIEAER value*) because PCI core didn't do that at the time.

But currently, the PCI core clears and enables the AER status registers.
So it's redundant for octeon code to do so. This patch series removes
the redundant code from the pci-octeon.c

Currently, the correctable and uncorrectable AER mask registers are not
set to their default value when AER service driver is loaded. This
defect is also fixed in the "[PATCH 1/6]" in the series.

Please note that "Patch 4/6" is dependent on "Patch 1/6".

Thanks,
Naveen Naidu

Naveen Naidu (6):
 [PATCH 1/6] PCI/AER: Enable COR/UNCOR error reporting in set_device_error_reporting()
 [PATCH 2/6] MIPS: OCTEON: Remove redundant clearing of AER status registers
 [PATCH 3/6] MIPS: OCTEON: Remove redundant enable of PCIe normal error reporting
 [PATCH 4/6] MIPS: OCTEON: Remove redundant enable of COR/UNCOR error
 [PATCH 5/6] MIPS: OCTEON: Remove redundant ECRC Generation Enable
 [PATCH 6/6] MIPS: OCTEON: Remove redundant enable of RP error reporting

 arch/mips/pci/pci-octeon.c | 50 --------------------------------------
 drivers/pci/pcie/aer.c     | 13 +++++++++-
 2 files changed, 12 insertions(+), 51 deletions(-)

-- 
2.25.1


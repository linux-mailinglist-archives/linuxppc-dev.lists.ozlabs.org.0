Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D207B698F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 14:55:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IlL/sp2b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Hql0cWRz3d81
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 23:55:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IlL/sp2b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Tue, 03 Oct 2023 23:54:54 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Hpk4ZrDz3dC5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 23:54:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696337695; x=1727873695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PaTpYoAT1uZlfzdLbZxjO14jzGyLuKJKiccXqKEpHDw=;
  b=IlL/sp2bPlxuNC1hSU64zMKr2+QTzr9j1WNvn2TM6UFjvFII6NC3Udb8
   lwZQ2ik56ab+PnlGDKInKAC2C3Xd0w9jqfMoBNEPiAuRh8AqyPsB4oIVL
   VdjSJy7Nc617z0xxlzt4UgG8+kB8L76PU9LEepUhEl/AQgqo4O6npLuv3
   xxVxSOYfDZ2OeeaQ2cR1i3wqT0OdGGcLlbX7dmrJ9lOVywtff/JiwZkWD
   9ccuu4RtJXdRaMnAeGh/JP6Fj4TKl0yYsZghxRIAJQr5la3SF4ZcNK1/u
   vqgWY83mux7aUXIP8jm5jj1vEqiiZrDlBTZmKXHGJOMghu10nfFmUoEP7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="4432425"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="4432425"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816665798"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="816665798"
Received: from bmihaile-mobl1.ger.corp.intel.com (HELO localhost) ([10.251.222.64])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:53:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jonathan.derrick@linux.dev,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	marek.vasut+renesas@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	m.karthikeyan@mobiveil.co.in,
	nirmal.patel@linux.intel.com,
	rjui@broadcom.com,
	robh@kernel.org,
	roy.zang@nxp.com,
	sbranden@broadcom.com,
	yoshihiro.shimoda.uh@renesas.com,
	Zhiqiang.Hou@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] PCI: Add PCI_HEADER_TYPE_MFD pci_regs.h
Date: Tue,  3 Oct 2023 15:52:59 +0300
Message-Id: <20231003125300.5541-3-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231003125300.5541-1-ilpo.jarvinen@linux.intel.com>
References: <20231003125300.5541-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add PCI_HEADER_TYPE_MFD into pci_regs.h to be able to replace
literals in the code.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 include/uapi/linux/pci_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index e5f558d96493..06df65f11c39 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -80,6 +80,7 @@
 #define  PCI_HEADER_TYPE_NORMAL		0
 #define  PCI_HEADER_TYPE_BRIDGE		1
 #define  PCI_HEADER_TYPE_CARDBUS	2
+#define  PCI_HEADER_TYPE_MFD		0x80	/* Multi-Function Device (possible) */
 
 #define PCI_BIST		0x0f	/* 8 bits */
 #define  PCI_BIST_CODE_MASK	0x0f	/* Return result */
-- 
2.30.2


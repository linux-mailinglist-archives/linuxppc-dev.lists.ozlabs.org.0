Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4B5660965
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 23:16:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Npd3m1G2bz3cCC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 09:16:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ps8r7eIi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=anirudh.venkataramanan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ps8r7eIi;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Npcgm6lyQz3bVy
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 08:59:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673042373; x=1704578373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0AI0odRghP/P2eZTU9+vUvGrnUWUgK7vgCVx3xkIU9s=;
  b=Ps8r7eIifbtlr+vQFXSglGaxtl2ByWTxVA/vWGkmkEIdjA0EJvlsZtTF
   i07Lks/SEdeXUxr4kQrUwznVmHfpcgEXWvq2VRNv5Bu2d/N0mWF7rPWM4
   9ylSCT+Ca4YigWjBZiMgrIyJ+TFJxLImj6Zms367NYuEnscT1x8hLr2pn
   o5RM+gnzNSpU8AeUgs3oDLt6uL0F1XBZHFK4r80gIorxBv6oCkuk4Dron
   GNrGjtvrXoFeveCFO7y9n1e5nKxzrSa68oFP3DvJQrjA4wiJtZNXEIXT+
   AKiBbHB4qAu5Vra0h9V5M2YkBI3p0wMnmwdlzB3RZqhlcE9MSjWm0MKbp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="387030714"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="387030714"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 13:59:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="763652899"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="763652899"
Received: from avenkata-desk0.sc.intel.com ([172.25.112.60])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jan 2023 13:59:17 -0800
From: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 7/7] sparc: configs: Remove references to CONFIG_SUNVNET and CONFIG_LDMVSW
Date: Fri,  6 Jan 2023 14:00:20 -0800
Message-Id: <20230106220020.1820147-8-anirudh.venkataramanan@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230106220020.1820147-1-anirudh.venkataramanan@intel.com>
References: <20230106220020.1820147-1-anirudh.venkataramanan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 07 Jan 2023 09:09:38 +1100
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An earlier patch removed the Sun LDOM vswitch and sunvnet drivers. Remove
references to CONFIG_SUNVNET and CONFIG_LDMVSW from the sparc64 defconfig.

Cc: Leon Romanovsky <leon@kernel.org>
Signed-off-by: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
---
 arch/sparc/configs/sparc64_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sparc/configs/sparc64_defconfig b/arch/sparc/configs/sparc64_defconfig
index 1809909..a2c76e8 100644
--- a/arch/sparc/configs/sparc64_defconfig
+++ b/arch/sparc/configs/sparc64_defconfig
@@ -95,8 +95,6 @@ CONFIG_MII=m
 CONFIG_SUNLANCE=m
 CONFIG_HAPPYMEAL=y
 CONFIG_SUNGEM=m
-CONFIG_SUNVNET=m
-CONFIG_LDMVSW=m
 CONFIG_NET_PCI=y
 CONFIG_E1000=m
 CONFIG_E1000E=m
-- 
2.37.2


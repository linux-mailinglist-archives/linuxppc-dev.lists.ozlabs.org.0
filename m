Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4D366095E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 23:14:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Npd0f0jL3z3fLR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 09:14:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EjTHBPw9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=anirudh.venkataramanan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EjTHBPw9;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Npcgl1hCrz3bPW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 08:59:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673042371; x=1704578371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YxmNblIsKqhfyJq7N8D9hjsKeTOrNyEjlTYDV33bZjo=;
  b=EjTHBPw9B/1S3i64OvKKKEv6XJcUI2XqDZY868SvDrfBNOfvj7UpcGjB
   NjSdFS77htlRi1PfJIpuvvaCPgYQasHb8okNj7x3arce8+xZKN1j3MsuO
   dsEO2GoU/4gB2rcrJgrQ7FgEtNbQQPTXdGhxHAHcrN/SKqZXE/5I0M0Fr
   qgcqSFT6c7wKeW2gSQNZbreSViZvpp8BdUxYl4UbDG0q0MBUt4RPy9aHY
   kYQFMo1o3xWU/AA5+SlZwM6li+yvUWQCDPe1P1i1plENuXvowFgHHVZxq
   quW55yEMrUsNRUz11QfoRlgbQrX26OnZ61JRfd4pGA/87W9/fQbT2DJWU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="387030706"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="387030706"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 13:59:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="763652885"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="763652885"
Received: from avenkata-desk0.sc.intel.com ([172.25.112.60])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jan 2023 13:59:16 -0800
From: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 3/7] powerpc: configs: Remove reference to CONFIG_CASSINI
Date: Fri,  6 Jan 2023 14:00:16 -0800
Message-Id: <20230106220020.1820147-4-anirudh.venkataramanan@intel.com>
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

An earlier patch removed the Sun Cassnini driver. Remove references to
CONFIG_CASSINI from the ppc6xx defconfig.

Cc: Leon Romanovsky <leon@kernel.org>
Signed-off-by: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 1102582..0eba1de 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -487,7 +487,6 @@ CONFIG_PCMCIA_SMC91C92=m
 CONFIG_EPIC100=m
 CONFIG_HAPPYMEAL=m
 CONFIG_SUNGEM=m
-CONFIG_CASSINI=m
 CONFIG_NIU=m
 CONFIG_TEHUTI=m
 CONFIG_TLAN=m
-- 
2.37.2


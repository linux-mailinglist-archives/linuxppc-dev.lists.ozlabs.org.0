Return-Path: <linuxppc-dev+bounces-11203-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7FAB31D02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:58:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jx45J9Yz3clV;
	Sat, 23 Aug 2025 00:58:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874696;
	cv=none; b=HysNqphh3tHcsMSKHVR9OhX7SaaLQAjQJIse+A1vfM9PCs3tXpAc0yoFm5AjEi6tRNqf700FKUKcvhC9SWTvPTdIDun3uufrILYWCBooXugTMlOokGon59USnkKbJNO4NY6Zkxk8h7g90BGF+W8oSrn2GEOyQN+gGza9VvEVE1yGgoqapa/B9e+ZFQq69/VRSqvjNMxNrehYjlU8f1lNcTbq4WLFovESvyaBJHcBn7cu1FaRu0ZUqNbh0tZuOUfIrkFRsvJjXeGnECUIe/gNdzvDWdOZafkhQXwGZO9huJvF7vTEFcAQhb9UUEhWeX3TLYGwpPChLTVzNWxRDPfDig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874696; c=relaxed/relaxed;
	bh=o541McpIjhFhLpjZVEx0EZIsBIdfs8TW9KxyBgXmkyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MNORX4+xXv793irzkxxIms+qHsxJE2Zd32RHUWVGgNxGS64ffkAzKnvMZXngJ43T699RiNyygi+jtEvPSV3RIaQ3iUME6uWJGwvebShG50LZoh4DJEVwqGTNDkJzdcdcrUlKyqtrZzWCujeT4zsk7ozBz7iWWX3P0UbtXMFPKphKn5zxw+57vmwQ1TlQ6ynIxL3d5/NKE8ILXswl6HYTAuaJkS3fPH40ZFnQdcWGaq2p9dI0IhGGzv0BZJWDX475bOayGrMKIa4wf1bRK9DRPuh18t9HAGtraB5Llh17Fj7Nlj5BZMDUMg+FGHrsCPN+ibKcFOb5OApPmHpVUIKgVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SdU0ddWS; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SdU0ddWS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jx36FRnz3ckP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:58:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874696; x=1787410696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ee6ivqpcnefQPqKlLb6mSNrXVqSqgxwUEWQuLhjZ8qY=;
  b=SdU0ddWSUylutFWYoJb9bykCLryHFtT77r0rlZjLHlRcejb/72S8QZMG
   4QCCWMtmDDUcNE7Sam+z4C56pc8fJG0cNL1D6/CFWTcOocmiPQIqBZw0x
   KtlY0G+kd1gajODXbEOT01WLd5q3hES9obRgtccFmfpzkT36c+Fjmw6ig
   EoX7gafiBaDqgU2dwzmLL5pQ3CjkdPiksX08vB/n+SFU/ykQv1nW9eBMk
   sD/zDTayrjJT+QstUOgzBx+SER1zu4n5L68i+vJTosortP1qyFqmNoliD
   xxdQjSMTcZVlAvr9Ql9jnkYZV6Vk5MciOlHMFwUXhOe1fn0b1kMCOGca/
   w==;
X-CSE-ConnectionGUID: XhOHEZcMRCamgwkA3fcZ6g==
X-CSE-MsgGUID: rfrSrnbSQUCQX91Kw090kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69283140"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69283140"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:11 -0700
X-CSE-ConnectionGUID: MCHsPL/ZRuqfR30RXNcprQ==
X-CSE-MsgGUID: LlCQKywETQWGsfuL1uTiAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169547072"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andreas Larsson <andreas@gaisler.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org,
	sparclinux@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 06/24] PCI: Always claim bridge window before its setup
Date: Fri, 22 Aug 2025 17:55:47 +0300
Message-Id: <20250822145605.18172-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
References: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When the claim of a resource fails for the full range in
pci_claim_bridge_resource(), clipping the resource to a smaller size is
attempted. If the clipping successful, the new bridge window is
programmed and only as the last step the code attempts to claim the
resource again. The order of the last two steps is slightly illogical
and inconsistent with the assignment call chains.

If claiming the bridge window after clipping fails, the bridge window
that was setup is left in place.

Rework the logic such that the bridge window is claimed before calling
the relevant bridge setup function. This make the behavior consistent
with resource fitting call chains that always assign the bridge window
before programming it.

If claiming the bridge window fails, the clipped bridge window is no
longer setup but pci_claim_bridge_resource() returns without writing
the bridge window at all.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index c5fc4e2825be..b477f68b236c 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -857,9 +857,16 @@ int pci_claim_bridge_resource(struct pci_dev *bridge, int i)
 	if ((bridge->class >> 8) != PCI_CLASS_BRIDGE_PCI)
 		return 0;
 
+	if (i > PCI_BRIDGE_PREF_MEM_WINDOW)
+		return -EINVAL;
+
+	/* Try to clip the resource and claim the smaller window */
 	if (!pci_bus_clip_resource(bridge, i))
 		return -EINVAL;	/* Clipping didn't change anything */
 
+	if (!pci_claim_resource(bridge, i))
+		return -EINVAL;
+
 	switch (i) {
 	case PCI_BRIDGE_IO_WINDOW:
 		pci_setup_bridge_io(bridge);
@@ -874,10 +881,7 @@ int pci_claim_bridge_resource(struct pci_dev *bridge, int i)
 		return -EINVAL;
 	}
 
-	if (pci_claim_resource(bridge, i) == 0)
-		return 0;	/* Claimed a smaller window */
-
-	return -EINVAL;
+	return 0;
 }
 
 /*
-- 
2.39.5



Return-Path: <linuxppc-dev+bounces-4200-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 633A59F3566
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 17:10:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBlKL70HFz3024;
	Tue, 17 Dec 2024 03:10:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734365430;
	cv=none; b=WzYJ2XszShcJr/N7tNiS2ySXjEpnOCQ13XoUlF9tBe7rnYlaVIaMILsqomF5H1lpnQHXIF1y/uZ7V/uZWqX6RFWa5VzaG10RAqVgbDPRNMhFlzAk+EwjeGUEDBuoDXimbfG3rHpBwTE8WKO8wCi0z8CEjTXzjHMcAjyAOZnUjygjktKcd8ogiqie263eoZ/+/yO3n+DJI5zBdSOZSDjEH6NsbBmGabTFgu+b0YcaqJf4Isw6+LT0n+eog+iCJfgc0v8ebGCEHBo//1IxboQ2B2qcpofeyuC75AZkDvIXnLRbyBeusYdZp90/lR36em1xTXHLt2dZ0gzLJQMmTtIejw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734365430; c=relaxed/relaxed;
	bh=2qCHnrnH+PCzGp2ccIxKEwjli1sOFBwDexrOH/jf6MM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=oyIlKd8kUBmYPkgAdAgzPuLs/bTjTzkxOORPYDePySb02a0u1D+GCr+6jYLZmrDkiq1tmttVYpLNPrDTd9KVaRLK7oZxb91S4O1WYjglR7Ai98a5NtfMRUz1BbRXu7AcaN1OO1UqNKTYoQ8XpAkhIVRGjCenIWPPzUpFsWKRjYnRAkfJLi46w5rqfmcwOWma0akvradVknpda2ckvLnxYe94ojlYdg/LiabZIo1TzzUUmIYRmhrM95Bd2Go01Am9euN/VCC6Rqav1rqTOUqoQgEajKdgeF1q2allRGov280w+g6V12aMuHVssgnOZlrMnqBC8O2Hdd615wt2OKdEPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aUChjFDZ; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aUChjFDZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBlKG5WVRz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 03:10:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734365428; x=1765901428;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+uv/7k4icZNWNusvJVdXIbirJCnG0+qQNlYVBeg5/Tc=;
  b=aUChjFDZXkqKbzMWCZj6ed7nKa6Bk5NX2oH+YFUbRE067Y34sR+PoEqw
   ZHeewyFrX9+aVfWHHNvKeEY0ny9icbDBTHv/tucHOHh/hsGp5QyJP5KUF
   i5OIhp2HLmRjnryFIqoy2Mn9JWvh3u0eeNzxR5RbuGRpSxA085qVbHiej
   t6gHV74OB1gDfMXDaEekgWDOhqA7FCE9XWs1vAtUxPJuqjQu827oHMEe4
   t5Opn3N2DKkA24rUeYbsTWL1Ac0H1Vnt78xmrjDE+Noa4giwIP7AO1Npg
   mvCw6EC9QFACibfA9j4JclnW8FXh7zdv320+0lYphYZ9ZPPoeUhkocaJH
   w==;
X-CSE-ConnectionGUID: m2ZI/faSQ7aj4y9JOle/yA==
X-CSE-MsgGUID: XJN5nUepS56UUjUAS1HPVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34904186"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="34904186"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 08:10:22 -0800
X-CSE-ConnectionGUID: 09aDVqpbQNClxQSSDRrojA==
X-CSE-MsgGUID: i9QSmHfrT6GyVHwruP3UiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="97120698"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 08:10:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/4] PCI: pci_printk() removal (+ related cleanups)
Date: Mon, 16 Dec 2024 18:10:08 +0200
Message-Id: <20241216161012.1774-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

include/linux/pci.h provides pci_printk() which is a low-level
interface with level that is only useful for AER due to error severity
variations.

This series cleans up shpchp logging wrappers to avoid using low-level
pci_printk() unnecessarily and replaces pci_printk() with aer_printk().

Ilpo Järvinen (4):
  PCI: shpchp: Remove logging from module init/exit functions
  PCI: shpchp: Change dbg() -> ctrl_dbg()
  PCI: shpchp: Cleanup logging and debug wrappers
  PCI: Descope pci_printk() to aer_printk()

 drivers/pci/hotplug/shpchp.h      | 18 +-----------------
 drivers/pci/hotplug/shpchp_core.c | 13 +------------
 drivers/pci/hotplug/shpchp_hpc.c  |  2 +-
 drivers/pci/pcie/aer.c            | 10 +++++++---
 include/linux/pci.h               |  3 ---
 5 files changed, 10 insertions(+), 36 deletions(-)

-- 
2.39.5



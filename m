Return-Path: <linuxppc-dev+bounces-11206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8C6B31D08
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jxL0dhhz3cmP;
	Sat, 23 Aug 2025 00:58:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874710;
	cv=none; b=c4wTnqzDqAYgPR1TMKViopVsbv4PVYfkcDYevdIJZC66mKQqrPKbU7SHKDIDZRyMPHbgG4XiR9VTqhBh5PCm9pUt9UDz1PEmjU0c5W3Fgv94jeqvH66gZzoa69cqk8Ql5/45iVdTCIT32Ch7yO+OYoTE+0FWUtadIqyTfaXDS9C4jlg17BLyuJUx8U+oaS5gdqkp5dmlrAvbl+9FGTKbALdmbvEzT/4FYtaBt54fgFCSLsnfME31HyX9OgiX8Kqo49/0oXSX5pnuGt6SKmyw6DpsfWEEEmKjNf+1zWCYuq5/YkYwRtK/jiEQBFe3CkkY75csLxO/apaWwxB7QOR8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874710; c=relaxed/relaxed;
	bh=/+f7qtaHQyf0pv/p11QM0cvc/kLOwFYUbhiYRvjN9/E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JzGr/rMdXnIv8Wh8FZDQdFhV4wJGZPaec9Sk5c0u4/aCqjMHJB0aqtq948cOlRV0KZC9jNv4rFie9hei/yaJGIKCc3UZ6SYc8boVGJU6cidDDEpsqUWUJ2uOtYhCsmUfjiajAjozeQ5u/9BAI2bD5HYB2Xzf9sp+T/MgpaMN32C8IZlwdcbF/RKQAe3SoCA2faj7picYGYTK+xKDkPO0xogHRqafZ7/JKt6xWqOX7FhRDIU78aTLDlGsbpmn8xRAnxaCokBvfGHCALB+JMhJo6/rznULQ+QsArhEt9Rli3vuN5BQFq7yId4P8NqjF1FlkHjBFICUiM73/o5xcn+ygg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VPnFT9d1; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VPnFT9d1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jxK1Pdpz3ckk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:58:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874710; x=1787410710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lNB4OF2Frswq8A/Spc0itCO+i13cv1R1+OiD+b5mXBM=;
  b=VPnFT9d134jvh+LLwBb78lVZCGjfuDK8JW3BY+jjPn1e4KT1F7/U5zqE
   w6TELPkzEL6CY/plOV7hZLE9/Hb6aLomP0VXoNj8QDNqm+DOLzJdVqM1e
   /JPFXAJV9ivCSeWIHsmphZ5ZIVkImzah+2Y/8sSqTxsSq/BYBoIHUL+r8
   TLQrP8uzMJXdhgzU/P2ID33nlE9IJv4w0gkeGjL8aXOajxBEmhXvpOSTW
   vCBjZNrUhSxqssl982Ebi65Emth3Lw6xnnQOmGzGyD/3EAoftqYminPlP
   OAHwTU9K0LJRaByhgfMqUJYAWIG2Y8qZlnP0E7Il2sRsa92jDEZi6HdxB
   Q==;
X-CSE-ConnectionGUID: jh6FZfLNTUyT6lmQCmMKrQ==
X-CSE-MsgGUID: mgF5ZyTNSTq0zIzK+3ULtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80780572"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="80780572"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:28 -0700
X-CSE-ConnectionGUID: QdpNvnJ4TxqlKStF+Xcarg==
X-CSE-MsgGUID: dx1mT04YSL+qjkrIT85xOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168232435"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:22 -0700
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
Subject: [PATCH 14/24] PCI: Warn if bridge window cannot be released when resizing BAR
Date: Fri, 22 Aug 2025 17:55:55 +0300
Message-Id: <20250822145605.18172-15-ilpo.jarvinen@linux.intel.com>
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

BAR resizing calls to pci_reassign_bridge_resources() that attempts to
release any upstream bridge window to allow them to accommodate the new
BAR size. The release can only be performed if there are no other child
resources for the bridge window. The code just silently continues when
this condition is detects.

Add pci_warn() to inform user that a bridge window could not be
released because of child resources. As too small bridge window is
often the reason why the BAR resize cannot succeed, this warning will
help to pinpoint to the cause.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 5ef6362b5166..55289cd58e2c 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -2556,6 +2556,10 @@ int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res)
 				goto cleanup;
 
 			pci_release_resource(bridge, i);
+		} else {
+			pci_warn(bridge,
+				 "%s %pR: was not released (still contains assigned resources)\n",
+				 res_name, res);
 		}
 
 		bus = bus->parent;
-- 
2.39.5



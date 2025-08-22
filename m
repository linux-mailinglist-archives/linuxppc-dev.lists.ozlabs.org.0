Return-Path: <linuxppc-dev+bounces-11196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E25B31CF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:57:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jwR0tQlz3chX;
	Sat, 23 Aug 2025 00:57:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874663;
	cv=none; b=ARhT4P6Zl41OQGHNcd6FGN82jfxIu/s5cEdddzFmVfPihNNrz3rv19NMPEtVr6aiBlDLeTg7NdqFGNIcIR0jSZVJVdzXPFEer6bY/6Z1aHwdnJt+aMPKEg4/+P9jYuUIZ8JlwOVHYfXfuz4C1ebtEb1uHs6aKiOo1e5AZ+grxsORkQndEpO20uWpDQQR5RYgj9SPYdFfQwVZyHToJgCSO/51KZUaAjotIXF11yKzBZ+2L2BwyvNoa4oN6fw0CCwkRRKQZ0/FeeW8ydMnvnH+wlEuQRVJ/2ajtZmm5zWxKZ3f3Zd7NlE/HqiHjV8RPIw/bH82G/7ObO6wB7oRwzRBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874663; c=relaxed/relaxed;
	bh=ujplEvbDO1wFklyNcDE7UE0WyWOxOKVGzILaJlwSzy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MONjG75itY1LjirLxwvrxkZK1ZvOfiydfkOIOlVeW0LjIKcjQQVB5Hz87q/Uwyqae0J+GKMaFX5N3YHodgFpqsjOc7t0a4eDEG5G2agi1YxkrUylMmi3DiKPskOBPgJH/OUFtKPeHtLfseXma1dCYmLDqd0H6p2IVyXNlua76TquyX7jFEhTf/b+UqWHm+tAm4VcelgIyMH9V5Os0SjluAkeYJDJPa0Jp9D0jPkZYF+hzeg+UzkTf6750ce3F4GJw86C1nlaIPjZ88jW67TBeRnPJPWZskROzSnxuer6nUJw/nq08aQlIWikGBSwGuevYhSyaSADT4cn9albcLcRCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ipBWOXFk; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ipBWOXFk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jwQ23vpz3chw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:57:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874662; x=1787410662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F2R5lm6B0zlfTPYSGNsRRvyNW/8MTuBWGQgTQj1Brew=;
  b=ipBWOXFkVZsUuMbUxd3LK2MTfyQ4FEsLA64iTDzjKnZfK0hg1NamqE0l
   aBvDnPUEPDBwvOEInqbpSZAEdFUQWvXh7ffA5TAzwYh0RL3vu71aSlbue
   nUTw6J++hmmQLdPkyJStP2/OB7x7h+o6a42JZ5xb6JJR6CrJqMAw4ph3J
   MY5lg8n+eLu+YDNDw50yiZyoQwSZmXoS6geKiJbdmRkUCu7k6II5TrS0Y
   5vWqtJRbvuP2rGDjUDHl7BmJZNHK07+g0zFQ5X1ONASQapBPEU/JCsG2w
   dnQ1c9M/L9MsbaB42kXsTo5qikBm4BS8OrX0SAZSf4tT6DduHn5TMAkDd
   g==;
X-CSE-ConnectionGUID: 8iBVyzrGSbKm2TPMnAGOpg==
X-CSE-MsgGUID: E173XObkTWKCu69xYqhnYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57201371"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57201371"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:40 -0700
X-CSE-ConnectionGUID: dUvSFF9VS1qy+pJdy3UIkw==
X-CSE-MsgGUID: wzKVwqaETQWyVrIJW+JaKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168920509"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:35 -0700
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
Subject: [PATCH 09/24] PCI: Enable bridge even if bridge window fails to assign
Date: Fri, 22 Aug 2025 17:55:50 +0300
Message-Id: <20250822145605.18172-10-ilpo.jarvinen@linux.intel.com>
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

A normal PCI bridge has multiple bridge windows and not all of them are
always required by devices underneath the bridge. If Root Port or
bridge does not have a device underneath, no bridge windows get
assigned. Yet, pci_enable_resources() is set to fail indiscriminantly
on any resource assignment failure if the resource is not known to be
optional.

In practice, the code in pci_enable_resources() is currently largely
dormant. The kernel sets resource flags to zero for any unused bridge
window and resets flags to zero in case of an resource assignment
failure, which short-circuits pci_enable_resources() because of this
check:

	if (!(r->flags & (IORESOURCE_IO | IORESOURCE_MEM)))
		continue;

However, an upcoming change to resource flags will alter how bridge
window flags resource flags behave activating these long dormants
checks in pci_enable_resources().

While complex logic could be built to selectively enable a bridge only
under some conditions, a few versions of such logic were tried during
development of this change and none of them worked satisfactorily.
Thus, I just gave up and decided to enable any bridge regardless of the
bridge windows as there seems to be no clear benefit from not enabling
it but a major downside as pcieport will not be probed for the bridge
if it's not enabled.

Therefore, change pci_enable_resources() to not check if bridge window
resources remain unassigned. Resource assignment failures are pretty
noisy already so there is no need to log that for bridge windows in
pci_enable_resources().

Ignoring bridge window failures hopefully prevents an obvious sources
of regressions when the upcoming change that no longer clears resource
flags for bridge windows is enacted. I've hit this problem even during
my own testing on multiple occassions so I expect it to be a quite
common problem.

This can always be revisited later if somebody thinks the enable check
for bridges is not strict enough, but expect a mind-boggling number of
regressions from such a change.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-res.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index 0468c058b598..4e0e60256f04 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -527,22 +527,26 @@ int pci_enable_resources(struct pci_dev *dev, int mask)
 		if (pci_resource_is_optional(dev, i))
 			continue;
 
-		if (r->flags & IORESOURCE_UNSET) {
-			pci_err(dev, "%s %pR: not assigned; can't enable device\n",
-				r_name, r);
-			return -EINVAL;
+		if (i < PCI_BRIDGE_RESOURCES) {
+			if (r->flags & IORESOURCE_UNSET) {
+				pci_err(dev, "%s %pR: not assigned; can't enable device\n",
+					r_name, r);
+				return -EINVAL;
+			}
+
+			if (!r->parent) {
+				pci_err(dev, "%s %pR: not claimed; can't enable device\n",
+					r_name, r);
+				return -EINVAL;
+			}
 		}
 
-		if (!r->parent) {
-			pci_err(dev, "%s %pR: not claimed; can't enable device\n",
-				r_name, r);
-			return -EINVAL;
+		if (r->parent) {
+			if (r->flags & IORESOURCE_IO)
+				cmd |= PCI_COMMAND_IO;
+			if (r->flags & IORESOURCE_MEM)
+				cmd |= PCI_COMMAND_MEMORY;
 		}
-
-		if (r->flags & IORESOURCE_IO)
-			cmd |= PCI_COMMAND_IO;
-		if (r->flags & IORESOURCE_MEM)
-			cmd |= PCI_COMMAND_MEMORY;
 	}
 
 	if (cmd != old_cmd) {
-- 
2.39.5



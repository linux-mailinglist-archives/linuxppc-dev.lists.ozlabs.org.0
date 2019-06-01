Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F408831E8D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 15:38:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45GMpQ3L3jzDqDp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 23:38:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="kJ48E0Jk"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45GMYT5qXhzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2019 23:27:09 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 54522273CD;
 Sat,  1 Jun 2019 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395627;
 bh=3K6/aUg3C52Mziko9m56XexLE8geFfS7O36EjOwfNKI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kJ48E0JkWSo9dkFWAXyRWVGOD9IxwW2yPNiKYPtTo2Yn+IZ2i/2EdzWsnAm50YLXO
 P0eu/2GqTzRkYA7BWaqDoq2Wq8HCrIGcnUFTeMdZLc3C5LU7TjEWvigztOYgVEfF9G
 Z1zIgFmu0mAHT0aJc/RwKmXrXmmSCKtpnL+/9sj8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 39/56] PCI: rpadlpar: Fix leaked device_node
 references in add/remove paths
Date: Sat,  1 Jun 2019 09:25:43 -0400
Message-Id: <20190601132600.27427-39-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132600.27427-1-sashal@kernel.org>
References: <20190601132600.27427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, Sasha Levin <sashal@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>,
 linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>

[ Upstream commit fb26228bfc4ce3951544848555c0278e2832e618 ]

The find_dlpar_node() helper returns a device node with its reference
incremented.  Both the add and remove paths use this helper for find the
appropriate node, but fail to release the reference when done.

Annotate the find_dlpar_node() helper with a comment about the incremented
reference count and call of_node_put() on the obtained device_node in the
add and remove paths.  Also, fixup a reference leak in the find_vio_slot()
helper where we fail to call of_node_put() on the vdevice node after we
iterate over its children.

Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/hotplug/rpadlpar_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
index f2fcbe944d940..aae295708ea7a 100644
--- a/drivers/pci/hotplug/rpadlpar_core.c
+++ b/drivers/pci/hotplug/rpadlpar_core.c
@@ -55,6 +55,7 @@ static struct device_node *find_vio_slot_node(char *drc_name)
 		if ((rc == 0) && (!strcmp(drc_name, name)))
 			break;
 	}
+	of_node_put(parent);
 
 	return dn;
 }
@@ -78,6 +79,7 @@ static struct device_node *find_php_slot_pci_node(char *drc_name,
 	return np;
 }
 
+/* Returns a device_node with its reference count incremented */
 static struct device_node *find_dlpar_node(char *drc_name, int *node_type)
 {
 	struct device_node *dn;
@@ -314,6 +316,7 @@ int dlpar_add_slot(char *drc_name)
 			rc = dlpar_add_phb(drc_name, dn);
 			break;
 	}
+	of_node_put(dn);
 
 	printk(KERN_INFO "%s: slot %s added\n", DLPAR_MODULE_NAME, drc_name);
 exit:
@@ -447,6 +450,7 @@ int dlpar_remove_slot(char *drc_name)
 			rc = dlpar_remove_pci_slot(drc_name, dn);
 			break;
 	}
+	of_node_put(dn);
 	vm_unmap_aliases();
 
 	printk(KERN_INFO "%s: slot %s removed\n", DLPAR_MODULE_NAME, drc_name);
-- 
2.20.1


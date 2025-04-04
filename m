Return-Path: <linuxppc-dev+bounces-7445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F26A7B6D8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Apr 2025 06:26:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTQXy6NlFz30Pl;
	Fri,  4 Apr 2025 15:26:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743740802;
	cv=none; b=gjQw3SWqn5riHzGKvrh7UpAWQer6OgKggEfnX2XyhrelzBDatvRFvhnJfUHYIfzcYa6PRWyP2pOLAy3oS/lqGk90YEjsT7Vt/HBZLXPLMBN9GeprMc2WiXN0QPcNtPYrJWQHFpXFUSAGogEdljMjuV8lQVzxq1UjEj2k3no0i9/2nKHvyXt4Sbz/i5BMOYVdWCeQdNCVApohcJ885UehgEEL/j6f/eaNc1K6Ao11AQC4XOBWgojyKIRYtYB8OyAdZ0zQctaR2fDoGV2kx0Rz0zebGf+/bfws5tlbQwrHPKsnsI2jyv8GCaepZPBc2q1FqtI/Xg+PVxjLVKXeYiS2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743740802; c=relaxed/relaxed;
	bh=g8RNqE7aPiU1zvwocf1geGsqM6oe9JplNEQakBf0Reg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hnXwjdbeXhbLrjqAaeYzaO+BdyffdrWMiEl5EZoGCPmpnDvewRaW1SqNFv3nISSkEXdZBBhOpy8JAydExRsDChTKV7syrP1Ex9pyDrNszz4TPss4ShJ+zXPLSMWUFT2u6m0WPS7GULAU1T+bf7eU3jKkB4Q8cjUy64Bc8+9zR2vzuee0o/Qg1YTww81jZ0d0YejZRO1cWi6K1dPkxFd+xCgiKjiVoyTehiSkoxVNEgSYnRQx6sB/MVS+nGnqCtfQpOQfc0Wde4uATR+qo04fyglC599MsjBemCku8kAfg6ZYSHs6dSzlcnNoWllr003f9mGkirp2p5NtXDpVqNxCdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=NJ2WDg/F; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=NJ2WDg/F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTQXv5sLvz30Nl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 15:26:39 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4A9C18287DC7;
	Thu,  3 Apr 2025 23:18:16 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id y0x95OhCHdpj; Thu,  3 Apr 2025 23:18:15 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 5125A82888D4;
	Thu,  3 Apr 2025 23:18:15 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5125A82888D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1743740295; bh=g8RNqE7aPiU1zvwocf1geGsqM6oe9JplNEQakBf0Reg=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=NJ2WDg/FTHCCC6jFgYkZlr24HYP+QOKD2ftg3UT+clr+55Mx+4dkhbO6XW1PFMw85
	 kD67hZYiQ0jWO3dcGWqL9fYMPsZ19bSMXZH6fABD0/bCFLyOOwJl5bkUmIFGW0Z5T9
	 kEarqQZJELs45FV7AKLy+5XuXmFBbNHDUgwcNFJ4=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Bl4Uh3ydGZaJ; Thu,  3 Apr 2025 23:18:15 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
	by mail.rptsys.com (Postfix) with ESMTPSA id BAF458287D01;
	Thu,  3 Apr 2025 23:18:14 -0500 (CDT)
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	tpearson@raptorengineering.com,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 3/3] pci/hotplug/pnv_php: Fix refcount underflow on hot unplug
Date: Thu,  3 Apr 2025 23:18:10 -0500
Message-Id: <20250404041810.245984-4-sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250404041810.245984-1-sanastasio@raptorengineering.com>
References: <20250404041810.245984-1-sanastasio@raptorengineering.com>
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
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When hot unplugging a slot containing a PCIe switch on a PowerNV system,
the reference count of the device_node corresponding to the root will
underflow. This is due to improper handling of the device_nodes'
refcounts in pnv_php_detach_device nodes that occurs on each unplug
event.

When iterating through children nodes, pnv_php_detach_nodes first
recursively detach each child's children, then it would decrement the
child's refcount and finally call of_detach_node on it, which in turn
would decrement the refcount further and result in an underflow. Fix
this by dropping the explicit of_put call and by moving the final
of_detach_node call after the loop.

The underflow that occurs without this patch produces the following
backtrace on unplug events:

  refcount_t: underflow; use-after-free.
  WARNING: CPU: 4 PID: 669 at lib/refcount.c:28 refcount_warn_saturate+0x214/0x224
  Call Trace:
   refcount_warn_saturate+0x210/0x224 (unreliable)
   kobject_put+0x154/0x2d4
   of_node_put+0x2c/0x40
   of_get_next_child+0x74/0xd0
   pnv_php_detach_device_nodes+0x2a4/0x30c
   pnv_php_set_slot_power_state+0x20c/0x500
   pnv_php_disable_slot+0xb8/0xdc
   power_write_file+0xf8/0x18c
   pci_slot_attr_store+0x40/0x5c
   sysfs_kf_write+0x64/0x78
   kernfs_fop_write_iter+0x1b4/0x2a4
   vfs_write+0x3bc/0x50c
   ksys_write+0x84/0x140
   system_call_exception+0x124/0x230
   system_call_vectored_common+0x15c/0x2ec

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 drivers/pci/hotplug/pnv_php.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 1a734adb5b10..a3fa44f7bf1a 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -156,11 +156,12 @@ static void pnv_php_detach_device_nodes(struct device_node *parent)
 	struct device_node *dn;
 
 	for_each_child_of_node(parent, dn) {
+		/* Detach any children of the parent node first */
 		pnv_php_detach_device_nodes(dn);
-
-		of_node_put(dn);
-		of_detach_node(dn);
 	}
+
+	/* Finally, detach the parent */
+	of_detach_node(parent);
 }
 
 static void pnv_php_rmv_devtree(struct pnv_php_slot *php_slot)
-- 
2.30.2



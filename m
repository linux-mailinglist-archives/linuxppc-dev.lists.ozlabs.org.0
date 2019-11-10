Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F85F6717
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 04:37:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479fpV2klQzF6Xs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 14:37:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="PPzuzhkC"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479dft6vYmzF48F
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 13:45:58 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D01421D7F;
 Sun, 10 Nov 2019 02:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573353957;
 bh=0nt6omekfdvnZbVzvocj9xSl1eWhEFqOqV5EXwNxaH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PPzuzhkCLWFLqKMp+Mo3h8QWKFWY1nyKrYUB0CVIy5vcBdoh4k+SLEk62ZegmxHFX
 bAG0sC3k92SY9NqhLX0zvNdRasx4PO8UfV7DI0XJlPu2xThUUW1Lp+ixle1ATbpDuG
 VfC55vA3YngeKydKkF8QyQc2MrWh2p1fbwSl1eLM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 012/109] powerpc/pseries: Disable CPU hotplug
 across migrations
Date: Sat,  9 Nov 2019 21:44:04 -0500
Message-Id: <20191110024541.31567-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024541.31567-1-sashal@kernel.org>
References: <20191110024541.31567-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Fontenot <nfont@linux.vnet.ibm.com>

[ Upstream commit 85a88cabad57d26d826dd94ea34d3a785824d802 ]

When performing partition migrations all present CPUs must be online
as all present CPUs must make the H_JOIN call as part of the migration
process. Once all present CPUs make the H_JOIN call, one CPU is returned
to make the rtas call to perform the migration to the destination system.

During testing of migration and changing the SMT state we have found
instances where CPUs are offlined, as part of the SMT state change,
before they make the H_JOIN call. This results in a hung system where
every CPU is either in H_JOIN or offline.

To prevent this this patch disables CPU hotplug during the migration
process.

Signed-off-by: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Reviewed-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/rtas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 141d192c69538..a01f83ba739ef 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -984,6 +984,7 @@ int rtas_ibm_suspend_me(u64 handle)
 		goto out;
 	}
 
+	cpu_hotplug_disable();
 	stop_topology_update();
 
 	/* Call function on all CPUs.  One of us will make the
@@ -998,6 +999,7 @@ int rtas_ibm_suspend_me(u64 handle)
 		printk(KERN_ERR "Error doing global join\n");
 
 	start_topology_update();
+	cpu_hotplug_enable();
 
 	/* Take down CPUs not online prior to suspend */
 	cpuret = rtas_offline_cpus_mask(offline_mask);
-- 
2.20.1


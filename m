Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263E26BA3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 21:28:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458N3X3wTBzDqLG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 05:28:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="LXbV2XNT"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458Mvp3qrGzDqKs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 05:22:14 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E3112177E;
 Wed, 22 May 2019 19:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558552932;
 bh=5FtMFb5fTVywaRzfyhTc3uZrAM9WA4rSelThMtC9RLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LXbV2XNTEP0wSzPejGQyLJvSQUZI4JBlUSIAMGLyQIFFEfy/d5ikkwj94VCddyluH
 1Meym9GmAdhniv+0k27TgZOfYorSIMaKqmCInVJspyUxL1TFJYMlbAeVNC/Yeq8gyZ
 na+noYYvc2jlKhvaZ7RZ7q+HJy4OSQXbAH+lAjPA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 036/375] powerpc/perf: Fix loop exit condition in
 nest_imc_event_init
Date: Wed, 22 May 2019 15:15:36 -0400
Message-Id: <20190522192115.22666-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522192115.22666-1-sashal@kernel.org>
References: <20190522192115.22666-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anju T Sudhakar <anju@linux.vnet.ibm.com>

[ Upstream commit 860b7d2286236170a36f94946d03ca9888d32571 ]

The data structure (i.e struct imc_mem_info) to hold the memory address
information for nest imc units is allocated based on the number of nodes
in the system.

nest_imc_event_init() traverse this struct array to calculate the memory
base address for the event-cpu. If we fail to find a match for the event
cpu's chip-id in imc_mem_info struct array, then the do-while loop will
iterate until we crash.

Fix this by changing the loop exit condition based on the number of
non zero vbase elements in the array, since the allocation is done for
nr_chips + 1.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 885dcd709ba91 ("powerpc/perf: Add nest IMC PMU support")
Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/perf/imc-pmu.c               | 2 +-
 arch/powerpc/platforms/powernv/opal-imc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 6159e9edddfd0..2d12f0037e3a5 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -499,7 +499,7 @@ static int nest_imc_event_init(struct perf_event *event)
 			break;
 		}
 		pcni++;
-	} while (pcni);
+	} while (pcni->vbase != 0);
 
 	if (!flag)
 		return -ENODEV;
diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
index 58a07948c76e7..3d27f02695e41 100644
--- a/arch/powerpc/platforms/powernv/opal-imc.c
+++ b/arch/powerpc/platforms/powernv/opal-imc.c
@@ -127,7 +127,7 @@ static int imc_get_mem_addr_nest(struct device_node *node,
 								nr_chips))
 		goto error;
 
-	pmu_ptr->mem_info = kcalloc(nr_chips, sizeof(*pmu_ptr->mem_info),
+	pmu_ptr->mem_info = kcalloc(nr_chips + 1, sizeof(*pmu_ptr->mem_info),
 				    GFP_KERNEL);
 	if (!pmu_ptr->mem_info)
 		goto error;
-- 
2.20.1


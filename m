Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 702AD15F70F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 20:45:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K3kW4PXkzDqkW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 06:45:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=l7/S2o3n; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JzG25XkgzDqcR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 03:23:38 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EF9224784;
 Fri, 14 Feb 2020 16:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697416;
 bh=Euz8prmoV/9Omi9CY0OJt7pU2e0BfM7/YWlxm/rXuLE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l7/S2o3nc+sqBYWT4gJXeWCFzY061Sm4YuUCNRaRGfOrXPJWjUSKTHe18i9Ofsde3
 /gv/mVpk6l8CX8hcXalgiXzrEfZGmfQq4lmqz0J5rHTqbtQRXCIgXWfn7h5Hy5epqF
 c77UQzX6tCJZAnVHHzkvGrsjbu0FqK+0R7KcmavA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 106/141] ide: remove set but not used variable
 'hwif'
Date: Fri, 14 Feb 2020 11:20:46 -0500
Message-Id: <20200214162122.19794-106-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162122.19794-1-sashal@kernel.org>
References: <20200214162122.19794-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Wang Hai <wanghai38@huawei.com>,
 linux-ide@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wang Hai <wanghai38@huawei.com>

[ Upstream commit 98949a1946d70771789def0c9dbc239497f9f138 ]

Fix the following gcc warning:

drivers/ide/pmac.c: In function pmac_ide_setup_device:
drivers/ide/pmac.c:1027:14: warning: variable hwif set but not used
[-Wunused-but-set-variable]

Fixes: d58b0c39e32f ("powerpc/macio: Rework hotplug media bay support")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ide/pmac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/ide/pmac.c b/drivers/ide/pmac.c
index b20025a5a8d93..9c48ff85bbbbb 100644
--- a/drivers/ide/pmac.c
+++ b/drivers/ide/pmac.c
@@ -1024,7 +1024,6 @@ static int pmac_ide_setup_device(pmac_ide_hwif_t *pmif, struct ide_hw *hw)
 	struct device_node *np = pmif->node;
 	const int *bidp;
 	struct ide_host *host;
-	ide_hwif_t *hwif;
 	struct ide_hw *hws[] = { hw };
 	struct ide_port_info d = pmac_port_info;
 	int rc;
@@ -1080,7 +1079,7 @@ static int pmac_ide_setup_device(pmac_ide_hwif_t *pmif, struct ide_hw *hw)
 		rc = -ENOMEM;
 		goto bail;
 	}
-	hwif = pmif->hwif = host->ports[0];
+	pmif->hwif = host->ports[0];
 
 	if (on_media_bay(pmif)) {
 		/* Fixup bus ID for media bay */
-- 
2.20.1


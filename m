Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E561F25DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 01:34:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gqMT57dNzDqCV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:33:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ewDKCuJ5; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gpx70hrpzDqCl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 09:14:35 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39DCE20B80;
 Mon,  8 Jun 2020 23:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658072;
 bh=DJ+RkNvt0Js/EBh4v/QVhJIKEDFFoh4tGKhMbLz5ypE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ewDKCuJ5QjO7hK2FdB7TuMuyGR/AIPLJ1tWP2XMAAqrMptrS5CqLrReR8yXtv6jd7
 mVhSmDkxNQXgzOyjT7tvywvrRwd5yatIktevs6FB4hgx+e0uBfVvUgU77RDkTHXx7U
 HRifO8cQvM/qDKeCLPZHhQfx6UMZvi0G/U9a2rfc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 117/606] ibmvnic: Skip fatal error reset after
 passive init
Date: Mon,  8 Jun 2020 19:04:02 -0400
Message-Id: <20200608231211.3363633-117-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Juliet Kim <julietk@linux.vnet.ibm.com>, Sasha Levin <sashal@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Juliet Kim <julietk@linux.vnet.ibm.com>

[ Upstream commit f9c6cea0b38518741c8dcf26ac056d26ee2fd61d ]

During MTU change, the following events may happen.
Client-driven CRQ initialization fails due to partner’s CRQ closed,
causing client to enqueue a reset task for FATAL_ERROR. Then passive
(server-driven) CRQ initialization succeeds, causing client to
release CRQ and enqueue a reset task for failover. If the passive
CRQ initialization occurs before the FATAL reset task is processed,
the FATAL error reset task would try to access a CRQ message queue
that was freed, causing an oops. The problem may be most likely to
occur during DLPAR add vNIC with a non-default MTU, because the DLPAR
process will automatically issue a change MTU request.

Fix this by not processing fatal error reset if CRQ is passively
initialized after client-driven CRQ initialization fails.

Signed-off-by: Juliet Kim <julietk@linux.vnet.ibm.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 4bd33245bad6..3de549c6c693 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2189,7 +2189,8 @@ static void __ibmvnic_reset(struct work_struct *work)
 				rc = do_hard_reset(adapter, rwi, reset_state);
 				rtnl_unlock();
 			}
-		} else {
+		} else if (!(rwi->reset_reason == VNIC_RESET_FATAL &&
+				adapter->from_passive_init)) {
 			rc = do_reset(adapter, rwi, reset_state);
 		}
 		kfree(rwi);
-- 
2.25.1


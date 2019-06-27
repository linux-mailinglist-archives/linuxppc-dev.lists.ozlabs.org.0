Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0910577E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 02:50:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z1XN2LwGzDqDL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 10:50:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="NYeD4X4+"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z1Fg30QNzDqCF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 10:37:43 +1000 (AEST)
Received: from sasha-vm.mshome.net (unknown [107.242.116.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F37E21851;
 Thu, 27 Jun 2019 00:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561595861;
 bh=i8H1IK9D580FoHZptQkVpLaZq7f0muucIYXClDzYsis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NYeD4X4+rybil6AN9644AQfJFTTol/qqQXdKgXJ5trtNMXswsnJEU6f1siMuGHdbm
 8LPIksJ/ASBlqTdFFf22N4TdAAYsbPVLox5mVxLjzHMQHCZDKSxk3FBqfnvl7JEzh9
 0VHkVXBvTRcVYl68dM70SmEkUJvjZYAvwlAn+G+g=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 27/60] ibmvnic: Refresh device multicast list
 after reset
Date: Wed, 26 Jun 2019 20:35:42 -0400
Message-Id: <20190627003616.20767-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627003616.20767-1-sashal@kernel.org>
References: <20190627003616.20767-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 Thomas Falcon <tlfalcon@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Falcon <tlfalcon@linux.ibm.com>

[ Upstream commit be32a24372cf162e825332da1a7ccef058d4f20b ]

It was observed that multicast packets were no longer received after
a device reset.  The fix is to resend the current multicast list to
the backing device after recovery.

Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index bf0a5fe0da17..b88af81499e8 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1854,6 +1854,9 @@ static int do_reset(struct ibmvnic_adapter *adapter,
 		return 0;
 	}
 
+	/* refresh device's multicast list */
+	ibmvnic_set_multi(netdev);
+
 	/* kick napi */
 	for (i = 0; i < adapter->req_rx_queues; i++)
 		napi_schedule(&adapter->napi[i]);
-- 
2.20.1


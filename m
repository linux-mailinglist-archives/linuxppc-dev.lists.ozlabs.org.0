Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7250AAE008
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 22:46:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S0ZX4pmpzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 06:46:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S0Xc34QqzDq99
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 06:45:02 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C19ABABB1;
 Mon,  9 Sep 2019 20:44:57 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Juliet Kim <julietk@linux.vnet.ibm.com>
Subject: [PATCH] net/ibmvnic: Fix missing { in __ibmvnic_reset
Date: Mon,  9 Sep 2019 22:44:51 +0200
Message-Id: <20190909204451.7929-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190907.173714.1400426487600521308.davem@davemloft.net>
References: 
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, John Allen <jallen@linux.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 1c2977c09499 ("net/ibmvnic: free reset work of removed device from queue")
adds a } without corresponding { causing build break.

Fixes: 1c2977c09499 ("net/ibmvnic: free reset work of removed device from queue")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 6644cabc8e75..5cb55ea671e3 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1984,7 +1984,7 @@ static void __ibmvnic_reset(struct work_struct *work)
 	rwi = get_next_rwi(adapter);
 	while (rwi) {
 		if (adapter->state == VNIC_REMOVING ||
-		    adapter->state == VNIC_REMOVED)
+		    adapter->state == VNIC_REMOVED) {
 			kfree(rwi);
 			rc = EBUSY;
 			break;
-- 
2.22.0


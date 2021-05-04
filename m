Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7AE3730A6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 21:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZV644C3Mz30HC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 05:19:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZV5h1PXYz2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 05:19:35 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E452BB311;
 Tue,  4 May 2021 19:19:32 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: netdev@vger.kernel.org
Subject: [PATCH v2 net-next resend] ibmvnic: remove default label from
 to_string switch
Date: Tue,  4 May 2021 21:19:23 +0200
Message-Id: <20210504191923.32313-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210503.134721.2149322673805635760.davem@davemloft.net>
References: <20210503.134721.2149322673805635760.davem@davemloft.net>
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
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Lijun Pan <lijunp213@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Falcon <tlfalcon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Dany Madden <drt@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This way the compiler warns when a new value is added to the enum but
not to the string translation like:

drivers/net/ethernet/ibm/ibmvnic.c: In function 'adapter_state_to_string':
drivers/net/ethernet/ibm/ibmvnic.c:832:2: warning: enumeration value 'VNIC_FOOBAR' not handled in switch [-Wswitch]
  switch (state) {
  ^~~~~~
drivers/net/ethernet/ibm/ibmvnic.c: In function 'reset_reason_to_string':
drivers/net/ethernet/ibm/ibmvnic.c:1935:2: warning: enumeration value 'VNIC_RESET_FOOBAR' not handled in switch [-Wswitch]
  switch (reason) {
  ^~~~~~

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Acked-by: Lijun Pan <lijunp213@gmail.com>
---
v2: Fix typo in commit message
---
 drivers/net/ethernet/ibm/ibmvnic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 5788bb956d73..4d439413f6d9 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -846,9 +846,8 @@ static const char *adapter_state_to_string(enum vnic_state state)
 		return "REMOVING";
 	case VNIC_REMOVED:
 		return "REMOVED";
-	default:
-		return "UNKNOWN";
 	}
+	return "UNKNOWN";
 }
 
 static int ibmvnic_login(struct net_device *netdev)
@@ -1946,9 +1945,8 @@ static const char *reset_reason_to_string(enum ibmvnic_reset_reason reason)
 		return "TIMEOUT";
 	case VNIC_RESET_CHANGE_PARAM:
 		return "CHANGE_PARAM";
-	default:
-		return "UNKNOWN";
 	}
+	return "UNKNOWN";
 }
 
 /*
-- 
2.26.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A816AC2A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 17:52:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R7R23l3gzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 03:52:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=embeddedor.com (client-ip=192.185.47.18;
 helo=gateway20.websitewelcome.com; envelope-from=gustavo@embeddedor.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=embeddedor.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=nCfQCNEZ; 
 dkim-atps=neutral
X-Greylist: delayed 1268 seconds by postgrey-1.36 at bilbo;
 Tue, 25 Feb 2020 03:51:16 AEDT
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com
 [192.185.47.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R7PJ6JN6zDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 03:51:16 +1100 (AEDT)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 53ED3400D7F50
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 09:15:52 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 6GcPjY8xMRP4z6GcPjxKLP; Mon, 24 Feb 2020 10:30:05 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SufFoM7/8X7+v8o1TDT24AfCBucvI9ztFhZQBUHKfzs=; b=nCfQCNEZU6z8PI4KS/40hsBhWa
 71Io5GlxegKDq0wXha6Mv9nPJVptBoR9NmBc8UIzoenYGe2i8236k6lg3mI2tPoUmAc00NK31E9EU
 PRx1avlnd4Wffsq7cEc6vU0Z6e/iooVPGGHQY3PKiIa2Sb8OtGh9rP/6vzqQRgHRymux/gQROIdqq
 WhwCrierGXTU30JY0Vk9ER3tZgR23tTxhMMVRZL9laorV7GvDjEd5Zvs1putZ9JV+qUYdULLwSBfD
 r42KSQtOEtmzF4TXHjIR/qf7g6CMW4u1kMtjo5QKbceJGmwMunJZN5L2ReQxGdfDxN91U3KmZdhr4
 PKIEBHNQ==;
Received: from [200.68.140.135] (port=30752 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j6GcN-002oWo-Rv; Mon, 24 Feb 2020 10:30:03 -0600
Date: Mon, 24 Feb 2020 10:32:52 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Geoff Levand <geoff@infradead.org>,
 "David S. Miller" <davem@davemloft.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Ishizaki Kou <kou.ishizaki@toshiba.co.jp>
Subject: [PATCH][next] toshiba: Replace zero-length array with flexible-array
 member
Message-ID: <20200224163252.GA28066@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.135
X-Source-L: No
X-Exim-ID: 1j6GcN-002oWo-Rv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.135]:30752
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 48
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.h      | 2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_wireless.h | 2 +-
 drivers/net/ethernet/toshiba/spider_net.h         | 2 +-
 drivers/net/ethernet/toshiba/tc35815.c            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.h b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
index 805903dbddcc..68f324ed4eaf 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.h
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
@@ -308,7 +308,7 @@ struct gelic_port {
 	struct gelic_card *card;
 	struct net_device *netdev;
 	enum gelic_port_type type;
-	long priv[0]; /* long for alignment */
+	long priv[]; /* long for alignment */
 };
 
 static inline struct gelic_card *port_to_card(struct gelic_port *p)
diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_wireless.h b/drivers/net/ethernet/toshiba/ps3_gelic_wireless.h
index 4041d946b649..1f203d1ae8db 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_wireless.h
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_wireless.h
@@ -158,7 +158,7 @@ struct gelic_eurus_scan_info {
 	__be32 reserved2;
 	__be32 reserved3;
 	__be32 reserved4;
-	u8 elements[0]; /* ie */
+	u8 elements[]; /* ie */
 } __packed;
 
 /* the hypervisor returns bbs up to 16 */
diff --git a/drivers/net/ethernet/toshiba/spider_net.h b/drivers/net/ethernet/toshiba/spider_net.h
index c0c68cbc898c..05b1a0736835 100644
--- a/drivers/net/ethernet/toshiba/spider_net.h
+++ b/drivers/net/ethernet/toshiba/spider_net.h
@@ -470,7 +470,7 @@ struct spider_net_card {
 	struct spider_net_extra_stats spider_stats;
 
 	/* Must be last item in struct */
-	struct spider_net_descr darray[0];
+	struct spider_net_descr darray[];
 };
 
 #endif
diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
index 3fd43d30b20d..b50c3ec3495b 100644
--- a/drivers/net/ethernet/toshiba/tc35815.c
+++ b/drivers/net/ethernet/toshiba/tc35815.c
@@ -367,7 +367,7 @@ struct TxFD {
 
 struct RxFD {
 	struct FDesc fd;
-	struct BDesc bd[0];	/* variable length */
+	struct BDesc bd[];	/* variable length */
 };
 
 struct FrFD {
-- 
2.25.0


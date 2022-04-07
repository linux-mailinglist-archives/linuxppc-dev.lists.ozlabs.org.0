Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F12E4F7D26
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:39:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYyYc1QsXz3f60
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:39:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ck9VMXlw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ck9VMXlw; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYyN84vdFz3bZf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:31:20 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id f18so5870922edc.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vgJhsUA0t53G3i/our+ohO3psku9eyW28VU5QSKiZig=;
 b=ck9VMXlwjAkrJBjF/n1CbKYDRKjFW2L1sPR2cfn0O4RDS+4QiOHeU1rYTT4S9ncl+G
 o5azQ4trV0k6BexbuKXvDPcfd6d2avbwCYSYjZU2vIeAZL1SDwryL0Y9Z/si11u9czY8
 HzSmojIwKa9wGHtHA7Rw1QF6JO72eOMQZIlf93BwLEg4gdnjSLVBRiuAO8dVakaZb4kz
 SOSvnRA47mFgah3zGWtDP9mGpxSHfD8Utvl8jF8xYbBMw/zcDA+AHsBZNp4IxEZ19BHf
 XWEAPp3jBv3UnL1paAnMyKvp5qfSTKVSfzz4UUD+u3vqppZpYWgxHW3KPf144WduY8wu
 hZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vgJhsUA0t53G3i/our+ohO3psku9eyW28VU5QSKiZig=;
 b=WGVllefsxF7efDdnroqfGOEoiemCg52NOlm1Y5dBo7ZVZWPNOd94V+cmG1zfdTlVzH
 tWfc5Dzwt1iCoRs8GcnllJV9ZRZIWrJ925pCTKQ134SoeG7/uRxmgj4/4hf6EkZMVZUo
 qLqcybfFVamlz7PxCJWX3FIEWVa53yiZpQHGEmddYPx07ofb9DIeLaEL8Ci7mCLSR2Vw
 VXPNnWaOu4u9FLjCmsKsuSRpd21/ZQlxNrghGNR/0UrxL15PD9KwBrEUkSjYJOb8UMkA
 a91d4QzqsvsdbWvUwBPg3H73GHg7vD9WnuYG8NZ2bQ5GLduOXAAdzseayatLivw2aeTl
 jsFQ==
X-Gm-Message-State: AOAM530VKqnDkbLo6eE2RXWBjaNbjUrE9yyBwYTparaHrWh9U23R9r30
 UnrEAlY52jzJ5qCon3OXvP4=
X-Google-Smtp-Source: ABdhPJxIonNOQ1zmloCWblK64EDRlsodCxqZVtWTSlCR5kf0sJLYfy5mmraay8MHk+JFs8Mqdx5Yvg==
X-Received: by 2002:a05:6402:5191:b0:41c:e08c:ae21 with SMTP id
 q17-20020a056402519100b0041ce08cae21mr13474506edd.268.1649327477350; 
 Thu, 07 Apr 2022 03:31:17 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm7413573ejz.57.2022.04.07.03.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:31:17 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next 13/15] ps3_gelic: Replace usage of found with
 dedicated list iterator variable
Date: Thu,  7 Apr 2022 12:28:58 +0200
Message-Id: <20220407102900.3086255-14-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407102900.3086255-1-jakobkoschel@gmail.com>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 Ariel Elior <aelior@marvell.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Manish Chopra <manishc@marvell.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Vladimir Oltean <olteanv@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Casper Andersson <casper.casan@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 .../net/ethernet/toshiba/ps3_gelic_wireless.c | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c b/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
index dc14a66583ff..c8a016c902cd 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
@@ -1495,14 +1495,14 @@ static int gelic_wl_start_scan(struct gelic_wl_info *wl, int always_scan,
  */
 static void gelic_wl_scan_complete_event(struct gelic_wl_info *wl)
 {
+	struct gelic_wl_scan_info *target = NULL, *iter, *tmp;
 	struct gelic_eurus_cmd *cmd = NULL;
-	struct gelic_wl_scan_info *target, *tmp;
 	struct gelic_wl_scan_info *oldest = NULL;
 	struct gelic_eurus_scan_info *scan_info;
 	unsigned int scan_info_size;
 	union iwreq_data data;
 	unsigned long this_time = jiffies;
-	unsigned int data_len, i, found, r;
+	unsigned int data_len, i, r;
 	void *buf;
 
 	pr_debug("%s:start\n", __func__);
@@ -1539,14 +1539,14 @@ static void gelic_wl_scan_complete_event(struct gelic_wl_info *wl)
 	wl->scan_stat = GELIC_WL_SCAN_STAT_GOT_LIST;
 
 	/* mark all entries are old */
-	list_for_each_entry_safe(target, tmp, &wl->network_list, list) {
-		target->valid = 0;
+	list_for_each_entry_safe(iter, tmp, &wl->network_list, list) {
+		iter->valid = 0;
 		/* expire too old entries */
-		if (time_before(target->last_scanned + wl->scan_age,
+		if (time_before(iter->last_scanned + wl->scan_age,
 				this_time)) {
-			kfree(target->hwinfo);
-			target->hwinfo = NULL;
-			list_move_tail(&target->list, &wl->network_free_list);
+			kfree(iter->hwinfo);
+			iter->hwinfo = NULL;
+			list_move_tail(&iter->list, &wl->network_free_list);
 		}
 	}
 
@@ -1569,22 +1569,22 @@ static void gelic_wl_scan_complete_event(struct gelic_wl_info *wl)
 			continue;
 		}
 
-		found = 0;
+		target = NULL;
 		oldest = NULL;
-		list_for_each_entry(target, &wl->network_list, list) {
-			if (ether_addr_equal(&target->hwinfo->bssid[2],
+		list_for_each_entry(iter, &wl->network_list, list) {
+			if (ether_addr_equal(&iter->hwinfo->bssid[2],
 					     &scan_info->bssid[2])) {
-				found = 1;
+				target = iter;
 				pr_debug("%s: same BBS found scanned list\n",
 					 __func__);
 				break;
 			}
 			if (!oldest ||
-			    (target->last_scanned < oldest->last_scanned))
-				oldest = target;
+			    (iter->last_scanned < oldest->last_scanned))
+				oldest = iter;
 		}
 
-		if (!found) {
+		if (!target) {
 			/* not found in the list */
 			if (list_empty(&wl->network_free_list)) {
 				/* expire oldest */
-- 
2.25.1


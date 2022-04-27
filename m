Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D9E511C54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 18:17:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpP6X4l0Lz3fHR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 02:17:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QdO1SZDa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QdO1SZDa; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpNtz0sgbz3br1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 02:07:39 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id i27so4346464ejd.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 09:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vgJhsUA0t53G3i/our+ohO3psku9eyW28VU5QSKiZig=;
 b=QdO1SZDa4iev+atCa/l33RZOTYxU8Tm6OBJDuf3wFR1IPldpmE0Zz1hGsOF0mrH3tp
 Rrbgry+KLq2g5sBompEWvjwLxY/s/BnZGQGzzRqRqXLHBTYLUYGEpJu906ZngqiA10I2
 p881qc+TsKdacaJize2/DNjc/WdmBcRP99WCcLj6IETGvqy23i2A6EI4klZ1jjJeda8b
 SmmzFz4xtkLCcGeLFvx7Lz4Frop8YYjZXS/gLlZqdgiJGfMo9V1SPUpzzANTuBoVYNJK
 IlRCbSielt0CFTgv7ZMUDxqDNtKQ026XVmFIuWJY91BdH+nbOdJPWD/XeYlhk3N5g+Nu
 q1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vgJhsUA0t53G3i/our+ohO3psku9eyW28VU5QSKiZig=;
 b=Rstj8WG10tm+g1ItOmuzNNi379m89P84AQT6/ctBXhPzPsNO8B+b9lKILxLz8d1xLX
 6E/Yn2FQxpsAWrmt1sr7tSeDEmhZ/3vHfUETm6jtJZ+j/eGgaY33PC15WhExDIqGD0Pl
 +avNocdxB6tX8FZ3NapdvjuO7WRagjEajWjWp/+DwuQK04PxWTQryiQTae/JkhNxAcM/
 3qnZ4eaO0sbfCGFW41rBXpiugfvWb/cFijWOZjM2y7W3vh02O2reeQgwBiDTf66SOyf/
 vNtBxDgwbK7YT7hhJ9b/itlHH3ZWg/v/Z33pcO0as140H4v95CpBXkajeadAaAn3bqX+
 FQZQ==
X-Gm-Message-State: AOAM533DB3yOfsjMJPUC+UjZG/f27B1Yugpj7D1nsHKhSR5tRe0R2CJ+
 RnZ4KcRqtSX9SMkr+w9e9Qk=
X-Google-Smtp-Source: ABdhPJxySUvwtY5DIqWX7IFtrekY9kkCubgf/t3517/f4PE7o1mxgYeQStUpKexVIlQ/w9B/1wLAJg==
X-Received: by 2002:a17:907:7b8c:b0:6f3:a7d8:2609 with SMTP id
 ne12-20020a1709077b8c00b006f3a7d82609mr11153301ejc.53.1651075655941; 
 Wed, 27 Apr 2022 09:07:35 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 n5-20020a170906378500b006efb4ab6f59sm6984098ejc.86.2022.04.27.09.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 09:07:35 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v5 16/18] ps3_gelic: Replace usage of found with
 dedicated list iterator variable
Date: Wed, 27 Apr 2022 18:06:33 +0200
Message-Id: <20220427160635.420492-17-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427160635.420492-1-jakobkoschel@gmail.com>
References: <20220427160635.420492-1-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, Arnd Bergmann <arnd@arndb.de>,
 KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
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


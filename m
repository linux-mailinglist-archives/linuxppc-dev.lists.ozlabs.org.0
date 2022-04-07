Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D230F4F7D0F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:36:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYyV0524tz3dqc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:36:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WyOREzFf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b;
 helo=mail-ej1-x62b.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WyOREzFf; dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYyN16S7dz2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:31:13 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id p15so9868259ejc.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JrLemglUST4WORuuuukktAwV8TRd9yLyGflAl3xl1zc=;
 b=WyOREzFfzYbYbcLeB8gc+wwbWojyzKQUgWjvo9Vn4QjrT1rTi9xtZRj0mVTe0B62ty
 JXFIP3trzcbd5i4YgUkTx/ltYxiagR4lJ0OPxM8UZ70oCHJ3U4M1q+1xgHFrD4bt5BJu
 TiKC7QXqW1sLc9HcMLxVP8ka1LRg94eK2McleovX+8TrXVbFOYUeSQzlauxOhKRfjWJY
 SixUHMJIRmnVW8P6LuIOSHzRLMIs+tg9L7Uhkoxg7cmhWDV8O0CSoOfNs+uej8UgHtCJ
 chVqhJAWIKvd/EeXFL4roipes4cs7ySm//Jj4r0+/WkZNwrPvwjJG4Uu0Wmn0GRG5ang
 ZOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrLemglUST4WORuuuukktAwV8TRd9yLyGflAl3xl1zc=;
 b=iYIKMRutSlDFKGtzDKbKKEojiXolLXjLsloAqcQOpZ6r1aXS10FPxs+NsSua4ua400
 deQE7EJ6f+cvRsx+EQ1z3dcHj2hJeZLw0aQv2mCOGlh8O6R0xCQyEZ5rRsGpyY9aoosz
 DGq7BHALUvGAS15FtH/6As0h09IsSRLBQBdjKTXP2aGPb24jNY6ROaDj3hiva64OAsZ9
 tAdBqWi0ETcGRAJr0LPdnreWxVYzRluTR82VVj05MkYYesVYBZZr89wzctFTb9Pu8EaV
 x20BLMOofa5l7cfnNnVbieWWrbgK0lrfmedz30tAhPFZMBEv6WaiJliwzkVP/GBT9U8O
 ZA4A==
X-Gm-Message-State: AOAM531mZN+0RUNSgU4CZzaYVVUj5fHqEanqTJV8mftGZ9aV16a99vg9
 qmSx5mUzliY6YaxJKJkMnwc=
X-Google-Smtp-Source: ABdhPJyewobKoIhkiW69eTX4QUvvE84+KI1RURJxm+/w8jCuoRNuw9RkuPi9ipd1CcAlGrc9cXUJ5A==
X-Received: by 2002:a17:906:6a81:b0:6da:d7e5:4fa with SMTP id
 p1-20020a1709066a8100b006dad7e504famr12975794ejr.223.1649327471064; 
 Thu, 07 Apr 2022 03:31:11 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm7413573ejz.57.2022.04.07.03.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:31:10 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next 08/15] qed: Remove usage of list iterator variable
 after the loop
Date: Thu,  7 Apr 2022 12:28:53 +0200
Message-Id: <20220407102900.3086255-9-jakobkoschel@gmail.com>
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

Since "found" and "p_ent" need to be equal, "found" should be used
consistently to limit the scope of "p_ent" to the list traversal in
the future.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/ethernet/qlogic/qed/qed_spq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_spq.c b/drivers/net/ethernet/qlogic/qed/qed_spq.c
index d01b9245f811..cbaa2abed660 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_spq.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_spq.c
@@ -934,10 +934,10 @@ int qed_spq_completion(struct qed_hwfn *p_hwfn,
 		       u8 fw_return_code,
 		       union event_ring_data *p_data)
 {
+	struct qed_spq_entry	*found = NULL;
 	struct qed_spq		*p_spq;
-	struct qed_spq_entry	*p_ent = NULL;
+	struct qed_spq_entry	*p_ent;
 	struct qed_spq_entry	*tmp;
-	struct qed_spq_entry	*found = NULL;
 
 	if (!p_hwfn)
 		return -EINVAL;
@@ -980,7 +980,7 @@ int qed_spq_completion(struct qed_hwfn *p_hwfn,
 	DP_VERBOSE(p_hwfn, QED_MSG_SPQ,
 		   "Complete EQE [echo %04x]: func %p cookie %p)\n",
 		   le16_to_cpu(echo),
-		   p_ent->comp_cb.function, p_ent->comp_cb.cookie);
+		   found->comp_cb.function, found->comp_cb.cookie);
 	if (found->comp_cb.function)
 		found->comp_cb.function(p_hwfn, found->comp_cb.cookie, p_data,
 					fw_return_code);
-- 
2.25.1


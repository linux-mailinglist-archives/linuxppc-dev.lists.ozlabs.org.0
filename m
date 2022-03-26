Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 192E34E8376
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:44:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQntw0JDgz30NW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:44:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=jW5AjdYS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=H26TIaWM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=2001:19f0:5:15da:5400:3ff:fecc:7379;
 helo=stuerz.xyz; envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=jW5AjdYS; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=H26TIaWM; 
 dkim-atps=neutral
Received: from stuerz.xyz (stuerz.xyz
 [IPv6:2001:19f0:5:15da:5400:3ff:fecc:7379])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlbv75d0z3071
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:01:31 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 02397FBC11; Sat, 26 Mar 2022 17:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314090; bh=GR587e14fj7vyf0bO2BugLnbQ5EnAUU2jijqnxcsSs4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jW5AjdYSByRdLOX240+sHJxCgM2QeEUTMkSkZtNvLvFB033JNfa1bSbHVlgkImdlG
 J20nepjpe5eLQ+hB8qlD/dew46CRiGh/6rRjKWopeZNIjoW7qIrMHs4mZ5N/+LMtGR
 HQBi+TH4yP9yH/zJsksR8Sx+cfv0n7eQzl41Oe5UpfkQNeKbVfJmgCtjCfhq7xuwlW
 nDd4qJujUwto7MFYhx8H5+HWK8UuMnJsOuKJyOCunBBgnmkrC9SfH4qG8snDKzPVhs
 MXvZkc92QyDum3bawWqFr/m8pK2NfD+vwv8an8XmOjsNsyO0+Lz1gPLUXwmWRY6V/T
 M5PV4yPdX/PQQ==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id DE6B1FB7CD;
 Sat, 26 Mar 2022 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314086; bh=GR587e14fj7vyf0bO2BugLnbQ5EnAUU2jijqnxcsSs4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H26TIaWMVGKq4tF2BG6qu/hCDcSX611Q5whfiFBruI8g3h+nG8n0r8hl+xjhGpOnt
 PQcE6X6BljRd7Chbp7ruW2FXYT0H3sRliw60OtFCYiWyLfDIHA26MMP2RqHNdYHDTR
 HS1yhmuOKde/dOuNKaTBZoyMPKw5bD98diBrAE527OHu1i2BzjovAhDC2uvBAZA2s6
 xskXmBDZNrzcJPy6bNdGhMbm6vzJwoJjlyvtIAlLd06bRdZzTrA9sjn5qnKQxeCoI3
 PcMERwXpsbCKB8tvMkv2YuKpgOnTtiTZl4bKXlbzVnz1lPZMlhJZgrvK+w9hOqR2RZ
 mtoVK+uBYp/1Q==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 19/22] wnc36xx: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:59:06 +0100
Message-Id: <20220326165909.506926-19-benni@stuerz.xyz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326165909.506926-1-benni@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 05:40:34 +1100
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This replaces comments with C99's designated
initializers because the kernel supports them now.

Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
---
 drivers/net/wireless/ath/wcn36xx/main.c | 122 ++++++++++++------------
 1 file changed, 61 insertions(+), 61 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index 95ea7d040d8c..0fed64bd37b4 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -193,67 +193,67 @@ static inline u8 get_sta_index(struct ieee80211_vif *vif,
 }
 
 static const char * const wcn36xx_caps_names[] = {
-	"MCC",				/* 0 */
-	"P2P",				/* 1 */
-	"DOT11AC",			/* 2 */
-	"SLM_SESSIONIZATION",		/* 3 */
-	"DOT11AC_OPMODE",		/* 4 */
-	"SAP32STA",			/* 5 */
-	"TDLS",				/* 6 */
-	"P2P_GO_NOA_DECOUPLE_INIT_SCAN",/* 7 */
-	"WLANACTIVE_OFFLOAD",		/* 8 */
-	"BEACON_OFFLOAD",		/* 9 */
-	"SCAN_OFFLOAD",			/* 10 */
-	"ROAM_OFFLOAD",			/* 11 */
-	"BCN_MISS_OFFLOAD",		/* 12 */
-	"STA_POWERSAVE",		/* 13 */
-	"STA_ADVANCED_PWRSAVE",		/* 14 */
-	"AP_UAPSD",			/* 15 */
-	"AP_DFS",			/* 16 */
-	"BLOCKACK",			/* 17 */
-	"PHY_ERR",			/* 18 */
-	"BCN_FILTER",			/* 19 */
-	"RTT",				/* 20 */
-	"RATECTRL",			/* 21 */
-	"WOW",				/* 22 */
-	"WLAN_ROAM_SCAN_OFFLOAD",	/* 23 */
-	"SPECULATIVE_PS_POLL",		/* 24 */
-	"SCAN_SCH",			/* 25 */
-	"IBSS_HEARTBEAT_OFFLOAD",	/* 26 */
-	"WLAN_SCAN_OFFLOAD",		/* 27 */
-	"WLAN_PERIODIC_TX_PTRN",	/* 28 */
-	"ADVANCE_TDLS",			/* 29 */
-	"BATCH_SCAN",			/* 30 */
-	"FW_IN_TX_PATH",		/* 31 */
-	"EXTENDED_NSOFFLOAD_SLOT",	/* 32 */
-	"CH_SWITCH_V1",			/* 33 */
-	"HT40_OBSS_SCAN",		/* 34 */
-	"UPDATE_CHANNEL_LIST",		/* 35 */
-	"WLAN_MCADDR_FLT",		/* 36 */
-	"WLAN_CH144",			/* 37 */
-	"NAN",				/* 38 */
-	"TDLS_SCAN_COEXISTENCE",	/* 39 */
-	"LINK_LAYER_STATS_MEAS",	/* 40 */
-	"MU_MIMO",			/* 41 */
-	"EXTENDED_SCAN",		/* 42 */
-	"DYNAMIC_WMM_PS",		/* 43 */
-	"MAC_SPOOFED_SCAN",		/* 44 */
-	"BMU_ERROR_GENERIC_RECOVERY",	/* 45 */
-	"DISA",				/* 46 */
-	"FW_STATS",			/* 47 */
-	"WPS_PRBRSP_TMPL",		/* 48 */
-	"BCN_IE_FLT_DELTA",		/* 49 */
-	"TDLS_OFF_CHANNEL",		/* 51 */
-	"RTT3",				/* 52 */
-	"MGMT_FRAME_LOGGING",		/* 53 */
-	"ENHANCED_TXBD_COMPLETION",	/* 54 */
-	"LOGGING_ENHANCEMENT",		/* 55 */
-	"EXT_SCAN_ENHANCED",		/* 56 */
-	"MEMORY_DUMP_SUPPORTED",	/* 57 */
-	"PER_PKT_STATS_SUPPORTED",	/* 58 */
-	"EXT_LL_STAT",			/* 60 */
-	"WIFI_CONFIG",			/* 61 */
-	"ANTENNA_DIVERSITY_SELECTION",	/* 62 */
+	[0]  = "MCC",
+	[1]  = "P2P",
+	[2]  = "DOT11AC",
+	[3]  = "SLM_SESSIONIZATION",
+	[4]  = "DOT11AC_OPMODE",
+	[5]  = "SAP32STA",
+	[6]  = "TDLS",
+	[7]  = "P2P_GO_NOA_DECOUPLE_INIT_SCAN",
+	[8]  = "WLANACTIVE_OFFLOAD",
+	[9]  = "BEACON_OFFLOAD",
+	[10] = "SCAN_OFFLOAD",
+	[11] = "ROAM_OFFLOAD",
+	[12] = "BCN_MISS_OFFLOAD",
+	[13] = "STA_POWERSAVE",
+	[14] = "STA_ADVANCED_PWRSAVE",
+	[15] = "AP_UAPSD",
+	[16] = "AP_DFS",
+	[17] = "BLOCKACK",
+	[18] = "PHY_ERR",
+	[19] = "BCN_FILTER",
+	[20] = "RTT",
+	[21] = "RATECTRL",
+	[22] = "WOW",
+	[23] = "WLAN_ROAM_SCAN_OFFLOAD",
+	[24] = "SPECULATIVE_PS_POLL",
+	[25] = "SCAN_SCH",
+	[26] = "IBSS_HEARTBEAT_OFFLOAD",
+	[27] = "WLAN_SCAN_OFFLOAD",
+	[28] = "WLAN_PERIODIC_TX_PTRN",
+	[29] = "ADVANCE_TDLS",
+	[30] = "BATCH_SCAN",
+	[31] = "FW_IN_TX_PATH",
+	[32] = "EXTENDED_NSOFFLOAD_SLOT",
+	[33] = "CH_SWITCH_V1",
+	[34] = "HT40_OBSS_SCAN",
+	[35] = "UPDATE_CHANNEL_LIST",
+	[36] = "WLAN_MCADDR_FLT",
+	[37] = "WLAN_CH144",
+	[38] = "NAN",
+	[39] = "TDLS_SCAN_COEXISTENCE",
+	[40] = "LINK_LAYER_STATS_MEAS",
+	[41] = "MU_MIMO",
+	[42] = "EXTENDED_SCAN",
+	[43] = "DYNAMIC_WMM_PS",
+	[44] = "MAC_SPOOFED_SCAN",
+	[45] = "BMU_ERROR_GENERIC_RECOVERY",
+	[46] = "DISA",
+	[47] = "FW_STATS",
+	[48] = "WPS_PRBRSP_TMPL",
+	[49] = "BCN_IE_FLT_DELTA",
+	[51] = "TDLS_OFF_CHANNEL",
+	[52] = "RTT3",
+	[53] = "MGMT_FRAME_LOGGING",
+	[54] = "ENHANCED_TXBD_COMPLETION",
+	[55] = "LOGGING_ENHANCEMENT",
+	[56] = "EXT_SCAN_ENHANCED",
+	[57] = "MEMORY_DUMP_SUPPORTED",
+	[58] = "PER_PKT_STATS_SUPPORTED",
+	[60] = "EXT_LL_STAT",
+	[61] = "WIFI_CONFIG",
+	[62] = "ANTENNA_DIVERSITY_SELECTION",
 };
 
 static const char *wcn36xx_get_cap_name(enum place_holder_in_cap_bitmap x)
-- 
2.35.1


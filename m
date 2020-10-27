Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B31D29CCA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 00:21:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLSPr6DzWzDqFK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:21:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=fnnyXMra; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=LhRto8Gj; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRrq3k1jzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:56:11 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUnXmlM0pClR2oSFLL6eEWvAWYA2QW+YiY+0XjVZIZk=;
 b=fnnyXMraO7p09sICaO22cniixEyjU6BSK7GQa102YZaPqJxYBdda0nB0KIVATJejAL2/uz
 dwW8QXz8mYyHf6wvdEv7B65G3nJKntzU59jdHqIxSRlqilM5Vpr2wvnrE51RINrrYRVHRe
 PYThagWLiHUWO7FhC2mnHwrFy3IVdjNUgiL/XlYmlMRWAIK8uRUEfGiNl6/NLx6ZPnjmoB
 m4EKy+VbBc7Z5MDc3k5wsXGmgmNm3efPQ927+tdFrQs6gVq2oP42ouJmxLfX8u0K7yq3H2
 VBX44HdWy79z0/CZfIzePmm3knhG8C2g58k2rdVTD1aHkbRQndTEpRqc79jH7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUnXmlM0pClR2oSFLL6eEWvAWYA2QW+YiY+0XjVZIZk=;
 b=LhRto8GjrXrS3x1WtqyEzaR2oSLcCb9lDG0/JNGC54mzzO12yMUMHiL7FS5TIt+/eyI4fV
 suVt8QjXdQk+iCAw==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 12/15] net: rtlwifi: Remove in_interrupt() usage in
 halbtc_send_bt_mp_operation()
Date: Tue, 27 Oct 2020 23:54:51 +0100
Message-Id: <20201027225454.3492351-13-bigeasy@linutronix.de>
In-Reply-To: <20201027225454.3492351-1-bigeasy@linutronix.de>
References: <20201027225454.3492351-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Zhu Yanjun <zyjzyj2000@gmail.com>, Samuel Chessman <chessman@tux.org>,
 Ping-Ke Shih <pkshih@realtek.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 linux-rdma@vger.kernel.org, Rain River <rain.1986.08.12@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Ulrich Kunitz <kune@deine-taler.de>,
 Jouni Malinen <j@w1.fi>, Daniel Drake <dsd@gentoo.org>,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Leon Romanovsky <leon@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, linux-crypto@vger.kernel.org,
 Jon Mason <jdmason@kudzu.us>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

halbtc_send_bt_mp_operation() uses in_interrupt() to determine if it is
safe to invoke wait_for_completion().

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

Aside of that in_interrupt() is not correct as it does not catch preempt
disabled regions which neither can sleep.

halbtc_send_bt_mp_operation() is called from:

 rtl_watchdog_wq_callback()
   rtl_btc_periodical()
     halbtc_get()
       case BTC_GET_U4_BT_PATCH_VER:
         halbtc_get_bt_patch_version()

 which is preemtible context.

   rtl_c2h_content_parsing()
     btc_ops->btc_btinfo_notify()
       rtl_btc_btinfo_notify()
         exhalbtc_bt_info_notify()
           ex_btc8723b1ant_bt_info_notify()
	   ex_btc8821a1ant_bt_info_notify()
	   ex_btc8821a2ant_bt_info_notify()
             btcoexist->btc_set_bt_reg()
               halbtc_set_bt_reg()

   rtl_c2h_content_parsing() is in turn called from:

   rtl_c2hcmd_wq_callback()
     rtl_c2hcmd_launcher()

   which is preemptible context and from:

   _rtl_pci_rx_interrupt
     rtl_c2hcmd_enqueue()

   which is obviously not preemptible but limited to C2H_BT_MP commands
   which does invoke rtl_c2h_content_parsing().

Aside of that it can be reached from:

     halbtc_get()
       case BTC_GET_U4_SUPPORTED_FEATURE:
         halbtc_get_bt_coex_supported_feature()
       case BTC_GET_U4_BT_FORBIDDEN_SLOT_VAL:
         halbtc_get_bt_forbidden_slot_val()
       case BTC_GET_U4_BT_DEVICE_INFO:
         halbtc_get_bt_device_info()
       case BTC_GET_U4_SUPPORTED_VERSION:
         halbtc_get_bt_coex_supported_version()
       case BTC_GET_U4_SUPPORTED_FEATURE:
         halbtc_get_bt_coex_supported_feature()

   btcoexist->btc_get_bt_afh_map_from_bt()
     halbtc_get_bt_afh_map_from_bt()

   btcoexist->btc_get_ble_scan_para_from_bt()
     halbtc_get_ble_scan_para_from_bt()

   btcoexist->btc_get_ble_scan_type_from_bt()
     halbtc_get_ble_scan_type_from_bt()

   btcoexist->btc_get_ant_det_val_from_bt()
     halbtc_get_ant_det_val_from_bt()

   btcoexist->btc_get_bt_coex_supported_version()
     halbtc_get_bt_coex_supported_version()

   btcoexist->btc_get_bt_coex_supported_feature()
     halbtc_get_bt_coex_supported_feature()

None of these have a caller. Welcome to the wonderful world of HALs and
onion layers.

Remove in_interrupt() check.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Ping-Ke Shih <pkshih@realtek.com>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
---
 drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c =
b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
index 2155a6699ef8d..be4c0e60d44d1 100644
--- a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
@@ -240,9 +240,6 @@ bool halbtc_send_bt_mp_operation(struct btc_coexist *bt=
coexist, u8 op_code,
 	rtl_dbg(rtlpriv, COMP_BT_COEXIST, DBG_LOUD,
 		"btmpinfo wait req_num=3D%d wait=3D%ld\n", req_num, wait_ms);
=20
-	if (in_interrupt())
-		return false;
-
 	if (wait_for_completion_timeout(&btcoexist->bt_mp_comp,
 					msecs_to_jiffies(wait_ms)) =3D=3D 0) {
 		rtl_dbg(rtlpriv, COMP_BT_COEXIST, DBG_DMESG,
--=20
2.28.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BF429CC9F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 00:16:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLSJK1QjPzDqTW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:16:33 +1100 (AEDT)
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
 header.s=2020 header.b=S1Go9+9X; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=gge+wRRs; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRrn1yZMzDqPK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:56:09 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYBcnGuL2Fv6XeYcZjE3LkVMNVEGa0a3exz1vREKTcg=;
 b=S1Go9+9Xp1GErdJCi+ANF4TEINcRzr4AAM9/EjAfOm4GEAFc0SAG0j54/KDBMytSqwvQfq
 RGUaLHTTjqE0QRPwHdSY+UdOuUmep7RPNXzM9oAi28hssNsjf7kGpFSOVeeC1JUfcKe6tz
 bR/M0svDfG+smM3ZkcyuGLBREabdElvv/1cqPEpYchufXaGju3kscLwxVoombjHcDLxGdO
 oqwvAjv2MmmHX2ZyDbISyl2mOuqmVj4hqglUIjxYCWCaCuU8KT/Chcnr+/MNAaCO88JXQr
 vI1oB6Vkr8DY8OB3gr9Gp9LXg4bJyq5R50D4HAWZbvQWxrJvOHM+5ztGg+8i2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYBcnGuL2Fv6XeYcZjE3LkVMNVEGa0a3exz1vREKTcg=;
 b=gge+wRRsIsf6uzGIOrNEXhKbIkqdyeWoXun2w3tqw/cLzNfabNyfNxT4gS/Gwym/a3kk4u
 vFpUXoU8eg4F39DA==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 11/15] net: rtlwifi: Remove in_interrupt() usage in
 is_any_client_connect_to_ap().
Date: Tue, 27 Oct 2020 23:54:50 +0100
Message-Id: <20201027225454.3492351-12-bigeasy@linutronix.de>
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

is_any_client_connect_to_ap() is using in_interrupt() to determine whether
it should acquire the lock prior accessing the list.

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

The function is called from:

    - halbtc_get()

    - halbtc_get()
        halbtc_get_wifi_link_status()

    - halbtc_display_dbg_msg()
	halbtc_display_wifi_status()
          halbtc_get_wifi_link_status()

All top level callers are part of the btc_coexist callback inferface and
are never invoked from a context which can hold the lock already.

The contexts which hold the lock are either protecting list add/del
operations or list walks which never call into any of the btc_coexist
interfaces.

In fact the conditional is outright dangerous because if this function
would be invoked from a BH disabled context the check would avoid taking
the lock while on another CPU the list could be manipulated under the lock.

Remove the in_interrupt() check and always acquire the lock.

To simplify the code further use list_empty() instead of walking the list
and counting the entries just to check the count for > 0 at the end.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Ping-Ke Shih <pkshih@realtek.com>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
---
 .../realtek/rtlwifi/btcoexist/halbtcoutsrc.c  | 25 +++++--------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c =
b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
index 2c05369b79e4d..2155a6699ef8d 100644
--- a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
@@ -47,30 +47,17 @@ static bool is_any_client_connect_to_ap(struct btc_coex=
ist *btcoexist)
 {
 	struct rtl_priv *rtlpriv =3D btcoexist->adapter;
 	struct rtl_mac *mac =3D rtl_mac(rtlpriv);
-	struct rtl_sta_info *drv_priv;
-	u8 cnt =3D 0;
+	bool ret =3D false;
=20
 	if (mac->opmode =3D=3D NL80211_IFTYPE_ADHOC ||
 	    mac->opmode =3D=3D NL80211_IFTYPE_MESH_POINT ||
 	    mac->opmode =3D=3D NL80211_IFTYPE_AP) {
-		if (in_interrupt() > 0) {
-			list_for_each_entry(drv_priv, &rtlpriv->entry_list,
-					    list) {
-				cnt++;
-			}
-		} else {
-			spin_lock_bh(&rtlpriv->locks.entry_list_lock);
-			list_for_each_entry(drv_priv, &rtlpriv->entry_list,
-					    list) {
-				cnt++;
-			}
-			spin_unlock_bh(&rtlpriv->locks.entry_list_lock);
-		}
+		spin_lock_bh(&rtlpriv->locks.entry_list_lock);
+		if (!list_empty(&rtlpriv->entry_list))
+			ret =3D true;
+		spin_unlock_bh(&rtlpriv->locks.entry_list_lock);
 	}
-	if (cnt > 0)
-		return true;
-	else
-		return false;
+	return ret;
 }
=20
 static bool halbtc_legacy(struct rtl_priv *adapter)
--=20
2.28.0


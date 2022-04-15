Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E255029BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 14:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kfwft01sfz3bZy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 22:31:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bik80RG5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bik80RG5; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfwfL0fgNz2yn1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 22:30:49 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id lc2so15095148ejb.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cM7cNDbZdzDRR54XOLUdiPP1jrQ7jBG9dEAYVsbcNLE=;
 b=bik80RG5BJTj91DXG4BprsO4mTgco6QGIGjMUUl1T6dHSIeviC5xOCFZG/C6Qu1H0o
 w0Wyqs2Jkg/jOvbH5xOVandyeLruRMdekZJKLlTYeZj9IvKfZ4VgGlUM03zWK2uj2yKW
 S7oTi0BiBI7hnkPTSfm2Ov2T4+2baYv+e+Eo1397jsaVCR5jVGXSGWvric8XNDkHm+qz
 2xsaNdKknQV8mDknd2sO1NRdYlgNHbPAKF6m3kIPTUthoFPBKCntItTshu/lAaNGZrp8
 X0tRh9j1wd6I4bAGXyH+CGQrKM/ETEt9Xq8lniL+7bIH88uGUvb2xi1fnTOo9RTqqdZS
 H4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cM7cNDbZdzDRR54XOLUdiPP1jrQ7jBG9dEAYVsbcNLE=;
 b=ChlWt0xrLozA7oZFcA/Swrw1AACtlNCxVPo+SXrJzttnMyldesVznHljkAo4tY0iMd
 DnOgkiZsJtmqqBjDNB5J83fDFntBCrHL8y/GgmxFKraSUtBbdHAL3tvuoF8pxWk+ln4j
 n9Z31xWp02DPy+AeJeosRhjsTTKGqBFZYkItaJrdCB9vcV0fFhBpCn7hydHSygtv10Vj
 +t6riJMfp44IAiEv1i5+O+vJLHW3i4mSyGrlz43z0pw3fl2uj6gbxckqNYcePncdMvDc
 MT7NTNpSLYP5QQSH+SiWrYLZlIn+iKwnf5apd+nfy1kKD2xqI7Xs441JdbJ7GTCQttrk
 OTFg==
X-Gm-Message-State: AOAM530DYY01xid8oEqrA7Vz3d47XhiWWw9jla5sVXzUfisSQArUvK4O
 LbO1f8f3MSQR5idI04ChpSQ=
X-Google-Smtp-Source: ABdhPJyDoVWG26VAB7SBkp1JY1foVvcNpUoGUFZg6AUnrhSJ8MrmB1N6dz6LykMqhp6U5q2nqjcU7Q==
X-Received: by 2002:a17:907:3e0d:b0:6e8:cccd:de80 with SMTP id
 hp13-20020a1709073e0d00b006e8cccdde80mr6017929ejc.162.1650025846062; 
 Fri, 15 Apr 2022 05:30:46 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1649533ejb.194.2022.04.15.05.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 05:30:45 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v4 01/18] connector: Replace usage of found with
 dedicated list iterator variable
Date: Fri, 15 Apr 2022 14:29:30 +0200
Message-Id: <20220415122947.2754662-2-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415122947.2754662-1-jakobkoschel@gmail.com>
References: <20220415122947.2754662-1-jakobkoschel@gmail.com>
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
 "Bos, H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
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
 drivers/connector/cn_queue.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/connector/cn_queue.c b/drivers/connector/cn_queue.c
index 996f025eb63c..ed77599b0b25 100644
--- a/drivers/connector/cn_queue.c
+++ b/drivers/connector/cn_queue.c
@@ -92,20 +92,19 @@ int cn_queue_add_callback(struct cn_queue_dev *dev, const char *name,
 
 void cn_queue_del_callback(struct cn_queue_dev *dev, const struct cb_id *id)
 {
-	struct cn_callback_entry *cbq, *n;
-	int found = 0;
+	struct cn_callback_entry *cbq = NULL, *iter, *n;
 
 	spin_lock_bh(&dev->queue_lock);
-	list_for_each_entry_safe(cbq, n, &dev->queue_list, callback_entry) {
-		if (cn_cb_equal(&cbq->id.id, id)) {
-			list_del(&cbq->callback_entry);
-			found = 1;
+	list_for_each_entry_safe(iter, n, &dev->queue_list, callback_entry) {
+		if (cn_cb_equal(&iter->id.id, id)) {
+			list_del(&iter->callback_entry);
+			cbq = iter;
 			break;
 		}
 	}
 	spin_unlock_bh(&dev->queue_lock);
 
-	if (found)
+	if (cbq)
 		cn_queue_release_callback(cbq);
 }
 
-- 
2.25.1


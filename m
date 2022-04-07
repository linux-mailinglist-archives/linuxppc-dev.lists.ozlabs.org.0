Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 347CE4F7D0C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:35:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYySc0mWTz3cBF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:35:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mPVBrjND;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531;
 helo=mail-ed1-x531.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mPVBrjND; dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYyMz6hhkz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:31:11 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id x20so5833807edi.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f1NofSwJuKbiTcVP4Eyds36Vn/5/VoS2zfBkRtVaGBU=;
 b=mPVBrjNDRSKFnXBMjokClolP1gEqY1f/xNBXpmGUphbGpB86gSOCxQ36CB3FM/eiSJ
 wS6Oq6p6OOEp2onWQFVvJfzHdDVgU5bhd0XCuop5GfAiPYRGakMDZECfd+gruNOQC1Ge
 PxxACeDIhJvtKRA5qdzwIpJlPWLC0H5MfHABv80edUIN+HSDRJfOwMzzCqgZvCnYSelJ
 xRQdIckbsBzYUjsESqCIR7w5Q9oT+83Xgd0J+1FEZ2pj0LeKzxs/lR2wx9wVfizJCkbB
 VUvsxW7NV6nZ4ER1ZxSao5e/dZhFrAZTVjRRP5Gv4ON3wQrlZ6XfoyO4+bnzr9NNzzOX
 DSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f1NofSwJuKbiTcVP4Eyds36Vn/5/VoS2zfBkRtVaGBU=;
 b=iAco1S3RUoCpZ3Sdo/Kvj2SUpBZ7Bzp6FFxfdiGoCvpOwkmbrhX9Cka5ksVyp140jm
 tLNrUmB1EthlzceB152HjOsG7HQqf8tD1niAwC45Hl3a7ufO+7GQzeB8TAbXdxuQCyYl
 WrV55kb6SMunPI/LG39WlKR0LKnOkkyysqE//38WqrAPtP1Mj4VuzXK4LBnleHkCsMG3
 WLU24RMVvr5XtOp0vEnulyltAt9mCRfqVmdQltNZ23JomMh7h+CeDNaKWUMEA6ELejxF
 uzoLV8VItpEnQEdbwLUy20ws03SLVe0G9TqxogYQd7++eZD6eILLdeyfkpjf+E76G3dn
 lnIA==
X-Gm-Message-State: AOAM533DinLV0u/PFbKbl/5KzgDjgo6o87ZgJXFpzhCZxB5RL5Bdeh/p
 WAVaFZyfQBYnCjK+t4kAJjo=
X-Google-Smtp-Source: ABdhPJxhyOLOUaA05vo+Xl63Y34SMUPml4tHedyJPbBGpSZT1vRmx0YR+uDsfyLsMnlqwc+LyQPpyw==
X-Received: by 2002:a05:6402:350d:b0:419:547f:134a with SMTP id
 b13-20020a056402350d00b00419547f134amr13733726edd.405.1649327468259; 
 Thu, 07 Apr 2022 03:31:08 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm7413573ejz.57.2022.04.07.03.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:31:07 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next 06/15] qed: Use dedicated list iterator variable
Date: Thu,  7 Apr 2022 12:28:51 +0200
Message-Id: <20220407102900.3086255-7-jakobkoschel@gmail.com>
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
concluded to use a separate iterator variable [1].

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/ethernet/qlogic/qed/qed_dev.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dev.c b/drivers/net/ethernet/qlogic/qed/qed_dev.c
index 672480c9d195..e920e7dcf66a 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dev.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dev.c
@@ -174,7 +174,7 @@ int qed_db_recovery_add(struct qed_dev *cdev,
 int qed_db_recovery_del(struct qed_dev *cdev,
 			void __iomem *db_addr, void *db_data)
 {
-	struct qed_db_recovery_entry *db_entry = NULL;
+	struct qed_db_recovery_entry *db_entry = NULL, *iter;
 	struct qed_hwfn *p_hwfn;
 	int rc = -EINVAL;
 
@@ -190,12 +190,13 @@ int qed_db_recovery_del(struct qed_dev *cdev,
 
 	/* Protect the list */
 	spin_lock_bh(&p_hwfn->db_recovery_info.lock);
-	list_for_each_entry(db_entry,
+	list_for_each_entry(iter,
 			    &p_hwfn->db_recovery_info.list, list_entry) {
 		/* search according to db_data addr since db_addr is not unique (roce) */
-		if (db_entry->db_data == db_data) {
-			qed_db_recovery_dp_entry(p_hwfn, db_entry, "Deleting");
-			list_del(&db_entry->list_entry);
+		if (iter->db_data == db_data) {
+			qed_db_recovery_dp_entry(p_hwfn, iter, "Deleting");
+			list_del(&iter->list_entry);
+			db_entry = iter;
 			rc = 0;
 			break;
 		}
-- 
2.25.1


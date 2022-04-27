Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2AA511C44
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 18:13:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpP1R0dstz3dsq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 02:13:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FMGbpYNN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FMGbpYNN; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpNtn0ZWXz3bhQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 02:07:29 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id i27so4345522ejd.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 09:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f1NofSwJuKbiTcVP4Eyds36Vn/5/VoS2zfBkRtVaGBU=;
 b=FMGbpYNN25F29l+OAZ0oU2BSV4UFQJQ8hALv0efMdnT1md03Ok8yKVBi1uKWmXTXYr
 8a9N8bN4djVpu+rhkHyFNvsW7gx582gKpIIKhML+MK8K+3O12xCutoBlK02J44kqEg9p
 FxMeGTrpDvinkZIEnIngkY0Q7JkNGcaS/bxLY5uu2ICywIuSjpgLHl0VL7EiP7CCymSZ
 sSn5E8X+YJyjuSjXYZ8D0DrNxo/9SZLC9+ii96+bsyqSnU7Ed9OH5SSGM/QEiT4TSXyM
 rkSYO4NHWuqn73Ql8mLCthpWscg4aPdcFDI2cCxtAKq7gLV4kgH6rvuF/haYkBEgILrA
 faaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f1NofSwJuKbiTcVP4Eyds36Vn/5/VoS2zfBkRtVaGBU=;
 b=y7gW46BD4zRunumb4qks8Mi7GEpOhmHTYaJ5JtNY2XqFehkyf5v3N4QpK7KHWrUlmY
 JMjDnPbVArSgJ3DheXECr8nTt2NFO0aLln1pLZr/XL+XyX6xC+C2fNqKBMo+PvMi1KMK
 FSJFldjRaQrURoK3mnH4MZpXjYuOgHV2ZB6MjEaEvCSi64Z19k7FTbzjBUW8dENfAR69
 FD3u5H6r6fuPNslOnEYuv+icLGiNrX9G3XEUyMkEfRiCQgmzH3d8CbueZRsrqot4U74y
 m+BU3HxOyLQLHn1rciD+g+I9K+gB7+6MIJbBHgRIN9Y0RkFURfdyNLgESd8ATiH51/m4
 EMYQ==
X-Gm-Message-State: AOAM530yFbjMzLbbz5y2MQu6wIdd3xPF3IuwdIW0ThM4DcHXbeF8Mot+
 JOeOvp+fQpHpOCnxCyjGM5E=
X-Google-Smtp-Source: ABdhPJwIhJiLJw69ilI7ZBKSX+zC1iXAarfAnk0c8Ge8xoFbIVAxNWeUGJZz0HlsPZ83L0cvGrZ8xQ==
X-Received: by 2002:a17:907:c0c:b0:6f3:8667:9be4 with SMTP id
 ga12-20020a1709070c0c00b006f386679be4mr18859070ejc.325.1651075646215; 
 Wed, 27 Apr 2022 09:07:26 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 n5-20020a170906378500b006efb4ab6f59sm6984098ejc.86.2022.04.27.09.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 09:07:25 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v5 09/18] qed: Use dedicated list iterator variable
Date: Wed, 27 Apr 2022 18:06:26 +0200
Message-Id: <20220427160635.420492-10-jakobkoschel@gmail.com>
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


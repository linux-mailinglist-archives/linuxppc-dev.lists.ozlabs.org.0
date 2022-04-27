Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A70511C48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 18:13:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpP2709Byz3cfr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 02:13:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dydbqc5J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629;
 helo=mail-ej1-x629.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dydbqc5J; dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpNtp6r8Dz3bp3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 02:07:30 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id i27so4345665ejd.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LXuHnml0JyQ7WUWtSyqxCdcrvdOAihH7ECEcB+ac3FQ=;
 b=dydbqc5J60BLLi30zbMUbH7rkOREmVuwqXYM7KqyVJ5PTePK07uL1it2F3ppOULrQp
 XOnGBiUiY9fCOnKmRENfByrA63YlpbGpanCw0uQnd+ZXKWb23Fe+VUM+HBSvz3hbwYb0
 fxxJkdmou9OPPb6NqqihMEGz7guVzyP7lwViOWdEg5SiEssRFwqsPO1dwSNHPc6DCXEQ
 WAwUQSN/dMR6z/a2sieXWO8H3XWqgFIVTl5X+QYo6IQ1GO4xbn9k1OYHY55/FLUVZJaQ
 unv/NKd2hSzV1Yo9IFcRabSOEMNPfdQuZFplMoMO96GBvThfkSmcQUo5mcHy0G6nPCHE
 39gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXuHnml0JyQ7WUWtSyqxCdcrvdOAihH7ECEcB+ac3FQ=;
 b=YOycCRgl/C7znI7OAcbPpwWPRfUc2mJA19VvvtJEks6fy8CarjKjltiyuSaguFbf3c
 lxr2OOtalaoxDkZ3mzp+94S164uww26j1EeypCiReSUG9gte6pjFf2QqLAFp4HZvPuXe
 qJVSncW3+tw9D2G1ReBZOohF+gN9W9rh2iIW5bu2rLWCUxs8DFsq0avEnSZXJ0tB60JI
 I88x6wf5SDmaGYNSTIJVaQnw+BacYRZdEk4WJlW7/PEKQQc0E8D8FlUy4VTpLbh0Nl6G
 7ekb6cZldgKBBiR3B8WYKKeOOVoUOdDukPJl5SKAEqq50erbtfrRMbmZ3DrhrqW+97dC
 ddbw==
X-Gm-Message-State: AOAM5321quN+6snLqkW7Y2lMmdLZvvSQ/OnABTYqx2lbDjPkjTdcO3uO
 DvEfFnbYMEVy00LxRZKTliU=
X-Google-Smtp-Source: ABdhPJy3vcafoHiVPbX6lh1POBOoAQAfG6usQdpjwle19kzFa7yL07Q0av8Z+KNsAtfAW8A2iujkhw==
X-Received: by 2002:a17:907:3f02:b0:6f3:5c42:321a with SMTP id
 hq2-20020a1709073f0200b006f35c42321amr25692644ejc.521.1651075647581; 
 Wed, 27 Apr 2022 09:07:27 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 n5-20020a170906378500b006efb4ab6f59sm6984098ejc.86.2022.04.27.09.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 09:07:27 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v5 10/18] qed: Replace usage of found with dedicated
 list iterator variable
Date: Wed, 27 Apr 2022 18:06:27 +0200
Message-Id: <20220427160635.420492-11-jakobkoschel@gmail.com>
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
 drivers/net/ethernet/qlogic/qed/qed_iwarp.c | 26 ++++++++++-----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_iwarp.c b/drivers/net/ethernet/qlogic/qed/qed_iwarp.c
index 1d1d4caad680..198c9321bf51 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_iwarp.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_iwarp.c
@@ -1630,38 +1630,36 @@ static struct qed_iwarp_listener *
 qed_iwarp_get_listener(struct qed_hwfn *p_hwfn,
 		       struct qed_iwarp_cm_info *cm_info)
 {
-	struct qed_iwarp_listener *listener = NULL;
+	struct qed_iwarp_listener *listener = NULL, *iter;
 	static const u32 ip_zero[4] = { 0, 0, 0, 0 };
-	bool found = false;
 
-	list_for_each_entry(listener,
+	list_for_each_entry(iter,
 			    &p_hwfn->p_rdma_info->iwarp.listen_list,
 			    list_entry) {
-		if (listener->port == cm_info->local_port) {
-			if (!memcmp(listener->ip_addr,
+		if (iter->port == cm_info->local_port) {
+			if (!memcmp(iter->ip_addr,
 				    ip_zero, sizeof(ip_zero))) {
-				found = true;
+				listener = iter;
 				break;
 			}
 
-			if (!memcmp(listener->ip_addr,
+			if (!memcmp(iter->ip_addr,
 				    cm_info->local_ip,
 				    sizeof(cm_info->local_ip)) &&
-			    (listener->vlan == cm_info->vlan)) {
-				found = true;
+			    iter->vlan == cm_info->vlan) {
+				listener = iter;
 				break;
 			}
 		}
 	}
 
-	if (found) {
+	if (listener)
 		DP_VERBOSE(p_hwfn, QED_MSG_RDMA, "listener found = %p\n",
 			   listener);
-		return listener;
-	}
+	else
+		DP_VERBOSE(p_hwfn, QED_MSG_RDMA, "listener not found\n");
 
-	DP_VERBOSE(p_hwfn, QED_MSG_RDMA, "listener not found\n");
-	return NULL;
+	return listener;
 }
 
 static int
-- 
2.25.1


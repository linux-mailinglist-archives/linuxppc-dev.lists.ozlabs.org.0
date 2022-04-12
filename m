Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9EA4FDF58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 14:19:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd4Y64jwYz3cMH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 22:19:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ijr9vklL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533;
 helo=mail-ed1-x533.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ijr9vklL; dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd4TD2wykz2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 22:16:32 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id g20so22087612edw.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3KCYsQY/y5IS+uLLSbczPyROpjTi5JnKwjdboy6JQyM=;
 b=Ijr9vklL6LjkEtOCaT7sYYYQ1JtbZJC3Vy+rq3yG6nRRVMc9KwA9fVYAQM2QFTx3te
 fA1fdxQAVJvrSYrECndrbRE75qFl+qYh4CO9rfv6QEvMfAf7QnFmHXNnBigOrqmZJFOj
 4YFuDyMa9pgKJlDwAQkTL5NHD33vXD2ad8/cyrUHQlsd5F4ff9rtdkpiSkpcKzyPAOSF
 sRw6w9Klo7XF16I3sOPabF2X5GAPATD0n1zRQUytlwLqAGtEd6JESH2eQYsGbcMN9PhZ
 UHZQf2fjN7DU1F9cL1t6h/PD8w2/WDFIIMq7ZuEcgxcoRWfNY7eMnrF1MAxkvIJVI6/y
 eYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3KCYsQY/y5IS+uLLSbczPyROpjTi5JnKwjdboy6JQyM=;
 b=Z3P9hHj17Phhuz+Dx9CLiLZaKEZLNoASteyWtHFaOTXXpiVfqFNn6eN7HSXe2lXoWP
 D+v6i+Xs14YxihJuLxvp/rd+9M8+eRQ2vqd7px33blY0Xwn9LgGLuXqNlBzDcj203lIV
 NoAHd2EC8Rr4CSCQlG/kXkLUvBQsCiZBvSTWT/FxvpzNOf4IOLvkSw2v9OFbTKsklqB1
 c+zCCBwWrUqawtUVLxYH679MJifELvoDIwiwZBi5HSnJ6TytizYw4utJFfO2uH8uE8hy
 6GY1Ju4OR9x50S/6Oept78YjxmhNIAM56zoINmr7rpl1zAvqW4RlEwdMpfRujf9/W3iF
 +lIQ==
X-Gm-Message-State: AOAM532ZGVp74qg+uRKM38GHnIjSY4QzDOqKfo0/dMfJtmYjdgqfuMhq
 8IMjIKObxff+ZYOy/Iz6u0s=
X-Google-Smtp-Source: ABdhPJyO6d0xiIlTTteAtNGMnPmGJvkkKfwwAvDDwF+Cb+4gNJBr9YV5I3Djws/hxiMNELH/5QJCbQ==
X-Received: by 2002:aa7:cd18:0:b0:41d:8df8:86e5 with SMTP id
 b24-20020aa7cd18000000b0041d8df886e5mr3998410edw.248.1649765788895; 
 Tue, 12 Apr 2022 05:16:28 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 b5-20020a17090630c500b006e8044fa76bsm8827900ejb.143.2022.04.12.05.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:16:28 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v3 05/18] net: dsa: mv88e6xxx: remove redundant check
 in mv88e6xxx_port_vlan()
Date: Tue, 12 Apr 2022 14:15:44 +0200
Message-Id: <20220412121557.3553555-6-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412121557.3553555-1-jakobkoschel@gmail.com>
References: <20220412121557.3553555-1-jakobkoschel@gmail.com>
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
 linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Vladimir Oltean <vladimir.oltean@nxp.com>

We know that "dev > dst->last_switch" in the "else" block.
In other words, that "dev - dst->last_switch" is > 0.

dsa_port_bridge_num_get(dp) can be 0, but the check
"if (bridge_num + dst->last_switch != dev) continue", rewritten as
"if (bridge_num != dev - dst->last_switch) continue", aka
"if (bridge_num != something which cannot be 0) continue",
makes it redundant to have the extra "if (!bridge_num) continue" logic,
since a bridge_num of zero would have been skipped anyway.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 64f4fdd02902..b3aa0e5bc842 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -1404,9 +1404,6 @@ static u16 mv88e6xxx_port_vlan(struct mv88e6xxx_chip *chip, int dev, int port)
 		list_for_each_entry(dp, &dst->ports, list) {
 			unsigned int bridge_num = dsa_port_bridge_num_get(dp);
 
-			if (!bridge_num)
-				continue;
-
 			if (bridge_num + dst->last_switch != dev)
 				continue;
 
-- 
2.25.1


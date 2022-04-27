Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75A5511C39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 18:10:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpNxq51Tqz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 02:10:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=me/CfCMU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=me/CfCMU; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpNtf6DQ6z3bYM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 02:07:22 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id g6so4400938ejw.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 09:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L7bydI8W7YKPMa0QpXcwp0iK03JxiA65XfYkLVk338s=;
 b=me/CfCMUzGN50v7aHW31BqgSnLtBSZmfvAHp5J7/hmxJn1cJoAxJnDiUBPmp28ldHA
 +GqEMGf2wiZIuh3K2rqkDck0yOW+vzBJCFtMKxdknc1uVNxKJEZ4gxdJDskKAyWsUucb
 6bMeInlzy6Of9d/Pc22rBibJlCHrw/7AAwcu0id7P82U2wisfojvpL4x2jLueBTGDEWj
 aa6wF7qFHEu5HxnjRJS6k8c6Bb86bjEUZA/Me25yzxMt+DdMujV13iTbg8BjgNoSGdRS
 x2cDpFPCekknCFLP4V5Ou6fIx7tnmJ9Us5hq32MYbmFhIFLrYWL0JQyecgu0p5TtMAPg
 CnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L7bydI8W7YKPMa0QpXcwp0iK03JxiA65XfYkLVk338s=;
 b=N/s3p/Go1YpB4j/dUoroteplXHfGEs8cpWlVsbQmQGXSCdIML2s49+QJO7Nkrkaa6f
 ewW/VRTVtrkIir+dB6W2g0G3E9/tsbJBm/LJSRXEEH0bkE02wnA/q8sy6aJlOLB820dE
 rsqbJA9WjrGoJYYctY77XuyUrFkklXUI+/nOzP09PIDDQjimSt7NcP7+lzS0SyBzmDZN
 29GrVrXt33Ek5KSfFE0FVbAaY3QQAZc7pAg/CQx7P2MiuW6o3lInqGoxJ0+PXLjFu2v3
 ylqWUf0dR4SYJ7sODnbQXzpP7HZvUiso2jKNrsl0tf+EekouS6obvfSNvbEsOPC00jMG
 bASQ==
X-Gm-Message-State: AOAM5333zZgPTCL0GDCXkAVhXm+whCz25IFPuXROCbNTCR6hGkWit4qT
 cGTkrgJXrj5H551Cgt7RNR4=
X-Google-Smtp-Source: ABdhPJwwQoZUzxJmxpPntFxcSAdUjkXDepMPzp8vysDK8FHgvVFqmw1HOME8T7SbR/DvsIrbGQJogQ==
X-Received: by 2002:a17:906:5d11:b0:6f3:722a:1fee with SMTP id
 g17-20020a1709065d1100b006f3722a1feemr21285729ejt.9.1651075639369; 
 Wed, 27 Apr 2022 09:07:19 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 n5-20020a170906378500b006efb4ab6f59sm6984098ejc.86.2022.04.27.09.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 09:07:19 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v5 04/18] net: dsa: sja1105: use list_add_tail(pos)
 instead of list_add(pos->prev)
Date: Wed, 27 Apr 2022 18:06:21 +0200
Message-Id: <20220427160635.420492-5-jakobkoschel@gmail.com>
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
 linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

When passed a non-head list element, list_add_tail() actually adds the
new element to its left, which is what we want. Despite the slightly
confusing name, use the dedicated function which does the same thing as
the open-coded list_add(pos->prev).

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
index e5ea8eb9ec4e..7fe9b18f1cbd 100644
--- a/drivers/net/dsa/sja1105/sja1105_vl.c
+++ b/drivers/net/dsa/sja1105/sja1105_vl.c
@@ -49,7 +49,7 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 	e->rule = rule;
 	e->gate_state = gate_state;
 	e->interval = entry_time;
-	list_add(&e->list, pos->prev);
+	list_add_tail(&e->list, pos);
 
 	gating_cfg->num_entries++;
 
-- 
2.25.1


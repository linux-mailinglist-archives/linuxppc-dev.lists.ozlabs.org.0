Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2FF32FFEB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 10:38:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtbyH51M2z3cSp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 20:38:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UhggsXAl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=baijiaju1990@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UhggsXAl; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtbNs0sYqz30LQ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Mar 2021 20:13:14 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so1385779pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Mar 2021 01:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9Aawe9QfXb0YxIR8Jzrfs58tlZMG5IqOctIXF8gQkLY=;
 b=UhggsXAldaEpBafQQQwFw14B6tumhWrHV43VeU8nYUccgd6lTUv4UrLEXD0mxpvYg0
 WJETcpeA1siImX1QC2lMAZ66NE30eUMlWU2Z6Dd3vFyCu6+aKJn/FC/VXfXHyd8F4NcF
 nNu7gZlfNHnIDQyonKFVJ573DfI15xS7F64dh2Y97k717XT6JRTBonF6n9dz2PG+ucty
 UU4/dO9GP2FqGMMqKNCCff6Iw6vlVVuRmBICkh1izEOfRNv3aYz0JjdZ4KFfevzjxm/Z
 KQQCLPSa8LFrPwcArGCfayTcp80+eL3j/oob2BNIWLvtGxkGG7ObNg4UObBFzC/TuCc6
 y5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9Aawe9QfXb0YxIR8Jzrfs58tlZMG5IqOctIXF8gQkLY=;
 b=GAcVshcKoyH3FhkJAcvCwEndKvbMyhX6iVNMjP8ngpA4WYKOEi+efRwBk18ZD822v7
 DITlBb5jJkmVd+b5d5xLhmT9gMRxwbpt2GRCPJ0DdfnghZPTWNZDsDYsTBTtYO5E/LSQ
 rqyd4Yo3DkMsxe+LNa+LBKO1Rp+2cIgi7n7ArKN6GLAUDmPB5ALAR97vF2uhcz1W66nf
 oJWLk93oroPBPUxK+y//O1q5UIxQmZuzeRMMmVslwQmig9dUi1YLXPIBETvfe4zw+tIe
 4MzvyJCwkjbwOAkoss3p/y5FxSKGs2GYgVMeUvRKBJxsLEz8yp1jwCKy5uH3/2+wM5vY
 yYzA==
X-Gm-Message-State: AOAM5308TLAhVGFURZj6isVDAWtP6zq+RhQccZg19heS1CnUJDjCrbRH
 5BVgD8H9dPsrF3LsB5oZbtk=
X-Google-Smtp-Source: ABdhPJw6y5+sJnv51Z6d8vwll05AJl+ba8SkszCda/a9N/8fuHzZ8pEuMl57xak273MSyHvwnb2M+g==
X-Received: by 2002:a17:902:a40b:b029:e0:1096:7fb with SMTP id
 p11-20020a170902a40bb02900e0109607fbmr15909348plq.40.1615108389415; 
 Sun, 07 Mar 2021 01:13:09 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.66])
 by smtp.gmail.com with ESMTPSA id q15sm6850719pfk.181.2021.03.07.01.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 01:13:09 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: qiang.zhao@nxp.com,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH] net: wan: fix error return code of uhdlc_init()
Date: Sun,  7 Mar 2021 01:12:56 -0800
Message-Id: <20210307091256.22897-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 07 Mar 2021 20:38:26 +1100
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
Cc: netdev@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When priv->rx_skbuff or priv->tx_skbuff is NULL, no error return code of
uhdlc_init() is assigned.
To fix this bug, ret is assigned with -ENOMEM in these cases.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index dca97cd7c4e7..7eac6a3e1cde 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -204,14 +204,18 @@ static int uhdlc_init(struct ucc_hdlc_private *priv)
 	priv->rx_skbuff = kcalloc(priv->rx_ring_size,
 				  sizeof(*priv->rx_skbuff),
 				  GFP_KERNEL);
-	if (!priv->rx_skbuff)
+	if (!priv->rx_skbuff) {
+		ret = -ENOMEM;
 		goto free_ucc_pram;
+	}
 
 	priv->tx_skbuff = kcalloc(priv->tx_ring_size,
 				  sizeof(*priv->tx_skbuff),
 				  GFP_KERNEL);
-	if (!priv->tx_skbuff)
+	if (!priv->tx_skbuff) {
+		ret = -ENOMEM;
 		goto free_rx_skbuff;
+	}
 
 	priv->skb_curtx = 0;
 	priv->skb_dirtytx = 0;
-- 
2.17.1


Return-Path: <linuxppc-dev+bounces-17083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LlJBvgCnWkxMgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 02:46:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B94180ABB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 02:46:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKgYc1GH0z3cBx;
	Tue, 24 Feb 2026 12:46:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771897588;
	cv=none; b=TjnjcBVQe+rb7fDc6lmIVgim9h4CUnrcb27EA62hg7l0NamshaWJXWLAX59OyOeAMLJ77nILFG3w9WSrzaApz2SCWGv8w8m388jEU5Lat9541IF0hvDkOtwGk8n2xR7J9wx+5zYIp9/oqtchPB1LXKtDErTdAlRI9D12FcGn337xCpPJ63GPsaQCoFl4SAkCgszXuQHFqgZz09fNhIqc5dW/LTpOsfCdzOUAoCoPh0eqt+Tbm/G3UKBkNgMKDfPaisryTb7Dbvt7NBwAB2LGjZj1i/s3RHCFrUYI7VjxFBLFybAIDLOUDSqzwOP3kTGu6gEsakOwDN5BHchqkfoNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771897588; c=relaxed/relaxed;
	bh=pyCuepEEE5VZwezz+EwCnELSbh3qvdwdxfgg+cxEJD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AaLMSWyTqA/zgyThcOecqVlDZLQ7GnnRJfQiAPfKdpgy29aWD/re6q55g3dAxhHEtPLtBeMhgQabIywuBeQCC+mWBsDLGy3eR5XN4nC4rcxiFM0vRCHNDLn0B6ExZFw+YYIB2E0LW6Y7grECbnrz+jkPk0DOqmAan1XkZ6TMUTtLvNS8dGMC3+Rklu2uvVnYRF+7IByDMlNoP6FyqGRRVyK6fHvNpnnXQfewgZUEPOiwiTfymvpwSyS24sZ3pUKwAKBLMODXHBv+sj5MW7ZGloDd6Aw1IMyvgQ2O0li19rAo1d+LjzfLF/O9lsKilME5/WsZ4P0r6Qgbgwe68ui7aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gp6s3yCl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gp6s3yCl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKgYb1kbSz3cB5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 12:46:27 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2aad1bb5058so51634405ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 17:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771897585; x=1772502385; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pyCuepEEE5VZwezz+EwCnELSbh3qvdwdxfgg+cxEJD8=;
        b=gp6s3yClAEbuQBELXueHt4aZ/x1SdSqqMXZp6Sw/6cd3ubfQdoOb2XkJnV9PD4hnSe
         NMXDit/pQCsLUwRSGPeJ5qcnsZApE7B72UJFOJD3/kyfGfqz0Dm8MzobNXEMp4SAJyhk
         syOMwDAo0g2kMUHEpCIq81kbX7tAuhJ1X+NDmSbT6C5Bk9IFvusVHtWYnNTJJAlDyPPN
         KbxGXm+RFgwpFYp27bYG1ZTgRn7IS0QgWSOYT0zupbUooFWn+GCNJgnv7GQ8afK2fZ4r
         lojryPPBuYIvg56g0xI8/CLoUNbJYU29Bo/o7SLTyZ1daxIGwAXPlXwMtDPHn+KAB4ri
         A9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771897585; x=1772502385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyCuepEEE5VZwezz+EwCnELSbh3qvdwdxfgg+cxEJD8=;
        b=KWuLDYSDIrl7yDKpnTDfZLw48/O7SVmPiRjhn56IuSh9wIuHSv6Zn48daxTF5WDoHj
         N04jeZv0sjPQ8ICThLPeu0BBKaWsodASW7+eN3wjNfDLr+2F/SfNxoYGGUIJgVHW2VVp
         2mzNNCsDSD5F5XLacXmmshrSlA+lfVLVgKGS2kAAbqRLX8+eDhozERTPrpFh8V2QiDNU
         4DoTFhTHnmvvguU5JgyrR1DRin6sPtp+eZ0Cm1K0dEjIVN6b2THOHxLJBFQ3HC4OjHig
         ay3z/ArTSjXKPtQM82zhMAlV3XLbQuwwC4yn0s0vLBH55rok7JteuQUf1gCnn2Rf8IiY
         NyEg==
X-Forwarded-Encrypted: i=1; AJvYcCWkXzmCzUSa+BbN9J1eFq+b6unIw/SISkPJ2LKeEOVijsCThHImVpvDWmCKaaIO63BYKzzeRerj7lS6mXA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygResT0MHvdnJXPArfZz01ZVMnYf8zi7qS/HRRA/IhMFL/qHu8
	7J75OLuyF4ZlS2o6sPuZolXHAsZ6vAgxUPpOWzvtE5BbBBiCxpow0pTt
X-Gm-Gg: ATEYQzxIXuU2+sd/fZwRhzOrFipMnXhOEoGmJL2TQZxKoBd63SC5V0VuZDCmga2fdU/
	TOBgfBwmF9aeueQdBRnO9Q0mLM43yiHqtHP5xXPrA1XdkQGt0JDMs2T5sy8L5DMV4TCQFnfoqr6
	sthaHwXSjiS9NpGwfXlaLotTtHUH7pqLHrYyvvbYZlX8ppUKP9N40BO97TBKNMyRM/7ifgz7y9+
	5Agc7H/p+DBq46SCc3zzCOoed4nsT1ASnGjojO1dEJ96WdtJNA6+qqzjhCZAdZKjx3cxo6wTmh8
	SOUsPTYkgfXGxUyQ5HT5XgMlW+E3d4FxRPg6InlAwSneDF+XsUPk0FuFhmn66YkHOIJO+fMaUhL
	YcnKfjvXZKIx7jZq5rHPi1O9TUjXNr7RhhKbwKr/ZnKn3ZgqkYxumY/o88ug1CDsMaBGC6emWb1
	XK5PaN/YLpwUvHd0dni7q1cvOC95uN216QQOQR4unGmVMVpIq7fcfsiQ==
X-Received: by 2002:a17:903:32c7:b0:2aa:d320:e969 with SMTP id d9443c01a7336-2ad743fb337mr101422045ad.8.1771897585096;
        Mon, 23 Feb 2026 17:46:25 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad75044c72sm88143715ad.86.2026.02.23.17.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:46:24 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC FS_ENET DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] net: fs_enet: allow nvmem to override MAC address
Date: Mon, 23 Feb 2026 17:46:06 -0800
Message-ID: <20260224014607.353378-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17083-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,lists.ozlabs.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:pantelis.antoniou@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:pantelisantoniou@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 16B94180ABB
X-Rspamd-Action: no action

NVMEM typically loads after the ethernet driver and
of_get_ethdev_address returns -EPROBE_DEFER. return in such a case to
allow NVMEM to work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index 2cbcc29408e3..d3c772ed5fc9 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -951,7 +951,9 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	spin_lock_init(&fep->lock);
 	spin_lock_init(&fep->tx_lock);

-	of_get_ethdev_address(ofdev->dev.of_node, ndev);
+	ret = of_get_ethdev_address(ofdev->dev.of_node, ndev);
+	if (ret == -EPROBE_DEFER)
+		goto out_cleanup_data;

 	ret = fep->ops->allocate_bd(ndev);
 	if (ret)
--
2.53.0



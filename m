Return-Path: <linuxppc-dev+bounces-2486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE6A9AB7C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 22:38:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XY3sp4DFKz2yZ6;
	Wed, 23 Oct 2024 07:38:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729629170;
	cv=none; b=SWNIZP9Qa3o16Hz9oS5FbvDIVB3aBULbfVgZYDvVC+ViPq3iZbzMy6V980t4S/gQ6toyahRq4KLXXcrOyXBT4E5I7JfSFdnD/DHbNyM4At+iDFuk5Szox8FBvNpzjJ/0dHyv2ct8cwNRKD5R3b8NzaxeXRgNUT17hUNYkc0oxsdCCVDF8cumGBgJlFywGRbL778z8yISTEUJKiCMz7nMmpWbsOhNwpTsQGr/zBgWKol6sEfUrsQJFg1ypYDorDRs6UfpQ6zm7ekQeDJ0T5KjBoCbMf2MnuBONT5KF/n3nzqDKNWvHBB9KvbVf7SLx3pHac7gOFYT8HrlZr72SAD1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729629170; c=relaxed/relaxed;
	bh=GZ+4PADPN2uTECD/Dh3GFRRtK+3UQEC1z/LtDuogd5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GIACshlypzPWu8QHCUsEEj/99vkxREpeBcmGafeodWYKNcRfYNViM7b83oyX06AREQ7IVQIh6GLdDHh6FRYSJum0rk+Ayj7khnkEkRINTpxd/+9AqfQ7+KjrAjhBB8vFho9jrjAKzuTy2AFQTO0bi9Dkyx3AsX0WptViO8hjFV3Gbp3y8o7ZELaHCjOs/mWGXAnYGBPOjOtXeHqE2eBaN5azaSNicLiGXtLrdlQ7lbnNxugRZTk1n1rVgYnL7gJv5pfJJ2ygZLU41yoH+xfg5xawDW+J6ixCgJaarWD4WG5P/BEGfKP5h8nYXdsubazj3waWTy1W1rwhXGT3ngUrlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DeLUXQBr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DeLUXQBr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XY3lP22B4z2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 07:32:47 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20cb7139d9dso55607775ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 13:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729629163; x=1730233963; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ+4PADPN2uTECD/Dh3GFRRtK+3UQEC1z/LtDuogd5I=;
        b=DeLUXQBrqi6oPZLAa1cqdicY6munzLe85O4snrEXYtaZqW/kwBvyPoqgH0ffncibie
         EnBmBJqnXayHPjCLc3znrWoPk8bFl0QGYZeBmnkZ3HG1BIOi+IC9QHWCHK1Nv8mvbrtQ
         w1OQB9EDPCBR3TQc15XqwCcKU5erg5qtmt5qagf0r0kC03xuSgYSlpqlLlchVM2VCX9M
         cXa/xsJ8xS2a7VNK1MS5d4rEVzgb9JgDws2xfmMo3FLwpHJk5+HDQh+P+ewh3fyaneH9
         8OcAVemgH7iRN2Lu3dgAArtCvDPuPE+Za/iJvUgJUgkPDRJrlHUfq25Lhpel1j21aluk
         xBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729629163; x=1730233963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZ+4PADPN2uTECD/Dh3GFRRtK+3UQEC1z/LtDuogd5I=;
        b=dwnYPIbmUKX8NQi8uIEB7tF9ZYF3dd0XxFgT0/vsfCS37xacGdrQ5zfT8fIKVMxuIP
         BFEV98WBFSvnrNXAxrtGpkQ1Z0t5uCNG6FxoibCU8S7HXY4k+F7x/RjsHWRga/hmuCf/
         ORDHNQ8eTHWrBt9fpe0AD6OmDhdExt/APlaF2/gjPKu0WphqafMm6S7FAtACo4TbVrTx
         T76JtRzAZU3xU3ddIuU702I3iLqvT8vugS7m/Hp92fuHCM1Mm/yoIaQ0ft6bIQ4LgwaA
         f8RMTkshbhHRmTpfZSOoBKvVwOcJNqOMDdXGX0Tzf1rUXYVfO+ESYV9c8LLJPRTw4AP8
         TEMg==
X-Forwarded-Encrypted: i=1; AJvYcCWYNPmFn6sqrjbUXUNDwJKuQa8L4jOCraiEV29IQOA0WfxI9UP69f1D9BI+/8X5xzRZg41j5e9GV5e9eSU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGTLmBZKUt0f0PM1J61ODsM2nBqNlciFayS3cnkfzdeXLSbMaR
	WMamUcyQtZLq4C2i9mACExGD9r4DsCV1gR8n8vljGF/Wp+BmRaCx
X-Google-Smtp-Source: AGHT+IGcDqy20KPoabg7ESPBAC5OmxPOAcjQtMj/wH5Mv0MFuAdhMh+A6qVzGB2rUcn/bbgjEQMb9A==
X-Received: by 2002:a17:902:c945:b0:20c:da66:3875 with SMTP id d9443c01a7336-20fa9e5405cmr3800315ad.24.1729629163038;
        Tue, 22 Oct 2024 13:32:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0dd53esm46521235ad.222.2024.10.22.13.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:32:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] ibmvnic: use ethtool string helpers
Date: Tue, 22 Oct 2024 13:32:40 -0700
Message-ID: <20241022203240.391648-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

They are the prefered way to copy ethtool strings.

Avoids manually incrementing the data pointer.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index cca2ed6ad289..e95ae0d39948 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -3808,32 +3808,20 @@ static void ibmvnic_get_strings(struct net_device *dev, u32 stringset, u8 *data)
 	if (stringset != ETH_SS_STATS)
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(ibmvnic_stats); i++, data += ETH_GSTRING_LEN)
-		memcpy(data, ibmvnic_stats[i].name, ETH_GSTRING_LEN);
+	for (i = 0; i < ARRAY_SIZE(ibmvnic_stats); i++)
+		ethtool_puts(&data, ibmvnic_stats[i].name);
 
 	for (i = 0; i < adapter->req_tx_queues; i++) {
-		snprintf(data, ETH_GSTRING_LEN, "tx%d_batched_packets", i);
-		data += ETH_GSTRING_LEN;
-
-		snprintf(data, ETH_GSTRING_LEN, "tx%d_direct_packets", i);
-		data += ETH_GSTRING_LEN;
-
-		snprintf(data, ETH_GSTRING_LEN, "tx%d_bytes", i);
-		data += ETH_GSTRING_LEN;
-
-		snprintf(data, ETH_GSTRING_LEN, "tx%d_dropped_packets", i);
-		data += ETH_GSTRING_LEN;
+		ethtool_sprintf(&data, "tx%d_batched_packets", i);
+		ethtool_sprintf(&data, "tx%d_direct_packets", i);
+		ethtool_sprintf(&data, "tx%d_bytes", i);
+		ethtool_sprintf(&data, "tx%d_dropped_packets", i);
 	}
 
 	for (i = 0; i < adapter->req_rx_queues; i++) {
-		snprintf(data, ETH_GSTRING_LEN, "rx%d_packets", i);
-		data += ETH_GSTRING_LEN;
-
-		snprintf(data, ETH_GSTRING_LEN, "rx%d_bytes", i);
-		data += ETH_GSTRING_LEN;
-
-		snprintf(data, ETH_GSTRING_LEN, "rx%d_interrupts", i);
-		data += ETH_GSTRING_LEN;
+		ethtool_sprintf(&data, "rx%d_packets", i);
+		ethtool_sprintf(&data, "rx%d_bytes", i);
+		ethtool_sprintf(&data, "rx%d_interrupts", i);
 	}
 }
 
-- 
2.47.0



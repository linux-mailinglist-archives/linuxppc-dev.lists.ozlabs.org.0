Return-Path: <linuxppc-dev+bounces-2846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 951FC9BBF21
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 22:01:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xj3mc3Sl6z2xmS;
	Tue,  5 Nov 2024 08:01:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730754096;
	cv=none; b=hk1XKQHx4FldVpHDcRAz2xtHM3ZsFRDrJvobgiLpcz8IuD0w4KczRQ2FDA0Iph8hvwF/rot907UIigkXYUi8g6nr070xGPsv0/qAzrfQFtzL1+E7t9A2h2Oy9yuoXvO0KAyfVSini5yybd1jqe7bfoE85TvKli0EmqNZSY1bPogoD2ghCctQX33a0Req9pxjk8cgqLST0QiFdCaiiKhcMWC1RFZZAcZ19XLDxBLBZX4uhAiqm436EdpdLhCbboHDYe/td2iTJ7l5MzcNrBezDdGm1XnhKM0nUllC5l34VmSS/W3xyg+2abbaelVBTGxwJIa1rv/SyHivsjTNCz5Mwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730754096; c=relaxed/relaxed;
	bh=EOZ30S4SAP3QuaB6bi4m6ZHBaGMcsecLVZhaad9YKzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ew1d4X8vDjM5gXo5jb82DLbV8r4qyTIUPis6//eD5bwDvImiEAbuaO2zZG7bpQoeM3ByX0ZsUop0SvBx6Ornbj9PdY6l07IX/q//8nZVqiaPS0Sa437Mh/sVqOdBYXSs6kMy//BNHtvSNVYJ3h2R/kOQCi/ta7xINNQQThlEDkl3UYWl0/Ybg9dWHspLX/YMIfZTGwu2B90XOkxG3Otduoakaqq88Zd8UnXUeQkOlX86M2oNEklzMHaImztNuv/keN+NICuuC5mpvIs7CY4xp5VXTOIQH4cg51XW5HnECVBwYczh63KHahCcXfcf3XP0Ar5kURHVkZ975zQLBu7+MA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GetMFCkj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GetMFCkj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xj3mZ59Tmz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 08:01:33 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-72097a5ca74so4443843b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2024 13:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730754090; x=1731358890; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EOZ30S4SAP3QuaB6bi4m6ZHBaGMcsecLVZhaad9YKzY=;
        b=GetMFCkj7B/2shRFbgsYgJoo4jGGl8WxLNpAuHu8EyV3X2rUL6Kh/a0x+s6jed9kVw
         uLLm4lUIOWHVS8OUHkoxUugiviaT7DYsM9i+Y0gLiHdXVLwbnfdqekKYkGCVk3l+gb98
         f4sDe2VOcd4nm26jmb3nwtZL93ApOPrjUoEdeBpBKb8tiRSbpznQGGiE/vL7JnDxeI5j
         fjBTnAyJY8I+4rarHILQsFd7EG0p8x9iaeFwuqogJzoFbJS4JHcKX5WlyYIN+rr2/TjR
         lasdTZg29QUYDMff73NOqEmRDlDfIHhQGc3auw+v82e7ejhBpJF4jqMcZ4HW17ncFaQY
         Q31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730754090; x=1731358890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOZ30S4SAP3QuaB6bi4m6ZHBaGMcsecLVZhaad9YKzY=;
        b=NE/uwNfNkoOlf4G6rAq2nRlZeQQT4yE6iXIF7Fqg6RIwke1Q1QRbO99k28Dh66orA/
         EblxYHK6HtvKDiCgmM9wp+M14ufn+/ZOEbFSrHI0wA5D9onfNjvoQU40DheaGTzfjqMb
         ntQeg3exuYNw2TOo62bSp24DBPZkvCi9f0FVbhMBnoR6fhOXcZ7RY9zih9T1KhqXhTgl
         5K0M7U/8uFPstIdpjQcf5/J2A8kWNVQYS9vYO1mPIG0M1OS1d5OMPp4OW6M8bDVUnVEN
         aNa4OibxDPscYbmU0nDkZ5TrHod1veWrXswu2RInqzaCEMdXRn4dDP0xfE70avkrn4u1
         lsDg==
X-Forwarded-Encrypted: i=1; AJvYcCV2xpOpi7L5jbQy3L/aVIXPLAPL0wfLxqld8WTAVK7wrk6ggVGLhgH7+Fw/2LIBb04NfWquVEFMDNXK5lg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwoMVshdNsI0JnikrEqwwWfTdDpaH3tkoMx2WwRdWkvKEqnyd+w
	Q2UYtPlfCC9lE8KchBHDWbAvj/IhdJOX+T34fnPVpPD8D4oFIh/ZqIqZ0C1G
X-Google-Smtp-Source: AGHT+IG2k9jTJ8w3WT4q0Xp/IKcaQ8oJnjwc3KL97LKHzDgZ2ZetMe5DuSuE2uDGPwM8iqmYNZlNOg==
X-Received: by 2002:a05:6a00:4fc4:b0:720:36c5:b53b with SMTP id d2e1a72fcca58-720c99b5c7fmr18641347b3a.17.1730754090153;
        Mon, 04 Nov 2024 13:01:30 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8971sm8307755b3a.12.2024.11.04.13.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:01:29 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	maxime.chevallier@bootlin.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE QUICC ENGINE UCC ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next 0/4] net: ucc_geth: devm cleanups
Date: Mon,  4 Nov 2024 13:01:23 -0800
Message-ID: <20241104210127.307420-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Also added a small fix for NVMEM mac addresses.

This was tested as working on a Watchguard T10 device.

Rosen Penev (4):
  net: ucc_geth: use devm for kmemdup
  net: ucc_geth: use devm for alloc_etherdev
  net: ucc_geth: use devm for register_netdev
  net: ucc_geth: fix usage with NVMEM MAC address

 drivers/net/ethernet/freescale/ucc_geth.c | 34 ++++++++++-------------
 1 file changed, 14 insertions(+), 20 deletions(-)

-- 
2.47.0



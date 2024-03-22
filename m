Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC63886D3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 14:36:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=N1vh2CY6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1NdF6FdWz3vsG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 00:36:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=N1vh2CY6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1NcX41GMz3vsQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 00:35:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=EAolHBSknmyHAIRGgTuBToiKe0Qd+7DMZZj0gDF7Amc=; b=N1vh2C
	Y6glG5MRwaBGI0w+5dr2w3TJMvEHi9bZTIuPfPkRF5KOBkEpp3vSs/D/qqkgzmIq
	T0MfVmIJJF4mbd+yXDq4c34FSkEZTmJYkPenM6fqO1Z8f6EG0ORHWs63/hmmsMuP
	EBa4nCRh/MqZ5EP/akN7B3mCjK/kPe6vU4ir4v57dC4heOzWhCiLOm+L177TuC4O
	MK52+Sk5YYLO8NmakmY+hhkB64W/d6YcH/3Ihs0J4/sxLYG1dlfVK13wr2ri7kSa
	vQYOta2Hcw7EGIKwk3BvrTZ+4uUkU7ZOKATLhLFdoF2KxoTzzjgzE9g0o87yvrb8
	IbNMHGAOAYo5wvQA==
Received: (qmail 3870347 invoked from network); 22 Mar 2024 14:26:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:32 +0100
X-UD-Smtp-Session: l3s3148p1@F4KwxT8UrOBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 14/64] i2c: cpm: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:07 +0100
Message-ID: <20240322132619.6389-15-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-cpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 4404b4aac676..306e397fec0a 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -402,7 +402,7 @@ static u32 cpm_i2c_func(struct i2c_adapter *adap)
 /* -----exported algorithm data: -------------------------------------	*/
 
 static const struct i2c_algorithm cpm_i2c_algo = {
-	.master_xfer = cpm_i2c_xfer,
+	.xfer = cpm_i2c_xfer,
 	.functionality = cpm_i2c_func,
 };
 
@@ -570,7 +570,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
 	out_8(&cpm->i2c_reg->i2brg, brg);
 
 	out_8(&cpm->i2c_reg->i2mod, 0x00);
-	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Master mode */
+	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Host mode */
 
 	/* Disable interrupts. */
 	out_8(&cpm->i2c_reg->i2cmr, 0);
-- 
2.43.0


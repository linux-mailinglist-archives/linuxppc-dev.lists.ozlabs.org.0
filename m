Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF535A3512
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 08:40:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MF6Xd0zvYz3c5w
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 16:40:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=WuvjrSLG;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WAttMf3n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=WuvjrSLG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WAttMf3n;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MF6Ww5BkKz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 16:40:11 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 71103320091B;
	Sat, 27 Aug 2022 02:40:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 27 Aug 2022 02:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661582405; x=1661668805; bh=QDkYxF39cwQWGm2LweFlE2621
	iU114WCwi1dojAaaTc=; b=WuvjrSLG6VV13v6xOpyjEmVEzrwcTgfVc5g+XydAp
	iPQSC2PLtOqBV3HFY+GcgSp6OqXFMj6fRGho30ywm0fypkwFYexoOJoZnAD1z6SI
	MEhDJ2OD/qQCnb7pN4kysl1OtwyXMx+3SV3Ks+euMgWr8PkpO9wlkqed8Z2JqqOm
	E2hHkYtS5I0nPZOcr1ESonPG6I22J0aZj5QV7DteeY6+YQ9qWx82LMpnZ+NzEDgc
	Q8RUcPBtXfoxt3FlGyhg097QLQdyaQADj8Uf5sU55bksdcSTN4bIv8x0NCFzLbzB
	YF+VSUCI0yyBiCO/smEI8YtYsuoqJdFSM1VL1I/8HjZ0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661582405; x=1661668805; bh=QDkYxF39cwQWGm2LweFlE2621iU114WCwi1
	dojAaaTc=; b=WAttMf3ngKOrc0UwLlGFdQK/1j2PV5sE3R2Uh7tpsfpeJ7y/lre
	QgRKH1r/jpFJ/xgq8aw3DcTSALgaqHilyBsUDuFL0Bs5XER1plYd1fB9BPki2HLF
	JQXN15kfbCZEOgrzVOqLbORkcIGBXH3U5YyVvHGhJmhuTKKgZ2L9zmsRfFdngzb0
	/EZ3xkOsyU2jukWsXzRvWWwg1BpIGRrcwyt4sw7Bslk5mJc87R5h1Tg6ca+SkqmV
	Oerivf/VOP6zYem/LmpDYOxkiqA0ZjbyQNJkTMnA/fkHkzJkE8c0iMSLLvcSIMF1
	ZvWEC3qhJAnjPTqnWaw5LLWDv9poJW71Ihw==
X-ME-Sender: <xms:RbwJY_hM8yRZ854ZFq4bZmjJ8kO0BLRHxv68juiyVDTCo8Jt-yv0nQ>
    <xme:RbwJY8CxVJ-KfuCenr-SI5JCSV9uId7qs_-QBmW7BzS7wgIRKZW6OyS3ZCE_B0eJA
    Z5nvpEQf5YtS44srg>
X-ME-Received: <xmr:RbwJY_GGIkPYTJRw8kNzsmc9y-Tk02dIk_jzw8Bwye_oKVMew-Y3g7UIiKjNPex9vxur1eHxSRkoXIF_6Xls5iTeSe7T>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejiedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephf
    fvvefufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
    vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepvd
    egudetjefgveevvedutdeigeelueffvefhfeeuheeuffekhfffheegheejhfdtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrse
    hruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:RbwJY8Rm_0NNZ_EXsPLKdtT4lpW7fMbAgpocxtcfiurlY0VCKHZ7tQ>
    <xmx:RbwJY8ydBlsxGWyfqZH95RZvhSx6xTZ0_d0rOX2Z5I-vrqfHRNrh8A>
    <xmx:RbwJYy4UjZRs082CoUjE_38D7g5s9LL2KEDeVsYnVeQJ6QiV5v7a0Q>
    <xmx:RbwJYyYxZXHUSkcPeUtewyiVe8kWJd9T-RN6cnZoaD1J3qBUjdmwRA>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Aug 2022 02:40:03 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pasemi: Use strscpy instead of strlcpy
Date: Sat, 27 Aug 2022 16:39:46 +1000
Message-Id: <20220827063946.9073-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.37.2
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
Cc: Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

find_i2c_driver() contained the last usage of strlcpy() in arch/powerpc.
The return value was used to check if strlen(src) >= n, for which
strscpy() returns -E2BIG.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/platforms/pasemi/misc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/misc.c b/arch/powerpc/platforms/pasemi/misc.c
index f859ada29074..9e9a7e46288a 100644
--- a/arch/powerpc/platforms/pasemi/misc.c
+++ b/arch/powerpc/platforms/pasemi/misc.c
@@ -36,8 +36,7 @@ static int __init find_i2c_driver(struct device_node *node,
 	for (i = 0; i < ARRAY_SIZE(i2c_devices); i++) {
 		if (!of_device_is_compatible(node, i2c_devices[i].of_device))
 			continue;
-		if (strlcpy(info->type, i2c_devices[i].i2c_type,
-			    I2C_NAME_SIZE) >= I2C_NAME_SIZE)
+		if (strscpy(info->type, i2c_devices[i].i2c_type, I2C_NAME_SIZE) < 0)
 			return -ENOMEM;
 		return 0;
 	}
-- 
2.37.2


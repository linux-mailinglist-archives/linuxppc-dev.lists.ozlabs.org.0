Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BB1751778
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 06:31:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=IvxxHJoM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o1EkPEY1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1hWz3jbDz3cCt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 14:31:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=IvxxHJoM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o1EkPEY1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=lists.ozlabs.org)
X-Greylist: delayed 503 seconds by postgrey-1.37 at boromir; Thu, 13 Jul 2023 14:30:52 AEST
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1hW03FlFz30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 14:30:52 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 4868D5C00B4;
	Thu, 13 Jul 2023 00:22:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 13 Jul 2023 00:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1689222143; x=1689308543; bh=oJF8y7iJSj
	5urfUsFz14aQ2teMG/yYLc0OWikYd5Q3Q=; b=IvxxHJoMMDmaVc1NjRbzpdDK/f
	bS+5expb4wKUlWpFt3jbUxb6sUo+NJr91CtPUGJcMT2zHZ0rjsuhIlO35eMeXOEU
	jufLxCeTTL+G13GXUYHyRZFh5ij0K9TSsoBJ3HpMQphhrVFNRfvpkwvH4IVdMPVI
	VgcIzM+QBuI0J0ZKXvnifeg4YkvFugoeMGgaoHexrPI5+9HzIAFZznz1IzpHP5bg
	SOfOlcikA66WzmTSYG67ntpOt4lGLc7zIJla7g/bDToSnbwyicfOyKPEmc2Y11my
	ciT9LwmxXrqSRCZMY6rh/gzk1IHJo6fJENE8NhTKbzQo9WZQTy1AQplpSeFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1689222143; x=1689308543; bh=oJF8y7iJSj5ur
	fUsFz14aQ2teMG/yYLc0OWikYd5Q3Q=; b=o1EkPEY1s5g+4NSl4OYCmmOCbUs/x
	p443uFwFitrGcO08+PQ29xZ822+lFs29BHAax9Lts/q0887/zO5FK3y4TGY+g/Dv
	W4+DzuNBQUUgseovthyCgw4d4ZtoIzhdfWgirQmOhkqVqqZpMGeW7y4OIV3qyE3V
	OrDfdgiuy/PdIvWg38ZUIZKGHkBxQR7umYWJ+TRv9WzNoFr1KvbtYLkrqBrfBc1b
	by78ffgIy5nCI37ZUHSk355gb5XbOdKiC2WG0UKNf/zZqXWVC1BB68+NWDWhEqag
	TdA+1+kPn/YVP8Xio5D8zbl7UCHeb3BRb5UMfjMxYxSgRMVIXEk3MDzXg==
X-ME-Sender: <xms:_XuvZA97Tk7gEXpiP1tZGPdaPrU8nSqOkdiKbyJ89bvjPYScDFvNlA>
    <xme:_XuvZIv7w5UyThoW44Pv1qFPpd1NzPZ6j6cY6MU7OnJ5GJkCi-XyF7YJejMlnfb0w
    t1imVqhRmzsb4KLww>
X-ME-Received: <xmr:_XuvZGBU9T1B8OqKXixAzRVYpBV7grs3x35Ja-_yN8e-Ol-RkXKN4_jLu45D-z1DH7INJ3KGtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfeefgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgih
    uceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepvdegud
    etjefgveevvedutdeigeelueffvefhfeeuheeuffekhfffheegheejhfdtnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruh
    hsshgvlhhlrdgttg
X-ME-Proxy: <xmx:_XuvZAeZphhPwsl1u5CTFrnjHKXOdD3e_WfzztDMzI1TFTWaj6BmaA>
    <xmx:_XuvZFM2I43-sEWx_Z_Xtdmvwwx88EpIIU-1wyYcb9voGIVU2PnPbA>
    <xmx:_XuvZKlPN0rfK_HGWYIVEZYcKts0bvrg2SriBDam1ULxWrAbN4bDow>
    <xmx:_3uvZGqhsEuwEXH2klDPpNelFRizlQ0o8cf7_2CSdhiod0c-4lzgjA>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jul 2023 00:22:19 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/crypto: Add gitignore for generated P10 AES/GCM .S files
Date: Thu, 13 Jul 2023 14:21:45 +1000
Message-ID: <20230713042206.85669-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.41.0
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
Cc: herbert@gondor.apana.org.au, dtsen@linux.ibm.com, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

aesp10-ppc.S and ghashp10-ppc.S are autogenerated and not tracked by
git, so they should be ignored.  This is doing the same as the P8 files
in drivers/crypto/vmx/.gitignore but for the P10 files in
arch/powerpc/crypto.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
Fixes: 81d358b118dc ("powerpc/crypto: Fix aes-gcm-p10 link errors")

(but who cares)

 arch/powerpc/crypto/.gitignore | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 arch/powerpc/crypto/.gitignore

diff --git a/arch/powerpc/crypto/.gitignore b/arch/powerpc/crypto/.gitignore
new file mode 100644
index 000000000000..e1094f08f713
--- /dev/null
+++ b/arch/powerpc/crypto/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+aesp10-ppc.S
+ghashp10-ppc.S
-- 
2.41.0


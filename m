Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820C69ECC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 03:21:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM0JN4K82z3cF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 13:21:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=s+mPEa9U;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ARZ7H2mc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=s+mPEa9U;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ARZ7H2mc;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM0HM5W3fz3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 13:20:14 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 302F25C0097;
	Tue, 21 Feb 2023 21:20:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 21 Feb 2023 21:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1677032410; x=1677118810; bh=6CldTPDRC35/NuRPY763+DzOr
	zdkuvpNt+pC5ZygTgI=; b=s+mPEa9UpBkbnnARbgZUNF5k3YeFZR5c/xawHvPqf
	E4V3dUsmI1MLYarjrXWVlzCQH5ScAvi38PIH0Z5RiG7SxE3MMn7iPi4i3GTOmH4G
	fjCI+pZeb6Xm2j5sB4+neEuuGHJR36G0zwv6zXKtDEzYy9EO77I46chUSc8yQf3o
	STqYLlKZQ93f72nzJNCqkFyw1W194Z6wttc/nKK1Pcy6EbZMKQvPcPJCVT3pfJVB
	7pJrt0JUbp/ZhbhdxTR4c83p0/7bljgHLfSM9JQpAwe6QYWPdiuPDQqDfS4PRoXr
	3N7W+6nrW3kSuwl6nVzC71HGjsOMFkwTi6xlIMJA2MHhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1677032410; x=1677118810; bh=6CldTPDRC35/NuRPY763+DzOrzdkuvpNt+p
	C5ZygTgI=; b=ARZ7H2mck7KFJ2AYOw2+prlmiDT7VTa2V4mkDxROGk4DbY3Lv1/
	8kms7sRsn37RElL3xO5BvgkEl2Y5pajeT+oeVpiAaeFnT0Vig0aA3u73Ji/ta3OB
	Buw8Gj2CHu2pxUQ2bTw5kjl0ojJYCjsVSMb2r0WBbtiiWrtpLx4JcXsF5/cnUkGb
	bDe54h4uppsnJRHm6r9BTGIUXI+wKRXBOo8TcOtciLJwTqGDppl5d2BiDAaGL89E
	Z/Ot9mFy2xKg0EtJtjvGLOja//ALV0Pre18rnbMXRzmhtns/wBhEpZWKyK6xb+D4
	JnRMPp0UZEfa6P0+KDhveqzuFvJZtT4LERg==
X-ME-Sender: <xms:2Xv1Y4YOCcSvtFo3yqdMWCzsO9te6uxdBOCRuGZhq0hKPOXQEDD9MQ>
    <xme:2Xv1YzavZXpc9dpPBI6s9EKgrWXMiQMEphb8AvEMEEX1_1Gwi6CCL73CE5HP-hxbc
    jgWKvwNdsCp0ibjcw>
X-ME-Received: <xmr:2Xv1Yy923snlq2QxEG3qH6CCGFj8-67RputcE9gTQyCmf5IkWnfG0qWwwJdqUubcz3FHozvRabkgn42kki3KJ4I-Fw4Gl73lDBlzBL9uJ23QQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejkedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
    hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpedvge
    duteejgfevveevuddtieegleeuffevhfefueehueffkefhffehgeehjefhtdenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrh
    hushhsvghllhdrtggt
X-ME-Proxy: <xmx:2Xv1Yyr4HczDm_NaBo0YchMMU9qZzGgyfEwscbhgS5YM4FbJ-dK1Tg>
    <xmx:2Xv1YzoqtEQJWLBFl6QliO4X1gBy8RIvQJ8z9-etly6vf_aYdwnDJw>
    <xmx:2Xv1YwSzBNlxbxZQf9ZK5nb_5brK2EoiNnviiJEWDK0bupDNvw-PvQ>
    <xmx:2nv1YyX1BiZju3-gTx2uXg4uT7O30vrdu-yWdPyRAbo7xW7EJzmbDw>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 21:20:07 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Avoid hcall in plpks_is_available() on non-pseries
Date: Wed, 22 Feb 2023 13:17:08 +1100
Message-Id: <20230222021708.146257-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.39.2
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
Cc: Murphy Zhou <jencce.kernel@gmail.com>, ajd@linux.ibm.com, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

plpks_is_available() can be called on any platform via kexec but calls
_plpks_get_config() which makes a hcall, which will only work on pseries.
Fix this by returning early in plpks_is_available() if hcalls aren't
possible.

Fixes: 119da30d037d ("powerpc/pseries: Expose PLPKS config values, support additional fields")
Reported-by: Murphy Zhou <jencce.kernel@gmail.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/platforms/pseries/plpks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index cdf09e5bd741..6f7bf3fc3aea 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -22,6 +22,7 @@
 #include <asm/hvcall.h>
 #include <asm/machdep.h>
 #include <asm/plpks.h>
+#include <asm/firmware.h>
 
 static u8 *ospassword;
 static u16 ospasswordlength;
@@ -377,6 +378,9 @@ bool plpks_is_available(void)
 {
 	int rc;
 
+	if (!firmware_has_feature(FW_FEATURE_LPAR))
+		return false;
+
 	rc = _plpks_get_config();
 	if (rc)
 		return false;
-- 
2.39.2


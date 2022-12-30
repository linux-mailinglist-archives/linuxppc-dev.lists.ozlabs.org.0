Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFA36594A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 05:23:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjsZt0Zp9z3cgm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 15:23:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=AdfnUSDc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZbpGheFs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=AdfnUSDc;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZbpGheFs;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NjsWt6hrPz3c23
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 15:21:14 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E5B9C5C034B;
	Thu, 29 Dec 2022 23:21:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 29 Dec 2022 23:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672374072; x=1672460472; bh=av
	aCv9mDt906Bh4sj41n++Uvq9fM0k+OtKCj4mLejVk=; b=AdfnUSDcvhkNMT5qCO
	AGnXPlAaZOOHNImBd5bJ/NIwV2xgkd+58jc1AoriH5xNS6O3fRcoE6SNRuqLlxaC
	cK3q7xPoVNJ/o5hpxB1azDqdGxLQgPNxThdDaRbb+DyUP/DynwEuZEMKYpdsAAG5
	PYMMGjVpK4SeMEkHZ9Sw7s30jbdUZOiJUuUNGaeD8PvSv8kNtDis/XU7D7endoJF
	BO0lhG9sD2t3Zj6TpS//5ramOMbnDMAoxhPBXe6aJHOTmSE/78l6fHrJAhnlIRqX
	iqq0GwF330APEiWRq5gb2p9SsJl46Ntwuwp04/9bm3vpH8hyKfwIOnvM84rx4ahx
	2Ucg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672374072; x=1672460472; bh=avaCv9mDt906B
	h4sj41n++Uvq9fM0k+OtKCj4mLejVk=; b=ZbpGheFs815c1clpgDCXEJB+Kvsq2
	78bKBhR5qE0TTh0YcJGHAK43gEupTOcCfHdBwBxzEEq+9VQ1Ff+HNH7Zzv6Ro7wT
	jlOXwTxq7aWnVRCGlQ5hsH53iHaPdHApDrqR5LKkAbGJTbKbkjZJHsILoECooYuf
	T3LbJe06dlYXy1k9J2UCo8FCjJbTVSYRfK659IuDx7/vKVEJEz2Pj8eR6NYsQQ0y
	MGu3U5OrfayvY4YNSknH2QIhe4AL37llflnp8sxXgPFggduMkGv5lDrM+8i3NYMV
	2vVTNpBcYNTZEQZjiX7jI+zAS5cxAMpjnxa4LcRigjwF1CUg/BqOOw5eA==
X-ME-Sender: <xms:OGeuY4vsrS_QNTPBH2IR2LrsnH-E74P6SmmQjVM2vQHeCm_Fy1YKyA>
    <xme:OGeuY1e1rHGLoi_TXOHGy7SAhcnN2EycHE-rq05kwW4grfLb52zpjn-2WBmjTvdxu
    KvhBd9Me-F_ETLPGA>
X-ME-Received: <xmr:OGeuYzy4CScfhYUUVnr5uEgdfyzryF5vYRf0zTdUYivBD9taQ0Ir7XAHHbvKsoCjfwh_9g4KN75ZFFyPyuGFRTRkGXxgjXcgU-_FVovoSvy8xA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieehgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvve
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
    vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhephf
    dvuefgtddvieeigefffeffkeeigedvgfeitdejteffveefhfdtheejffeiiedvnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrse
    hruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:OGeuY7PF3H5NEqrW6QjUfPgNef-6JdZLDDWFxX7Gq3rsa1uPqpbwdw>
    <xmx:OGeuY4_D5hQjvYpypyZWawxZgzS4PgpFmbK0Aa84y3Rwbsna-pxYEQ>
    <xmx:OGeuYzVargSKTX_DMyhDjforEeSOUWhr0QoUY0p2-4mr85M_pRazbQ>
    <xmx:OGeuY1NDGvSaZ-lGDXMZiv7sTr7ShrTme1UiWM4gW1f1W46GS5ipkg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 23:21:09 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/7] powerpc/secvar: WARN_ON_ONCE() if multiple secvar ops are set
Date: Fri, 30 Dec 2022 15:20:09 +1100
Message-Id: <20221230042014.154483-3-ruscur@russell.cc>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230042014.154483-1-ruscur@russell.cc>
References: <20221230042014.154483-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, Russell Currey <ruscur@russell.cc>, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The secvar code only supports one consumer at a time.

Multiple consumers aren't possible at this point in time, but we'd want
it to be obvious if it ever could happen.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/kernel/secvar-ops.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/secvar-ops.c b/arch/powerpc/kernel/secvar-ops.c
index 6a29777d6a2d..aa1b2adc2710 100644
--- a/arch/powerpc/kernel/secvar-ops.c
+++ b/arch/powerpc/kernel/secvar-ops.c
@@ -8,10 +8,12 @@
 
 #include <linux/cache.h>
 #include <asm/secvar.h>
+#include <asm/bug.h>
 
-const struct secvar_operations *secvar_ops __ro_after_init;
+const struct secvar_operations *secvar_ops __ro_after_init = NULL;
 
 void set_secvar_ops(const struct secvar_operations *ops)
 {
+	WARN_ON_ONCE(secvar_ops);
 	secvar_ops = ops;
 }
-- 
2.38.1


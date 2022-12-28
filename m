Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9368C6573B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 08:39:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nhk1c2tnhz3cFP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 18:39:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=J4MTx/6D;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=iC7cLEPb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=J4MTx/6D;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=iC7cLEPb;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NhjxQ3WSJz3bVs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Dec 2022 18:35:53 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 1F4963200902;
	Wed, 28 Dec 2022 02:30:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 28 Dec 2022 02:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672212629; x=1672299029; bh=av
	aCv9mDt906Bh4sj41n++Uvq9fM0k+OtKCj4mLejVk=; b=J4MTx/6DSY86I1XPwH
	SXekn71UCI6T3R/aU6g6Y2eZoN/84Mdcb4RaW1vPUY63leUA3w6JqdUQLMe/AFJB
	IoOPqx+AaklEy4fSw5T8e6HP7Vl32AAauRe4zeNshFAlcj3AXc4F/jkk1ojTQ2A/
	vSgE5I1WNK0Y9GIWLO4pvhe2Dap3FBy3rpDmfSqdR/IpljCfseNdZuYuUByME9Wx
	ZMk5qS3i7lybZrRaFG6CV9hONZtHWe2kRVX0cRXMHRNZrAclaEc4T1OhT+1+kTby
	JC2oI2wEhee5T5FUgPqUPmDvFhoCL6V5m+MzCDyp0vMKvFqvUbM0kRym0FVwSFk4
	JjqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672212629; x=1672299029; bh=avaCv9mDt906B
	h4sj41n++Uvq9fM0k+OtKCj4mLejVk=; b=iC7cLEPbfula0gN/zS5qUdjw70ZZp
	hVo9Dmhkf/OUiPVPDW3Tuupka+cPw6ONJ2Ya//dr4T1+R+UUrwDe7t69ZGLLycCy
	sA7HqJsBckVAx2HYJyJ+nYXnCgqtlvY3QYeq9ZbSl4eGFsRA9+umhYP2mnwHtvbM
	OwUa9jjsT5zcJhuk83ZPVFrsGqwNY156JN4tt7MRBoVnTHO3nYwrQ85V0JPEnZiN
	UL+oRsB4g8KuGUSVslzJtGd1YEp11h3QeI4T3PInDzZvPVHU5bYht894YYWxnjjE
	ETD+8zVT9bKNlM9vx0+za+xaf7sY5kp+lIgLl+2Hb5kPEruZ1zqd29Ciw==
X-ME-Sender: <xms:lfCrYz6ew2gKNY9ixm-qlVwKTbv-m04lLLsCKpJM6VVN0-lVT_gC7A>
    <xme:lfCrY44wlEi-uSY8gh5_yL_f-w_tuLRZETak0S6KMovr9C5EY-J-jbbIg10HH5x85
    uLgb3eV0KI7A-IyHQ>
X-ME-Received: <xmr:lfCrY6eYAOnmzFsGKykCSXuofQ3PKT6OSojkVsd2MHQbwv06VWI1PCqQ2fvlS-At8ffipylxCKnl6RI31zRL6naLz5GbJH8FuZ-hVyTwpKXMyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedugdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
    evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    fhvdeugfdtvdeiieegffefffekieegvdfgiedtjeetffevfefhtdehjeffieeivdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:lfCrY0J1Po9B-WtZ6zijqkrsKO9Fg__7yXw4FxofWaYujd4OZJ1aHQ>
    <xmx:lfCrY3L9DKwDQgpJwlQE1nMMn885j5unT-wkDaw6pQ0cEKhJ3yXGCA>
    <xmx:lfCrY9zxOu_BYzzSKcLjZy1iaUhanugRx7_Vz1wm403olUpSwxKCag>
    <xmx:lfCrY0r6wsgooC-7PhyRz8wqYvjPIblRifNiXnzDwpyIWTQPG_AMAg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Dec 2022 02:30:26 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc/secvar: WARN_ON_ONCE() if multiple secvar ops are set
Date: Wed, 28 Dec 2022 18:29:39 +1100
Message-Id: <20221228072943.429266-3-ruscur@russell.cc>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228072943.429266-1-ruscur@russell.cc>
References: <20221228072943.429266-1-ruscur@russell.cc>
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


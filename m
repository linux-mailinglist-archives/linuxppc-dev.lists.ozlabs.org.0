Return-Path: <linuxppc-dev+bounces-4135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFF69F291B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 05:08:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBRHW4njTz2xQC;
	Mon, 16 Dec 2024 15:07:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734322071;
	cv=none; b=lH08AQnBcsFUKBnHE/vY30LVi0nFe5B8UVne8Gg61MkXfZVcDYMn8VycpdV2PzSXJK+xdL9dat/5pmgn1y/VMITeCYo0QREDgIW1jM8lQouvL3JGQKDLIfUN3CSMH5cBY/3ivW3e1QHZ3G6UOgfJq6Be64eyntSwLuddewcKp6BoZrMRgwtURC5ZYsq9BUEEH3JogjIXW4gHf4QuuaGuk9eLKKOPSIsCz3XYgTT9H9ri4bPJWrueBjz0s0/welw7/yCKAAJrZ5oUn8Mi4YZTrqnycK9M4CQz0kbd8KCMIIMzFOxtL7Pmq5S6XKRsfT1pD0I2rwaZnjj1FXNDL/dllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734322071; c=relaxed/relaxed;
	bh=7FsOXcq+/0ZdRHjFY/Pay2SSMUKplS8E0JS9EFTqA3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFYLAUj8f0j82ZOEdZwp9gKch1OKu0Pr/JP2WsE7XOrFJ93y0NR7lYSTEfYkh+c59MvkkWii9hsXcTiHeE7eFg59VUkuzlT66eZmJTuEN/Lzg7pcmABHjJ/iq7YlW31blBNHfISmxHo0roHKv9nDn8ZFsNqwt7075SpXX25luLdcENzic4jhiIlSCVKp2YS6WxmbaUGEnIVuddx3omZ1roiLSZLc6dJoMySEmBuOUKqKjmMDnPBSZ4Oe5q1BPQn/RCHUgvBh+amteO0R54waeU8w47bq808VOjUztWJoCqfMOwVuPTgIsZSyVXyt/pcxEbm+fbT4VEt0NU4fXfV8fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=rKNRcGOq; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=rKNRcGOq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBRHV2Pxpz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 15:07:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734322066;
	bh=Jn8gj5ETLfAmg0J0FzeVMFzW8y4Al5TBi0L76/poVeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rKNRcGOqDyGxIYNM6sGZypbYnUnRhbQsV3FSVJNv/Lud70FZlizhYzCTa0WaOykWm
	 eHv6szvSHrftwF35djHryS1bvs5YDc3G4wVzKvPXqabtkn6xYcKvAmEbee245Zn8g6
	 d+/J1OBw4dROLzbQidPJzXElYXPymhqLhHaUrFfU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 05:07:43 +0100
Subject: [PATCH 1/5] powerpc/secvar: Mark __init functions as such
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-sysfs-const-bin_attr-powerpc-v1-1-bbed8906f476@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-powerpc-v1-0-bbed8906f476@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-powerpc-v1-0-bbed8906f476@weissschuh.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734322065; l=1924;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Jn8gj5ETLfAmg0J0FzeVMFzW8y4Al5TBi0L76/poVeY=;
 b=o5LTMX942/pTgvjJuj+3fewCjW41uN7ZEzdZrygLYHNpJhNVyIR79PTD79v0ctAOfgC45j8mU
 1vBsP3mrbdUBir6cn6QYNshbLXlDwNTuDsJ0EiLiAweMAdo1SY4aZEb
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The setup functions are only called during the init phase of the kernel.
They can be discarded and their memory reused after that.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/kernel/secvar-sysfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index fbeb1cbac01b2c575cb7a71b16d214f2f822c489..b7536fbe8c4f43fa0f523c64685167b8b9dfd5ee 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -130,7 +130,7 @@ static const struct kobj_type secvar_ktype = {
 	.default_groups = secvar_attr_groups,
 };
 
-static int update_kobj_size(void)
+static __init int update_kobj_size(void)
 {
 
 	u64 varsize;
@@ -145,7 +145,7 @@ static int update_kobj_size(void)
 	return 0;
 }
 
-static int secvar_sysfs_config(struct kobject *kobj)
+static __init int secvar_sysfs_config(struct kobject *kobj)
 {
 	struct attribute_group config_group = {
 		.name = "config",
@@ -158,7 +158,7 @@ static int secvar_sysfs_config(struct kobject *kobj)
 	return 0;
 }
 
-static int add_var(const char *name)
+static __init int add_var(const char *name)
 {
 	struct kobject *kobj;
 	int rc;
@@ -181,7 +181,7 @@ static int add_var(const char *name)
 	return 0;
 }
 
-static int secvar_sysfs_load(void)
+static __init int secvar_sysfs_load(void)
 {
 	u64 namesize = 0;
 	char *name;
@@ -209,7 +209,7 @@ static int secvar_sysfs_load(void)
 	return rc;
 }
 
-static int secvar_sysfs_load_static(void)
+static __init int secvar_sysfs_load_static(void)
 {
 	const char * const *name_ptr = secvar_ops->var_names;
 	int rc;
@@ -224,7 +224,7 @@ static int secvar_sysfs_load_static(void)
 	return 0;
 }
 
-static int secvar_sysfs_init(void)
+static __init int secvar_sysfs_init(void)
 {
 	u64 max_size;
 	int rc;

-- 
2.47.1



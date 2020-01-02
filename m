Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E316C12E356
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2020 08:32:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47pKWR4LJHzDqBr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2020 18:32:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WHXpgfq2"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47pKTW5RfDzDq9L
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2020 18:31:11 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id p14so21667303pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jan 2020 23:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CrxKb8FH1108rNWv898Y1pvRsrvWMXaQTRG0cZ6cWN4=;
 b=WHXpgfq2T0ZaknbGsRb2KQdZd1WxCpVQd+FJ6nQIw6s4/G2u41mULJ6jjRHM9zAEO/
 txg8Q5xR9B1uiIwB/94Eqyh9j7UT2YzgR81U/PUZzMRhtV176r837FtyvVUEnJgMv2lP
 FCFhY/0awP9nDLUTZtp5kxk3TJJLpQWsirwpFuRQubLij0iAmqwom6app9EkurGTvbpn
 EoDYGjtfRLyh4ucGzsEE24HYsyz3sitQVj+AmD7Av+NMF/1RiYVGlwl9XjUIsnGTXnJz
 6Kk5cJXHr/4BJE1/9Qoxnh5Twx3cwpx41TChflSOb8hrJh7KJYicHVxYlBEzydB2l9iW
 lEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CrxKb8FH1108rNWv898Y1pvRsrvWMXaQTRG0cZ6cWN4=;
 b=SoIDx7O+g0qxHyjxsMeqDNh6UYaeaJa320RsTEFxVxLHXhJJk9iNG8pJgsd0gEVpms
 EG/KABAjvWdTMQuMlT4m27pox+7y2YbV3GNuR3NNXC8zs6WH59sC4fxwMHk8ddu19tCx
 2sMx+S6gcVdor5M6vUdkEWJzkp73I9ZdQ4yrgT8xprBlqWn5tjEItOaUk65tmVIy/SLW
 SZKJ4+wudz0HpGqLNSpEtypty1LhBhRCxJJ40HY/xpa5dRUhk3+6BcH5PUUJLGPC/xvl
 xQVSXD+TEHpHvs4zFtNq0Mwq86pBrb7OeUP8jq5CndBjCgm24/qpIV5+RwwBC17wyo7d
 E0qw==
X-Gm-Message-State: APjAAAV267PbbYzhiJvm7nDWDw4Y/JHJD+bIsgf5X3w2oNZHxBp79zq7
 La51kVh+79Lz2Z5nZcdO6DSk4phu
X-Google-Smtp-Source: APXvYqyrDpxgFXmjtB40vtTxDLLYeDgvQ0sydavF7TFWk/mgmYUuBcnikuBxkPTxdp6npuH+7nQ+GQ==
X-Received: by 2002:a63:465b:: with SMTP id v27mr90065720pgk.257.1577950266940; 
 Wed, 01 Jan 2020 23:31:06 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id z16sm62852972pff.125.2020.01.01.23.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 23:31:06 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/config: Enable secuity features in skiroot
Date: Thu,  2 Jan 2020 18:30:58 +1100
Message-Id: <20200102073058.163746-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This turns on HARDENED_USERCOPY with HARDENED_USERCOPY_PAGESPAN, and
FORTIFY_SOURCE.

It also enables SECURITY_LOCKDOWN_LSM with _EARLY and
LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY options enabled.

MODULE_SIG is selected by lockdown, so it is still enabled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 069f67f12731..0a441c414a57 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -33,7 +33,6 @@ CONFIG_JUMP_LABEL=y
 CONFIG_STRICT_KERNEL_RWX=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_SIG=y
 CONFIG_MODULE_SIG_FORCE=y
 CONFIG_MODULE_SIG_SHA512=y
 CONFIG_PARTITION_ADVANCED=y
@@ -297,5 +296,15 @@ CONFIG_WQ_WATCHDOG=y
 CONFIG_XMON=y
 CONFIG_XMON_DEFAULT=y
 CONFIG_ENCRYPTED_KEYS=y
+CONFIG_SECURITY=y
+CONFIG_HARDENED_USERCOPY=y
+# CONFIG_HARDENED_USERCOPY_FALLBACK is not set
+CONFIG_HARDENED_USERCOPY_PAGESPAN=y
+CONFIG_FORTIFY_SOURCE=y
+CONFIG_SECURITY_LOCKDOWN_LSM=y
+CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
+CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY=y
+# CONFIG_INTEGRITY is not set
+CONFIG_LSM="yama,loadpin,safesetid,integrity"
 # CONFIG_CRYPTO_ECHAINIV is not set
 # CONFIG_CRYPTO_HW is not set
-- 
2.24.1


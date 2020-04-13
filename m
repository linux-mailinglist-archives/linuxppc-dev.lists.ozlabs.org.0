Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE21A6C62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 21:13:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491JDW1hx4zDqLf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 05:13:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nN2STru+; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491J6D36KkzDqLj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 05:07:47 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id b13so5959677oti.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 12:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1SmeqPeiRq4ELCasPb+U8ymC5PsnIVQabtpniLNnwes=;
 b=nN2STru+RfJVvuJeMIFQLgrdkOGYez2Z1PYGTs0D1LYSJqvmKwJ2hDWXUCxBg4RLPj
 e0e6yWG4G4STB9CcnJSsYza2LirnlHEpPq9CIxdm1bQzwZd53tTbf3U+znQvdzflYhNy
 otoWjP/4C6Fk/LRiQjc+PsttIfXcDhrrAf3fEzdGIloBcTrcZpA/PoUnhq+2ufxHtAab
 I2k8gkE59CGciNYEXd696x1ikWYVljkoLDX5ifETtdViSYXS3Ig5PeYO7p/r0KM0FE3D
 8qzuFlyCOAzv3BNw9hAPgXYP1lVP2NQo6EzcJJoHavxWzECzexsRQbR/sIBa7Hw3nx6K
 Y6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1SmeqPeiRq4ELCasPb+U8ymC5PsnIVQabtpniLNnwes=;
 b=t6lrqlGYP8VjNuGQp0q8hE3j8izSUQ9hV7CeuPPPHnxcwfnfihFSOg3ZPo9H3cCtS1
 dtSt1fSCkmMcQtaojgvyOKlUf2OvYSxnqd2CaM0LMdRjpIGl8ZWOQKuVo5Xnya8OuWLV
 ms60c2Y1LWA1kKbcrUfIj+PA33zGZa8tRaQ1ZpHAI2WXumz5aBsPUA9NHQ+GBcRYGUR5
 0UjDdCvuOE4f9FeQH7UB+Nux/wZ/Y0/HtuHdcwPkCkDS5dNOFDqXqainGXP4XitM+7rC
 XARt6vz0CeEONSchoTa+Vft06RDihbTsG3JJnN6Ni1k2j3fnXkDPoapqXjD7wTCt1GIK
 fZfA==
X-Gm-Message-State: AGi0Puaa6BD5hL4PdO0lXZoCxSc4oR7fAXv/RQ7vWW2Fs4GFYL02p/82
 yS5AOVnls62muAVYo5Hc1y4=
X-Google-Smtp-Source: APiQypJDQOcmUsrOhKZoci5yeuiwCmqlB0ibqUMV3v1Bb9nK4GHKKBGKcCU+pe7P0SvzixrgJnKrjw==
X-Received: by 2002:a9d:4808:: with SMTP id c8mr15527587otf.313.1586804864550; 
 Mon, 13 Apr 2020 12:07:44 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id j17sm4920241otp.58.2020.04.13.12.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 12:07:44 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/wii: Fix declaration made after definition
Date: Mon, 13 Apr 2020 12:06:45 -0700
Message-Id: <20200413190644.16757-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A 0day randconfig uncovered an error with clang, trimmed for brevity:

arch/powerpc/platforms/embedded6xx/wii.c:195:7: error: attribute
declaration must precede definition [-Werror,-Wignored-attributes]
        if (!machine_is(wii))
             ^

The macro machine_is declares mach_##name but define_machine actually
defines mach_##name, hence the warning.

To fix this, move define_machine after the is_machine usage.

Fixes: 5a7ee3198dfa ("powerpc: wii: platform support")
Reported-by: kbuild test robot <lkp@intel.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/989
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/powerpc/platforms/embedded6xx/wii.c | 25 ++++++++++++------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
index 67e48b0a164e..a802ef957d63 100644
--- a/arch/powerpc/platforms/embedded6xx/wii.c
+++ b/arch/powerpc/platforms/embedded6xx/wii.c
@@ -172,19 +172,6 @@ static void wii_shutdown(void)
 	flipper_quiesce();
 }
 
-define_machine(wii) {
-	.name			= "wii",
-	.probe			= wii_probe,
-	.setup_arch		= wii_setup_arch,
-	.restart		= wii_restart,
-	.halt			= wii_halt,
-	.init_IRQ		= wii_pic_probe,
-	.get_irq		= flipper_pic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-	.machine_shutdown	= wii_shutdown,
-};
-
 static const struct of_device_id wii_of_bus[] = {
 	{ .compatible = "nintendo,hollywood", },
 	{ },
@@ -200,3 +187,15 @@ static int __init wii_device_probe(void)
 }
 device_initcall(wii_device_probe);
 
+define_machine(wii) {
+	.name			= "wii",
+	.probe			= wii_probe,
+	.setup_arch		= wii_setup_arch,
+	.restart		= wii_restart,
+	.halt			= wii_halt,
+	.init_IRQ		= wii_pic_probe,
+	.get_irq		= flipper_pic_get_irq,
+	.calibrate_decr		= generic_calibrate_decr,
+	.progress		= udbg_progress,
+	.machine_shutdown	= wii_shutdown,
+};

base-commit: 8f3d9f354286745c751374f5f1fcafee6b3f3136
-- 
2.26.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3AE1E30C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 22:59:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WmYf6T6SzDqNg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 06:59:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AXnthflo; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WmX622PpzDqGQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 06:58:29 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id fs4so340522pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 13:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F26zeW4GLWARSnrEORKnMOfqslBUHMfZSurQbAYAbuo=;
 b=AXnthfloxC/4AXUlFHH90V2umIGLCyr5SggMMUdHfjzW/7kgSaqq1Cba1ifxqYrMwU
 zeP5xqq6XDqWiCbT8FOZdvCZTEFjT5IX67nobdkf93pvIKdHjORCIG2xIfGrrA3pq/2X
 akiYTNWIMKaZ0lya4pHtg5xc/HQv+w9NwO7mTJ7iuEodH2AZeyMkjFzRhApvO3iXiagT
 8SICmy7Fl+S7VYeA7yZHTTX0d7KPVE8WPSObV1orm3R9AtjG3h7DhMYqgjLZmkHW+ZvU
 IBfjN6ButVSsuWTFGZkOuxo7GTaV++mxzRTPsub0CtW5Iryc2KDSgEUN96gKjsj4aAXn
 eCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F26zeW4GLWARSnrEORKnMOfqslBUHMfZSurQbAYAbuo=;
 b=NYCrXxeLoghrmIyxkatGh7s8uEDKf80EAVoNMk2pw3LMkZ1/3093nCoL901pDu0MYR
 QvN1MEpUEQ79TZiMxjD/sMsxtgAMpAlrEatjsdazfzsVt88+B1Lf+BaKTwJ2tZYlgV1d
 RiatcAfdJTcOO+IxGVW9CNWcOAHIxF3dlisQOLqY/cbsdGjocriBkIOp+C5WZfHU9N4F
 74gjs3sFG8vsiyfI6QTQX4FL0893tR1v7JdVF1jmcUzRniqOw5uSRD1cZ+5k5xVGdwLe
 4TK5fVKO5bhgEE964TinJJlgXBo3jw6f/7/y0iXZ8034AjUowml6KlLnRfFlmNq+SHJR
 DiKA==
X-Gm-Message-State: AOAM531cUl5U7NNeFG4tdow+BhVQar7fd0ZZzLIWw1mos8N6EG5Dw6QB
 EyqFEimn3vqXnUTnvNal8ME=
X-Google-Smtp-Source: ABdhPJzIPs3U/H/hy/IdG5CS11VpSpxr/KBY8qOG3iHdT7E7cluhT5dkHhRLjCB21iwigA3gOl4U/w==
X-Received: by 2002:a17:90a:8814:: with SMTP id
 s20mr1174769pjn.74.1590526705804; 
 Tue, 26 May 2020 13:58:25 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id i11sm383619pfq.2.2020.05.26.13.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 13:58:25 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc/wii: Fix declaration made after definition
Date: Tue, 26 May 2020 13:57:57 -0700
Message-Id: <20200526205756.2952882-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200413190644.16757-1-natechancellor@gmail.com>
References: <20200413190644.16757-1-natechancellor@gmail.com>
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
Cc: kbuild test robot <lkp@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
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

To fix this, move define_machine after the machine_is usage.

Fixes: 5a7ee3198dfa ("powerpc: wii: platform support")
Reported-by: kbuild test robot <lkp@intel.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/989
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* s/is_machine/machine_is/ (Nick)

* Add Nick's reviewed-by tag.

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

base-commit: b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8
-- 
2.27.0.rc0


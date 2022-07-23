Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3DA57F1CF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 23:47:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lr0JL443Zz3dph
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jul 2022 07:46:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JC3nAoMT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JC3nAoMT;
	dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lr0Gy4b0bz2xmj
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jul 2022 07:45:44 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id i7so5837561qvr.8
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jul 2022 14:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qOV2niHKO7PtVMQqwHmkefwvvV5KsW69pLHmCgIHVEs=;
        b=JC3nAoMTVQvMQDRTMWOnWiytHG6OpszfZ4JQQrRPLIGuJpq4TguV9NhcxQFSTn7dWV
         HxMgtOMRWGlVxr22qPPO+AJLWE2xkgFolvdcPFh9IPbk6yEw8hal86GpH0LA9fCyQf1n
         i4QUmivVhWxelD9ZVZSnGmVg4zyzVTjWp4Qwdaa73uGvSznM20cAjqypqnas3QJxiH8v
         8qMCKoJGDPWDKtZD2WPtDsN3pqn63sB0YCgRFRPaQqNU+ltLzCQgCn5unw77RP4G8KUH
         ERaQHoiQiJbfxWdNtvFdGqxOHZTtXtOXXd6MkeJoxGsq7wWiAA4SktoGC6aR477DaaE8
         G+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qOV2niHKO7PtVMQqwHmkefwvvV5KsW69pLHmCgIHVEs=;
        b=cUlUkxJlSpaOlvgzuYwpTL18MFQrMC9sIGkx9Gfw58Cohl7A08xw/i3aqoR1//psvL
         bRD1oeC7IVLntIxZHE3P2PAj2usxix8P49OEyEe1AGXIedWqN7Nbg0IAahNzRV18Y5b6
         SQswyS/qF03u8kAlBJdo++kbGqP791Ir8L6quIRRPYP8YAn5tjp4amiSm8Dg3hMRXCH9
         AlgC+Z8Ajg6gYBY2ZqkYA7EcpNSUwxL+WITyh2j3d+0NND213jCHoSRJRvDjQKxnXR5H
         I03hhJiGtnTZ6/awI/Jqk3tpGl33uBNqLKVjxca/WZ6NXi0K8OJZor/NpXxa1GneDwCY
         HBWQ==
X-Gm-Message-State: AJIora/WvQGMYGDoAFbimfXNyo26yuERU0HKwnhlkD6qvQ41j5OPZGIW
	ITuNhplC1APwQPhjzAQAP+o=
X-Google-Smtp-Source: AGRyM1tWJtYmpPAC6pDD2r1ggEtIQghnJsNEc6XwBU5AEZoOA4HkiFaN+EK8a/VXa4gscI8VFXC9yA==
X-Received: by 2002:a0c:800d:0:b0:474:19c:f0af with SMTP id 13-20020a0c800d000000b00474019cf0afmr5070727qva.74.1658612741164;
        Sat, 23 Jul 2022 14:45:41 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:1230:6235:40e3:a1d2:6281])
        by smtp.gmail.com with ESMTPSA id f22-20020ac84716000000b0031ed590433bsm4903219qtp.78.2022.07.23.14.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 14:45:40 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in archrandom.h
Date: Sat, 23 Jul 2022 14:45:36 -0700
Message-Id: <20220723214537.2054208-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220723214537.2054208-1-yury.norov@gmail.com>
References: <20220723214537.2054208-1-yury.norov@gmail.com>
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
Cc: Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

archrandom.h includes <asm/machdep.h> to refer ppc_md. This causes
circular header dependency, if generic nodemask.h  includes random.h:

In file included from include/linux/cred.h:16,
                 from include/linux/seq_file.h:13,
                 from arch/powerpc/include/asm/machdep.h:6,
                 from arch/powerpc/include/asm/archrandom.h:5,
                 from include/linux/random.h:109,
                 from include/linux/nodemask.h:97,
                 from include/linux/list_lru.h:12,
                 from include/linux/fs.h:13,
                 from include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
include/linux/sched.h:1203:9: error: unknown type name 'nodemask_t'
 1203 |         nodemask_t                      mems_allowed;
      |         ^~~~~~~~~~

Fix it by removing <asm/machdep.h> dependency from archrandom.h

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/include/asm/archrandom.h |  9 +--------
 arch/powerpc/kernel/setup-common.c    | 11 +++++++++++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
index 9a53e29680f4..21def59ef1a6 100644
--- a/arch/powerpc/include/asm/archrandom.h
+++ b/arch/powerpc/include/asm/archrandom.h
@@ -4,7 +4,7 @@
 
 #ifdef CONFIG_ARCH_RANDOM
 
-#include <asm/machdep.h>
+bool __must_check arch_get_random_seed_long(unsigned long *v);
 
 static inline bool __must_check arch_get_random_long(unsigned long *v)
 {
@@ -16,13 +16,6 @@ static inline bool __must_check arch_get_random_int(unsigned int *v)
 	return false;
 }
 
-static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
-{
-	if (ppc_md.get_random_seed)
-		return ppc_md.get_random_seed(v);
-
-	return false;
-}
 
 static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 {
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index eb0077b302e2..18c5fa5918bf 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -171,6 +171,17 @@ EXPORT_SYMBOL_GPL(machine_power_off);
 void (*pm_power_off)(void);
 EXPORT_SYMBOL_GPL(pm_power_off);
 
+#ifdef CONFIG_ARCH_RANDOM
+bool __must_check arch_get_random_seed_long(unsigned long *v)
+{
+	if (ppc_md.get_random_seed)
+		return ppc_md.get_random_seed(v);
+
+	return false;
+}
+EXPORT_SYMBOL(arch_get_random_seed_long);
+#endif
+
 void machine_halt(void)
 {
 	machine_shutdown();
-- 
2.34.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F74A1012C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 06:05:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HDKH0lJVzDqLS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 16:05:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NzXqUC3r"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HD8L0xkWzDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 15:57:22 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id 19so6833966otz.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 20:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JKv0VBuRwgPnUIE0FprSRERanMIVD3+yR6LSEQF1wLY=;
 b=NzXqUC3rnt0t3oKIEOl8NmoyMTwTXCgprN8GV/9qLL2YKXtUMUu4P4K8Ih1vdBU3Os
 /FriExA87fkZ2pE9T4EP9h9zsRQPj+ooLLWOb0gZQymIW46Ymn6/0gSLXYdqACB5SlLZ
 Yw6tIOXBARBSHr4lyussaVG4PrXR2VfkNP8NPr0noFNDUic2AJ0YH8Yrf/J+cOAsxefk
 tPwZgOjBo5fyoB422297DNvybdtVR2iZ80VL6bv4e+a9Rq24OFaUyRcoviTWVYtJmGsr
 BLODOqp1dTrWWHbK7LmRt0r4HLm77pUeDUneUvl5k62ym2Hay6x9uyrPdAJ4D5TzxHv9
 ajtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JKv0VBuRwgPnUIE0FprSRERanMIVD3+yR6LSEQF1wLY=;
 b=J2m4ezgzzZ2IioWgRDZRxDJkIVEh4P7rF8bjOEbt298f2qMv9Y4M59Yj9BJl1T81dB
 coSIzEFZtGONfFUKpfhCw7Bsz98fhE5m9JpnNQtKUX3Kndoi4iED8ddLGkEEKcfI2fOb
 M0pGYTmOUJR3dmfX8SDtl3Q6iUXbQ9I5tLHohZ714Lm6JjRWEDo0qk1N6x9zsQZrw/sV
 jOnOqU/4eibAbyvhAkVFeaIYtsIF34+GZVNGhUVNIp+KrTaW7Ct7N9VsC3tqW2If66XH
 7IAKRwX6VeWryRcswTncp4ww9+LnqLaLqaSrwaWoMlMSLsnOfd4v0bzW9IVBGEfu8o4V
 QzGw==
X-Gm-Message-State: APjAAAV43Db0uro4xFpwqCSi7qpl1gGtRHrgtXJs1cYgudwi7LWdHMhb
 sXVsQkV2B4oavI8o+7lChaI=
X-Google-Smtp-Source: APXvYqxbAXeCxTtTdtfhCHIZocbAGoX1snmaFJ97WP3dgp44HVZfrhRUFqdNVrqmdzEN5O2SrmZvgQ==
X-Received: by 2002:a9d:75c7:: with SMTP id c7mr2239508otl.12.1574139440139;
 Mon, 18 Nov 2019 20:57:20 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::7])
 by smtp.gmail.com with ESMTPSA id e88sm7019765ote.39.2019.11.18.20.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 20:57:19 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 3/3] powerpc/prom_init: Use -ffreestanding to avoid a
 reference to bcmp
Date: Mon, 18 Nov 2019 21:57:12 -0700
Message-Id: <20191119045712.39633-4-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119045712.39633-1-natechancellor@gmail.com>
References: <20191014025101.18567-1-natechancellor@gmail.com>
 <20191119045712.39633-1-natechancellor@gmail.com>
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

r374662 gives LLVM the ability to convert certain loops into a reference
to bcmp as an optimization; this breaks prom_init_check.sh:

  CALL    arch/powerpc/kernel/prom_init_check.sh
Error: External symbol 'bcmp' referenced from prom_init.c
make[2]: *** [arch/powerpc/kernel/Makefile:196: prom_init_check] Error 1

bcmp is defined in lib/string.c as a wrapper for memcmp so this could be
added to the whitelist. However, commit 450e7dd4001f ("powerpc/prom_init:
don't use string functions from lib/") copied memcmp as prom_memcmp to
avoid KASAN instrumentation so having bcmp be resolved to regular memcmp
would break that assumption. Furthermore, because the compiler is the
one that inserted bcmp, we cannot provide something like prom_bcmp.

To prevent LLVM from being clever with optimizations like this, use
-ffreestanding to tell LLVM we are not hosted so it is not free to make
transformations like this.

Link: https://github.com/ClangBuiltLinux/linux/issues/647
Link: https://github.com/llvm/llvm-project/commit/76cdcf25b883751d83402baea6316772aa73865c
Reviewed-by: Nick Desaulneris <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v3:

* New patch in the series

v3 -> v4:

* Rebase on v5.4-rc3.

* Add Nick's reviewed-by tag.

* Update the LLVM commit reference to the latest applied version (r374662)
  as it was originally committed as r370454, reverted in r370788, and
  reapplied as r374662.

v4 -> v5:

* Rebase on next-20191118 to avoid a conflict with commit
  6266a4dadb1d ("powerpc/64s: Always disable branch profiling for prom_init.o")

 arch/powerpc/kernel/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 3c113ae0de2b..82170c155cb6 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -23,6 +23,7 @@ CFLAGS_prom.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 
 CFLAGS_prom_init.o += $(call cc-option, -fno-stack-protector)
 CFLAGS_prom_init.o += -DDISABLE_BRANCH_PROFILING
+CFLAGS_prom_init.o += -ffreestanding
 
 ifdef CONFIG_FUNCTION_TRACER
 # Do not trace early boot code
-- 
2.24.0


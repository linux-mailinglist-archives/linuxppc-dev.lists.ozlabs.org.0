Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1971D848A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 20:14:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QnG20XklzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 04:14:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rgY0C0Tx; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QnBK3W9dzDqgw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 04:10:49 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id a68so8879331otb.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZxD1YrOrHOLHOKBWQNSGC/hDMCUT9Jgny3VoBoayC0=;
 b=rgY0C0TxLfXX74YNZwA4VgzP454UWEwbM/tZyy31ob24Ee4XFMN6Rix6QE4ltW0OWG
 Qj5mgRkU05rz5D51ZtpCGQ8e3sUS+clBEam1iTRP1a0f7n8RBN0bhA4sMPbqDxzBeytU
 tF2BDnPUfBtEW/21kSTdpTKgLh7wQzoZnC88kqbxQFxBdsI2AYVtzXvD9is6D/p4pDsx
 nXP0GAYQgVWbIo5TF6UF0PkiicakjgzzTeWX4iRZr3BddcvO1GGf9Z98OmUpKQG5F0Bk
 HI12SyWjxRsNmL5wMqUMLsUSNHtlvtqiCUEikkFfJXtVxvNI6nj1GCjS4vTtmKTGvgK5
 6hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZxD1YrOrHOLHOKBWQNSGC/hDMCUT9Jgny3VoBoayC0=;
 b=ZgBmt2bTvmVUjwdmZn9P7+v+0XW2ejj1Z/oT6rGSnkYvdq6cPXWURY8S5AdS1ckeg3
 ANnP5DRuhcfTPZZmh4RFu+zscKb4sJttA80sabZsoODJbFU8DLF82A9YqSRKpRCUgob2
 2G8D3C9Y4Gu4UEH07wVxUmylncAlSz8ZNnAHRI1s1UdFmuSiLyyjS2K272sslhCedHZI
 +xQ2we6z8qDldENDvN/B5ZYnN1wMOdj26IsOPya39ROIzFUyQrn0w/vaAuqWBuBxt6Rp
 tsqOEjaWBqKUY51x3QoUncU/v/MZDxHkW8c+GB8QOxbGklp8BKjxYXJ0zy3rykzoEKjM
 4APw==
X-Gm-Message-State: AOAM532Bxn2f7niSzTlyyY9QLZW0ETa4WMgDOH1YQ0E+8ep3Xc00L6AT
 8rve1jmIriOZW/XV6seG0os=
X-Google-Smtp-Source: ABdhPJyaAm9aVKpeNqS9nc9LMsHNSDoAZXomzsHfqr9mAnU1CS9TL17kMcTO/zK8nuEcBt5aPPiiCQ==
X-Received: by 2002:a9d:a4c:: with SMTP id 70mr13974434otg.334.1589825445493; 
 Mon, 18 May 2020 11:10:45 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id t22sm3217760oij.2.2020.05.18.11.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 11:10:45 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] input: i8042: Remove special PowerPC handling
Date: Mon, 18 May 2020 11:10:43 -0700
Message-Id: <20200518181043.3363953-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <87a7254bxd.fsf@mpe.ellerman.id.au>
References: <87a7254bxd.fsf@mpe.ellerman.id.au>
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

This causes a build error with CONFIG_WALNUT because kb_cs and kb_data
were removed in commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and
include/asm-ppc").

ld.lld: error: undefined symbol: kb_cs
> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a

ld.lld: error: undefined symbol: kb_data
> referenced by i8042.c:309 (drivers/input/serio/i8042.c:309)
> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> referenced by i8042-ppcio.h:33 (drivers/input/serio/i8042-ppcio.h:33)
> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> referenced by i8042.c:319 (drivers/input/serio/i8042.c:319)
> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> referenced 15 more times

Presumably since nobody has noticed this for the last 12 years, there is
not anyone actually trying to use this driver so we can just remove this
special walnut code and use the generic header so it builds for all
configurations.

Fixes: 917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/input/serio/i8042-ppcio.h | 57 -------------------------------
 drivers/input/serio/i8042.h       |  2 --
 2 files changed, 59 deletions(-)
 delete mode 100644 drivers/input/serio/i8042-ppcio.h

diff --git a/drivers/input/serio/i8042-ppcio.h b/drivers/input/serio/i8042-ppcio.h
deleted file mode 100644
index 391f94d9e47d..000000000000
--- a/drivers/input/serio/i8042-ppcio.h
+++ /dev/null
@@ -1,57 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _I8042_PPCIO_H
-#define _I8042_PPCIO_H
-
-
-#if defined(CONFIG_WALNUT)
-
-#define I8042_KBD_IRQ 25
-#define I8042_AUX_IRQ 26
-
-#define I8042_KBD_PHYS_DESC "walnutps2/serio0"
-#define I8042_AUX_PHYS_DESC "walnutps2/serio1"
-#define I8042_MUX_PHYS_DESC "walnutps2/serio%d"
-
-extern void *kb_cs;
-extern void *kb_data;
-
-#define I8042_COMMAND_REG (*(int *)kb_cs)
-#define I8042_DATA_REG (*(int *)kb_data)
-
-static inline int i8042_read_data(void)
-{
-	return readb(kb_data);
-}
-
-static inline int i8042_read_status(void)
-{
-	return readb(kb_cs);
-}
-
-static inline void i8042_write_data(int val)
-{
-	writeb(val, kb_data);
-}
-
-static inline void i8042_write_command(int val)
-{
-	writeb(val, kb_cs);
-}
-
-static inline int i8042_platform_init(void)
-{
-	i8042_reset = I8042_RESET_ALWAYS;
-	return 0;
-}
-
-static inline void i8042_platform_exit(void)
-{
-}
-
-#else
-
-#include "i8042-io.h"
-
-#endif
-
-#endif /* _I8042_PPCIO_H */
diff --git a/drivers/input/serio/i8042.h b/drivers/input/serio/i8042.h
index 38dc27ad3c18..eb376700dfff 100644
--- a/drivers/input/serio/i8042.h
+++ b/drivers/input/serio/i8042.h
@@ -17,8 +17,6 @@
 #include "i8042-ip22io.h"
 #elif defined(CONFIG_SNI_RM)
 #include "i8042-snirm.h"
-#elif defined(CONFIG_PPC)
-#include "i8042-ppcio.h"
 #elif defined(CONFIG_SPARC)
 #include "i8042-sparcio.h"
 #elif defined(CONFIG_X86) || defined(CONFIG_IA64)

base-commit: 72bc15d0018ebfbc9c389539d636e2e9a9002b3b
-- 
2.27.0.rc0


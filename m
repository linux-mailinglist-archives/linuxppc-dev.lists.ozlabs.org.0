Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D15BF97A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:44:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fP3b2wG5zDqxj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:44:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="GqCpdlt2";
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN0N2c5mzDqs1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:36 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id a2so2240551pfo.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DewAllPq01LncnaE6NYCCskktLTPQ+Oq7qAAM5yWaKA=;
 b=GqCpdlt27oIxoalJ+q55GpBWVA+O9B4EMwRWAPEitDTY5x/y/r3wW9KbkZvPr2V4X/
 S8caIKThukUOlDs2WCows35gv3FJcnOv4JTcjIQERxd+vzGaspWFjmHz3dbggEHqAL0H
 9XgrssZH7A/r46cr0/K6ftOAUAm1WnB4t7vdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DewAllPq01LncnaE6NYCCskktLTPQ+Oq7qAAM5yWaKA=;
 b=UN4Ux66C0dqSEvXUSVOW5iZBf4xsJo0AgmZdO5KlhehnSbIJqfyP4Za1/jLcXbbCKU
 Ft6qInOfTtdyTnErxpqcSqjbI4vyIkMTgxzQsSK4ketquDH4Ri3NC/jgoU2uT+/6S680
 49bzOjFWFMXuTFjD03j8JM4Kr+ITY3ArrKmR40EZ9bAT4qAu4l/bccpY6zyblHj//Cnv
 8rBXjnNR50lGKbxJL7TqPl84Klve+ia80Nn4JA+3PZQxLVTorH24H4c3zHLtE7ThjOJo
 PoHv8dhHdDbTZcTErGZTdV24ffhin7PR2x8FMIAm64zkLxTIoTjmCkULTq3dZZ1So+lw
 Ufsw==
X-Gm-Message-State: APjAAAWsS4i58A7exFcoLuKpceY5NXLv/EkQdkmcfPw0Dq2zQ/7MAI9t
 PJXH82KhbR70XsZy+virvBwQqg==
X-Google-Smtp-Source: APXvYqy6lsJedhQhLRYmBsUadf9UZQvX3qa3S7SjzPO8c/ioUQ997KVZPcsBQte8g5aQEg6d61NfYg==
X-Received: by 2002:a65:5c0b:: with SMTP id u11mr4650029pgr.294.1569520592850; 
 Thu, 26 Sep 2019 10:56:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m2sm3024583pgc.19.2019.09.26.10.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:30 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 24/29] powerpc: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 26 Sep 2019 10:55:57 -0700
Message-Id: <20190926175602.33098-25-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 linux-parisc@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The EXCEPTION_TABLE is read-only, so collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 4e7cec088c8b..2ed44e5824d5 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -7,6 +7,7 @@
 
 #define BSS_FIRST_SECTIONS *(.bss.prominit)
 #define EMITS_PT_NOTE
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	0
 
 #include <asm/page.h>
 #include <asm-generic/vmlinux.lds.h>
@@ -162,7 +163,6 @@ SECTIONS
 		__stop__btb_flush_fixup = .;
 	}
 #endif
-	EXCEPTION_TABLE(0)
 
 /*
  * Init sections discarded at runtime
-- 
2.17.1


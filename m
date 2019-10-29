Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A10CE92F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 23:16:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472mBW38HvzF3WP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 09:16:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="MubpaUS4";
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kyg1k0gzF36V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:20:43 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id p5so3137200plr.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OvLPSIr20MO1GrkJ0OvwvGngd4/e51+GSaoElj9X+Gc=;
 b=MubpaUS4tHoReayETOIOWs+UpyMNXi3+g7N+ywDFi9zOzhpG5+ZUItxnBn6YjbZqXh
 paBOw3W55VS7rZu51ahUmY0fFJgtBFJYJ3pn22Ptz7nrtHG22uqdhr4XUVK2RZm1oi58
 oDEHrfa53FOnH3TQxpTEFg+lMs4RonQkU3kjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OvLPSIr20MO1GrkJ0OvwvGngd4/e51+GSaoElj9X+Gc=;
 b=t7C70n0vSkBinMxAX7sUa8psffMUC5cg+zHBdPxpILrXPzkfy64hvoKf39tNnOVKaQ
 Xr3kpW/MOjj7yVRIb+XlydQB06cvDvbIvNgX8rtn39tAKdbgIbDr9hBGfzGNVnnhhCza
 1BG2EuPSQpbHcOpp2BfMJIXWf9JhNrZtlAHPH33d9rkxoZAgCAPlJWjgDvuplk2cDPg4
 w7939mmWKif6qDypYFjCmApW4US6frqyMxca0TADZI1Fzkx6opSy3E5x2QBDUfyBC/CE
 pXLCto49pknBrTkKv5tKcegofriIxnx7lT/ufpiST9mMiCCdhEUwkFpOYlS3MGXNpI5N
 rEsA==
X-Gm-Message-State: APjAAAVAQ+4K1wc1JEjBfNWe1MCQ/QFRC1Y+fZKdFSdaFiRPiXARFiWW
 CR/2se1qtpYo6lo+uCRMpmKglg==
X-Google-Smtp-Source: APXvYqzV95hY+aVbWcx6HzxeaR6KOCXs7TBX7sOZo1MRJwttiLadHkvLLgsv0irLF7laDVGp9UyK9Q==
X-Received: by 2002:a17:902:bd06:: with SMTP id
 p6mr759011pls.120.1572384039491; 
 Tue, 29 Oct 2019 14:20:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o20sm58329pfp.16.2019.10.29.14.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 14:20:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 24/29] powerpc: Move EXCEPTION_TABLE to RO_DATA segment
Date: Tue, 29 Oct 2019 14:13:46 -0700
Message-Id: <20191029211351.13243-25-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
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
 Michal Simek <monstr@monstr.eu>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Andy Lutomirski <luto@kernel.org>,
 linux-alpha@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 4e7cec088c8b..8834220036a5 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -7,6 +7,7 @@
 
 #define BSS_FIRST_SECTIONS *(.bss.prominit)
 #define EMITS_PT_NOTE
+#define RO_EXCEPTION_TABLE_ALIGN	0
 
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


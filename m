Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE99DBF8A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:05:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fNB90gSBzDqlV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:05:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="KfnDRarT";
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN093LyGzDqqD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:22 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id d22so1616067pll.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tfsXsrL5x37ZSQucWl8Bh6EyFQTE0kRi9peGDqUDYWM=;
 b=KfnDRarTGgWf60O4C9cF+YzTjYXp+pSkpdzWR7YKNXHXP7TAfTSHAkqA4UoYNAcWUP
 NDUbjKE6AWe2+D+wOTvvlqXbdNAJZsnyYEgw38E2fXR/V8EEz3Xj/vyRfzrhH+es6//f
 V34BpcFgVde9WGbqi6+RYmyV1MCa8QFUww3V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tfsXsrL5x37ZSQucWl8Bh6EyFQTE0kRi9peGDqUDYWM=;
 b=exWzAL3xEjArzL25u+x8ttXq+8jaHC8mHEnNTDIW1UfUuXahA+gPnDN+nZZVEhH5sJ
 eee1SkVLJrrPdYKTfKZLDolEGZSc7/F+ka/u6sI1iXRaN0xHycNnt/Cf4nYdIxll7I0O
 8dZgckXpomkm2Vg31zK/EnqFmbImyP1exoh8wLe4h9o/gjqS/+JEoKX2jeunuURgPSsJ
 VqF3cCVfDIJxiDvJP/ZR8Zc1MSh+CnBF9w6nEduvC1Xo4yuCj4UYN9PY3W46vdrZFj5p
 DyBreEPZSiXi1yDO/DXcr4hk79QxQ7smGY+1LRARMAUPVptgvStSdzLU9mGiOyVy8Agr
 wYEA==
X-Gm-Message-State: APjAAAVFDc8Hj0OZObVHC4ydgXDQYRa+71JTbGQQIj+VgIlEKaU6OXMp
 0l2UGgnBMmT9heLYnpzIO5AEqw==
X-Google-Smtp-Source: APXvYqxNefsDmg9i8vv1ozpPK1xitEq/TEjXZ0cxntHJv7Z/K7QxcGEiK4QwS+/LuR6Pbs4fqhuAog==
X-Received: by 2002:a17:902:9a92:: with SMTP id
 w18mr5189269plp.201.1569520580043; 
 Thu, 26 Sep 2019 10:56:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id f15sm2984785pfd.141.2019.09.26.10.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:17 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 04/29] alpha: Rename PT_LOAD identifier "kernel" to "text"
Date: Thu, 26 Sep 2019 10:55:37 -0700
Message-Id: <20190926175602.33098-5-keescook@chromium.org>
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

In preparation for moving NOTES into RO_DATA, this renames the linker
script internal identifier for the PT_LOAD Program Header from "kernel"
to "text" to match other architectures.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/alpha/kernel/vmlinux.lds.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index c4b5ceceab52..781090cacc96 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -8,7 +8,7 @@
 OUTPUT_FORMAT("elf64-alpha")
 OUTPUT_ARCH(alpha)
 ENTRY(__start)
-PHDRS { kernel PT_LOAD; note PT_NOTE; }
+PHDRS { text PT_LOAD; note PT_NOTE; }
 jiffies = jiffies_64;
 SECTIONS
 {
@@ -27,14 +27,14 @@ SECTIONS
 		LOCK_TEXT
 		*(.fixup)
 		*(.gnu.warning)
-	} :kernel
+	} :text
 	swapper_pg_dir = SWAPPER_PGD;
 	_etext = .;	/* End of text section */
 
-	NOTES :kernel :note
+	NOTES :text :note
 	.dummy : {
 		*(.dummy)
-	} :kernel
+	} :text
 
 	RODATA
 	EXCEPTION_TABLE(16)
-- 
2.17.1


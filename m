Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB95ED36AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 03:05:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q8rk28RyzDqXL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 12:05:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="Vo/YkX68";
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q7hJ3xH3zDqCR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 11:13:04 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id y5so4959539pfo.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 17:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OvLPSIr20MO1GrkJ0OvwvGngd4/e51+GSaoElj9X+Gc=;
 b=Vo/YkX68H3JSVeYxOg0wgKZHM0DDpLq1uGIDRlC9At7IoYDSFTbfrL3kzgv//JSf1l
 wfMMq2ZZ1sw3ulG7OB/Al6Lb7yhUEHFwVbMy0hx6CDWOUEDVNEPAVOGo2TBJff56wZsX
 1wJpR43jEKVUBiVd5MS1y8q4VLWL+t/un7fCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OvLPSIr20MO1GrkJ0OvwvGngd4/e51+GSaoElj9X+Gc=;
 b=Q8K+5fSiCANeESKy8XxjTv1OFthdIq+2sJbYXvrohn/nv913h4RRtyxzkIcAeRZzAH
 FzbykKQD4QAutaARG4RHwLvjY18sz+mc0mom1EcH4u+0/7R2pYGGNsq3pXxDgv+L/g7w
 Lt5412yrre5Gd+qEUUtauElGYAO0+soHH7QoM611pv6OWLjvANXCONWiob9E015aMVbS
 SljP03ed7nPkfZqmzq2GnD4KJQYkev5YN7c2iwkJ0qWHEgoy+eGGSPTG8UpTFSGUZCWB
 F7KPL2h1XfVBqQrSOuM//Av6r3jA6qqtknoCOefFKlAnHGoPiGwXmweWzPL5Cdfn4XcQ
 GuJA==
X-Gm-Message-State: APjAAAVHd8ykov9eQAKIpE7O48K1cIOcTx92eVCzAaUqOXwYh7/aqrxa
 2ThnIvJOPIrxDbuqCwprkTDWIQ==
X-Google-Smtp-Source: APXvYqwcXL9IUcA1NwWjkBG6ihgZ1mTQNQKZY+myfeizvcbcy9RQ9+vXBtLYoNyG3c9FkCNmz89Vqw==
X-Received: by 2002:a63:4383:: with SMTP id
 q125mr13830250pga.373.1570752781928; 
 Thu, 10 Oct 2019 17:13:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v68sm8097683pfv.47.2019.10.10.17.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 17:12:56 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v2 24/29] powerpc: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 10 Oct 2019 17:06:04 -0700
Message-Id: <20191011000609.29728-25-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011000609.29728-1-keescook@chromium.org>
References: <20191011000609.29728-1-keescook@chromium.org>
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
 Michal Simek <monstr@monstr.eu>, x86@kernel.org, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-xtensa@linux-xtensa.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
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


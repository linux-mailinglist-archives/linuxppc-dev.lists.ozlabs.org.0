Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A980FD3694
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 02:53:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q8bH2mhNzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 11:53:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="VJjnLJGI";
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q7hB21vKzDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 11:12:58 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id s17so3589548plp.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 17:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bvYKnL/TaFkIaenIAvKRMlAb1gjfrMgYQ33pk+cyLNw=;
 b=VJjnLJGIO0uGgKBCPhgyxZ/iGefUMJczEPz55L/NXxQm4X5HtH7Z6IwSEISlxXbPIi
 0AKWMzRKkEkFoTXpqSQ6so/StMfOF2yJFPqmtCJOuv0Jt6L5qcDOFqlnVgUtBy87cn2m
 oVq9vePrz89q5V3+gDCK4GhXWqgAgeYpXsYQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bvYKnL/TaFkIaenIAvKRMlAb1gjfrMgYQ33pk+cyLNw=;
 b=iY+2Rz42cUDg+Ld4RDlmnm1kJBGjG7fd87MXLtkKSD2D09GJF572+2XyiuGERp9vXA
 IU0xi1avRDpNA06ctaIiCpC/Hve1X3tacFKxkXQ+ERTReRcVPkmQwbskviKWIJaGfpzL
 8wKLuGCT8euSPlHiyZd+HpP3C8AKbAUJmQ4Z8VmDl9Z1hGVn3/ZGXqQgaqTF5uQsL4kN
 TfAOUJnIaBD6khKyLT6q2FAnEiVjKsL4IrySx9fJoP0gUyezU5LD/E6/XeMDpI4GT/X/
 4eGCZB+gRPKKd9XssK3QGxFfMee+4IPkd6nWZpm39JRfEYQhdelio4HlpWEdag+rk8kn
 lKyA==
X-Gm-Message-State: APjAAAUu2kCRdZ3u/pAL1KSXLEGocokM+omytzbG2t8mH5uTs5+UJwPn
 n8O/0cp8S8SD07Hq8Fo41VVAZg==
X-Google-Smtp-Source: APXvYqz1nJHbdicuisYaMkUGL4dW9cHVrS4hPr3bZVo4nTa2ffJhe6O1BBJ7QgwtCPb4vvcDzPVB3A==
X-Received: by 2002:a17:902:b410:: with SMTP id
 x16mr12316640plr.46.1570752775741; 
 Thu, 10 Oct 2019 17:12:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j128sm7319082pfg.51.2019.10.10.17.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 17:12:52 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v2 22/29] microblaze: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 10 Oct 2019 17:06:02 -0700
Message-Id: <20191011000609.29728-23-keescook@chromium.org>
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
 arch/microblaze/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/microblaze/kernel/vmlinux.lds.S b/arch/microblaze/kernel/vmlinux.lds.S
index b8efb08204a1..760cac41cbfe 100644
--- a/arch/microblaze/kernel/vmlinux.lds.S
+++ b/arch/microblaze/kernel/vmlinux.lds.S
@@ -11,6 +11,8 @@
 OUTPUT_ARCH(microblaze)
 ENTRY(microblaze_start)
 
+#define RO_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm/page.h>
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/thread_info.h>
@@ -52,7 +54,6 @@ SECTIONS {
 
 	. = ALIGN(16);
 	RO_DATA(4096)
-	EXCEPTION_TABLE(16)
 
 	/*
 	 * sdata2 section can go anywhere, but must be word aligned
-- 
2.17.1


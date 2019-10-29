Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71AE92FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 23:22:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472mL50F8tzF3V3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 09:22:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="eUd4sJyu";
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kyh03ZXzF37D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:20:44 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id r4so4875940pfl.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bvYKnL/TaFkIaenIAvKRMlAb1gjfrMgYQ33pk+cyLNw=;
 b=eUd4sJyuTxgb840F9yzQhnhrVaW7UlInFUEaGLHC1o+XiNP1nT/Ur++05DeF2BOEy1
 B62m8k8aGhQzoIv1kV+qUa/1jSYvGM+XuBBi2YZI/Sqw728eeJNak1/uE8PFXjImt3OF
 0AKvdtizmmUcAZkSIZCgqYnSyMgJK/Tq10Dl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bvYKnL/TaFkIaenIAvKRMlAb1gjfrMgYQ33pk+cyLNw=;
 b=ZZalFqpabTOIrkPIrTLt4Q4CXwQRSvF8Bjw++a5DpAzT5wRjoFTa+qTXmdN0vGVd7P
 xL2+dweH0NuZuPwJhDhsKDOYnKGoQLGeDtgpXQBHhCfrkDA4+gHOtYI6hEgjScFcOMf7
 lSdBFpbz3lRpVP8zV47r4D1XWy5YXejFhWwQWurDls0tQX3CvHxT+c0uEnbUxY+g0H5z
 2e4F9xDy5AIx74fkhfGDhbf4/K+De24AujtvuRLXAmrgGCIaorQY+9Cc2vaDR/2kmsx7
 FPyWD79zkdBsgOxoY00hlLUIdT2B849fXCBwYtVZFMVArbCHreuJ7Rm5o1kVwgqA83t6
 HrLw==
X-Gm-Message-State: APjAAAUC2+4Mbm9HQGF0Kr+0z149tH0YAXJ5QIm1GFg0IqqNRHmJd/gj
 Inc23sULF140Oi03O9XNVCYQaA==
X-Google-Smtp-Source: APXvYqwwc1LDGwYBzq0oCKE2jPQZSBhTqIM79blAEpYmjFxE7wS/lF6/Gpxpu2EeXpX55BTOzgQThA==
X-Received: by 2002:a63:29c1:: with SMTP id
 p184mr25932369pgp.174.1572384041825; 
 Tue, 29 Oct 2019 14:20:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c66sm55210pfb.25.2019.10.29.14.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 14:20:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 22/29] microblaze: Move EXCEPTION_TABLE to RO_DATA segment
Date: Tue, 29 Oct 2019 14:13:44 -0700
Message-Id: <20191029211351.13243-23-keescook@chromium.org>
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


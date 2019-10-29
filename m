Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 096F1E9238
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 22:42:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472lRK6BztzF3Jw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 08:42:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="BLxlII5r";
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kqH2QdZzF34m
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:14:19 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id b25so10516460pfi.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aFfN5juCtHu18am/Lscu0/nkwdENrYqqL+l/G+SE/2I=;
 b=BLxlII5rDGoHmuigiKEk7antvAdvT/j3giLp5TnKagC9nulTOKvHicMJhgLTJ+AKjt
 LLFa576ZnM7bbaXQ2jb97Idx+ncHmLJpJMLmr4o4toROhc1fZICnCkh73tOmvHe/0Lk5
 zMTVw0I0Iv5ESqJhCqUkt09+m+oXMu/pMXKQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aFfN5juCtHu18am/Lscu0/nkwdENrYqqL+l/G+SE/2I=;
 b=Zh8/qginFylQ9/A5KNqRR4L/iy8erJCbj2/0v+jyUl0X1U4QY3TyGAZfMEwYU53pDQ
 M/hLiioOMDaql8k5kVcv7aSN1fnmEEW6qp22Z7xJ0HidjinWOErmhULxL3HIsCgPskcn
 Pl0fMUs8ikBhP2b6JNb0dDs1ph1KSJjdxgzVOt8JUYNMf8WM+Iueb3JAhfkQQ7eIB+0f
 p/Y/BOPIZH6ZcCAnXK4DrHzqRc1I3aJmEWreZ+kUTlMCEaRSeaK7aEvidqyyE0Id0SPM
 YYkxJzTP1IJyyZU17TW7EzxOeZ45oxdwVm92qfFsLMn1wl2me7aRySkAfJpCukoeSgtJ
 DQaA==
X-Gm-Message-State: APjAAAUraas1XJeGKnAlI9+iDj/cVOsE7y3sh2EaRUdzkEnRVU7CQVa8
 jAllGbvK40qHUlGZkW0PCq4T2g==
X-Google-Smtp-Source: APXvYqxIz8Zfja85HNwsMZQJeGaOSKeaS1VAjTfMrFhoCZX55Emhn1vDqjO4e6bfN5HPCuUgRo1k5w==
X-Received: by 2002:a63:364d:: with SMTP id d74mr5244833pga.408.1572383655700; 
 Tue, 29 Oct 2019 14:14:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id p6sm49172pfn.26.2019.10.29.14.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 14:14:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 16/29] x86: Move EXCEPTION_TABLE to RO_DATA segment
Date: Tue, 29 Oct 2019 14:13:38 -0700
Message-Id: <20191029211351.13243-17-keescook@chromium.org>
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

The exception table was needlessly marked executable. In preparation
for execute-only memory, move the table into the RO_DATA segment via
the new macro that can be used by any architectures that want to make
a similar consolidation.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/vmlinux.lds.S | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index a1a758e25b2b..b06d6e1188de 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -22,6 +22,7 @@
 #endif
 
 #define EMITS_PT_NOTE
+#define RO_EXCEPTION_TABLE_ALIGN	16
 
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/asm-offsets.h>
@@ -145,8 +146,6 @@ SECTIONS
 #endif
 	} :text = 0x9090
 
-	EXCEPTION_TABLE(16)
-
 	/* End of text section, which should occupy whole number of pages */
 	_etext = .;
 	. = ALIGN(PAGE_SIZE);
-- 
2.17.1


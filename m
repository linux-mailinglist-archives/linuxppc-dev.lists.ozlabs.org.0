Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FABBF8ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:11:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fNKd3rGwzDqfH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:11:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="NeoCDK86";
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN095wghzDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:25 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id i30so1989011pgl.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ct25FYY49pcH025DailB6pbS1DlS4bIVNf04cXZx2wM=;
 b=NeoCDK86mT/W24oE5rtmJouGfsbTTEGkoSxTx4KF4CSxjsSlvFZN3J9odBOQnvlXiP
 iUyNYZOgnvxnrzhYkrDgkrU0+SzkX/L29uWuoGEThELn/fWhiKJEA65hwXsy3koRBZjm
 4+HnR9f+RjX0Rbvz5f8d8QfWgEFoMfVNcSBHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ct25FYY49pcH025DailB6pbS1DlS4bIVNf04cXZx2wM=;
 b=caW4/hkb3ELEEypFjf3s1ZHwsd16gopNM7HNZczYKEKnTr7nSIEtq5xUM7SoURTJI4
 nkhwYDepYfs78fiqBL1BEpI7HobtLJZVtuFfM0hdOKlCH56wUZ3Icnfv+80I9UtOMGne
 CQqQ+VQsNOY8gca9acKxy6xzsqgKu+NXNnkND6PIOM3FaD8lH2o4CCVpItAxhq35ZkEw
 DLmw/KNCYPV012Z8ohUGu86Mc5siJEEXZloL4ZCYCkHCTJ3E2D5wAFntoqAk0PiuKp3U
 Uo+XsQ1M2dGGRMg93KiavhHPjul/rRBrcSK7tde/WZqWUGIYiK1/0QAdnyfFMO35RiY2
 O+6A==
X-Gm-Message-State: APjAAAW5i4vW+fO2YHkcwgyREz+56W0xu3gKk01dtgc6VvKRKS7H2Lcv
 8QOiMx9m4FriA2Hjwj7Y6EycIg==
X-Google-Smtp-Source: APXvYqwCE1BZTT9Hh90UUQnKWrAcK2jHTYm7yifQDk8oKb7icUZpadcMBDqMvGH5nif/lmL5cmzvdg==
X-Received: by 2002:a63:186:: with SMTP id 128mr4612810pgb.157.1569520583020; 
 Thu, 26 Sep 2019 10:56:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e10sm4090474pfh.77.2019.09.26.10.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 06/29] s390: Move RO_DATA into "text" PT_LOAD Program Header
Date: Thu, 26 Sep 2019 10:55:39 -0700
Message-Id: <20190926175602.33098-7-keescook@chromium.org>
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

In preparation for moving NOTES into RO_DATA, this moves RO_DATA back
into the "text" PT_LOAD Program Header, as done with other
architectures. The "data" PT_LOAD now starts with the writable data
section.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/s390/kernel/vmlinux.lds.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index 7e0eb4020917..13294fef473e 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -52,7 +52,7 @@ SECTIONS
 
 	NOTES :text :note
 
-	.dummy : { *(.dummy) } :data
+	.dummy : { *(.dummy) } :text
 
 	RO_DATA_SECTION(PAGE_SIZE)
 
@@ -64,7 +64,7 @@ SECTIONS
 	.data..ro_after_init : {
 		 *(.data..ro_after_init)
 		JUMP_TABLE_DATA
-	}
+	} :data
 	EXCEPTION_TABLE(16)
 	. = ALIGN(PAGE_SIZE);
 	__end_ro_after_init = .;
-- 
2.17.1


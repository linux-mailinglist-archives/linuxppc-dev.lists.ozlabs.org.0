Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87841E91A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 22:17:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472kv445j2zF35b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 08:17:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="kdVHFkWU";
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kq15S9rzF34N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:14:04 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id c16so8300978plz.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UBMCQcUOloL4FNQm5udB+snIcmDdRxu45Na8ZXgn6j0=;
 b=kdVHFkWUWfSKoiPKPgWKbAsFTrcW5JNBQhTGTF4q2deleiY3/8n0BF6eoXBERPq8mq
 MXvnqxBYuL7FPHWZ/R6H0s/W1xjZNZPEiLHYArhnUWssmjQ9IekX8pDgbayL/8UyYSTb
 kH2PTazTZLVUdMFc2ETjXJ8rIdmfptOgLDOBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UBMCQcUOloL4FNQm5udB+snIcmDdRxu45Na8ZXgn6j0=;
 b=QiFH4++HKkb3BfODOOeqfgU5UvhyIswyirDRgBYRZcOK1425Zld+FHNKJVn2JSFy1O
 6E/nVV6tt/LgLxAlHiXKRTEbD1DDheF3wph7uHM3j2ZSvo6BTyjOijOiJ77G3LaIZ47/
 +GeZDnoZrDiixKU8RvB9PNvC/NZB7NuxtD5lI9+q1pCTCLhqR6LpVvsg0C3UTDbODY3u
 5a28FfjVRsHTJ//EY1IOnTGWlH3lkago/HiNRoY9o2pNrYXvLKG6JelTguWeBrKQhGZ+
 Ner8A2REVIoGnSuh2nNvWizLufU26/xMhkC1V5+EbfKWlbwkoCS7Pq7f37CSBEBDH/It
 aGDg==
X-Gm-Message-State: APjAAAW2FpzVDSU+De4ExcAF2KiClxYQ+RWy37JK3bXeOSmoo7yeNkQV
 3Y6FWD3zeS+fmNqO9yOwu0Wc+w==
X-Google-Smtp-Source: APXvYqxEU/jPSR344Zm3qUnGnizPxb8rt1UkEG6PtKOdviXqXNGWzTbgn7h13zjGLZsYob22VLKUOQ==
X-Received: by 2002:a17:902:bb8d:: with SMTP id
 m13mr785919pls.29.1572383641856; 
 Tue, 29 Oct 2019 14:14:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z9sm135208pgs.46.2019.10.29.14.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 14:14:00 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 01/29] powerpc: Rename "notes" PT_NOTE to "note"
Date: Tue, 29 Oct 2019 14:13:23 -0700
Message-Id: <20191029211351.13243-2-keescook@chromium.org>
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

The Program Header identifiers are internal to the linker scripts. In
preparation for moving the NOTES segment declaration into RO_DATA,
standardize the identifier for the PT_NOTE entry to "note" as used by
all other architectures that emit PT_NOTE.

Note that there was discussion about changing all architectures to use
"notes" instead, but I prefer to avoid that at this time. Changing only
powerpc is the smallest change to standardize the entire kernel. And
while this standardization does use singular "note" for a section that
has more than one note in it, this is just an internal identifier. It
matches the ELF "PT_NOTE", and is 4 characters (like "text", and "data")
for pretty alignment. The more exposed macro, "NOTES", use the more
sensible plural wording.

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vmlinux.lds.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 060a1acd7c6d..81e672654789 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -19,7 +19,7 @@ ENTRY(_stext)
 
 PHDRS {
 	kernel PT_LOAD FLAGS(7); /* RWX */
-	notes PT_NOTE FLAGS(0);
+	note PT_NOTE FLAGS(0);
 	dummy PT_NOTE FLAGS(0);
 
 	/* binutils < 2.18 has a bug that makes it misbehave when taking an
@@ -177,7 +177,7 @@ SECTIONS
 #endif
 	EXCEPTION_TABLE(0)
 
-	NOTES :kernel :notes
+	NOTES :kernel :note
 
 	/* The dummy segment contents for the bug workaround mentioned above
 	   near PHDRS.  */
-- 
2.17.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF09AD35AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 02:17:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q7nL3hZMzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 11:17:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="fUPnxPNk";
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q7Xf2d5nzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 11:06:26 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id p30so4699685pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 17:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WqLTzjTdYtu13eBI1Hsh3syPKd5R5C/bZSENvznkqN8=;
 b=fUPnxPNkLbKz79eLdwRoDJjW70ASz4RGYombh+MpItuFQQCQWGWcKvPqy4gl6E62bz
 YXcrXM4MjXChDuBwxAdJsCaz9rjKO2RPeC3DbmTKU7AZ15ypootuMHyTiE2LYXks+fRY
 MfiZIZu5Q++w2SE3zrFSij8n4HmJ+XDt2oi0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WqLTzjTdYtu13eBI1Hsh3syPKd5R5C/bZSENvznkqN8=;
 b=GlozOlWnjTqeOdtYbyq0J0J6wXmzUWdARvcsMi+KGnOZisqmZLLpUVMEZkvAkMNpi0
 lgSkg2TT5ExBJtkWsswaWRS4oEUCfvqlLcFvjk0etxV/OqopHhlK2AIIXLmCcmy/dgNd
 yGbOcmNXOsVcE4vRQx3GUZhSnD3V+1zLTa9XQ7+xcU0XzWC/YoS9q0RD2TkveiMRMkRW
 v5Oxc4XeL2H1I0u/J0fXX4Oxo1cLkzMAYSP5ioH1+533csUxKSmBnDq5Z5ymMoaFeq7+
 xGf4s43xvyRUtIyQUzGO32Exvte2yBvxSH+KQUQdRLkyyEEN+HufJetrpFLac1d8DV2o
 iT6Q==
X-Gm-Message-State: APjAAAVlajvkEj3nl8IZihcJQEuN/L5cA30gN4gOI7mfzmlN9A3+GOei
 BzBWOUHMmzP3ctkrsm97oZ+8ZA==
X-Google-Smtp-Source: APXvYqwSvIKQzn0Wh29UPciSLsyXo4RVbmYIVzpELs7182W3aoZycw+TLoXbSJd3JfRFzRbTSmYlrw==
X-Received: by 2002:a63:fb0a:: with SMTP id o10mr13787651pgh.258.1570752384285; 
 Thu, 10 Oct 2019 17:06:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e192sm9402924pfh.83.2019.10.10.17.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 17:06:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v2 01/29] powerpc: Rename "notes" PT_NOTE to "note"
Date: Thu, 10 Oct 2019 17:05:41 -0700
Message-Id: <20191011000609.29728-2-keescook@chromium.org>
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

The Program Header identifiers are internal to the linker scripts. In
preparation for moving the NOTES segment declaration into RO_DATA,
standardize the identifier for the PT_NOTE entry to "note" as used by
all other architectures that emit PT_NOTE.

Signed-off-by: Kees Cook <keescook@chromium.org>
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1396BF9AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:56:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fPKL3gYxzDr1G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:56:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="g+0oLVAq";
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fNBY4sWlzDqlX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 04:05:25 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id q7so1943036pgi.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 11:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2XFXeoGzN1a69pdrls3Beu9JzTpe303VvDFe7zacy8U=;
 b=g+0oLVAqgoC2ew3EG5pLyiK4x/TqojlpwWAAFR+n2zcKEHaA+12gz1WCbQcTKhnK8V
 du7myxKhRoFz8Vn350c/04sX/0q1TmPiCjT+hhJhaVb0xaMcrKAjrM6bAOhht8bRTLF/
 Rvlu7BrJq+bmPv67tsPaw4XYg0FUkK7Uc3Zrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2XFXeoGzN1a69pdrls3Beu9JzTpe303VvDFe7zacy8U=;
 b=h3f4/6ZsZ3Khvg5sNUJOUMkLZHtRzpkISfi1zQSDju46iT8O37uZygvwMPkg3qlpW8
 J4ehLziXFKAqaFHkQMx8lXOeRsNN69PNCS47rzznai/+ZmpmIJDypNZiVhibHEgTA1p3
 yrW/sPOa9nzvHWnH3yjqOuerLgLZVHDeR+FwnvkBdzJG5Kna4TKbdmWl97BcxaC2NXBJ
 s0j0D/oHlAtF229DP/LGN3dfQc1kDEb+0GaQLUdjCt0fL8d2T6VsyLiyBgd6FiV+wQ5Q
 ni4P1KBdbHq86CHiwYQX9PPGHmV9OlQzcIcZTyfqVJXJVOAduD2QYj9XcOL9tt4aLoJ3
 8mfw==
X-Gm-Message-State: APjAAAWhqZALu/c8wkGmlmSZI1cnGt8H7qZBMz/+oTXCQB2MRW/+Z58Y
 LxMhWmyt+lguXljaWG+bgVdYAQ==
X-Google-Smtp-Source: APXvYqz61iDdqBAe+eZrQT2tMeg7B3FlHieVQyDUPoWyOaOfAOoRrb/ef7ZJD9oTwPZs33YIQXx+4w==
X-Received: by 2002:a63:ff4a:: with SMTP id s10mr4691464pgk.166.1569521122354; 
 Thu, 26 Sep 2019 11:05:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v44sm8488912pgn.17.2019.09.26.11.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 11:05:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 22/29] microblaze: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 26 Sep 2019 10:55:55 -0700
Message-Id: <20190926175602.33098-23-keescook@chromium.org>
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
 arch/microblaze/kernel/vmlinux.lds.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/microblaze/kernel/vmlinux.lds.S b/arch/microblaze/kernel/vmlinux.lds.S
index b8efb08204a1..abe5ff0f3773 100644
--- a/arch/microblaze/kernel/vmlinux.lds.S
+++ b/arch/microblaze/kernel/vmlinux.lds.S
@@ -11,6 +11,8 @@
 OUTPUT_ARCH(microblaze)
 ENTRY(microblaze_start)
 
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	16
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


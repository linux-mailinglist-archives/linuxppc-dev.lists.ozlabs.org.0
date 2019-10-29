Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D47E9210
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 22:31:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472lCD0LPKzF2Ww
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 08:31:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="YmH7JoRc";
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kq70n1czF34N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:14:10 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id q26so6896650pfn.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=j9O9o67lY/P6wlTEjsCX8aHvBVVSD/zx23uzcL5Y/Qk=;
 b=YmH7JoRcIpuxHSBEzuyBZcI2cXlEocfRSYinjuQggynP+Yn5Bn4zkxrvfy7jAIlUuJ
 3z/TlcEeTvA6xOI+hfOAcAJs7nBEtgLlKKNYCzlXJEj1NFiiqMvLbkPYxAWyblfxS+ij
 cYtL8PEwHkOICPVjXRXFQwTlPFkJBooeg3rsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=j9O9o67lY/P6wlTEjsCX8aHvBVVSD/zx23uzcL5Y/Qk=;
 b=rzBNvRZTu/yqWKQ6JgHDPxZAcaKJ+7U4cBEw9YPEEnl7zAe5OvoyyygX9E93DgLmMh
 pT4zLSv9p45tXRHWYXq8XO+CPoYzFO7qlmOuPYNSKN3NR4hGGzT+b9QOBDb7lOkFNzTp
 SmmN2FRXKKm3d4P7lqzeIo2Ft6GsRUDzKi8lv02GsKc1sJLLswrLvhkJDVFRcfGhRvkE
 V26tO+zpIALWIoUZioIjAiEA78/QN4E9Q7g21NLhhGIupGsoGIORKa+/M6L3DyeKBbKu
 iW7BSI9ZT45nllcwbU2cw+pY2IVURgHe1x0sv04cRBZvhP8IT53EWwFifhyV2S3NF6ef
 ImSA==
X-Gm-Message-State: APjAAAUvwGPlq7bVEXxXcJnvjQTlukrShL0/DtX8w4OmXmastDya0irM
 2gwXa0yPTPKfSrd1cA6TY5AKsw==
X-Google-Smtp-Source: APXvYqwjW3Si7/tNLiB0yWdzOESspeMKg8ZGEJduGjpXWpuGODoydLiyAFH5fAhzQLyONbMAITVrtg==
X-Received: by 2002:a63:b5b:: with SMTP id a27mr30641499pgl.262.1572383648493; 
 Tue, 29 Oct 2019 14:14:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y8sm134824pgs.34.2019.10.29.14.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 14:14:04 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 06/29] s390: Move RO_DATA into "text" PT_LOAD Program Header
Date: Tue, 29 Oct 2019 14:13:28 -0700
Message-Id: <20191029211351.13243-7-keescook@chromium.org>
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

In preparation for moving NOTES into RO_DATA, move RO_DATA back into the
"text" PT_LOAD Program Header, as done with other architectures. The
"data" PT_LOAD now starts with the writable data section.

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com>
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


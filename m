Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4034D35AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 02:16:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q7ls1Y13zDqLK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 11:16:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="TBJeuKMY";
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q7Xf1KRtzDqQl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 11:06:25 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id v4so4946295pff.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 17:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7MxClQbH59XRrbTRajW1Gh8uACzcU2+htsVcXyM7D1g=;
 b=TBJeuKMY2z8zTRQ1bFw/ImZS5YFoYQAHk+uSCJMry9jQKOeGheQ5i7gXGHU01GWcTB
 uOgoFqPErAXZia+mP12x9qnkRfY1Ys9PjUB5SmB5We4kWHLZQ5n99yhQi0dIKcFUZu6/
 hILLkVhE9upOn1PuRtaesOlh4SL00TV9kLm5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7MxClQbH59XRrbTRajW1Gh8uACzcU2+htsVcXyM7D1g=;
 b=uOzGuJCf70E7H2MhlhuoXn2QfsOQdXpgWBwH8Aw0Onq1emDlGfERBqzHkUz5ap/yLr
 8TfPz0UtBLKCHWcZPAhOL28OiBZu4AjUN8dymwGTy4Hh0CaXlG34dQtTIsY7CvgBLpu8
 rHaoqe4W4fCsvD2FJnyAdys18GeB/ZeJOpHoN2PmfmSH9MHjoLFKWtVcMgNh/Qbbdg55
 1fLiVdaOx94dRoLKjG9jhJaCOJ0/viaFK3/cSdV611foFKqhnKX/xQTcqG2A3+aOnCi9
 hPQ3IbSE4PHByN3fAuCy436ZNmqC++9iXoGi/4ITqwwTcICxYTAaaoCEvYKgDBrQdQRq
 lTZA==
X-Gm-Message-State: APjAAAWezZp8Mcj7a1QGKQLO2yWRbHZ94c4MAsKyGWLWFERHtjczYYCP
 14npDC8prGm/ufSz3nO6kgQd+ky+3lY=
X-Google-Smtp-Source: APXvYqwg7IWyK5GALjp45zOGgCtbjryTtA5MoWvVIZiHDTE9GJEt+Ue8rYJCs4VD37qrCGGbQgqtBg==
X-Received: by 2002:a62:5bc1:: with SMTP id
 p184mr12930072pfb.180.1570752383534; 
 Thu, 10 Oct 2019 17:06:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d5sm5372814pjw.31.2019.10.10.17.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 17:06:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v2 04/29] alpha: Rename PT_LOAD identifier "kernel" to "text"
Date: Thu, 10 Oct 2019 17:05:44 -0700
Message-Id: <20191011000609.29728-5-keescook@chromium.org>
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

In preparation for moving NOTES into RO_DATA, rename the linker script
internal identifier for the PT_LOAD Program Header from "kernel" to
"text" to match other architectures.

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


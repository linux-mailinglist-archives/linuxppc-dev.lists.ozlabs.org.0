Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8E6BF99A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:51:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fPC60G7MzDqVZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:50:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="h2p8CR6C";
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN0Q2vnRzDqnx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:38 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id t14so1974737pgs.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0o22aj+Q2fPal3OzyLNHtFtEJCV1jKXrih1rnY9ZOvQ=;
 b=h2p8CR6CTCVG0EcWBzFZk9M7pS5/grZV7SzSB6Fp/b72sOhC+rJHHanRbr647L3D5O
 3PK+ZsRgr4yUne37ilhSCOXRu+oA9brL1Q3zUBwCc+GNAanTNZBOlRbFkU/6xiHKWXKz
 z9Lk6mr7quDbn6Iv5uFqVP/gtakRm/cG9s24k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0o22aj+Q2fPal3OzyLNHtFtEJCV1jKXrih1rnY9ZOvQ=;
 b=KRtQGv8ickwBSIf96ILGZwlxn+JjNSqzSESGmDGO/wR19oGbqfQHYl+wJBIeyxE8D+
 PIM215XqcI3zgmIV4V3KxPfghVuetDYjOlKOk2XAyPu20snNcgG9aJ5bBvKFnEaVV/fk
 sPKI6LLxnumM15kGNmd030Ee+VTnW7y7Irkupqawjzpq1j3Pj3aQWYE/5GNN8gvb9eH3
 r4j7XSiQPEPd7rTO8iSw2cl7V2m5gu7nqrnBJ8ay0Q8fKcdF80fFAemE7Sj2N99fGvSu
 oW9zZeW2vYYKD3I2mbEcbKjcSF9mafcXWUvGMP2X23HHnlzDSzXz3IpCshUp4bWN4QSe
 eI7g==
X-Gm-Message-State: APjAAAVAYS2SBpPrihaGjP+TmZZi+w6pXMM83Y0ACvVQ1D8JrZxqv160
 jJPS+KhkqV2Y9eFfiT27/hDhdQ==
X-Google-Smtp-Source: APXvYqy6S7VpAjQkHoN68ZupzJjzmnjjpPcZsaZVMPIKEdbkFn7g1SNyoioq3hB1BxaJQAQsFZhPUg==
X-Received: by 2002:a62:7a88:: with SMTP id v130mr5261721pfc.184.1569520595802; 
 Thu, 26 Sep 2019 10:56:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t68sm6742712pgt.61.2019.09.26.10.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:30 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 26/29] x86/mm: Remove redundant &s on addresses
Date: Thu, 26 Sep 2019 10:55:59 -0700
Message-Id: <20190926175602.33098-27-keescook@chromium.org>
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

The &s on addresses are redundant and are better removed to match all
the other similar functions.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/mm/init_64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 26299e9ce6da..e67ddca8b7a8 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1300,9 +1300,9 @@ void mark_rodata_ro(void)
 {
 	unsigned long start = PFN_ALIGN(_text);
 	unsigned long rodata_start = PFN_ALIGN(__start_rodata);
-	unsigned long end = (unsigned long) &__end_rodata_hpage_align;
-	unsigned long text_end = PFN_ALIGN(&_etext);
-	unsigned long rodata_end = PFN_ALIGN(&__end_rodata);
+	unsigned long end = (unsigned long)__end_rodata_hpage_align;
+	unsigned long text_end = PFN_ALIGN(_etext);
+	unsigned long rodata_end = PFN_ALIGN(__end_rodata);
 	unsigned long all_end;
 
 	printk(KERN_INFO "Write protecting the kernel read-only data: %luk\n",
-- 
2.17.1


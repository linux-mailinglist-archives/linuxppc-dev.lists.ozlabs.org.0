Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 982AEBF965
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:42:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fP152nvNzDqhk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:42:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="KPMZBnze";
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN0M5PQyzDqqD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:35 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id q10so2285388pfl.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HjFHv9xxIhK5RJeBiuSF34CW9EFCi2H1cUI0osZb25Q=;
 b=KPMZBnze/A/QVrsTLF2KGN3ebdUhyckFs45P2jOghM70xqivIFR9hfivXkVt5CbeNY
 IE1kSylnyZRNl8HDUTfbWj8AKjNJnMw62zdeR5tu6VCLH496t+W13oMohTiMGaZ6p79Z
 3c4uLS8nqL5lvrbWSW4400GI1UZ1nPH1jjAIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HjFHv9xxIhK5RJeBiuSF34CW9EFCi2H1cUI0osZb25Q=;
 b=RwUTcnZ+ttcLpk4amtW6VA5szrkBuKhrs5JV3g52wKiuwYSVN0MDTXgPWH/sYyf4DR
 gEch7skXEAC2nO1LOyOMmXS4lXQouplf51aUSdeVJ9eZvGG/WGnoGJ83HyFjSyqaenKo
 Ng4KAyPc+dcM1VoC3SV0GEhVX5Z6+b54ZFWLWTqepH643jAfpD7WQQTDFzdPzJ12DCM6
 fw1JO1Y3/RjyATI0N7cner9tE+OMDtZHd1nOSCOggEFtXfnGrIXs5zo1WqDUW2+87IFk
 enEnXn2gBQXrCvHD2YqQN7xvF/x6MHexWMrxb27XNhpUZfbq2tnW1/qOo4cwaUwId1pN
 RJCQ==
X-Gm-Message-State: APjAAAUeVA859x10W0BTXR+G+fyF6VqKKLavV/RkSFAYOm4ofiLbYhTe
 NhtNaTooEoMLNCzDyjXgsM/iZA==
X-Google-Smtp-Source: APXvYqyFMbRLlIoK6p9J6QIn/93x5dhozlYQ0YGx3wABZc+vZZjpU1J4N8nao/7zNkR46rXeo7ym8w==
X-Received: by 2002:a62:19c7:: with SMTP id 190mr5160181pfz.105.1569520591920; 
 Thu, 26 Sep 2019 10:56:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id f89sm3068052pje.20.2019.09.26.10.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:30 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 20/29] h8300: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 26 Sep 2019 10:55:53 -0700
Message-Id: <20190926175602.33098-21-keescook@chromium.org>
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
 arch/h8300/kernel/vmlinux.lds.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/h8300/kernel/vmlinux.lds.S b/arch/h8300/kernel/vmlinux.lds.S
index 2ac7bdcd2fe0..aba90398b774 100644
--- a/arch/h8300/kernel/vmlinux.lds.S
+++ b/arch/h8300/kernel/vmlinux.lds.S
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
@@ -37,7 +40,6 @@ SECTIONS
 #endif
 	_etext = . ;
 	}
-	EXCEPTION_TABLE(16)
 	RO_DATA(4)
 	ROMEND = .;
 #if defined(CONFIG_ROMKERNEL)
-- 
2.17.1


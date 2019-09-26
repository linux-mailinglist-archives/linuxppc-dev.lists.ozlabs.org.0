Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C030EBF93E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:35:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fNsW3X9tzDqZx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:35:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="NS1tMZPO";
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN0J0kSwzDqsD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:32 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id y72so2226300pfb.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b1/uW6kDsyZTSJ+gwaKuf5Y3ySZgNCgjZ9WgbQU3J5M=;
 b=NS1tMZPO6DiLtYsg7bkcpePHNmJ/nLyEn8bFqB536OAMsynj/sM0sV9JASHY+/D/aV
 0irY/ZZ/Sw5Ff6a3Xr8hTMKPFlLAyCjdwPHuVnFq7tw1NS7SnAKb8YnaFIBVxhT0Mjeq
 faTnz/PfHNqDfDu8NYYA9Yvm+scVClDMmdf/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b1/uW6kDsyZTSJ+gwaKuf5Y3ySZgNCgjZ9WgbQU3J5M=;
 b=aDB4v3ohG4q53MTunkTS6hR7osB4+teT0Pm7CCiNt56PUzCb06S7o1HCVNoJDoxeJB
 c7f6+1gAObhix2aa6GsAgDOJd1v98JWugCs7Qg5OI6TfzxolDMgWyJTenV1VQuFoYB5e
 VlzO5VasixwWvokKmt/wl9Q1pGxKWObZf7E8umSVDSsjIg9XArji+/77lhQo6jq5arzF
 yosDmJSCF5gAMpvClAq6/spRVaJyDOi7r+MZfZ4ci6kQ23aosmpHHfQBiQvLmylrDH4f
 9bmeV3J4s0jiQTO5DgNkPj052vuRH42pJdAgCzDyxgqG3ktrUbOg3PZLRpcFUWULG/tx
 U3Yw==
X-Gm-Message-State: APjAAAX4E/zJysAJYoAS8japUattpG2HUBg+C7602NwGDmzbEtW9ewzw
 r7fr6YLHFsTPb6XU3/yqJIX/wQ==
X-Google-Smtp-Source: APXvYqxnFFNqQpUkqna8OeByYxEA/Nx8utFzCAqw8OBF0xZQgqdbBmLWMEJr85fjA0ZYcRUxNYx6WA==
X-Received: by 2002:a17:90a:37c9:: with SMTP id
 v67mr5020846pjb.29.1569520590214; 
 Thu, 26 Sep 2019 10:56:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z25sm2899187pfn.7.2019.09.26.10.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 17/29] alpha: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 26 Sep 2019 10:55:50 -0700
Message-Id: <20190926175602.33098-18-keescook@chromium.org>
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
 arch/alpha/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index edc45f45523b..72303827bcb4 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 #define EMITS_PT_NOTE
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	16
 
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/thread_info.h>
@@ -35,7 +36,6 @@ SECTIONS
 	_etext = .;	/* End of text section */
 
 	RO_DATA(4096)
-	EXCEPTION_TABLE(16)
 
 	/* Will be freed after init */
 	__init_begin = ALIGN(PAGE_SIZE);
-- 
2.17.1


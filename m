Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7D8E9251
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 22:46:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472lXX5kv1zF1fG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 08:46:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="XxYZzxUJ";
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kqJ4dHnzF34m
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:14:20 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id w3so10506662pgt.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l+J574mlC+dRmZJG9pHhpppQFEze5VvTPTaNiTnbyaQ=;
 b=XxYZzxUJLSS1EjXOu0N/W8WJ4nsXkGW0wuYPPQz4S9Q7ybSmxfOvzX4/Pbx0hRVhwL
 IrpMdG7OEhiyZc3pXm3O/EWpZWxxrVnOcBtrFviHXzAXJGTEX7UE4FQN2re4YmyUukvg
 kN8X/p4Rc2H96j4CDSRi5o2KB2cQvjaVsgVbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l+J574mlC+dRmZJG9pHhpppQFEze5VvTPTaNiTnbyaQ=;
 b=SrLGiEerGkGTWlo3rMITYDybT2OxFfvNURVw4sPsrNJXiIdGqu5Z0eLFDvXw5so7Yb
 AWOPojYOjRAFnL14mMOhM1zysZuD9d6nP3QmQRn2ZdNJ4YMsdyk0IHuH+5j1jTPktv0a
 k4rvsyOhjx4XZlpzMCBw7DBZFvsqmADzpjHS8B/xH96JsAAdtNl0c2XkdqKsDhOo3tvb
 OnuSX/lSLeEk5ubq2GhsDWnjgSYr7aj0zkwWu1b2mbxbb9JoQKjcrYpkNM3XeYIiUzet
 ytbuv1K0sdznnwv23OjQhyPs1AoVw2T8TOXcAX4rCTXNsHr+D5BBNGmZzpEzZLgxhVkH
 xnjw==
X-Gm-Message-State: APjAAAWWkjFpVHY1h8jo/VMF1/hTksISh0UOOG99a+IWuCG6aveI/jul
 qJ31AkiEbGf2+7EagZgwucqmYg==
X-Google-Smtp-Source: APXvYqwDTCHy7ekbXHpuxYWgHEZHkPXVWMIgLthR/cRPbNMgyLncTh1RVOtUSpgF7h0Elx7DzeS6cg==
X-Received: by 2002:a65:5382:: with SMTP id x2mr1341257pgq.420.1572383658639; 
 Tue, 29 Oct 2019 14:14:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i11sm150632pgd.7.2019.10.29.14.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 14:14:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 19/29] c6x: Move EXCEPTION_TABLE to RO_DATA segment
Date: Tue, 29 Oct 2019 14:13:41 -0700
Message-Id: <20191029211351.13243-20-keescook@chromium.org>
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

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/c6x/kernel/vmlinux.lds.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/c6x/kernel/vmlinux.lds.S b/arch/c6x/kernel/vmlinux.lds.S
index a3547f9d415b..ac99ba0864bf 100644
--- a/arch/c6x/kernel/vmlinux.lds.S
+++ b/arch/c6x/kernel/vmlinux.lds.S
@@ -5,6 +5,9 @@
  *  Copyright (C) 2010, 2011 Texas Instruments Incorporated
  *  Mark Salter <msalter@redhat.com>
  */
+
+#define RO_EXCEPTION_TABLE_ALIGN	16
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/thread_info.h>
 #include <asm/page.h>
@@ -80,8 +83,6 @@ SECTIONS
 		*(.gnu.warning)
 	}
 
-	EXCEPTION_TABLE(16)
-
 	RO_DATA(PAGE_SIZE)
 	.const :
 	{
-- 
2.17.1


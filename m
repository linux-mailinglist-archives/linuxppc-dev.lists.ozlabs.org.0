Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27036BF9A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:54:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fPH26ZKvzDr0x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:54:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="YyccQSUv";
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fNBZ0KjdzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 04:05:26 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id d22so1650643pls.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 11:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LBq+xea/ZmJQ/9uj4ezLaR0vyHYQneqqBGeQvqqFY5g=;
 b=YyccQSUv7s3dpyKNfcnsTuVNk/Y6kwXh+M8oxRRtdUgW8nSUtTYRC0g/WriqeXH9y2
 wwVCXNxHIivS7mTiFSK+TSyzV+h8hVp4SAUn1izuVQbvw0l7XMGaQM6lK95NH4vmtwbU
 BZR9POA+VLIcdjNACdsaoN48Vcx862rY58h7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LBq+xea/ZmJQ/9uj4ezLaR0vyHYQneqqBGeQvqqFY5g=;
 b=kookLMNmyiTlO1yfeooz1IT+m2LdKx/mmlShKMuDA5OqzE0DYx4pcymB9SXy8NS1nH
 iTmKtk8EVZeOhDNY9LTvyoSZcZ4+FdDy5gBppCYho40vP5ovOlIjOmmsP3YamMigkyfg
 s8+a2n0oX4wpLx7FulXyBc8K5F98uy/gAy9GBqrYLUuhs8sv1ihlYxC0PeVAJkKb7ZLG
 LdO3Si9uWVNbb6lud4WIErlUNIlzZGDOtsDeKyH/HwfIpDakjJrMdg+WErXEuMfVjgC9
 DUtGydRIO1z0Px2niwDdyJ5rl/KKnmzjnzU6B8OoMprgDFdf+eccuw/kusYCLBYjf5oF
 gikQ==
X-Gm-Message-State: APjAAAVbkgjBTUOMKXVRUac6Vr/rkxxgI3h/TJkMJTknviYOq+nLo63w
 FWDY867tCB81cp0RZ539vjeKFA==
X-Google-Smtp-Source: APXvYqzkn6dvMB+EvQiPjIgquz94zhqgnJASSzAj4vbdHobiWS7v9jA7Bv9z5kMPyHOm+3eNniFkDQ==
X-Received: by 2002:a17:902:a618:: with SMTP id
 u24mr5406606plq.76.1569521121016; 
 Thu, 26 Sep 2019 11:05:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e127sm3746231pfe.37.2019.09.26.11.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 11:05:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 16/29] x86: Move EXCEPTION_TABLE to RO_DATA segment
Date: Thu, 26 Sep 2019 10:55:49 -0700
Message-Id: <20190926175602.33098-17-keescook@chromium.org>
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

The exception table was needlessly marked executable. In preparation
for execute-only memory, this moves the table into the RO_DATA segment
via a new macro that can be used by any architectures that want to make
a similar consolidation.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/vmlinux.lds.S | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index a1a758e25b2b..a5c8571e4967 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -22,6 +22,7 @@
 #endif
 
 #define EMITS_PT_NOTE
+#define RO_DATA_EXCEPTION_TABLE_ALIGN	16
 
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/asm-offsets.h>
@@ -145,8 +146,6 @@ SECTIONS
 #endif
 	} :text = 0x9090
 
-	EXCEPTION_TABLE(16)
-
 	/* End of text section, which should occupy whole number of pages */
 	_etext = .;
 	. = ALIGN(PAGE_SIZE);
-- 
2.17.1


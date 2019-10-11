Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3C4D36A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 03:01:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q8lm6wxKzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 12:01:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="TKF/H7IX";
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q7hH3wcjzDqJQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 11:13:03 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id y72so4932142pfb.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Wn91QvvOWXGcdAukdBFPOsAS+V9wjbJFfxE/dszqFsM=;
 b=TKF/H7IXE7UJDzb3rMUleub9owN4KR+Kc5MridCe/6j0nlzZqoEI/zttKy0QHihDrJ
 2ZeHmtUNHexo6bQLRtT0gDvTipRD0K5TGW8Q7FVWpvhcmLBUGnPT1TySO+nYDUITKTZu
 3WNoDW0bVMFt0uCMT6eBCSnH00RkY54ViUTLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Wn91QvvOWXGcdAukdBFPOsAS+V9wjbJFfxE/dszqFsM=;
 b=JUD2ujzhcIOJYMrUgJ6DhxDXcSMoDmd/nu5BSD8/TAsBCx62FY+IqXZ3gHodpyCHG1
 r6DKP7B23JrM3FnZQqHJKyfEzjA46LBLcZMXsjD9G3l5vKu3WWdXRvZ+r7N21PAum1ID
 5xLolN0/LtXHv02IOL2g3eBILaQJS7x2wj84xf4sjoUZNmfBTcFOx9WH5LkkzsCYUW/W
 ziLX7cbczMNuLFe3JlXsl1i95W6WiCTORrkK+uvcXM6ZNF/saKYaLVvoj6O9gedGxi0x
 P8H0rJ0tnkHoUmmnH9+72iOe4fnbEW4bDxove9Up+w7dKK97C5mpgr50s6KQRrDCVoI+
 nBdw==
X-Gm-Message-State: APjAAAX4nDdg5DuNUyT45RvnHZYRgulhrjN34sZQVkFmDl/mEkl0RBhj
 x0rUOPnSQAOXX/ZRvS04IAOWpw==
X-Google-Smtp-Source: APXvYqwhzx8QmNWMryCruzS69inQpCD817u3s0gzfMeJwk1Bb2iOQgca7Hto534MUkNuyGvUJAkyfA==
X-Received: by 2002:a17:90a:ff0f:: with SMTP id
 ce15mr14913883pjb.14.1570752780484; 
 Thu, 10 Oct 2019 17:13:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y144sm7993803pfb.188.2019.10.10.17.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 17:12:56 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v2 29/29] x86: Use INT3 instead of NOP for linker fill bytes
Date: Thu, 10 Oct 2019 17:06:09 -0700
Message-Id: <20191011000609.29728-30-keescook@chromium.org>
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

Instead of using 0x90 (NOP) to fill bytes between functions, which makes
it easier to sloppily target functions in function pointer overwrite
attacks, fill with 0xCC (INT3) to force a trap. Also drop the space
between "=" and the value to better match the binutils documentation
https://sourceware.org/binutils/docs/ld/Output-Section-Fill.html#Output-Section-Fill

Example "objdump -d" before:

...
ffffffff810001e0 <start_cpu0>:
ffffffff810001e0:       48 8b 25 e1 b1 51 01    mov 0x151b1e1(%rip),%rsp        # ffffffff8251b3c8 <initial_stack>
ffffffff810001e7:       e9 d5 fe ff ff          jmpq   ffffffff810000c1 <secondary_startup_64+0x91>
ffffffff810001ec:       90                      nop
ffffffff810001ed:       90                      nop
ffffffff810001ee:       90                      nop
ffffffff810001ef:       90                      nop

ffffffff810001f0 <__startup_64>:
...

After:

...
ffffffff810001e0 <start_cpu0>:
ffffffff810001e0:       48 8b 25 41 79 53 01    mov 0x1537941(%rip),%rsp        # ffffffff82537b28 <initial_stack>
ffffffff810001e7:       e9 d5 fe ff ff          jmpq   ffffffff810000c1 <secondary_startup_64+0x91>
ffffffff810001ec:       cc                      int3
ffffffff810001ed:       cc                      int3
ffffffff810001ee:       cc                      int3
ffffffff810001ef:       cc                      int3

ffffffff810001f0 <__startup_64>:
...

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index b06d6e1188de..3a1a819da137 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -144,7 +144,7 @@ SECTIONS
 		*(.text.__x86.indirect_thunk)
 		__indirect_thunk_end = .;
 #endif
-	} :text = 0x9090
+	} :text =0xcccc
 
 	/* End of text section, which should occupy whole number of pages */
 	_etext = .;
-- 
2.17.1


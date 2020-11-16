Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6122B3C32
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 05:40:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZGbf70VCzDqRt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 15:40:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::849; helo=mail-qt1-x849.google.com;
 envelope-from=3mwgyxwwkdgovlmaictvqmzaowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=IvTiaILv; dkim-atps=neutral
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZGTx6mDjzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 15:35:42 +1100 (AEDT)
Received: by mail-qt1-x849.google.com with SMTP id 7so9383116qtw.23
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Nov 2020 20:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=PcaGZc6YEOa/upx9Lq4nvAAaktl5oI7rmAzxmSmunYg=;
 b=IvTiaILv6o6vnqxABrEeyP2OMeqO/3EX3J6QRuqZyxRsA35iW4xnt6GHlb4Czp+BIf
 MuTyZxG+S5m/+T1R7J6OCfKslikVSjpnm2YUV2iEL+JVdyEHXyfFuYKqp22x6w392Cry
 vLpa5Op2KviOrR3eR2cotrH7krvJubYlycA224sF4yZMJ6cFhlEyR/lDNLwtPEfqrw1V
 UET9RdgoKLBrbvxRDLj7YN/EkbJ41+Us2UsgR474itfhk9RY8kqT/4LIB4lk8ZINwgc1
 BOHkbIM1HgmyuWM87FIBfBOyk+i12o5YaymFOHgD2mXqNPAlb2+UtcdyTidTRWQMopRM
 2qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=PcaGZc6YEOa/upx9Lq4nvAAaktl5oI7rmAzxmSmunYg=;
 b=tqiAPyuUICwNYTPDlcmNEWpf+nPl7F/dABVX9mk8rujQE+HtPLbf96iBy1kJVIw88Q
 P3zDfO6IgeNfbD/F7IoS9peDYEPn1rNJExha59XOXFjsYcUywC+oEMqQUHOAa+c5SqRk
 o6SwhrL4Zv6f+69sghsUwZnsTxotQuVpRx0R09i9K3AR6cSCHq3fvX2Us91p+ah0nXRD
 u3ZmEKfsq3eR20ilRZM9yd/FHPgaRnZAMHwn2LTshpLcbBJKrFdcjX9e7MvjcBb7c+tx
 /RYfSm01Sv+VseI4cmPWstOnqJBvBEdFfYamf/wzjjDiZX4Z3ttIhsfRpYBtDZuwV1E/
 ELtQ==
X-Gm-Message-State: AOAM5323xcwLgyf2bSo3UvklTNeFbfFHzUFFiZ+amcMv5ix1p74lQPI8
 a7NUGdwPm+ONtXu3ydiemDC6ZdKkNB9a6YBu9ms=
X-Google-Smtp-Source: ABdhPJy2bHsPOn15HLl05w92gsUQjUlJnWRrJ/pAei6VtA5MZWwb7lRPf7PerV7mX+jsiPU8dnMxscRw1eG8k6ZAH08=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a0c:fb4a:: with SMTP id
 b10mr13942185qvq.1.1605501339502; Sun, 15 Nov 2020 20:35:39 -0800 (PST)
Date: Sun, 15 Nov 2020 20:35:30 -0800
In-Reply-To: <20201116043532.4032932-1-ndesaulniers@google.com>
Message-Id: <20201116043532.4032932-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20201116043532.4032932-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH 1/3] powerpc: boot: include compiler_attributes.h
From: Nick Desaulniers <ndesaulniers@google.com>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kernel uses `-include` to include include/linux/compiler_types.h
into all translation units (see scripts/Makefile.lib), which #includes
compiler_attributes.h.

arch/powerpc/boot/ uses different compiler flags from the rest of the
kernel. As such, it doesn't contain the definitions from these headers,
and redefines a few that it needs.

For the purpose of enabling -Wimplicit-fallthrough for ppc, include
compiler_types.h via `-include`.

Link: https://github.com/ClangBuiltLinux/linux/issues/236
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
We could just `#include "include/linux/compiler_types.h"` in the few .c
sources used from lib/ (there are proper header guards in
compiler_types.h).

It was also noted in 6a9dc5fd6170 that we could -D__KERNEL__ and
-include compiler_types.h like the main kernel does, though testing that
produces a whole sea of warnings to cleanup. This approach is minimally
invasive.

 arch/powerpc/boot/Makefile     | 1 +
 arch/powerpc/boot/decompress.c | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index f8ce6d2dde7b..1659963a8f1d 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -31,6 +31,7 @@ endif
 BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
 		 -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
+		 -include $(srctree)/include/linux/compiler_attributes.h \
 		 $(LINUXINCLUDE)
 
 ifdef CONFIG_PPC64_BOOT_WRAPPER
diff --git a/arch/powerpc/boot/decompress.c b/arch/powerpc/boot/decompress.c
index 8bf39ef7d2df..6098b879ac97 100644
--- a/arch/powerpc/boot/decompress.c
+++ b/arch/powerpc/boot/decompress.c
@@ -21,7 +21,6 @@
 
 #define STATIC static
 #define INIT
-#define __always_inline inline
 
 /*
  * The build process will copy the required zlib source files and headers
-- 
2.29.2.299.gdc1121823c-goog


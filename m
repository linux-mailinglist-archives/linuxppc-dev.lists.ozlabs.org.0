Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B8B2B72E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 01:12:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbNYH691BzDqVj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 11:12:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::749; helo=mail-qk1-x749.google.com;
 envelope-from=34mw0xwwkdimuklzh1suplyznvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eHi14+wz; dkim-atps=neutral
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbNSD3ZZczDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 11:08:04 +1100 (AEDT)
Received: by mail-qk1-x749.google.com with SMTP id c18so188839qkl.15
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 16:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=60RDm9GZdiDvHOVTVOgnNPhDb7lpPTDsg7QOSfebuy4=;
 b=eHi14+wzHA3GWNL69Egy8TJVe0yzRQoR91adGg656Kp/8QG7pQZoGOT91k6ka6w6Fr
 +sP0fkZBSd0zQ/JWhtkfQ0/NecTiOyHSXm2rzOgmaSubxI2y0f5Wvl45NXgBYqiaBza1
 3Z6NCFLdM4+m+oYnxqhtSifKMOm5GCRHyLMlxA4RJLEAQk7iBlCzdLdjawsaylu+S9/m
 BgxE756zWYZtQ/v28Vg3RXRB5u5GIpeRGxAg2hNTVU4eAB5JKAYRCiZKwWdeRChd3p4I
 z+GJjq4PbppqAfNtKx2K8bS70rw9vWX/52pFYj4KfXGZ2MKiCiHt7zb7204HqB1vVwZK
 JGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=60RDm9GZdiDvHOVTVOgnNPhDb7lpPTDsg7QOSfebuy4=;
 b=Qob+Qr5XQ7Q1YFGhn193lst0QMVM9TqePMIKTHi0TZyagY3gx6BgaiV7QvNAj6/uul
 BfbgywffMjPTUa18wC9+5Gqi2qWGidij2uiZnTeDLJMYVICdgFUg7o1z2h1qIhDgzGEj
 8LW6TpwfB44QHBUZlynetrOg5PcwBObOp6emLnSof6O1SPxsqTfOheO9jExpqqzebTO2
 +HtSAPtxg4uBk2H5Eu7E5UEEOE+Z32oWAn27EDqAdzYL6NZrvTTUjGLzsKFYvomHAwgJ
 Slnc5CaLqOuWAps2tNaXEzwzi8ayANHPLr+h5lRy1BhHtgPd+ERouYp4ikQdSUUvrQ8o
 wsNA==
X-Gm-Message-State: AOAM5325RxRpDINRKRw/hmcHkdbr6/tSWmUpK2biXF3XgzG2PvplwJnD
 sDt+tehWml6rlXvc5b/S4/A3RNvzoWTapa4B+hs=
X-Google-Smtp-Source: ABdhPJzmlVGZoccUlD7B14kIiKYBXJ8LMSWJfZ77mc02Pp7puSP6ttSA82K5uXIAgrM5ZNnwIz+UFgG10oc/SIHOvY8=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:ad4:53c8:: with SMTP id
 k8mr1987233qvv.40.1605658082001; Tue, 17 Nov 2020 16:08:02 -0800 (PST)
Date: Tue, 17 Nov 2020 16:07:49 -0800
In-Reply-To: <20201118000751.845172-1-ndesaulniers@google.com>
Message-Id: <20201118000751.845172-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20201118000751.845172-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 1/3] powerpc: boot: include compiler_attributes.h
From: Nick Desaulniers <ndesaulniers@google.com>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
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
Cc: clang-built-linux@googlegroups.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Paul Mackerras <paulus@samba.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <natechancellor@gmail.com>,
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
compiler_attributes.h via `-include`.

It was also noted in 6a9dc5fd6170 that we could -D__KERNEL__ and
-include compiler_types.h like the main kernel does, though testing that
produces a whole sea of warnings to cleanup. This approach is minimally
invasive.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Acked-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://github.com/ClangBuiltLinux/linux/issues/236
---
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


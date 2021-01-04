Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26C2E9F09
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 21:52:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8nrL2r8WzDqRX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 07:52:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BTViVEkr; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8nmT19sMzDqQv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 07:49:12 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id a6so19484875qtw.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jan 2021 12:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0deU4ENrLoy0KwklsESPgFxyWQtFjK1GDUDq1gySRsA=;
 b=BTViVEkrUqTtllVnsO10h/CjecoikEpshx6In+fY9q6WMvlZF3OS427DrfNlHm3A5F
 wdlgln+WMqHKePUMvDs/Sm8pXi3gikpZPy1t1rrkuYzWWdb7vksCVr7NPTyIA2qgROiJ
 U6kb/0bc+BL4pQDdGhvq+ag87Sha61speYCodnq4Pfh57f66HQzyj0YQulaNo66g8hl8
 GFAiVcICix1h8/6ZyE3M6zbNRaUd1q65L6kzFAo72UHMbHfdqvUcsJdflbjIctxS6Y0O
 +Sa1cyA+DTvY5Ix9Q/Ha3DUCkGjY2tbiaq2feGfrI9vBbvge8TTwJ0BmvFKAyP7dreA/
 6Upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0deU4ENrLoy0KwklsESPgFxyWQtFjK1GDUDq1gySRsA=;
 b=uEpOaepGQOrBo/c39gE5nM7ciB549Cuzm5TuyJdmngsajy2QrmSTxycdmRDXBJRJ/h
 twXZYFKAYcAtgoE1XMpUDi7ghSPi58EhsG3cFBAVGqbEI/rWgcKYn9NdYDrnVHuaCzaN
 Q04bATYLP06Rp123uACgszuxh6yx/oCxCbTghlrrR+km1Z+Ydn7o7uL2mikKhzIjBYgh
 Pvab7eva281F5QxYGBqTcyYO4wYZTfYXAjbrTq/O8HedqssDqwQcyFDhU2nJUCnjtWd1
 lTAIRv/PKtQkaMkrRRc1nGFdRGVUsTMmueivo9rDbWnvlXW5kv9THM27Vj+AQg9FAPEj
 e6sw==
X-Gm-Message-State: AOAM530sYKMxVNO4wAWNqSOPx70PRauN5RtyJJog0ceMe9tyr/x5DYym
 BsnNJ/OqLqlYFKyXqogfDE4=
X-Google-Smtp-Source: ABdhPJxLhujl9v1O5kK81SPDwZg7ZK3IiWRfLmVVM45eg90+xFyPS7+k9HKJACZzfNwa615aZe29lA==
X-Received: by 2002:ac8:5956:: with SMTP id 22mr73233053qtz.63.1609793348136; 
 Mon, 04 Jan 2021 12:49:08 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id c136sm27688101qkg.71.2021.01.04.12.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 12:49:07 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Handle .text.{hot,unlikely}.* in linker script
Date: Mon,  4 Jan 2021 13:48:50 -0700
Message-Id: <20210104204850.990966-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
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
 stable@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit eff8728fe698 ("vmlinux.lds.h: Add PGO and AutoFDO input
sections") added ".text.unlikely.*" and ".text.hot.*" due to an LLVM
change [1].

After another LLVM change [2], these sections are seen in some PowerPC
builds, where there is a orphan section warning then build failure:

$ make -skj"$(nproc)" \
       ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- LLVM=1 O=out \
       distclean powernv_defconfig zImage.epapr
ld.lld: warning: kernel/built-in.a(panic.o):(.text.unlikely.) is being placed in '.text.unlikely.'
...
ld.lld: warning: address (0xc000000000009314) of section .text is not a multiple of alignment (256)
...
ERROR: start_text address is c000000000009400, should be c000000000008000
ERROR: try to enable LD_HEAD_STUB_CATCH config option
ERROR: see comments in arch/powerpc/tools/head_check.sh
...

Explicitly handle these sections like in the main linker script so
there is no more build failure.

Cc: stable@vger.kernel.org
Fixes: 83a092cf95f2 ("powerpc: Link warning for orphan sections")
Link: https://github.com/ClangBuiltLinux/linux/issues/1218
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 0318ba436f34..8e0b1298bf19 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -85,7 +85,7 @@ SECTIONS
 		ALIGN_FUNCTION();
 #endif
 		/* careful! __ftr_alt_* sections need to be close to .text */
-		*(.text.hot TEXT_MAIN .text.fixup .text.unlikely .fixup __ftr_alt_* .ref.text);
+		*(.text.hot .text.hot.* TEXT_MAIN .text.fixup .text.unlikely .text.unlikely.* .fixup __ftr_alt_* .ref.text);
 #ifdef CONFIG_PPC64
 		*(.tramp.ftrace.text);
 #endif

base-commit: d8a4f20584d5906093a8fc6aa06622102a501095
-- 
2.30.0


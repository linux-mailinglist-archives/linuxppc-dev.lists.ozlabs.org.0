Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3FA2E9F3F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 22:02:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8p454J7qzDqRN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 08:02:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tXg34Bi0; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8p1H1V40zDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 08:00:18 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id d11so13692655qvo.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jan 2021 13:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2E48a8501cvft0YkWjvJEBQif0+UmPCQbs5NE+bNygg=;
 b=tXg34Bi0XOseVJr5UoJacS8ykQjH116YS2PcHbFf7A4BNICd57eoM9GkkMapVESLEM
 0qyYb5kNnMdStYO1SumzKK9/kO7TfDnTgvLZkFLqCZ8GAAQYPTinJdAFvSXIvuO9tQ+c
 fr+xBOLaSwuDD6MTs3thEIEP7yz/7sWFtyWDg6mYOrL5y0ICYC/jZIYwuO9vxA1MHOTG
 LZvdoqgmGBu4SzNdlYvUu00yDNcEV85RQK1TZEO9t/jjoJuj0RN/10GKzCtzZDXq5UsV
 KspcFYbezhp5H0e1I3PCjWcFD1KYB6RkWU1S6TgRkUVIgbv4kH84H+Awx0uVy7clx8RU
 btOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2E48a8501cvft0YkWjvJEBQif0+UmPCQbs5NE+bNygg=;
 b=ulC4EY4PNfV4cZ27iEIZnJ8Etk1/c72N7o9A2+IpyCVSV7mu8xn82Wa1XySvq6sSC9
 aiXgFWmIiLYmt7W2WEbPAXi0ig9OkWnhHXxt0AajQANzFdrC+PKDwWkpsXjWdYMBcBtA
 /iZnJFQ3M0TiMIil5XPlW1vzLFzqtFjwnPO6gcp8DvU9Sha2h75e4hkKVJEengbuqx1L
 LwSBQntfUClNNOVj9zWDY5Msf1qI7mD4qybRmHcl6bTPn0uik/7BNeJke/3Cb0vY01l6
 8OT9T/YMyA5Dj/3Tlak54RkiER+WJaAhd2NkLG0LONz5nwuSKjdgbh4MfpuDhssz3ohD
 iT8Q==
X-Gm-Message-State: AOAM532KXL7idGt/QM4hihJueBPOScXmLKMwd1pDuyFqCOWRYkMAqwYQ
 UbjrGhe9RUU3vNWuixg6YbM=
X-Google-Smtp-Source: ABdhPJya+ZmAK68T/hIsH/3E7ve05TqDM/FCR3w6bx5agpPHLJHEg/P1bFvdRXc0DgqkFSXXIQ/bhg==
X-Received: by 2002:ad4:4a70:: with SMTP id cn16mr77948768qvb.38.1609794013571; 
 Mon, 04 Jan 2021 13:00:13 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id v145sm15509352qka.27.2021.01.04.13.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 13:00:12 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc: Handle .text.{hot,unlikely}.* in linker script
Date: Mon,  4 Jan 2021 13:59:53 -0700
Message-Id: <20210104205952.1399409-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210104204850.990966-1-natechancellor@gmail.com>
References: <20210104204850.990966-1-natechancellor@gmail.com>
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

[1]: https://reviews.llvm.org/D79600
[2]: https://reviews.llvm.org/D92493

Cc: stable@vger.kernel.org
Fixes: 83a092cf95f2 ("powerpc: Link warning for orphan sections")
Link: https://github.com/ClangBuiltLinux/linux/issues/1218
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Add missing [1] and [2] references in commit message. Thanks to Sedat
  Dilek for pointing it out!

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


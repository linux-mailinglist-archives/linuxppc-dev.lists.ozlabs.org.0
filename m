Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F353DA3B0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 15:13:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb9vY0YRJz3cX0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 23:13:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZbnGy+mG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZbnGy+mG; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gb9v63cSfz2yXh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 23:13:05 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Gb9v31Rh9z9sT6; Thu, 29 Jul 2021 23:13:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627564383;
 bh=WGoigLxZNNnSonbKEn5onnFluyagimHtYGA0akLFSq0=;
 h=From:To:Cc:Subject:Date:From;
 b=ZbnGy+mGqrlRR2DyL7CDSrKQI4eNKnltMsf6+4wnmJa7UV3OtLqYI8+//Bft1wsQU
 +AJI/SMpYX/aKzMmx4puDDAbO20xLleVBvfZa7wBo5FizDIY5JaBKQc/QwitvnmyMe
 OekrI+IUmqRL3bQnJK+jAUka/dIG/pxv53l+m+oHZQ6nClq929AfFWYx4gwRhMotbN
 jWPgnFTKE1U2czsiAm5f5ox6VhFLKZtxcvC1Mw7BRe0BkegZTDCAjJV6Gbi/EXGdnt
 BqFSQ5D56PpsuejIlpNjKyjxWEIV7eUTG4L5pldrdJQ3zDjPIqVuC3zXJfZh8zmYxy
 Sjpe1EfHYG6vg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/vdso: Don't use r30 to avoid breaking Go lang
Date: Thu, 29 Jul 2021 23:12:44 +1000
Message-Id: <20210729131244.2595519-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: pmenzel@molgen.mpg.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Go runtime uses r30 for some special value called 'g'. It assumes
that value will remain unchanged even when calling VDSO functions.
Although r30 is non-volatile across function calls, the callee is free
to use it, as long as the callee saves the value and restores it before
returning.

It used to be true by accident that the VDSO didn't use r30, because the
VDSO was hand-written asm. When we switched to building the VDSO from C
the compiler started using r30, at least in some builds, leading to
crashes in Go. eg:

  ~/go/src$ ./all.bash
  Building Go cmd/dist using /usr/lib/go-1.16. (go1.16.2 linux/ppc64le)
  Building Go toolchain1 using /usr/lib/go-1.16.
  go build os/exec: /usr/lib/go-1.16/pkg/tool/linux_ppc64le/compile: signal: segmentation fault
  go build reflect: /usr/lib/go-1.16/pkg/tool/linux_ppc64le/compile: signal: segmentation fault
  go tool dist: FAILED: /usr/lib/go-1.16/bin/go install -gcflags=-l -tags=math_big_pure_go compiler_bootstrap bootstrap/cmd/...: exit status 1

There are patches in flight to fix Go[1], but until they are released
and widely deployed we can workaround it in the VDSO by avoiding use of
r30.

Note this only works with GCC, clang does not support -ffixed-rN.

1: https://go-review.googlesource.com/c/go/+/328110

Fixes: ab037dd87a2f ("powerpc/vdso: Switch VDSO to generic C implementation.")
Cc: stable@vger.kernel.org # v5.11+
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vdso64/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index 2813e3f98db6..3c5baaa6f1e7 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -27,6 +27,13 @@ KASAN_SANITIZE := n
 
 ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
 	-Wl,-soname=linux-vdso64.so.1 -Wl,--hash-style=both
+
+# Go prior to 1.16.x assumes r30 is not clobbered by any VDSO code. That used to be true
+# by accident when the VDSO was hand-written asm code, but may not be now that the VDSO is
+# compiler generated. To avoid breaking Go tell GCC not to use r30. Impact on code
+# generation is minimal, it will just use r29 instead.
+ccflags-y += $(call cc-option, -ffixed-r30)
+
 asflags-y := -D__VDSO64__ -s
 
 targets += vdso64.lds
-- 
2.25.1


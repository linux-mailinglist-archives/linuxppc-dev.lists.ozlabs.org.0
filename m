Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AF024FE9D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 15:15:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZt033GqCzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 23:15:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lTEjArrQ; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZsxS0dw8zDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 23:12:57 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id ds1so4298249pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rD1gqbdwu1eUR6GHi7PLObEOgmQFgVaRhw+UcIBkYAk=;
 b=lTEjArrQgo2xL+pT8mXEvCHx66b0PlK/htIi576WaKfNpDkZjmod1POKi/knbQjWp0
 RFA3nIZ3N8nFKtey5TR3QwiWAPxNspEGQTzF5o8NvDqNGERDnOKOom1m3vnLIH+kF9FR
 X+QKOZfm7D7qVRVMORlTRiqmWx0vJNtGIJINSkuDTp2KVn8y7XKi/SXKFg/LVUWOQRw/
 8yoAoeTXxe3pDRrWkMTQsNPtuXgM15u2KUWHGI1dxT8tO+dNy3enOEadFwdZ3qF+PsiM
 myIxgr7OuiYd51lcFuE2BOE84kgDCzd9omaf8tXstToT0qxp0LjM3f/tiDIBl4W7/az6
 zDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rD1gqbdwu1eUR6GHi7PLObEOgmQFgVaRhw+UcIBkYAk=;
 b=YrWauAg3v1ni8NBOq+HC18QYyXWMZiO4ElbGfAeRxiFw3NY+SsLDremr+zzVQrURJ2
 4u9UNKBh8TIOTYGUasLycZAWJT2SE+6B7/fyLDP8TY7BgXSIdLkWMJtY0AlvxAfA3ULj
 RUhfvsZYHPZT56bC7RwT4mTZQ85d8HTyod/vsVcQu0WCPZcraOo2DIFKDavOuu45QXNz
 sxCFs4I4e1jqqP3c9Oji3JugIW9wQdASzfXdq7OrfHUh/tZkTkJP5UX4zyI2ciVEHq97
 CusDkG3ErrFCnUhNCDeKN9NzgP05bLMuJ/l5EfEJ0o7fkuCAMHgD5073rGVlZMUNZXxy
 u/AQ==
X-Gm-Message-State: AOAM533rB37TqHeTGFQ9hQ9gnyvIfXwlQaU1WMCuw404ZHnvCV1hSzkF
 jb3I5qmYBtZA4YrwbeYQrxVDpfuabnA=
X-Google-Smtp-Source: ABdhPJwJLHVi39U2Jf5PoE9GVGidQVdzAwdvovo9iU6gCAI7iUb4dgaXam8rH+wJ/L7VhScCwaVVfQ==
X-Received: by 2002:a17:902:b18b:: with SMTP id
 s11mr3843937plr.211.1598274774860; 
 Mon, 24 Aug 2020 06:12:54 -0700 (PDT)
Received: from tee480.ibm.com (180-150-65-4.b49641.syd.nbn.aussiebb.net.
 [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id z25sm11938309pfg.150.2020.08.24.06.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 06:12:54 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Fix prefixes in alignment_handler signal
 handler
Date: Mon, 24 Aug 2020 23:12:31 +1000
Message-Id: <20200824131231.14008-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The signal handler in the alignment handler self test has the ability to
jump over the instruction that triggered the signal. It does this by
incrementing the PT_NIP in the user context by 4. If it were a prefixed
instruction this will mean that the suffix is then executed which is
incorrect. Instead check if the major opcode indicates a prefixed
instruction (e.g. it is 1) and if so increment PT_NIP by 8.

If ISA v3.1 is not available treat it as a word instruction even if the
major opcode is 1.

Fixes: 620a6473df36 ("selftests/powerpc: Add prefixed loads/stores to
alignment_handler test")
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 .../selftests/powerpc/alignment/alignment_handler.c   | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/alignment/alignment_handler.c b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
index 55ef15184057..c197ff828120 100644
--- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
+++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
@@ -64,12 +64,14 @@ int bufsize;
 int debug;
 int testing;
 volatile int gotsig;
+bool haveprefixes;
 char *cipath = "/dev/fb0";
 long cioffset;
 
 void sighandler(int sig, siginfo_t *info, void *ctx)
 {
 	ucontext_t *ucp = ctx;
+	u32 inst;
 
 	if (!testing) {
 		signal(sig, SIG_DFL);
@@ -77,7 +79,12 @@ void sighandler(int sig, siginfo_t *info, void *ctx)
 	}
 	gotsig = sig;
 #ifdef __powerpc64__
-	ucp->uc_mcontext.gp_regs[PT_NIP] += 4;
+	if (haveprefixes) {
+		inst = *(u32 *)ucp->uc_mcontext.gp_regs[PT_NIP];
+		ucp->uc_mcontext.gp_regs[PT_NIP] += ((inst >> 26 == 1) ? 8 : 4);
+	} else {
+		ucp->uc_mcontext.gp_regs[PT_NIP] += 4;
+	}
 #else
 	ucp->uc_mcontext.uc_regs->gregs[PT_NIP] += 4;
 #endif
@@ -648,6 +655,8 @@ int main(int argc, char *argv[])
 		exit(1);
 	}
 
+	haveprefixes = have_hwcap2(PPC_FEATURE2_ARCH_3_1);
+
 	rc |= test_harness(test_alignment_handler_vsx_206,
 			   "test_alignment_handler_vsx_206");
 	rc |= test_harness(test_alignment_handler_vsx_207,
-- 
2.17.1


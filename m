Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 2161D8C98F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 08:36:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aLOQjGtI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjSKl1zCLz3dwr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 16:27:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aLOQjGtI;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjSJz0kG7z3cWF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2024 16:26:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716186416;
	bh=y1VhBtAgD3zM+qTo3t7OilfWf+u8b7W61aax400N9nQ=;
	h=From:To:Cc:Subject:Date:From;
	b=aLOQjGtIY7e5NEWLbqd11L2X5sd2Aj+Zbn1u0b8GreYHr4sfLzb1WVdKY0DYOrIUk
	 XMyNJdQv4wXFyHOY2RGVwLr2PM/ggI7k5YuSDZ9kvmnk+S+2GmQNG9hAja9ox4YnrS
	 3o7jJzKEEMabdal1Op7Xa19UR5zWJjAwVPXRlS5s8Ap87wk0SI2fUegUn0ZFqEAINC
	 XrHpSs7k4EUZlBpTskPTxweEB/1DvFpnr9lWIoLvh0k4udSMFQsZaBHmn6OpBxJqsb
	 T8urzka1dCSAbsaDboUN0YzdD8F6yZdcoQnc9zEJpbOsZGCPamR+/0D3DmihIXDKgc
	 b/e4PmExiS7QA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VjSJw2JTzz4wbp;
	Mon, 20 May 2024 16:26:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/sigaltstack: Fix ppc64 GCC build
Date: Mon, 20 May 2024 16:26:47 +1000
Message-ID: <20240520062647.688667-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: ndesaulniers@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building the sigaltstack test with GCC on 64-bit powerpc errors with:

  gcc -Wall     sas.c  -o /home/michael/linux/.build/kselftest/sigaltstack/sas
  In file included from sas.c:23:
  current_stack_pointer.h:22:2: error: #error "implement current_stack_pointer equivalent"
     22 | #error "implement current_stack_pointer equivalent"
        |  ^~~~~
  sas.c: In function ‘my_usr1’:
  sas.c:50:13: error: ‘sp’ undeclared (first use in this function); did you mean ‘p’?
     50 |         if (sp < (unsigned long)sstack ||
        |             ^~

This happens because GCC doesn't define __ppc__ for 64-bit builds, only
32-bit builds. Instead use __powerpc__ to detect powerpc builds, which
is defined by clang and GCC for 64-bit and 32-bit builds.

Fixes: 05107edc9101 ("selftests: sigaltstack: fix -Wuninitialized")
Cc: stable@vger.kernel.org # v6.3+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/sigaltstack/current_stack_pointer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

I'll plan to merge this via the powerpc tree unless anyone objects.

diff --git a/tools/testing/selftests/sigaltstack/current_stack_pointer.h b/tools/testing/selftests/sigaltstack/current_stack_pointer.h
index ea9bdf3a90b1..09da8f1011ce 100644
--- a/tools/testing/selftests/sigaltstack/current_stack_pointer.h
+++ b/tools/testing/selftests/sigaltstack/current_stack_pointer.h
@@ -8,7 +8,7 @@ register unsigned long sp asm("sp");
 register unsigned long sp asm("esp");
 #elif __loongarch64
 register unsigned long sp asm("$sp");
-#elif __ppc__
+#elif __powerpc__
 register unsigned long sp asm("r1");
 #elif __s390x__
 register unsigned long sp asm("%15");
-- 
2.45.1


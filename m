Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B18176A8357
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 14:18:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSBVn4VS2z3chS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 00:18:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mx3WB01f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSBTq3grcz3cCy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 00:17:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mx3WB01f;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSBTq2Dr6z4x80;
	Fri,  3 Mar 2023 00:17:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677763039;
	bh=0JIQWJKznz7AtiZOyXNJNdwCGrnZhYEwd8v6MXpZZbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mx3WB01f/BIglEyoyz+c+rctgDHNseoJp9meZk/si0LfJlCdGCBb32q1e/Ju7OZ9c
	 fXqmqO2TeyTW5dj1LmXzJsKsDNHVmNC80eQ5YlYFfXOxIBMVZZaSB1U+0Ql/J0swlZ
	 HpYWMXDdtuuH1WvKQcsjx4DRRY8cSrMlXnL7HX+al/ESHnErySHt/jcQTcTNmJlIeS
	 GVC9R/XgWOd22ZBBJ6fYGZDm5xjhWtTQzVWiAQLA8pHPu4p64HSRTd4gjDsoSY5Z9W
	 Mwiy64D7rMVg/u6kj/lzGJwTsM2wWvU7ouw7MSegeBNawSOrewwjZP4s4IqhHlR48X
	 frBVjzrU/EnoA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/64: Use -mtune=pwr10/9/8 for clang
Date: Fri,  3 Mar 2023 00:16:56 +1100
Message-Id: <20230302131656.50626-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302131656.50626-1-mpe@ellerman.id.au>
References: <20230302131656.50626-1-mpe@ellerman.id.au>
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
Cc: nathan@kernel.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For the -mtune option clang doesn't accept power10/9/8, instead it
accepts pwr10/9/8. That will be fixed in future versions of clang, but
the kernel must support the clang versions in the wild.

So add support for the "pwr" spelling if clang is in use.

Reported-by: Nathan Chancellor <nathan@kernel.org>
BugLink: https://github.com/ClangBuiltLinux/linux/issues/1799
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/Kconfig.cputype | 4 ++++
 1 file changed, 4 insertions(+)

Need to confirm the clang <= 16 statement is correct.

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 7d7477b73951..e4e0e81be7de 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -278,6 +278,10 @@ config TUNE_CPU
 	default "-mtune=power10" if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power10)
 	default "-mtune=power9"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power9)
 	default "-mtune=power8"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power8)
+	# clang <= 16 only supports the "pwr" names
+	default "-mtune=pwr10"   if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr10)
+	default "-mtune=pwr9"    if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr9)
+	default "-mtune=pwr8"    if POWERPC64_CPU && CC_IS_CLANG && $(cc-option,-mtune=pwr8)
 
 config PPC_BOOK3S
 	def_bool y
-- 
2.39.2


Return-Path: <linuxppc-dev+bounces-1588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3369865F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 19:51:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDPRF0nNvz2yLB;
	Thu, 26 Sep 2024 03:51:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727286665;
	cv=none; b=R+NuGzswlPd6tmp/LGo5TvqQWPXeLjF9BATsKc/t9Z6o7XPls4ZGknr4TTIYnnzxYrc65wGxscENbybQ9qmgBjUieLEfw5QeqhDuxBILclSkFVm+qdGQliHkdMYY1qTt/kryyWlgbkFzGUcy7Z+0NKFtyFLQj4ogCoREdcsJoXBTfCYpnF0O/rwvhn9bjoibtKXDWmziq9rZ225HiwZI/HGa64rgesMDZ7hlarHC3RLShUxy+eTIl8EuTdbFzEvkRH01B5nFlXcqK5R0jSei3rvz6Tf4vRVxNb3axTS7RH0rqKRMRZOWHy/qIf76jpK+B2x4pERPPoY+L4FmjbdBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727286665; c=relaxed/relaxed;
	bh=li6IV2qx3WkyvqZf9KJWqF6Gg7ZSVp3ogBpF7syJBVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mfCcSFPd79laoxEhFPN2QD7HhNtWSVSSXTOgqh6L4VmykmdPXXzLVB0XLCJfEX9wIsyGQT6DH7HVupVhTJXQDgB5Gco+ojL64MJ3jizqyIsNhm+roSKs29r1HMDf8kvA69SSf7CQIseI/f7G+cXQAg5WvnYn3joqYLieZcin9XUsH85RigjpFeXbqoSLb0DVWRW57vM2HqpzTrQZ0dO4jtRPOhaSs0UqW5Efw64qMcmiGMG+2B8kQM4KSnxKTORfHrlbeEtNhfEQrXEarMOpnEUZfT5fg0g8XjXaxNgERXt10gzoiWC8RzWqex75vaZldN3rjuXHqeooxMACc00XwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=RB8PPgXy; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=ioc0=qx=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=RB8PPgXy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=ioc0=qx=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDPRC09Zwz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 03:51:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB302A445B6;
	Wed, 25 Sep 2024 17:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA01EC4CEC9;
	Wed, 25 Sep 2024 17:50:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RB8PPgXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1727286652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=li6IV2qx3WkyvqZf9KJWqF6Gg7ZSVp3ogBpF7syJBVA=;
	b=RB8PPgXyjBnCJwV/07CQ19TtZLNx5+NhwCnW46G5919eyl5QA7kpfnHJ0hiV+mrSpBB1WK
	Zv8cELp/4eBrjMI8+Tax2OowgRZT210aSqwz9vfOuTAqi/9+VgVA8xdS1EkWtggAbmYvzI
	jGAD1TNxp4+X5Yv5WE8zM3Q3bht2uYg=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 55314627 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 25 Sep 2024 17:50:51 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] powerpc/vdso: allow r30 in vDSO code generation of getrandom
Date: Wed, 25 Sep 2024 19:50:22 +0200
Message-ID: <20240925175021.1526936-2-Jason@zx2c4.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For gettimeofday, -ffixed-r30 was passed to work around a bug in Go
code, where the vDSO trampoline forgot to save and restore this register
across function calls. But Go requires a different trampoline for every
call, and there's no reason that new Go code needs to be broken and add
more bugs.  So remove -ffixed-r30 for getrandom.

Fixes: 8072b39c3a75 ("powerpc/vdso: Wire up getrandom() vDSO implementation on VDSO64")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Michael - can you take this through your tree as a ppc fix?

 arch/powerpc/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 56fb1633529a..31ca5a547004 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -22,7 +22,7 @@ endif
 
 ifneq ($(c-getrandom-y),)
   CFLAGS_vgetrandom-32.o += -include $(c-getrandom-y)
-  CFLAGS_vgetrandom-64.o += -include $(c-getrandom-y) $(call cc-option, -ffixed-r30)
+  CFLAGS_vgetrandom-64.o += -include $(c-getrandom-y)
 endif
 
 # Build rules
-- 
2.46.0



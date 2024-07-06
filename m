Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A026592937A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 14:09:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VajEfRv5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGThF2tqHz3cYm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 22:09:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VajEfRv5;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGTgV26R8z30Wm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2024 22:08:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720267717;
	bh=Ug+KF5YGrihKrbfmbNh75185czFZqdxboNmnIHHzoMM=;
	h=From:To:Subject:Date:From;
	b=VajEfRv5A/al4NyXt1zZwzC5DDDzC2Op3uXKHJdF4r/DouJO39myesAZJZmNrj8hb
	 Ecdg5mNtSQG6nQ3jVBDDZGbZA3HyOy+ntBRpW2N2wBcAYhM33SQCyuF+GDWOpo+jWY
	 AZ61D7UF76ezemvbw0YtVfA43xCSPydM4F69vnAXD6qKRqf5zdHvU0Kx0zfZ922BnQ
	 ETDGQw1sXLe3VXs1kQqtrFApFSiAoh86uobm+n0/xMSqVRkalsYwiZ5VZVd1TUBzAu
	 MYQrql4ucIzOdllgR7loB/vR3RJ+qXQccoyoiNQRh7a8bv97TqTAzYKntGC9p6B/uh
	 P/yewTF47hTkA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGTgT23pvz4w2S;
	Sat,  6 Jul 2024 22:08:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/powerpc: Fix build with USERCFLAGS set
Date: Sat,  6 Jul 2024 22:08:33 +1000
Message-ID: <20240706120833.909853-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently building the powerpc selftests with USERCFLAGS set to anything
causes the build to break:

  $ make -C tools/testing/selftests/powerpc V=1 USERCFLAGS=-Wno-error
  ...
  gcc -Wno-error    cache_shape.c ...
  cache_shape.c:18:10: fatal error: utils.h: No such file or directory
     18 | #include "utils.h"
        |          ^~~~~~~~~
  compilation terminated.

This happens because the USERCFLAGS are added to CFLAGS in lib.mk, which
causes the check of CFLAGS in powerpc/flags.mk to skip setting CFLAGS at
all, resulting in none of the usual CFLAGS being passed. That can
be seen in the output above, the only flag passed to the compiler is
-Wno-error.

Fix it by dropping the conditional setting of CFLAGS in flags.mk.
Instead always set CFLAGS, but also append USERCFLAGS if they are set.

Note that appending to CFLAGS (with +=) wouldn't work, because flags.mk
is included by multiple Makefiles (to support partial builds), causing
CFLAGS to be appended to multiple times. Additionally that would place
the USERCFLAGS prior to the standard CFLAGS, meaning the USERCFLAGS
couldn't override the standard flags. Being able to override the
standard flags is desirable, for example for adding -Wno-error.

With the fix in place, the CFLAGS are set correctly, including the
USERCFLAGS:

  $ make -C tools/testing/selftests/powerpc V=1 USERCFLAGS=-Wno-error
  ...
  gcc -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"v6.10-rc2-7-gdea17e7e56c3"'
  -I/home/michael/linux/tools/testing/selftests/powerpc/include -Wno-error
  cache_shape.c ...

Fixes: 5553a79387e9 ("selftests/powerpc: Add flags.mk to support pmu buildable")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/flags.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/powerpc/flags.mk b/tools/testing/selftests/powerpc/flags.mk
index b909bee3cb2a..abb9e58d95c4 100644
--- a/tools/testing/selftests/powerpc/flags.mk
+++ b/tools/testing/selftests/powerpc/flags.mk
@@ -5,8 +5,5 @@ GIT_VERSION := $(shell git describe --always --long --dirty || echo "unknown")
 export GIT_VERSION
 endif
 
-ifeq ($(CFLAGS),)
-CFLAGS := -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"$(GIT_VERSION)"' -I$(selfdir)/powerpc/include $(CFLAGS)
+CFLAGS := -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"$(GIT_VERSION)"' -I$(selfdir)/powerpc/include $(USERCFLAGS)
 export CFLAGS
-endif
-
-- 
2.45.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B661B523CE0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 20:50:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz3rq4W5gz3cJp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 04:50:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L7zWc1Ou;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L7zWc1Ou; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz3rF57sQz3brf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 04:50:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2331160F02;
 Wed, 11 May 2022 18:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE446C340EE;
 Wed, 11 May 2022 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652295017;
 bh=W9rLIkC4kkgzqycQuHkA/UVojPhdH7N+sZBFCymIYMw=;
 h=From:To:Cc:Subject:Date:From;
 b=L7zWc1OuyqYs4BtULyThnE4ZHBy3tF1C8dR4qLEgmXCt1qSQAjXpqbFarMmV8YjJH
 E0GLJaxtgCrWSO9P7xcFf4g3BzRFQUyZIMlNEjzsbXhYkADb1+b1bD1iotYgpALtoy
 wmQrSZT7C0zoVdH2sCAVyVgx8ZhfVYCztyU3QIHy5I0Yts7azUbKT25jBORdbXBJ9b
 mHOiy1C4jIHYEkI72o145Ewn6IBTbocEow8Y4KfJrhZqCNV/6j0JKc+oMuvIZMjvyH
 pdihbuNI2sgBgFLCxspf3HHY+SvA/Fhxp9xz1/EmLrQ2vAHDDGZR5m00hzWR6aSQod
 cx0H76qW6J0Lw==
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 0/2] Link the PowerPC vDSO with ld.lld
Date: Wed, 11 May 2022 11:49:59 -0700
Message-Id: <20220511185001.3269404-1-nathan@kernel.org>
X-Mailer: git-send-email 2.36.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

This series is an alternative to the one proposed by Nick before the
PowerPC vDSO unification in commit fd1feade75fb ("powerpc/vdso: Merge
vdso64 and vdso32 into a single directory"):

https://lore.kernel.org/20200901222523.1941988-1-ndesaulniers@google.com/

Normally, we try to make compiling and linking two separate stages so
that they can be done by $(CC) and $(LD) respectively, which is more in
line with what the user expects, versus using the compiler as a linker
driver and relying on the implicit default linker value. However, as
shown in the above thread, getting this right for the PowerPC vDSO is a
little tricky due to the linker emulation values.

The unification might make this easier but that needs further
investigation. To avoid regressing ld.bfd while enabling support for
linking the vDSO with ld.lld, we can tell the compiler to use ld.lld via
either '--ld-path=' (clang 12.0.0) or '-fuse-ld=lld'.

The first patch avoids a warning from ld.lld when linking both vDSO
objects and the second patch adds the flags.

This should help avoid the issue noticed during Alexey's LTO bring up:

https://lore.kernel.org/CAKwvOdmUMhqhQhDCpWjMNiQQPvwOJB9MbUkF3RR0BL+H+DagmA@mail.gmail.com/

Changelog:

v1 -> v2: https://lore.kernel.org/20220509204635.2539549-1-nathan@kernel.org/

* Flush out the second commit message much more with information from
  this cover letter and the other threads (Alexey's LTO enablement and
  Nick's initial stab at converting to $(CC) + $(LD)) [Nick].

* Add Nick and Alexey's tags.

Nathan Chancellor (2):
  powerpc/vdso: Remove unused ENTRY in linker scripts
  powerpc/vdso: Link with ld.lld when requested

 arch/powerpc/kernel/vdso/Makefile     | 1 +
 arch/powerpc/kernel/vdso/vdso32.lds.S | 1 -
 arch/powerpc/kernel/vdso/vdso64.lds.S | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)


base-commit: b6b1c3ce06ca438eb24e0f45bf0e63ecad0369f5
-- 
2.36.1


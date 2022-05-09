Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1707752062B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 22:47:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxtXR71zhz3cFL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 06:47:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h481kMiK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=nathan@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h481kMiK; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxtWp1hrxz3bbB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 06:47:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 124C9B81620;
 Mon,  9 May 2022 20:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190C4C385BB;
 Mon,  9 May 2022 20:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652129215;
 bh=sDVHXI9/rkDTE7dVP8WnbHuHCo+JWMk8WFLk4xACHAE=;
 h=From:To:Cc:Subject:Date:From;
 b=h481kMiKya6SLbaPaZ5UM1WUAw/wZCMkfOJ5lf0o7OzrPtikhVLxdIKwpac8lDxWX
 makYC8Pt2Ei+dT8NuOWXeg2pZcbwq4lhKYNz/ErpTBsdLDmLDIqSFlqRBCvakU+nTs
 KIfnorC44k6V+vKm02nTUlfkCNQqX+DyfdVhQjmHzRow5I5f/RBF2ieWc+Po5R7xd4
 YJwixwOTxxlFol/5ujpTCzopzBACkmSWY2xGbTkXy7giB+y2GCalhucHUJsfMf2UN9
 NaoM1ZzOmy+63t+oEsvLkMMY0cPE4HfSof/S6TkIbdUywMUky/b+0Wn1HIrHlnOA/k
 OzmY58c43/Juw==
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/2] Link the PowerPC vDSO with ld.lld
Date: Mon,  9 May 2022 13:46:33 -0700
Message-Id: <20220509204635.2539549-1-nathan@kernel.org>
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

Nathan Chancellor (2):
  powerpc/vdso: Remove unused ENTRY in linker scripts
  powerpc/vdso: Link with ld.lld when requested

 arch/powerpc/kernel/vdso/Makefile     | 1 +
 arch/powerpc/kernel/vdso/vdso32.lds.S | 1 -
 arch/powerpc/kernel/vdso/vdso64.lds.S | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)


base-commit: f06351f8c0c85e2d53e73c53a33b4ef55b4ad6de
-- 
2.36.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 243AA83E8C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 01:56:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=egrG2Ed9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TMGNm0fLYz3cVP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 11:56:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=egrG2Ed9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TMGN12cbrz307y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 11:56:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B5DAECE3863;
	Sat, 27 Jan 2024 00:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2054C433C7;
	Sat, 27 Jan 2024 00:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706316974;
	bh=vVTjlwra7ffKDvKLusXBZk6XeHCyJPCfJKjgSIJdI10=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=egrG2Ed9YkET4ZZCspyiUL8MKiolNEPH5y2o2FRFswgg85H/GtBAu1WduRMW0jHFb
	 P3vexsCcxP9aa6I30C6yBWLgCNFoQsqtlB5orCulJFfwhzgbBpzWh97aNsvkx7Vh/P
	 EU4c3mFj1bhzqwVXp0r+c/l8BkxXqFX621UVKiek=
Subject: Patch "powerpc: Use always instead of always-y in for crtsavres.o" has been added to the 4.19-stable tree
To: gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org,llvm@lists.linux.dev,nathan@kernel.org,sashal@kernel.org
From: <gregkh@linuxfoundation.org>
Date: Fri, 26 Jan 2024 16:56:12 -0800
In-Reply-To: <20240126-4-19-fix-lib-powerpc-backport-v1-1-f0de224db66b@kernel.org>
Message-ID: <2024012612-correct-valid-8b57@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    powerpc: Use always instead of always-y in for crtsavres.o

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-use-always-instead-of-always-y-in-for-crtsavres.o.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Fri Jan 26 16:52:20 2024
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 26 Jan 2024 10:36:31 -0700
Subject: powerpc: Use always instead of always-y in for crtsavres.o
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,  linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,  Nathan Chancellor <nathan@kernel.org>
Message-ID: <20240126-4-19-fix-lib-powerpc-backport-v1-1-f0de224db66b@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

This commit is for linux-4.19.y only, it has no direct upstream
equivalent.

Prior to commit 5f2fb52fac15 ("kbuild: rename hostprogs-y/always to
hostprogs/always-y"), always-y did not exist, making the backport of
mainline commit 1b1e38002648 ("powerpc: add crtsavres.o to always-y
instead of extra-y") to linux-4.19.y as commit b7b85ec5ec15 ("powerpc:
add crtsavres.o to always-y instead of extra-y") incorrect, breaking the
build with linkers that need crtsavres.o:

  ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory

Backporting the aforementioned kbuild commit is not suitable for stable
due to its size and number of conflicts, so transform the always-y usage
to an equivalent form using always, which resolves the build issues.

Fixes: b7b85ec5ec15 ("powerpc: add crtsavres.o to always-y instead of extra-y")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/lib/Makefile |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -21,8 +21,8 @@ obj-$(CONFIG_PPC32)	+= div64.o copy_32.o
 # 64-bit linker creates .sfpr on demand for final link (vmlinux),
 # so it is only needed for modules, and only for older linkers which
 # do not support --save-restore-funcs
-ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
-always-$(CONFIG_PPC64)	+= crtsavres.o
+ifeq ($(call ld-ifversion, -lt, 225000000, y)$(CONFIG_PPC64),yy)
+always	+= crtsavres.o
 endif
 
 obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-4.19/powerpc-use-always-instead-of-always-y-in-for-crtsavres.o.patch

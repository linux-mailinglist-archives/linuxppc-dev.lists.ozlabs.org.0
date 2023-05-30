Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB57715A9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 11:49:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVnfS2Zbmz3f40
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 19:49:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qdErysJt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qdErysJt;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVndb3Qpbz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 19:48:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4769261DCD;
	Tue, 30 May 2023 09:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E39AC433D2;
	Tue, 30 May 2023 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685440094;
	bh=S0UmimwWrs9i/HJ4eFgqwMNC/57ky8YO+gSANYAKMGw=;
	h=From:To:Cc:Subject:Date:From;
	b=qdErysJtn381dD4rHsvoj6vWpW4xwluHOvphkB/xH5pM66kxunDEWzsdWGQwYgwce
	 0ooXy7Hh/kNinvkYeywlEuHj0pIFMLNSrGXT5zhN5i9M8i7usTrMAiLtKilc3bwoC1
	 dJVW1yOE8jM5qynRdlfsEvdmzOxGl5vRWdNB+X9Ws/SUIbq/lARkMOfgpq1pfpQJkx
	 troqbob4choe0wgszNlAxNUbUmJcV7u2tsXsfDPqEDbdq+Ll+tcr8qOnE7XP0PrWZE
	 1xYlEft0gbeEBJCj5dJ/UOGL1M6KcYd4prgDwwbNTVXL+Ai2WOS00BJIP1EaQUTXmE
	 ousvAmgvFfw9g==
From: Naveen N Rao <naveen@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/tools: Pass -mabi=elfv2 to gcc-check-mprofile-kernel.sh
Date: Tue, 30 May 2023 15:08:21 +0530
Message-Id: <20230530093821.298590-1-naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Toolchains don't always default to the ELFv2 ABI. This is true with at
least the kernel.org toolchains. As such, pass -mabi=elfv2 explicitly to
ensure that we are testing against the correct compiler output.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
The script works fine without this change, so this is not a fix per se.
I felt it is better to be explicit about the ABI here to be sure about 
what we are testing against.

This applies atop Nick's patch to enable -mprofile-kernel for ELFv2 BE:
http://lore.kernel.org/20230506011814.8766-1-npiggin@gmail.com


- Naveen


 arch/powerpc/tools/gcc-check-mprofile-kernel.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
index e78c599251ff35..abd6b9b8f07e3e 100755
--- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
+++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
@@ -7,20 +7,20 @@ set -o pipefail
 # To debug, uncomment the following line
 # set -x
 
-# -mprofile-kernel is only supported on 64le, so this should not be invoked
-# for other targets. Therefore we can pass in -m64 and -mlittle-endian
-# explicitly, to take care of toolchains defaulting to other targets.
+# -mprofile-kernel is only supported on ppc64, so this should not be invoked
+# for other targets. Therefore we can pass in -m64 and -mabi explicitly, to
+# take care of toolchains defaulting to other targets.
 
 # Test whether the compile option -mprofile-kernel exists and generates
 # profiling code (ie. a call to _mcount()).
 echo "int func() { return 0; }" | \
-    $* -m64 -S -x c -O2 -p -mprofile-kernel - -o - \
+    $* -m64 -mabi=elfv2 -S -x c -O2 -p -mprofile-kernel - -o - \
     2> /dev/null | grep -q "_mcount"
 
 # Test whether the notrace attribute correctly suppresses calls to _mcount().
 
 echo -e "#include <linux/compiler.h>\nnotrace int func() { return 0; }" | \
-    $* -m64 -S -x c -O2 -p -mprofile-kernel - -o - \
+    $* -m64 -mabi=elfv2 -S -x c -O2 -p -mprofile-kernel - -o - \
     2> /dev/null | grep -q "_mcount" && \
     exit 1
 

base-commit: 7b2f56d76feff3b494d6e77950ab97987323d3c5
prerequisite-patch-id: 502430fc318f92c1fe5f3b482ca8d798232b0516
prerequisite-patch-id: 3862cf6dc646260228e50b70c316cf15b1d7f384
prerequisite-patch-id: 859f60071f4e425c806fc7fe6c59e268232050a4
prerequisite-patch-id: ef23f712e50f106d689a550dae0f816285c1db3b
prerequisite-patch-id: 8c6d31bb6ac4e4bef086fe502efa660ae99a96ca
-- 
2.40.1


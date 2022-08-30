Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEB55A6CCE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 21:10:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHH1f548Vz3bpW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 05:09:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=gNytFIHm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.78; helo=conuserg-11.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=gNytFIHm;
	dkim-atps=neutral
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHH110xvDz3blY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 05:09:24 +1000 (AEST)
Received: from grover.sesame (133-32-182-133.west.xps.vectant.ne.jp [133.32.182.133]) (authenticated)
	by conuserg-11.nifty.com with ESMTP id 27UJ8ZDL014149;
	Wed, 31 Aug 2022 04:08:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 27UJ8ZDL014149
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1661886515;
	bh=ExOgCI7V96Z6R/+llvRQlPICGHveN6sllg9dVu+33hs=;
	h=From:To:Cc:Subject:Date:From;
	b=gNytFIHmggiLo7UX9tYTYrdZQfCWlmO4rbJcLJNMoNMBqNB7rVBhTVi/u5v/L7sGc
	 fY/492KvOKhW4ymFQOdjLHHxVkhnqFF25y5509bbfwfQ2YqrEfOIFyYXbVquKMQu87
	 2fsFQcuWRWLc05nlEvlYSDRaqBayshOigmT+KrmQiFZ+sl4NemwiSFv4Cb7SCLUv7f
	 QPEiK9ZFaIrvQWz4ndP4ONfS7Ij2skGHE4tV8NnniFdPwvwzVOFoAkgfjfC4Ne9ToW
	 t6/19X89y9BgcyIts30ekgHNbq4DiQdPiXMxW21sfFRNx4DEAscMTNQHW5NoibSJET
	 z3GIv9kuDs9wA==
X-Nifty-SrcIP: [133.32.182.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] Documentation: raise minimum supported version of binutils to 2.25.1
Date: Wed, 31 Aug 2022 04:08:10 +0900
Message-Id: <20220830190811.323760-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Binutils 2.23 was released in 2012. Almost 10 years old.

We already require GCC 5.1, which was released in 2015.

Bump the binutils version to 2.25.1, which was also released in 2015.

Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/process/changes.rst | 4 ++--
 scripts/min-tool-version.sh       | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 19c286c23786..5fb6a60677ef 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -33,7 +33,7 @@ GNU C                  5.1              gcc --version
 Clang/LLVM (optional)  11.0.0           clang --version
 GNU make               3.81             make --version
 bash                   4.2              bash --version
-binutils               2.23             ld -v
+binutils               2.25.1           ld -v
 flex                   2.5.35           flex --version
 bison                  2.0              bison --version
 pahole                 1.16             pahole --version
@@ -94,7 +94,7 @@ Bash 4.2 or newer is needed.
 Binutils
 --------
 
-Binutils 2.23 or newer is needed to build the kernel.
+Binutils 2.25.1 or newer is needed to build the kernel.
 
 pkg-config
 ----------
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 250925aab101..8b1edd1f7281 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -14,7 +14,7 @@ fi
 
 case "$1" in
 binutils)
-	echo 2.23.0
+	echo 2.25.1
 	;;
 gcc)
 	echo 5.1.0
-- 
2.34.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB58857E49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 14:59:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PbegEhIP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tbtnz3Q7hz3vZ3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 00:59:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PbegEhIP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbtnG54vCz3bsJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 00:58:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 57B6ECE2BBC;
	Fri, 16 Feb 2024 13:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E302EC433C7;
	Fri, 16 Feb 2024 13:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708091903;
	bh=DYer1MDOjQctt3rMYGNc1SxWw+ODGSGiCUq1XcQAyLI=;
	h=From:To:Cc:Subject:Date:From;
	b=PbegEhIPANLIh7P1dBB/JNjJ59185jxfNRMHvnsacLeSzpDRXVRZQBjm15t74TRGq
	 tlDeM+Ez3MGhB5t3KdSj0BBuCzBv1i7QRhop0ejHLF8LTtVA13pWqU8GewwOfJuPGR
	 TySuyu/xmxiH7CTat4V5krMXjtc4OoTpt1wCs6G0bK2htVjF0JrP55HEAGWv4IzVcz
	 zeMorCM2Xu96x3QAoAJHBFxfGkC132JOou1mVzkQ2bQS5uJNO5hB2ahhdJY+N8dj7y
	 nfMOlQ9+hrvIUe0wQ+sjc5glbJPXFJTARLjz92gp/TwDK4VTANBlrjWDcK/PBFpeWm
	 RdMTIJdNGIDxw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: remove unused KCSAN_SANITIZE_early_64.o in Makefile
Date: Fri, 16 Feb 2024 22:58:17 +0900
Message-Id: <20240216135817.2003106-1-masahiroy@kernel.org>
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 2fb857bc9f9e ("powerpc/kcsan: Add exclusions from instrumentation")
added KCSAN_SANITIZE_early_64.o to arch/powerpc/kernel/Makefile, while
it does not compile early_64.o.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/kernel/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 72d1cd6443bc..a6f9b53c7490 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -55,7 +55,6 @@ CFLAGS_btext.o += -DDISABLE_BRANCH_PROFILING
 endif
 
 KCSAN_SANITIZE_early_32.o := n
-KCSAN_SANITIZE_early_64.o := n
 KCSAN_SANITIZE_cputable.o := n
 KCSAN_SANITIZE_btext.o := n
 KCSAN_SANITIZE_paca.o := n
-- 
2.40.1


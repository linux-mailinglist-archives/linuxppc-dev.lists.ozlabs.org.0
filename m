Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D75289111AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 20:59:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FW9h6l4o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4qXn49LKz2xFn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 04:59:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FW9h6l4o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4qVf2JkLz3cXW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 04:57:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1AA86227E;
	Thu, 20 Jun 2024 18:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3871DC4AF11;
	Thu, 20 Jun 2024 18:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718909849;
	bh=0ZTJnkb+12h9K7fDEj4OZ82shNV1u3ppXKLPLG9H5Xo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FW9h6l4o/Xsvb/aycYg8aPTzLUE/3h7KlB4uTFFt5Bftou8RIZj1PVuJeiiPhZT6/
	 cE+rBTLi+a8O9C1du7RLA/lht8M9EjUt7W8RaFDcftaUHpE58xFOqmb0qHqUeLFFo4
	 MX0XQrsFVvNKbVTbcr/F74wDSqtI6QUxJ/K6Yf0e0WCuDaQ/9zEqZvQ+oCJvbSF4aU
	 mK3GghfvrZpkPVl/ZtASis7Okq2KGLM5UFT8a7G+QXvIm0DmG2A/cRifbYsZM6jyVX
	 Z6WK1kH9duY9H7aLt2Hhnmxg8fwoMBYFhVJxQUWy70Epnsy5vQrOZhKklkc+ZgDdRC
	 FhmRTY2Av1HYA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-trace-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>
Subject: [RFC PATCH v3 03/11] powerpc/module_64: Convert #ifdef to IS_ENABLED()
Date: Fri, 21 Jun 2024 00:24:06 +0530
Message-ID: <e0782cdf680a645d7f8d311a16530be7004bb0ef.1718908016.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718908016.git.naveen@kernel.org>
References: <cover.1718908016.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Minor refactor for converting #ifdef to IS_ENABLED().

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/module_64.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index e9bab599d0c2..c202be11683b 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -241,14 +241,13 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 		}
 	}
 
-#ifdef CONFIG_DYNAMIC_FTRACE
 	/* make the trampoline to the ftrace_caller */
-	relocs++;
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE))
+		relocs++;
+
 	/* an additional one for ftrace_regs_caller */
-	relocs++;
-#endif
-#endif
+	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
+		relocs++;
 
 	pr_debug("Looks like a total of %lu stubs, max\n", relocs);
 	return relocs * sizeof(struct ppc64_stub_entry);
-- 
2.45.2


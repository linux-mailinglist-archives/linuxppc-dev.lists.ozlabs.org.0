Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9828AC82F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 10:58:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eVoUrqTz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNK0R4xxdz3vln
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 18:58:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eVoUrqTz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNJs24TlWz3vmW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 18:51:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4D73FCE0A08;
	Mon, 22 Apr 2024 08:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C17C2BD11;
	Mon, 22 Apr 2024 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713775908;
	bh=+AOj3OMDSB3feHYUPdQfVhUVtDWDdcImqVlO1v4xpng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eVoUrqTzKvKDMlRbSWxMwMfDr77F/fKfaXZo2D+M3jvbmz9/9rPDY11wr5uJd9WHR
	 73qR6p9MsEwspl1mw67ZTeyYCQ1FdiUxyXu6GbwzDfstwCeP1NpczqvSY3Ba3Z0ExF
	 qBMPc7gnPplQ3FSNK9aAmG5M0zlt/ivtRKIDO9W7wAAOdsxTPJAPWUmM+W1fP4IdGd
	 KAT9/hPs4sBh1ZzDW2QkE9pzzbAWiIcuTpjmeUWW8EYfxXBJk1pSD+eFGRvkHE7PRe
	 d4xcLwN7QI4MoUdGlr27hLmYCSgh98aXj/Vzt/0ZDsn1XD4giLiMchiuCvfBPl67Xb
	 qXJvsrGnAVEqQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/15] bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
Date: Mon, 22 Apr 2024 11:50:28 +0300
Message-ID: <20240422085028.3602777-6-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422085028.3602777-1-rppt@kernel.org>
References: <20240422085028.3602777-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <ke
 nt.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

BPF just-in-time compiler depended on CONFIG_MODULES because it used
module_alloc() to allocate memory for the generated code.

Since code allocations are now implemented with execmem, drop dependency of
CONFIG_BPF_JIT on CONFIG_MODULES and make it select CONFIG_EXECMEM.

Suggested-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 kernel/bpf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
index bc25f5098a25..f999e4e0b344 100644
--- a/kernel/bpf/Kconfig
+++ b/kernel/bpf/Kconfig
@@ -43,7 +43,7 @@ config BPF_JIT
 	bool "Enable BPF Just In Time compiler"
 	depends on BPF
 	depends on HAVE_CBPF_JIT || HAVE_EBPF_JIT
-	depends on MODULES
+	select EXECMEM
 	help
 	  BPF programs are normally handled by a BPF interpreter. This option
 	  allows the kernel to generate native code when a program is loaded
-- 
2.43.0


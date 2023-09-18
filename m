Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 057657A4303
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 09:42:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vnbzf3Qh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpxb26BXWz3dfH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 17:42:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vnbzf3Qh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpxMX0bb4z3c6Q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 17:32:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D75D60F9A;
	Mon, 18 Sep 2023 07:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC40C433B9;
	Mon, 18 Sep 2023 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695022341;
	bh=07Jp3LphXzl4EkHja0JdIUA/xjHpNGiZuguIXloPztM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vnbzf3QhQuVmwYQAf2Mt0WSZBefd5lhLSFtkXhwMC+n+X7N4ki+6T0boDwsgMr0XN
	 AAdXg1yYsIa/lFW8JGjF+xmiLYY63eHqaMwytJIlEVwOkPrMrojuYJZhQpE797YZju
	 GZcg8J0n+fEArc0GhUtiTV4LpXaeVrImgv2qDiS2pZ01DSA9wJwPYqPfL7KPbaX6bE
	 QYQH9HSRdQuGBz3raOjQKyLrYnfzs7cZoMWOYQ1LzctZYuLHDNxMU/K31vWL6RTmKL
	 zi7xoAjilllhk4DMDBlwvUkOVzwZl6SwuVwOf6rk+tbCRJ2s6/D0PIr6IMDdrgSqtE
	 mxvGlqxn371yQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/13] bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
Date: Mon, 18 Sep 2023 10:29:55 +0300
Message-Id: <20230918072955.2507221-14-rppt@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230918072955.2507221-1-rppt@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis
  Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
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
index 6a906ff93006..5be11c906f93 100644
--- a/kernel/bpf/Kconfig
+++ b/kernel/bpf/Kconfig
@@ -42,7 +42,7 @@ config BPF_JIT
 	bool "Enable BPF Just In Time compiler"
 	depends on BPF
 	depends on HAVE_CBPF_JIT || HAVE_EBPF_JIT
-	depends on MODULES
+	select EXECMEM
 	help
 	  BPF programs are normally handled by a BPF interpreter. This option
 	  allows the kernel to generate native code when a program is loaded
-- 
2.39.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC5D8A1942
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 18:03:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e959rFf0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFkxp4WR9z3vgp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 02:03:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e959rFf0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFkwQ2zK7z3vYD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 02:01:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F1231CE065F;
	Thu, 11 Apr 2024 16:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65599C113CE;
	Thu, 11 Apr 2024 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851316;
	bh=M6QQiy27Yx7cZTOC0617KB9Ln6pKKwikPWIcgenY/bM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e959rFf0FGI0PoEgIv3+2nGDkq9xVmqePeW9IUKhRR9fm/xePvfpioqz61uckMSmr
	 bsKvhh8aiqb+1hbru4aZPJCKo3jfLBuXlFCvNMYWcCgxYX5gHAOiQiyrO2GFAU6bPm
	 rDiEfTEbCXzSyUx6JjDJlgEPJsiVKld/UdGf8sfF1V548AL4O0qlf9lAbIDbEw/+nt
	 b/UibzbyDfbVVY6IbEz1hMUj1Jp7rSovkVB467ogMQygsPwGkBwQLq2O4ziU/K02Hw
	 iRGfOdEyV997OCcDBNKC0/iXYnnLp7WhCIWOyAIy3ufNrgtCZhStQZZ10xIfbu+t2p
	 EOYI7IX8ofV0w==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/15] arm64: module: remove uneeded call to kasan_alloc_module_shadow()
Date: Thu, 11 Apr 2024 19:00:37 +0300
Message-ID: <20240411160051.2093261-2-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160051.2093261-1-rppt@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-m
 ips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Since commit f6f37d9320a1 ("arm64: select KASAN_VMALLOC for SW/HW_TAGS
modes") KASAN_VMALLOC is always enabled when KASAN is on. This means
that allocations in module_alloc() will be tracked by KASAN protection
for vmalloc() and that kasan_alloc_module_shadow() will be always an
empty inline and there is no point in calling it.

Drop meaningless call to kasan_alloc_module_shadow() from
module_alloc().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/arm64/kernel/module.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 47e0be610bb6..e92da4da1b2a 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -141,11 +141,6 @@ void *module_alloc(unsigned long size)
 				    __func__);
 	}
 
-	if (p && (kasan_alloc_module_shadow(p, size, GFP_KERNEL) < 0)) {
-		vfree(p);
-		return NULL;
-	}
-
 	/* Memory is intended to be executable, reset the pointer tag. */
 	return kasan_reset_tag(p);
 }
-- 
2.43.0


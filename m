Return-Path: <linuxppc-dev+bounces-1972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07101998B68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 17:24:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPYTX5zVpz3bdV;
	Fri, 11 Oct 2024 02:24:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728573888;
	cv=none; b=mHklSRlMwgWqlI9pUdareCgVoHb+Hobfa0TgldlU+D00PVMj/cUU8Xk+ENSnxos/1UdYOHdYz4Ndir+QNVdO778mDAaX27pCPIvyusSMlnd65BFd4VqITj9lePc4L0k8IPOxblFp/CdmlyMcYCjNAktZ/WpaAr9JC+dsuS8d8so0BGJ+j3HlOqf8m2nGkyQzgZNMvSI6ciwwjZ7KVknn7JT3ow3ImCxoH0+NbbrOz6x+5ZP9xS7auxAljeoc+n9i2uTL8P5tChjTrssM9A4BotsqXYAi0EsVrjZMwlPJgzs3m9fgzNV09kr7kJpnzjo1AkByt/wivc71g1VYMCU5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728573888; c=relaxed/relaxed;
	bh=c62i3F029wIUU6xtQe3DQyljasrsetXeDj04xF8k0V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWxTLv2wYx4FgBktta2YkGcG2Gf6reODiZM2QONElzcdmFGL3hFGhXfzwAC+vLmK6SvNVYVxbp9OtJyhlS0Dgw3Hy/P6koXytQ5/44Ol/Cz6PU6OVAw43MQrk4ThTqVApaNwaFBYUxJq+GKpXYQhKWVp5AjDfydDbyGpPWepPJhsS5LtQc6aVkqprJC6dvBZu4BWI1bcEBp8gtZDgPtGemoKW0wlLkqwD3X3cjqB8PqV27rcpedVeyXNm12LCCppOTIgdb8mLK4Ls4g1GTsd/9QRl7MgwQZwH6GegRFR8LT8WzuqfmmweNAB6d4zgFm4N/S8F2DlvBYv47o1kZnSuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ekagPdIZ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ekagPdIZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPYTW0qqnz301n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 02:24:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE93BA4347C;
	Thu, 10 Oct 2024 15:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D86C4CEC5;
	Thu, 10 Oct 2024 15:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728573883;
	bh=gnTehr7qrLMKw/pUpKhTMaCY3tpDIt6F6aFobT96HoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ekagPdIZxqT4SWWRuS6VjAHAzc6oWKEW/4hsSTRm4pLygcR/K/5nYo1MRhIB1W8Bi
	 WhUInbNKfRaSZHzNuMbNo/gh/Dm11IzVkhHlBcuZvhkOJMQBELbJP+QR/GYDeVHSby
	 +1ODj4I12HqiH5y8g34fzvrSEzf2u/HDRwYAX/nNnTn9iTEhJxcxooLVqAwIKD6FZv
	 b3fbK7YHQj8tX05PEVkLu2GJn3pxXz8GTYW1p2sF1xOis1mXNPjG1oTG9dYByuOZVe
	 q0nYNSfpcIxt1MrmJaX80Vmf5bsmJaexf7/nT75nIm1VGT6H7a1RxSwQLd/ELhYVan
	 63H6TXss7XvhQ==
Date: Thu, 10 Oct 2024 18:20:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: Bisected: [PATCH v5 8/8] x86/module: enable ROX caches for
 module text
Message-ID: <Zwfw1bC-muLe6I9-@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-9-rppt@kernel.org>
 <20241010083033.GA1279924@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010083033.GA1279924@google.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 05:30:33PM +0900, Sergey Senozhatsky wrote:
> On (24/10/09 21:08), Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Enable execmem's cache of PMD_SIZE'ed pages mapped as ROX for module
> > text allocations.
> > 
> 
> With this modprobe disappoints kmemleak
> 
> [   12.700128] kmemleak: Found object by alias at 0xffffffffa000a000
> [   12.702179] CPU: 5 UID: 0 PID: 410 Comm: modprobe Tainted: G                 N 6.12.0-rc2+ #760
> [   12.704656] Tainted: [N]=TEST
> [   12.705526] Call Trace:
> [   12.706250]  <TASK>
> [   12.706888]  dump_stack_lvl+0x3e/0xdb
> [   12.707961]  __find_and_get_object+0x100/0x110
> [   12.709256]  kmemleak_no_scan+0x2e/0xb0
> [   12.710354]  kmemleak_load_module+0xad/0xe0
> [   12.711557]  load_module+0x2391/0x45a0
> [   12.712507]  __se_sys_finit_module+0x4e0/0x7a0
> [   12.713599]  do_syscall_64+0x54/0xf0
> [   12.714477]  ? irqentry_exit_to_user_mode+0x33/0x100
> [   12.715696]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
> [   12.716931] RIP: 0033:0x7fc7af51f059
> [   12.717816] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8f 1d 0d 00 f7 d8 64 89 01 48
> [   12.722324] RSP: 002b:00007ffc1d0b0c18 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> [   12.724173] RAX: ffffffffffffffda RBX: 00005618a9439b20 RCX: 00007fc7af51f059
> [   12.725884] RDX: 0000000000000000 RSI: 000056187aea098b RDI: 0000000000000003
> [   12.727617] RBP: 0000000000000000 R08: 0000000000000060 R09: 00005618a943af60
> [   12.729361] R10: 0000000000000038 R11: 0000000000000246 R12: 000056187aea098b
> [   12.731101] R13: 0000000000040000 R14: 00005618a9439ac0 R15: 0000000000000000
> [   12.732814]  </TASK>

Below is a quick fix, I'll revisit module - kmemleak interaction in v6


diff --git a/kernel/module/debug_kmemleak.c b/kernel/module/debug_kmemleak.c
index b4cc03842d70..df873dad049d 100644
--- a/kernel/module/debug_kmemleak.c
+++ b/kernel/module/debug_kmemleak.c
@@ -14,7 +14,8 @@ void kmemleak_load_module(const struct module *mod,
 {
 	/* only scan writable, non-executable sections */
 	for_each_mod_mem_type(type) {
-		if (type != MOD_DATA && type != MOD_INIT_DATA)
+		if (type != MOD_DATA && type != MOD_INIT_DATA &&
+		    !mod->mem[type].is_rox)
 			kmemleak_no_scan(mod->mem[type].base);
 	}
 }

-- 
Sincerely yours,
Mike.


Return-Path: <linuxppc-dev+bounces-2851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC3D9BC166
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 00:27:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xj71Q6fszz2xdg;
	Tue,  5 Nov 2024 10:27:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730762874;
	cv=none; b=EAOeWb+iCtpVZnMS0BjKq2W+wAgQyVsFPYeUS/vPzHfB0UDmlSZn3SBXJKKFAUdUmyEpIFCDp7hq6xgm1WbqqdRnzd+cNUhpMsKFibrE2JHzsufwsZnXLJXvfmTTJesnXnffC1T1O2+dK9lHeg+h077Z8pcQcGNefajire49JoALTu6yyJF5qn1FJu+OIxwFilq0/kiqtIqdH+d6iEcnq2zufEkUv7Pxm48dMkbauUuSJV9FFgpQz5U/RG263y+HG2nTOA666S6F06Y9kyMGY/2tF53dmUa2oMOxPxMdxF9VXVHhIn8Y6tk8NM8k51DIjODCk2/t2w739YajLI26rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730762874; c=relaxed/relaxed;
	bh=Q2NDL0EIuphmCCwbl0Vy6MrgKt/ZIc9Yf0NK3jfYrbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGzlHb3TjagYEq2u8PV9Uo989J+aJEQTetboXkkaRwHj36gC7ph4oQVpPckszgNd6i8hYgm10CUIjYXljffX1bJ3EBmHLPueQDptQQitZ/dD5TZ7lFuo5DF4aoMpzJ1wAiwObRxAkozLuaQ9uHms9blg/I7s6P1+JpOuO3YekV/4m6poLcnp4bLRTH2JixfZDfL04kHkjsKRuFih9pRyBD6kpvuxVCtwbB+/6XID9nnTfj+mzoT5X/y5DiiFIYTvePT78+5lK1MXKefM5ZnmzPFiLYadofml2DvkCr6ItGXXszFG2bGEEyNJ+Chj0vOD6LIMHS8GxnRE2szBcBvPyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uD6aQVKZ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uD6aQVKZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xj71M3t0Bz2xYs
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 10:27:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8521EA41B3D;
	Mon,  4 Nov 2024 23:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3A7C4CECE;
	Mon,  4 Nov 2024 23:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730762866;
	bh=G7tF/ZaqXBtDJLMTb97Oc+SktZk//Kx3oRVjwm2Gkec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uD6aQVKZ8xYi+PTTwYupZ6PGdQoZjGxor3CJ6T/KZlWjFxurKitUGg4OsLqeVl22R
	 oTMAQXmWqXP0EO6JaBIYZ9VEqoL35XGUitRTwgi+bJtDhjSL6UuAIcLW7XMfz2tbvE
	 x3MFVpG1yHfJRXfsS6NaRprs6A1rIqEf/OZ8jX2sy+DwUFdsMetTULRZ3iOQoxlOsn
	 5JoGBx6K0BrtfF9Z0+hxFGtNMWymLR+Dppngi0NxeJnTpYgOWeDN7FHowhaRXk3khA
	 u6nha7LupF4lzkb6ryYEoHDIxLmpv0DY+XiF9diWn7xWUzJjMMZ/7hbbF3UF0ISQXS
	 B++nhrf0RE3MQ==
Date: Mon, 4 Nov 2024 16:27:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
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
	Suren Baghdasaryan <surenb@google.com>,
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
Subject: Re: [PATCH v7 6/8] x86/module: prepare module loading for ROX
 allocations of text
Message-ID: <20241104232741.GA3843610@thelio-3990X>
References: <20241023162711.2579610-1-rppt@kernel.org>
 <20241023162711.2579610-7-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023162711.2579610-7-rppt@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Mike,

On Wed, Oct 23, 2024 at 07:27:09PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> When module text memory will be allocated with ROX permissions, the
> memory at the actual address where the module will live will contain
> invalid instructions and there will be a writable copy that contains the
> actual module code.
> 
> Update relocations and alternatives patching to deal with it.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: kdevops <kdevops@lists.linux.dev>

Hopefully the last time you have to hear from me, as I am only
experiencing issues with only one of my test machines at this point and
it is my only machine that supports IBT, so it seems to point to
something specific with the IBT part of the FineIBT support. I notice
either a boot hang or an almost immediate reboot (triple fault?). I
guess this is how I missed reporting this earlier, as my machine was
falling back to the default distribution kernel after the restart and I
did not notice I was not actually testing a -next kernel.

Checking out the version of this change that is in next-20241104, commit
7ca6ed09db62 ("x86/module: prepare module loading for ROX allocations of
text"), it boots with either 'cfi=off' or 'cfi=kcfi' but it exhibits the
issues noted above with 'cfi=fineibt'. At the immediate parent, commit
b575d981092f ("arch: introduce set_direct_map_valid_noflush()"), all
three combinations boot fine.

  $ uname -r; tr ' ' '\n' </proc/cmdline | grep cfi=

  6.12.0-rc5-debug-00214-g7ca6ed09db62
  cfi=kcfi

  6.12.0-rc5-debug-00214-g7ca6ed09db62
  cfi=off

  6.12.0-rc5-debug-00213-gb575d981092f
  cfi=fineibt

  6.12.0-rc5-debug-00213-gb575d981092f
  cfi=kcfi

  6.12.0-rc5-debug-00213-gb575d981092f
  cfi=off

I do not think this machine has an accessible serial port and I do not
think IBT virtualization is supported via either KVM or TCG in QEMU, so
I am not sure how to get more information about what is going on here. I
wanted to try reverting these changes on top of next-20241104 but there
was a non-trivial conflict in mm/execmem.c due to some changes on top,
so I just tested in the mm history.

If there is any other information I can provide or patches I can test, I
am more than happy to do so.

Cheers,
Nathan


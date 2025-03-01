Return-Path: <linuxppc-dev+bounces-6587-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37224A4A977
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Mar 2025 08:24:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4c5t6Kynz3bsP;
	Sat,  1 Mar 2025 18:24:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740813874;
	cv=none; b=VB7vpEnZguUaQqv3wSmf96QlLdMHP+0SLVRxFW/0StnmO7EuZJCFhRMNFR8h7D15TrS4H7R+Xs/8bqeH7gvVa5fzn60s9U3NoZggmC3q2qfcAUahNl4q2O6rL0o2/iWEwrABwUdYSWczET6rHj7Q6uILEMNCkqSqG7LijArStYRGRONLWwQglqjVEo+zZWBypJvF7hdQhq17kMkbN1UhmmQ044txcHG3fEjlpYQh3yFPjLEZUDa96bf2mZlnhM6voAK66SQAWFjGOWkylpXQEdA7CiyVtcETM/VeNzZHhxvZKYUlwNT3tveNyFGUSziFuSBmTdFZaoN4T71sG7qrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740813874; c=relaxed/relaxed;
	bh=T6rxFlo/hPCWLtCLwR3UaE+JW7XJ8IVSfcU3QpwR0Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8+W89C76ZUt6Kt1fs31Fgo9pyYzVVLOLkm3aLAISoTkqNVHJ8L8Z7gX1Zph2cdEZo24595m/kcDFgOvoF1/Yt09llhjAULJEJJBPzqXRVVvl9AjwHMsppPtZlVk2XqhYhk8NEIcOUvvh88udhX+DpiLfmMwFIEcGJPZ3EWa/6iRUxRB4c7FTN8Ii0oaTJ4kotCjs0hlxhXwYUmelduPuhOYqGZSgqKKl6umdFGeTs0IKcYM/MLBCZdx9aszYwPZTzrPCh3cP2uIET70geyee4N5ZyIZCCCcyr//9hl2CJ+gk3aZY79mt4ZCbh9oJBDDlS+zW7OpaAdoVVk8tbrkqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gtscTzal; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gtscTzal;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4c5s6Gwmz30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 18:24:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 091475C1FDF;
	Sat,  1 Mar 2025 07:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800D1C4CEDD;
	Sat,  1 Mar 2025 07:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740813870;
	bh=zNyC5lhRK0Jp4F93R1ijsSaURdoFR2R28yW7mia17cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtscTzalpXI+EBlbvhmEfLi9LdExvWsiMbsCojuFb6z7D6TJ+eIyI5Zu0dNVt1+Rt
	 R7KC6887+sVZtgnQ19+IkfSlJqXOab6/YNi9aZBAtp/VgQU/JqRJpIH8eBc4GGjByG
	 /iEET/+yluuuSKQHZY8L55Rx9HismpEadrVB6zyppH+G3FGWR/3bh3ot8dW5rcHNI7
	 NKKycvvnkEsnUXv1eFIzBBP8cwd+jkC4/L6TStK9cq+p4BvnEfW2RzlrWF5UZglu5h
	 /IAlH97YxPUeMyrnxQe6BmmTiig5TOwLHznM4yMtuGGFo8JCLj5r1JCg4T+JRGSA6x
	 kS+2S3GSKmFcQ==
Date: Sat, 1 Mar 2025 09:23:51 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, Junaid Shahid <junaids@google.com>
Subject: Re: [PATCH RFC v2 02/29] x86: Create
 CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
Message-ID: <Z8K2B3WJoICVbDj3@kernel.org>
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
 <20250110-asi-rfc-v2-v2-2-8419288bc805@google.com>
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
In-Reply-To: <20250110-asi-rfc-v2-v2-2-8419288bc805@google.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Brendan,

On Fri, Jan 10, 2025 at 06:40:28PM +0000, Brendan Jackman wrote:
> Currently a nop config. Keeping as a separate commit for easy review of
> the boring bits. Later commits will use and enable this new config.
> 
> This config is only added for non-UML x86_64 as other architectures do
> not yet have pending implementations. It also has somewhat artificial
> dependencies on !PARAVIRT and !KASAN which are explained in the Kconfig
> file.
> 
> Co-developed-by: Junaid Shahid <junaids@google.com>
> Signed-off-by: Junaid Shahid <junaids@google.com>
> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> ---
>  arch/alpha/include/asm/Kbuild      |  1 +
>  arch/arc/include/asm/Kbuild        |  1 +
>  arch/arm/include/asm/Kbuild        |  1 +
>  arch/arm64/include/asm/Kbuild      |  1 +
>  arch/csky/include/asm/Kbuild       |  1 +
>  arch/hexagon/include/asm/Kbuild    |  1 +
>  arch/loongarch/include/asm/Kbuild  |  3 +++
>  arch/m68k/include/asm/Kbuild       |  1 +
>  arch/microblaze/include/asm/Kbuild |  1 +
>  arch/mips/include/asm/Kbuild       |  1 +
>  arch/nios2/include/asm/Kbuild      |  1 +
>  arch/openrisc/include/asm/Kbuild   |  1 +
>  arch/parisc/include/asm/Kbuild     |  1 +
>  arch/powerpc/include/asm/Kbuild    |  1 +
>  arch/riscv/include/asm/Kbuild      |  1 +
>  arch/s390/include/asm/Kbuild       |  1 +
>  arch/sh/include/asm/Kbuild         |  1 +
>  arch/sparc/include/asm/Kbuild      |  1 +
>  arch/um/include/asm/Kbuild         |  2 +-
>  arch/x86/Kconfig                   | 14 ++++++++++++++
>  arch/xtensa/include/asm/Kbuild     |  1 +
>  include/asm-generic/asi.h          |  5 +++++
>  22 files changed, 41 insertions(+), 1 deletion(-)

I don't think this all is needed. You can put asi.h with stubs used outside
of arch/x86 in include/linux and save you the hassle of updating every
architecture.
 
> diff --git a/arch/sparc/include/asm/Kbuild b/arch/sparc/include/asm/Kbuild
> index 43b0ae4c2c2112d4d4d3cb3c60e787b175172dea..cb9062c9be17fe276cc92d2ac99d8b165f6297bf 100644
> --- a/arch/sparc/include/asm/Kbuild
> +++ b/arch/sparc/include/asm/Kbuild
> @@ -4,3 +4,4 @@ generated-y += syscall_table_64.h
>  generic-y += agp.h
>  generic-y += kvm_para.h
>  generic-y += mcs_spinlock.h
> +generic-y += asi.h

sparc already has include/asm/asi.h, this will break the build

> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 7b9a7e8f39acc8e9aeb7d4213e87d71047865f5c..5a50582eb210e9d1309856a737d32b76fa1bfc85 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2519,6 +2519,20 @@ config MITIGATION_PAGE_TABLE_ISOLATION
>  
>  	  See Documentation/arch/x86/pti.rst for more details.
>  
> +config MITIGATION_ADDRESS_SPACE_ISOLATION
> +	bool "Allow code to run with a reduced kernel address space"
> +	default n
> +	depends on X86_64 && !PARAVIRT && !UML
> +	help
> +	  This feature provides the ability to run some kernel code
> +	  with a reduced kernel address space. This can be used to
> +	  mitigate some speculative execution attacks.
> +
> +	  The !PARAVIRT dependency is only because of lack of testing; in theory
> +	  the code is written to work under paravirtualization. In practice
> +	  there are likely to be unhandled cases, in particular concerning TLB
> +	  flushes.
> +

If you expect other architectures might implement ASI the config would better
fit into init/Kconfig or mm/Kconfig and in arch/x86/Kconfig will define
ARCH_HAS_MITIGATION_ADDRESS_SPACE_ISOLATION.

>  config MITIGATION_RETPOLINE
>  	bool "Avoid speculative indirect branches in kernel"
>  	select OBJTOOL if HAVE_OBJTOOL
> diff --git a/arch/xtensa/include/asm/Kbuild b/arch/xtensa/include/asm/Kbuild
> index fa07c686cbcc2153776a478ac4093846f01eddab..07cea6902f98053be244d026ed594fe7246755a6 100644
> --- a/arch/xtensa/include/asm/Kbuild
> +++ b/arch/xtensa/include/asm/Kbuild
> @@ -8,3 +8,4 @@ generic-y += parport.h
>  generic-y += qrwlock.h
>  generic-y += qspinlock.h
>  generic-y += user.h
> +generic-y += asi.h
> diff --git a/include/asm-generic/asi.h b/include/asm-generic/asi.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..c4d9a5ff860a96428422a15000c622aeecc2d664
> --- /dev/null
> +++ b/include/asm-generic/asi.h
> @@ -0,0 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_GENERIC_ASI_H
> +#define __ASM_GENERIC_ASI_H
> +
> +#endif

IMHO it should be include/linux/asi.h, with something like

#infdef __LINUX_ASI_H
#define __LINUX_ASI_H

#ifdef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION

#include <asm/asi.h>

#else /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */

/* stubs for functions used outside arch/ */

#endif /* CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */

#endif /* __LINUX_ASI_H */

-- 
Sincerely yours,
Mike.


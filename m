Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFFF8ABB23
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 12:54:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X3eyeiLy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VM7gW6mVVz3dMW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 20:54:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X3eyeiLy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VM7fn52SVz3cQx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 20:53:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C61C0CE19A9;
	Sat, 20 Apr 2024 10:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F744C072AA;
	Sat, 20 Apr 2024 10:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713610427;
	bh=SM7VfRahGBLcoMQTiuF9XwON0oAIQm3UPvX2eiqyDXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3eyeiLylPAUkLSbyyrlGHXzvYV/bgYpLPhV7vw8xijwr2D1MExbuRdRactesAT8X
	 zdt7h71F5DqBQu/eRbhv/5Y0Rre5yGM+3/QnKDXleUxYNRTZmWf1Vo3WU+1+o9lafL
	 JRP9zqL5lB14IFxVzQv/2Y2x11fPGHO1UTIDooMmj7MCyEzwQSZ7FSoL/8Q352iA+B
	 xJtavt8SFXQQ13eBr6UXoSA7CP3oDA+2zBywG990wKdhsiRvE/zNe3PUQwDEQ+0Y6e
	 BUuBnLZ3CWf9tTcjXso+bnm9SeKBHDu3KkkjgF+H+J+dCs6K3ICndd93HsxM2BWoMW
	 e8kLY5pax56uw==
Date: Sat, 20 Apr 2024 13:52:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v4 14/15] kprobes: remove dependency on CONFIG_MODULES
Message-ID: <ZiOea81saMutayxt@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-15-rppt@kernel.org>
 <20240418061615.5fad23b954bf317c029acc4d@gmail.com>
 <ZiKSffcTiP2c6fbs@kernel.org>
 <321def3e-8bf1-4920-92dd-037b20f1272d@csgroup.eu>
 <ZiNv0jY7Ebw75iQl@kernel.org>
 <20240420181500.07b39c77f1ca086e8a5161b4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240420181500.07b39c77f1ca086e8a5161b4@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Nadav Amit <nadav.amit@gmail.com>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, "bpf@vger.kerne
 l.org" <bpf@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Puranjay Mohan <puranjay12@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 20, 2024 at 06:15:00PM +0900, Masami Hiramatsu wrote:
> On Sat, 20 Apr 2024 10:33:38 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > On Fri, Apr 19, 2024 at 03:59:40PM +0000, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 19/04/2024 à 17:49, Mike Rapoport a écrit :
> > > > Hi Masami,
> > > > 
> > > > On Thu, Apr 18, 2024 at 06:16:15AM +0900, Masami Hiramatsu wrote:
> > > >> Hi Mike,
> > > >>
> > > >> On Thu, 11 Apr 2024 19:00:50 +0300
> > > >> Mike Rapoport <rppt@kernel.org> wrote:
> > > >>
> > > >>> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > > >>>
> > > >>> kprobes depended on CONFIG_MODULES because it has to allocate memory for
> > > >>> code.
> > > >>>
> > > >>> Since code allocations are now implemented with execmem, kprobes can be
> > > >>> enabled in non-modular kernels.
> > > >>>
> > > >>> Add #ifdef CONFIG_MODULE guards for the code dealing with kprobes inside
> > > >>> modules, make CONFIG_KPROBES select CONFIG_EXECMEM and drop the
> > > >>> dependency of CONFIG_KPROBES on CONFIG_MODULES.
> > > >>
> > > >> Thanks for this work, but this conflicts with the latest fix in v6.9-rc4.
> > > >> Also, can you use IS_ENABLED(CONFIG_MODULES) instead of #ifdefs in
> > > >> function body? We have enough dummy functions for that, so it should
> > > >> not make a problem.
> > > > 
> > > > The code in check_kprobe_address_safe() that gets the module and checks for
> > > > __init functions does not compile with IS_ENABLED(CONFIG_MODULES).
> > > > I can pull it out to a helper or leave #ifdef in the function body,
> > > > whichever you prefer.
> > > 
> > > As far as I can see, the only problem is MODULE_STATE_COMING.
> > > Can we move 'enum module_state' out of #ifdef CONFIG_MODULES in module.h  ?
> > 
> > There's dereference of 'struct module' there:
> >  
> > 		(*probed_mod)->state != MODULE_STATE_COMING) {
> > 			...
> > 		}
> > 
> > so moving out 'enum module_state' won't be enough.
> 
> Hmm, this part should be inline functions like;
> 
> #ifdef CONFIG_MODULES
> static inline bool module_is_coming(struct module *mod)
> {
> 	return mod->state == MODULE_STATE_COMING;
> }
> #else
> #define module_is_coming(mod) (false)

I'd prefer

static inline module_is_coming(struct module *mod)
{
	return false;
}

> #endif
>
> Then we don't need the enum.
> Thank you,
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

-- 
Sincerely yours,
Mike.

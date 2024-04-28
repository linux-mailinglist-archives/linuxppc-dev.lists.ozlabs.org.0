Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC8A8B4A33
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2024 08:57:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XTZs9sEm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VRy222lq9z3cSy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2024 16:57:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XTZs9sEm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VRy1L5zMSz2yGk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2024 16:56:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C1EA5CE01BD;
	Sun, 28 Apr 2024 06:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702DBC113CC;
	Sun, 28 Apr 2024 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714287393;
	bh=r0oXOuLVQhCBCby5vRLJpkXcTQDGNz/eiiiW5fCcIdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XTZs9sEmm6/FaMuCbn9MAi43Dw5JaVHQ6Qo9kJKbgmQydz8t76xJqWvnLhWUbFuTg
	 eamwTb265HrxR6LlvTN02ea5enG0DyL5UUA409iL+FIlWuV8f+cOfIaceW/tsQa49F
	 k2+JGlrBeOuDTKAFlJG+dXckGS6E9qKllGv1lUiwvcOxOHi2PgVOFnk2K6JjT6mOLy
	 8wMBJhYy7rqcZ88dgAjki/503FzqraXQOZ8LtGXr77oJlvx8mQlCJ0bpcLxvSbj8II
	 FNv6UFgUz6gnk7tZPPzx3XToNx6Luyxbilf/EWAJ9azbxmvqxQI0iy3aMf/86QxAUL
	 09CFFAwUkdXQQ==
Date: Sun, 28 Apr 2024 09:55:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v6 08/16] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <Zi3yxk_7rMEPp0lT@kernel.org>
References: <20240426082854.7355-1-rppt@kernel.org>
 <20240426082854.7355-9-rppt@kernel.org>
 <CAPhsuW52MYy4Md5O=7XVGvkw395-LB+BiSadxoDdw8CrLw5t7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW52MYy4Md5O=7XVGvkw395-LB+BiSadxoDdw8CrLw5t7A@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linu
 x.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 26, 2024 at 12:01:34PM -0700, Song Liu wrote:
> On Fri, Apr 26, 2024 at 1:30 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >
> > Extend execmem parameters to accommodate more complex overrides of
> > module_alloc() by architectures.
> >
> > This includes specification of a fallback range required by arm, arm64
> > and powerpc, EXECMEM_MODULE_DATA type required by powerpc, support for
> > allocation of KASAN shadow required by s390 and x86 and support for
> > late initialization of execmem required by arm64.
> >
> > The core implementation of execmem_alloc() takes care of suppressing
> > warnings when the initial allocation fails but there is a fallback range
> > defined.
> >
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > Acked-by: Will Deacon <will@kernel.org>
> 
> nit: We should probably move the logic for ARCH_WANTS_EXECMEM_LATE
> to a separate patch.

This would require to split arm64 and I prefer to keep all these changes
together. 

> Otherwise,
> 
> Acked-by: Song Liu <song@kernel.org>
 
Thanks!

-- 
Sincerely yours,
Mike.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6675C72EEDB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 00:08:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HyA2VS9k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgjPV2S56z30gw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 08:08:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HyA2VS9k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgLDK6NS2z2yTN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 17:44:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5069B6132D;
	Tue, 13 Jun 2023 07:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E078FC433D2;
	Tue, 13 Jun 2023 07:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686642270;
	bh=ez0I+RKRhMdZt82NML91fPb7fzRC4/NkCFA3IdK3cEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyA2VS9kwVTQsYOWOuof1Z4qJ92ct0+rpQ0B5SIAzOL2Mz6wp6NoYwA7DcLYOqzj9
	 Q8Z9RGOQt5lsRA8Nc33tC8G7SiwN9ipBSdD03bBdhpX4MycI3Vh7vOT7ypJVtsouWv
	 8Bsg5dlRSFLhnsq+PWCSJc5VolYLva+SeDgrT92N096TEl0/uLmsJvVPLGz9OK3/dz
	 OYm6tEkeVT/cDyaIgk5UyxE5b/W7hyDcldGwNesOYI9EZOqwD7xGIveZKNt/lp9izm
	 uoBjmwxoGZjGvj7XWF9lQv7iNjjhyG9sIxFni/WcE8h+xW9r48P7ifrawWGz2rEEWN
	 FKciDs53eQHeQ==
Date: Tue, 13 Jun 2023 10:43:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v9 01/42] mm: Rename arch pte_mkwrite()'s to
 pte_mkwrite_novma()
Message-ID: <20230613074347.GR52412@kernel.org>
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
 <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
X-Mailman-Approved-At: Wed, 14 Jun 2023 08:08:02 +1000
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
Cc: kcc@google.com, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, david@redhat.com, eranian@google.com, Oleg Nesterov <oleg@redhat.com>, linux-mm@kvack.org, linux-csky@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, dethoma@microsoft.com, Linus Torvalds <torvalds@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Eugene Syromiatnikov <esyr@redhat.com>, jamorris@linux.microsoft.com, szabolcs.nagy@arm.com, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, "H . J . Lu" <hjl.tools@gmail.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, linux-alp
 ha@vger.kernel.org, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, broonie@kernel.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, debug@rivosinc.com, Florian Weimer <fweimer@redhat.com>, Michal Simek <monstr@monstr.eu>, John Allen <john.allen@amd.com>, linux-parisc@vger.kernel.org, Weijiang Yang <weijiang.yang@intel.com>, linux-api@vger.kernel.org, christina.schimpe@intel.com, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Cyrill Gorcunov <gorcunov@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org, Andrew.Cooper3@citrix.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 05:10:27PM -0700, Rick Edgecombe wrote:
> The x86 Shadow stack feature includes a new type of memory called shadow
> stack. This shadow stack memory has some unusual properties, which requires
> some core mm changes to function properly.
> 
> One of these unusual properties is that shadow stack memory is writable,
> but only in limited ways. These limits are applied via a specific PTE
> bit combination. Nevertheless, the memory is writable, and core mm code
> will need to apply the writable permissions in the typical paths that
> call pte_mkwrite(). Future patches will make pte_mkwrite() take a VMA, so
> that the x86 implementation of it can know whether to create regular
> writable memory or shadow stack memory.

Nit:                            ^ mapping?

> But there are a couple of challenges to this. Modifying the signatures of
> each arch pte_mkwrite() implementation would be error prone because some
> are generated with macros and would need to be re-implemented. Also, some
> pte_mkwrite() callers operate on kernel memory without a VMA.
> 
> So this can be done in a three step process. First pte_mkwrite() can be
> renamed to pte_mkwrite_novma() in each arch, with a generic pte_mkwrite()
> added that just calls pte_mkwrite_novma(). Next callers without a VMA can
> be moved to pte_mkwrite_novma(). And lastly, pte_mkwrite() and all callers
> can be changed to take/pass a VMA.
> 
> Start the process by renaming pte_mkwrite() to pte_mkwrite_novma() and
> adding the pte_mkwrite() wrapper in linux/pgtable.h. Apply the same
> pattern for pmd_mkwrite(). Since not all archs have a pmd_mkwrite_novma(),
> create a new arch config HAS_HUGE_PAGE that can be used to tell if
> pmd_mkwrite() should be defined. Otherwise in the !HAS_HUGE_PAGE cases the
> compiler would not be able to find pmd_mkwrite_novma().
> 
> No functional change.
> 
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: openrisc@lists.librecores.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
> Suggested-by: Linus Torvalds <torvalds@linuxfoundation.org>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Link: https://lore.kernel.org/lkml/CAHk-=wiZjSu7c9sFYZb3q04108stgHff2wfbokGCCgW7riz+8Q@mail.gmail.com/

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

Return-Path: <linuxppc-dev+bounces-10252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F36B057E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 12:33:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhFsD2FLTz3c6n;
	Tue, 15 Jul 2025 20:33:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752575616;
	cv=none; b=KTbzlgJB2/W1alnKgvH6dvtC/Gz2uC/FrfKZK43RytQgBp1veC7hQcBBwkGG3tMtk46Nzgig1O8Dv1anshi3L2mgblFJclcYc7/rjbGcutXkw6DFfXa1JL/Htgpam9+9UNQee6JCbsP4WzcVhENn7QcgKS7X5x+DrOgTALKhzqm1nCa7zGJzgWPcg6vr+ILuJlp/IV1MEb7xmnMGucavqjolXSAAt/35gCghloiGgEByr9R/UNpODY8DjXeUPCs9JRv+D0jaVxzTA6C4UVC7yiBA6Kok6AGFKWDfkZpfBQW4ZVPWx2ef9gHV61wkZU/4GlD2QB9XH7FBrrDoevPl/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752575616; c=relaxed/relaxed;
	bh=I9wyxQu3TOUIK70KpBN3XnOhTAISFo58eD2fsdfJONo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2BIeMEM/IToY0USge6Icy9aOnWVERW1KFAkyTVgku3NoNdA5NYuIfjiEFgwjy4sfsNaLd2ewqwz19QrDvjFnMxyTPYKYUY3jPwqlC0sVCTA2kj7d2RF65SY2nHoOKZ1L5mMuzEvw6C9fiHOdbt92S9xGHf5aESlzDJype4qnOCz6DuVz0nD196Qux/vAxk5CDuZXopiQvams2rw6LREPF2+n+vM2wac8ORiDy8cfHSKTPnNjtGjzm3wx74XliE+tephihN9vuGax6fKsulIUWXkUNSguoI5p+hM4vBdG03mGP8ndyAYy0hnPK+6cVKjIcFxcxzF9kdq9t1o/zoiag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhFsC0yHXz3c6Z
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jul 2025 20:33:33 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8276112FC;
	Tue, 15 Jul 2025 03:32:52 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C689E3F694;
	Tue, 15 Jul 2025 03:32:52 -0700 (PDT)
Date: Tue, 15 Jul 2025 11:32:47 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andreas Larsson <andreas@gaisler.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chris Zankel <chris@zankel.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 00/23] binfmt_elf,arch/*: Use elf.h for coredump note
 names
Message-ID: <aHYuT0SxX65tAEp3@e133380.arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
 <175255782864.3413694.2008555655056311560.b4-ty@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175255782864.3413694.2008555655056311560.b4-ty@kernel.org>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jul 14, 2025 at 10:37:11PM -0700, Kees Cook wrote:
> On Tue, 01 Jul 2025 14:55:53 +0100, Dave Martin wrote:
> > This series aims to clean up an aspect of coredump generation:
> > 
> > ELF coredumps contain a set of notes describing the state of machine
> > registers and other information about the dumped process.
> > 
> > Notes are identified by a numeric identifier n_type and a "name"
> > string, although this terminology is somewhat misleading.  Officially,
> > the "name" of a note is really an "originator" or namespace identifier
> > that indicates how to interpret n_type [1], although in practice it is
> > often used more loosely.
> > 
> > [...]
> 
> Applied to for-next/execve, thanks!
> 
> [01/23] regset: Fix kerneldoc for struct regset_get() in user_regset
>         https://git.kernel.org/kees/c/6fd9e1aa0784

[...]

> [23/23] binfmt_elf: Warn on missing or suspicious regset note names
>         https://git.kernel.org/kees/c/a55128d392e8
> 
> Take care,
> 
> -- 
> Kees Cook

Thanks!

Assuming nobody screams about things going wrong in next, I'll plan to
water down the paranoid check in binfmt_elf.c:fill_thread_core_info().

Anyone copy-pasting a new arch after this is in mainline shouldn't fall
foul of this.

Cheers
---Dave


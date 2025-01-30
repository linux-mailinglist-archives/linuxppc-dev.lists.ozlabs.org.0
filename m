Return-Path: <linuxppc-dev+bounces-5708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB1A22C69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 12:22:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkGny5b3mz2yXY;
	Thu, 30 Jan 2025 22:22:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738236134;
	cv=none; b=f4PYOn4EwsuprCJ9jlhoASwzY8scX/s/ovXRfL2CLp1J2IqKFBx/96kk2ueAbsTKwrpm6WP8KKwW9R824Fuu1kOJP76aUL8/hVf87KzpaI/3an9HT4oY1iaIXok03HkVFLD+Qgj0kj9x5Sjr0yu0lxnHgv7KAFp+efiiWWvX1gFubGu0gDNQDwM7JzUmOeV0Ok4w5C485VwjOvPXmzh0cBS2apjUAP9goVc5Jgc/0hC4grv7LRZNfndsE/SN7UVwfNwXQWLM7AMxlsNj7WKCeFg3/wzRWMhW/xt0tse/3AcX7jrh22Lu/8sIWgqHB8q580Q53Jm1ds3QsYTVe8BRZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738236134; c=relaxed/relaxed;
	bh=XeG5xC4Uqvg0zt5NpFadOX7LyU4YfVnKOLdPT5CBpi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJXj6LFMFtrIHLcnkwWGyfpYOdq9LBk4h8HolDSAuMXZO6LZBikn+KpyNfCcXHlByMAcdEYFcXa3+nJ8KT8A/rajS/0er/SedJ4X8N3HMwpFVQ/ItBQdG3EYiAczKPnSOspefkAHbaADhVzdtlMMSiUzDqPjK15GmXAhbl7niRuk2aEHmfYWaVAxWSVPNKa1mYxun79RtwhPrZvGKGWHzB5798Xc3M4i+3ALUZuysKAaNWIhm+tslj0GTDhMFl1F7zpM1nE6wD00uxrQMJH7F1LnOGxZ5MMUC3/RxBOMC0wes6oK8dBJBbPX/zLVDUXhXl9yxSzSVp1mrGxX/nn0dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkGnx3hvpz2xyG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 22:22:12 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 2914072C97D;
	Thu, 30 Jan 2025 14:22:08 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id F28277CCB3A; Thu, 30 Jan 2025 13:22:07 +0200 (IST)
Date: Thu, 30 Jan 2025 13:22:07 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: linux-snps-arc@lists.infradead.org, Rich Felker <dalias@libc.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andreas Larsson <andreas@gaisler.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
	linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	strace-devel@lists.strace.io, linux-arch@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mike Frysinger <vapier@gentoo.org>,
	Davide Berardi <berardi.dav@gmail.com>,
	Renzo Davoli <renzo@cs.unibo.it>, linux-um@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stafford Horne <shorne@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Oleg Nesterov <oleg@redhat.com>, Dinh Nguyen <dinguyen@kernel.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Johannes Berg <johannes@sipsolutions.net>,
	Alexey Gladkov <legion@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 2/6] syscall.h: add syscall_set_arguments() and
 syscall_set_return_value()
Message-ID: <20250130112207.GA6617@strace.io>
References: <20250128091626.GB8601@strace.io>
 <yt9dwmecya4g.fsf@linux.ibm.com>
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
In-Reply-To: <yt9dwmecya4g.fsf@linux.ibm.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 30, 2025 at 09:33:03AM +0100, Sven Schnelle wrote:
> "Dmitry V. Levin" <ldv@strace.io> writes:
> 
> > These functions are going to be needed on all HAVE_ARCH_TRACEHOOK
> > architectures to implement PTRACE_SET_SYSCALL_INFO API.
> >
> > This partially reverts commit 7962c2eddbfe ("arch: remove unused
> > function syscall_set_arguments()") by reusing some of old
> > syscall_set_arguments() implementations.
> >
> > Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/arc/include/asm/syscall.h        | 14 +++++++++++
> >  arch/arm/include/asm/syscall.h        | 13 ++++++++++
> >  arch/arm64/include/asm/syscall.h      | 13 ++++++++++
> >  arch/csky/include/asm/syscall.h       | 13 ++++++++++
> >  arch/hexagon/include/asm/syscall.h    | 14 +++++++++++
> >  arch/loongarch/include/asm/syscall.h  |  8 ++++++
> >  arch/mips/include/asm/syscall.h       | 32 ++++++++++++++++++++++++
> >  arch/nios2/include/asm/syscall.h      | 11 ++++++++
> >  arch/openrisc/include/asm/syscall.h   |  7 ++++++
> >  arch/parisc/include/asm/syscall.h     | 12 +++++++++
> >  arch/powerpc/include/asm/syscall.h    | 10 ++++++++
> >  arch/riscv/include/asm/syscall.h      |  9 +++++++
> >  arch/s390/include/asm/syscall.h       | 12 +++++++++
> >  arch/sh/include/asm/syscall_32.h      | 12 +++++++++
> >  arch/sparc/include/asm/syscall.h      | 10 ++++++++
> >  arch/um/include/asm/syscall-generic.h | 14 +++++++++++
> >  arch/x86/include/asm/syscall.h        | 36 +++++++++++++++++++++++++++
> >  arch/xtensa/include/asm/syscall.h     | 11 ++++++++
> >  include/asm-generic/syscall.h         | 16 ++++++++++++
> >  19 files changed, 267 insertions(+)
> >
> > diff --git a/arch/s390/include/asm/syscall.h b/arch/s390/include/asm/syscall.h
> > index 27e3d804b311..b3dd883699e7 100644
> > --- a/arch/s390/include/asm/syscall.h
> > +++ b/arch/s390/include/asm/syscall.h
> > @@ -78,6 +78,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
> >  	args[0] = regs->orig_gpr2 & mask;
> >  }
> >  
> > +static inline void syscall_set_arguments(struct task_struct *task,
> > +					 struct pt_regs *regs,
> > +					 const unsigned long *args)
> > +{
> > +	unsigned int n = 6;
> > +
> > +	while (n-- > 0)
> > +		if (n > 0)
> > +			regs->gprs[2 + n] = args[n];
> > +	regs->orig_gpr2 = args[0];
> > +}
> 
> Could that be changed to something like:
> 
> for (int n = 1; n < 6; n++)
>         regs->gprs[2 + n] = args[n];
> regs->orig_gpr2 = args[0];
> 
> I think this is way easier to parse.

I don't mind changing syscall_set_arguments() this way, but it just
mirrors syscall_get_arguments(), so I think it would be better if these
two functions were written in the same style.  Would you like to change
syscall_get_arguments() as well?


-- 
ldv


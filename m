Return-Path: <linuxppc-dev+bounces-5641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C19CA20E76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 17:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj9d75Ctxz2yxP;
	Wed, 29 Jan 2025 03:25:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738081547;
	cv=none; b=Zmrg0koD800ahDK0t691Du8CdUr4utafuEpx0pPWLoN8rkFatt5OhUQlt5a9InS5NdFZ1Ycm5fAUY57JoQBoQZfLE+H8H8YpV8TaENoXbY1rBUVtBlmvh20BHkbZ8Q4YdpJ1nMh216SJ+xGMdvmYL+iCkUe+9kXFI9E5eCUpPp16C33mX93VkYJFj3zysBbdPQFXJiFhBCsoldo7fEzAGw1UgmO4PJ8PhB4MfMh4lKgn/DgGygrJGlEzSsJjPmRO0MYiWY+aWhXLKgXhPbHRizICyp0SZg5SWyQ5bPEGkoB82rJ4IX31DUdwvWUm5jjFm3G5dNmXEteyXeCkI5K7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738081547; c=relaxed/relaxed;
	bh=Q+GzEo6xQjcCivH2uqqJkJdbnOBUjgfD/PowAlU4fmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEhePKhKlPvZfNLuCBvUtRJJkPFxZOnEX33hsdksV3HdGR+BF1cg0HBAH4kUIMczXKVwZ9hY7ZcYHxr7Mmzp0DE11jM/gWgomp69FDRDX6PtvCOHfM7htnKz0bdTdibsdvJRtGLxEByW8e4eQQKYRrukm0jkWPi2PmF3LWNgdmR4PVevx/zyya0plze7trAEcN1qb0rKD2EFnB9oSsDfDz6blcyraQYUtl5oyqAFbpo84nA+bXTrzAVjXSqdxlffu0tNaPuph5xSRE1BYirwPZGhdMQXiLqDsKKgO7CeB9JReylfVgGuzagCU5ICLkDrLMxsyGA8sOVOp8xTL08CsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj9d64v57z2yn2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 03:25:46 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 2308C72C8CC;
	Tue, 28 Jan 2025 19:25:45 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 0E2917CCB3A; Tue, 28 Jan 2025 18:25:45 +0200 (IST)
Date: Tue, 28 Jan 2025 18:25:44 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Oleg Nesterov <oleg@redhat.com>, linux-snps-arc@lists.infradead.org,
	Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
	linux-riscv@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Vineet Gupta <vgupta@kernel.org>,
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
	linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
	loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	Stafford Horne <shorne@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Johannes Berg <johannes@sipsolutions.net>,
	Alexey Gladkov <legion@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 3/6] syscall.h: introduce syscall_set_nr()
Message-ID: <20250128162544.GE11869@strace.io>
References: <20250128091636.GC8601@strace.io>
 <e76df471-1346-459a-9f24-fa053d7dcbe8@csgroup.eu>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e76df471-1346-459a-9f24-fa053d7dcbe8@csgroup.eu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 28, 2025 at 04:13:52PM +0100, Christophe Leroy wrote:
> Le 28/01/2025 à 10:16, Dmitry V. Levin a écrit :
> > Similar to syscall_set_arguments() that complements
> > syscall_get_arguments(), introduce syscall_set_nr()
> > that complements syscall_get_nr().
> > 
> > syscall_set_nr() is going to be needed along with
> > syscall_set_arguments() on all HAVE_ARCH_TRACEHOOK
> > architectures to implement PTRACE_SET_SYSCALL_INFO API.
> > 
> > Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >   arch/arc/include/asm/syscall.h        | 11 +++++++++++
> >   arch/arm/include/asm/syscall.h        | 24 ++++++++++++++++++++++++
> >   arch/arm64/include/asm/syscall.h      | 16 ++++++++++++++++
> >   arch/hexagon/include/asm/syscall.h    |  7 +++++++
> >   arch/loongarch/include/asm/syscall.h  |  7 +++++++
> >   arch/m68k/include/asm/syscall.h       |  7 +++++++
> >   arch/microblaze/include/asm/syscall.h |  7 +++++++
> >   arch/mips/include/asm/syscall.h       | 14 ++++++++++++++
> >   arch/nios2/include/asm/syscall.h      |  5 +++++
> >   arch/openrisc/include/asm/syscall.h   |  6 ++++++
> >   arch/parisc/include/asm/syscall.h     |  7 +++++++
> >   arch/powerpc/include/asm/syscall.h    | 10 ++++++++++
> >   arch/riscv/include/asm/syscall.h      |  7 +++++++
> >   arch/s390/include/asm/syscall.h       | 12 ++++++++++++
> >   arch/sh/include/asm/syscall_32.h      | 12 ++++++++++++
> >   arch/sparc/include/asm/syscall.h      | 12 ++++++++++++
> >   arch/um/include/asm/syscall-generic.h |  5 +++++
> >   arch/x86/include/asm/syscall.h        |  7 +++++++
> >   arch/xtensa/include/asm/syscall.h     |  7 +++++++
> >   include/asm-generic/syscall.h         | 14 ++++++++++++++
> >   20 files changed, 197 insertions(+)
> > 
> 
> > diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> > index 76020b66286b..712daa90e643 100644
> > --- a/arch/arm64/include/asm/syscall.h
> > +++ b/arch/arm64/include/asm/syscall.h
> > @@ -61,6 +61,22 @@ static inline void syscall_set_return_value(struct task_struct *task,
> >   	regs->regs[0] = val;
> >   }
> >   
> > +static inline void syscall_set_nr(struct task_struct *task,
> > +				  struct pt_regs *regs,
> > +				  int nr)
> > +{
> > +	regs->syscallno = nr;
> > +	if (nr == -1) {
> > +		/*
> > +		 * When the syscall number is set to -1, the syscall will be
> > +		 * skipped.  In this case the syscall return value has to be
> > +		 * set explicitly, otherwise the first syscall argument is
> > +		 * returned as the syscall return value.
> > +		 */
> > +		syscall_set_return_value(task, regs, -ENOSYS, 0);
> > +	}
> > +}
> > +
> >   #define SYSCALL_MAX_ARGS 6
> >   
> >   static inline void syscall_get_arguments(struct task_struct *task,
> 
> > diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> > index 521f279e6b33..7505dcfed247 100644
> > --- a/arch/powerpc/include/asm/syscall.h
> > +++ b/arch/powerpc/include/asm/syscall.h
> > @@ -39,6 +39,16 @@ static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
> >   		return -1;
> >   }
> >   
> > +static inline void syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr)
> > +{
> > +	/*
> > +	 * Unlike syscall_get_nr(), syscall_set_nr() can be called only when
> > +	 * the target task is stopped for tracing on entering syscall, so
> > +	 * there is no need to have the same check syscall_get_nr() has.
> > +	 */
> > +	regs->gpr[0] = nr;
> 
> Doesn't the same as for ARM64 apply here as well ?

I carefully checked all affected architectures and added that
syscall_set_return_value() call only where I think it's needed.

On powerpc it's not needed with the current implementation: their
do_seccomp() sets -ENOSYS before __secure_computing() invocation, and
their do_syscall_trace_enter() sets -ENOSYS in case of an invalid syscall
number.


-- 
ldv


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD1732151
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 23:06:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhvwr2L0Fz3bjw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 07:06:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhp495LWTz3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 02:42:33 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 35FGJsTl017085;
	Thu, 15 Jun 2023 11:19:54 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 35FGJqSI017082;
	Thu, 15 Jun 2023 11:19:52 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 15 Jun 2023 11:19:52 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 10/21] powerpc/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <20230615161952.GD19790@gate.crashing.org>
References: <20230612172805.681179-1-eric.devolder@oracle.com> <20230612172805.681179-11-eric.devolder@oracle.com> <87fs6tflfi.fsf@mail.lhotse>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fs6tflfi.fsf@mail.lhotse>
User-Agent: Mutt/1.4.2.3i
X-Mailman-Approved-At: Fri, 16 Jun 2023 05:50:10 +1000
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
Cc: linux-m68k@vger.kernel.org, chenhuacai@kernel.org, linux-ia64@vger.kernel.org, anshuman.khandual@arm.com, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, Eric DeVolder <eric.devolder@oracle.com>, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, arnd@arndb.de, bhe@redhat.com, deller@gmx.de, ysato@users.osdn.me, linux@armlinux.org.uk, ardb@kernel.org, 86@kernel.org, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, paul.walmsley@sifive.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, svens@linux.ibm.com, gor@linux.ibm.com, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, paulmck@kernel.org, konrad.wilk@oracle.com, frederic@kernel.org, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, rppt@kernel.org, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, palmer@dabbelt.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, juerg.haefliger@canonical.com, mhiramat@kernel.org, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 15, 2023 at 01:34:25PM +1000, Michael Ellerman wrote:
> Eric DeVolder <eric.devolder@oracle.com> writes:
> > -config KEXEC_FILE
> > -	bool "kexec file based system call"
> > -	select KEXEC_CORE
> > -	select HAVE_IMA_KEXEC if IMA
> > -	select KEXEC_ELF
> > -	depends on PPC64
> > -	depends on CRYPTO=y
> > -	depends on CRYPTO_SHA256=y
> ...
> > +
> > +config ARCH_HAS_KEXEC_FILE
> > +	def_bool PPC64 && CRYPTO && CRYPTO_SHA256
> 
> The =y's got lost here.
> 
> I think they were both meaningful, because both options are tristate. So
> this previously required them to be built-in (=y), whereas after your
> patch it will allow them to be modules.
> 
> I don't know for sure that those options need to be built-in, but that's
> what the code does now, so this patch shouldn't change it, at least
> without an explanation.

This patch shouldn't change it at all, period.  If you want to change it
(and that sounds like a good idea, if it is possible anyway), that
should be a separate patch.


Segher

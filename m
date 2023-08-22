Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B82783A85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 09:12:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dcW/Td18;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rG0JjH04;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVLBQ1vpDz3bbW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 17:11:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dcW/Td18;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rG0JjH04;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVKKm6lyMz2ym1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 16:33:16 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 01FC422C44;
	Tue, 22 Aug 2023 06:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1692685983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0LefrGrfWIlUUodSIRfdXfGvUMxOpn3Da/x1z7+TACM=;
	b=dcW/Td18f6Fki4csXaJVH2kX+joGxDMOht06LwZTOfNsgqpMfncIfcqoPyYT4pr6k4mnSU
	M0TGSwt1po685EhpFFg+MsGQqwUnObFIRiO2wfy913FH+/Lel6/Fb2dOKqsq92KJa+2uD1
	Bu3YIapaL9IWtKzXxWr75rikpNrC41E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692685983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0LefrGrfWIlUUodSIRfdXfGvUMxOpn3Da/x1z7+TACM=;
	b=rG0JjH04TqT5CksLvToAlLn8tIAFYWH057rgn75zDtNS/jv7ATjOlZlbjVPfguARFEVAuk
	XrENx1kzxGQ4t0Cg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 4B5DF2C143;
	Tue, 22 Aug 2023 06:32:58 +0000 (UTC)
Date: Tue, 22 Aug 2023 08:32:57 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v6 02/14] x86/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <20230822063257.GI8826@kitsune.suse.cz>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
 <20230712161545.87870-3-eric.devolder@oracle.com>
 <d8ddd4bd-fbc9-dbe9-f5c3-daf8d89aa46d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8ddd4bd-fbc9-dbe9-f5c3-daf8d89aa46d@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 22 Aug 2023 17:11:15 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, anshuman.khandual@arm.com, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, Eric DeVolder <eric.devolder@oracle.com>, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, arnd@arndb.de, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, ardb@kernel.org, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, palmer@dabbelt.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, svens@linux.ibm.com, gor@linux.ibm.com, aou@eecs.berkeley.edu, keescook@chromium.org, paulmck@kernel.org, konrad.wilk@oracle.com, frederic@kernel.org, xin3.li@intel.com,
  npiggin@gmail.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, rppt@kernel.org, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, juerg.haefliger@canonical.com, mhiramat@kernel.org, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Jul 13, 2023 at 07:13:57PM +0800, Leizhen (ThunderTown) wrote:
> 
> 
> On 2023/7/13 0:15, Eric DeVolder wrote:
> > The kexec and crash kernel options are provided in the common
> > kernel/Kconfig.kexec. Utilize the common options and provide
> > the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
> > equivalent set of KEXEC and CRASH options.
> > 
> > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > ---
> >  arch/x86/Kconfig | 92 ++++++++++--------------------------------------
> >  1 file changed, 19 insertions(+), 73 deletions(-)
> > 
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 7422db409770..9767a343f7c2 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -2040,88 +2040,34 @@ config EFI_RUNTIME_MAP
> >  
> >  source "kernel/Kconfig.hz"
> >  
> > -config KEXEC
> > -	bool "kexec system call"
> > -	select KEXEC_CORE
> > -	help
> > -	  kexec is a system call that implements the ability to shutdown your
> > -	  current kernel, and to start another kernel.  It is like a reboot
> > -	  but it is independent of the system firmware.   And like a reboot
> > -	  you can start any kernel with it, not just Linux.
> > -
> > -	  The name comes from the similarity to the exec system call.
> > -
> > -	  It is an ongoing process to be certain the hardware in a machine
> > -	  is properly shutdown, so do not be surprised if this code does not
> > -	  initially work for you.  As of this writing the exact hardware
> > -	  interface is strongly in flux, so no good recommendation can be
> > -	  made.
> > -
> > -config KEXEC_FILE
> > -	bool "kexec file based system call"
> > -	select KEXEC_CORE
> > -	select HAVE_IMA_KEXEC if IMA
> > -	depends on X86_64
> > -	depends on CRYPTO=y
> > -	depends on CRYPTO_SHA256=y
> > -	help
> > -	  This is new version of kexec system call. This system call is
> > -	  file based and takes file descriptors as system call argument
> > -	  for kernel and initramfs as opposed to list of segments as
> > -	  accepted by previous system call.
> > +config ARCH_SUPPORTS_KEXEC
> > +	def_bool y
> 
> In v5, Joel Fernandes seems to suggest you change it to the following form:

It's unfortunate that the suggestion did not make it to the mailinglist.

> In arch/Kconfig:
> +config ARCH_SUPPORTS_KEXEC
> +	bool
> 
> In arch/x86/Kconfig:
> config X86
> 	... ...
> +	select ARCH_SUPPORTS_KEXEC
> 
> In arch/arm64/Kconfig:
> config ARM64
> 	... ...
> +	select ARCH_SUPPORTS_KEXEC if PM_SLEEP_SMP

Which might work for this case

> 
> etc..
> 
> You can refer to ARCH_HAS_DEBUG_VIRTUAL.
> 
> >  
> > -config ARCH_HAS_KEXEC_PURGATORY
> > -	def_bool KEXEC_FILE
> > +config ARCH_SUPPORTS_KEXEC_FILE
> > +	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
> >  
> > -config KEXEC_SIG
> > -	bool "Verify kernel signature during kexec_file_load() syscall"
> > +config ARCH_SELECTS_KEXEC_FILE
> > +	def_bool y
> >  	depends on KEXEC_FILE
> > -	help
> > +	select HAVE_IMA_KEXEC if IMA

but not this case, at least not this trivially.

Than for consistency it looks better to keep as is.

Thanks

Michal

> >  
> > -	  This option makes the kexec_file_load() syscall check for a valid
> > -	  signature of the kernel image.  The image can still be loaded without
> > -	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
> > -	  there's a signature that we can check, then it must be valid.
> > +config ARCH_HAS_KEXEC_PURGATORY
> > +	def_bool KEXEC_FILE
> >  
> > -	  In addition to this option, you need to enable signature
> > -	  verification for the corresponding kernel image type being
> > -	  loaded in order for this to work.
> > +config ARCH_SUPPORTS_KEXEC_SIG
> > +	def_bool y
> >  
> > -config KEXEC_SIG_FORCE
> > -	bool "Require a valid signature in kexec_file_load() syscall"
> > -	depends on KEXEC_SIG
> > -	help
> > -	  This option makes kernel signature verification mandatory for
> > -	  the kexec_file_load() syscall.
> > +config ARCH_SUPPORTS_KEXEC_SIG_FORCE
> > +	def_bool y
> >  
> > -config KEXEC_BZIMAGE_VERIFY_SIG
> > -	bool "Enable bzImage signature verification support"
> > -	depends on KEXEC_SIG
> > -	depends on SIGNED_PE_FILE_VERIFICATION
> > -	select SYSTEM_TRUSTED_KEYRING
> > -	help
> > -	  Enable bzImage signature verification support.
> > +config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
> > +	def_bool y
> >  
> > -config CRASH_DUMP
> > -	bool "kernel crash dumps"
> > -	depends on X86_64 || (X86_32 && HIGHMEM)
> > -	help
> > -	  Generate crash dump after being started by kexec.
> > -	  This should be normally only set in special crash dump kernels
> > -	  which are loaded in the main kernel with kexec-tools into
> > -	  a specially reserved region and then later executed after
> > -	  a crash by kdump/kexec. The crash dump kernel must be compiled
> > -	  to a memory address not used by the main kernel or BIOS using
> > -	  PHYSICAL_START, or it must be built as a relocatable image
> > -	  (CONFIG_RELOCATABLE=y).
> > -	  For more details see Documentation/admin-guide/kdump/kdump.rst
> > +config ARCH_SUPPORTS_KEXEC_JUMP
> > +	def_bool y
> >  
> > -config KEXEC_JUMP
> > -	bool "kexec jump"
> > -	depends on KEXEC && HIBERNATION
> > -	help
> > -	  Jump between original kernel and kexeced kernel and invoke
> > -	  code in physical address mode via KEXEC
> > +config ARCH_SUPPORTS_CRASH_DUMP
> > +	def_bool X86_64 || (X86_32 && HIGHMEM)
> >  
> >  config PHYSICAL_START
> >  	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
> > 
> 
> -- 
> Regards,
>   Zhen Lei

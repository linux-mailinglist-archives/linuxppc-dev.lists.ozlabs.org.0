Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9642A3A401D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 12:21:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1cLr0r6Dz3c12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 20:21:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cT1NR7aC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=a/soMZBU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cT1NR7aC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=a/soMZBU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cT1NR7aC; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=a/soMZBU; 
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=cT1NR7aC; 
 dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=a/soMZBU; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1cL504Dvz2ysq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 20:20:28 +1000 (AEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 478D91FD6C;
 Fri, 11 Jun 2021 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623406825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxVK0K35pQZanZet6mzxQAOwPID5G7wB9PTtQWMWHKI=;
 b=cT1NR7aCEX3fBw33SzxKpP3CyxNUCV0oNJgoXp1gKAy4nP8ZtXYx01cSAYZ4fa7atfc1Z1
 HgFH3f91tTcHd4iGYOyG9vBeMCC0icU5VswCAcE/zASrDfgrtLHTkkQHdiQbbR5+Sr2lEm
 oJcxmosZduOD3QZ7dn/lJt8L3v8OMp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623406825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxVK0K35pQZanZet6mzxQAOwPID5G7wB9PTtQWMWHKI=;
 b=a/soMZBUQOwdKcdjA0tTGCK+9u0PwngUVJFaXLAD/tar4tLefv9Oy10juz55l9mbbdik48
 VqIitXUR+0hwZxDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2A3EE118DD;
 Fri, 11 Jun 2021 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623406825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxVK0K35pQZanZet6mzxQAOwPID5G7wB9PTtQWMWHKI=;
 b=cT1NR7aCEX3fBw33SzxKpP3CyxNUCV0oNJgoXp1gKAy4nP8ZtXYx01cSAYZ4fa7atfc1Z1
 HgFH3f91tTcHd4iGYOyG9vBeMCC0icU5VswCAcE/zASrDfgrtLHTkkQHdiQbbR5+Sr2lEm
 oJcxmosZduOD3QZ7dn/lJt8L3v8OMp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623406825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxVK0K35pQZanZet6mzxQAOwPID5G7wB9PTtQWMWHKI=;
 b=a/soMZBUQOwdKcdjA0tTGCK+9u0PwngUVJFaXLAD/tar4tLefv9Oy10juz55l9mbbdik48
 VqIitXUR+0hwZxDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Pt5JCek4w2DxcgAALh3uQQ
 (envelope-from <msuchanek@suse.de>); Fri, 11 Jun 2021 10:20:25 +0000
Date: Fri, 11 Jun 2021 12:20:23 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 2/2] powerpc/64: Option to use ELF V2 ABI for
 big-endian kernels
Message-ID: <20210611102023.GB8544@kitsune.suse.cz>
References: <20210611093959.821525-1-npiggin@gmail.com>
 <20210611093959.821525-3-npiggin@gmail.com>
 <20210611095819.GA8544@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210611095819.GA8544@kitsune.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 11, 2021 at 11:58:19AM +0200, Michal Suchánek wrote:
> On Fri, Jun 11, 2021 at 07:39:59PM +1000, Nicholas Piggin wrote:
> > Provide an option to build big-endian kernels using the ELFv2 ABI. This
> > works on GCC only so far, although it is rumored to work with clang
> > that's not been tested yet. A new module version check ensures the
> > module ELF ABI level matches the kernel build.
> > 
> > This can give big-endian kernels some useful advantages of the ELFv2 ABI
> > (e.g., less stack usage, -mprofile-kernel, better compatibility with eBPF
> > tools).
> > 
> > BE+ELFv2 is not officially supported by the GNU toolchain, but it works
> > fine in testing and has been used by some userspace for some time (e.g.,
> > Void Linux).
> > 
> > Tested-by: Michal Suchánek <msuchanek@suse.de>
> > Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  arch/powerpc/Kconfig                | 22 ++++++++++++++++++++++
> >  arch/powerpc/Makefile               | 18 ++++++++++++------
> >  arch/powerpc/boot/Makefile          |  4 +++-
> >  arch/powerpc/include/asm/module.h   | 24 ++++++++++++++++++++++++
> >  arch/powerpc/kernel/vdso64/Makefile | 13 +++++++++++++
> >  drivers/crypto/vmx/Makefile         |  8 ++++++--
> >  drivers/crypto/vmx/ppc-xlate.pl     | 10 ++++++----
> >  7 files changed, 86 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 088dd2afcfe4..093f973a28b9 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -163,6 +163,7 @@ config PPC
> >  	select ARCH_WEAK_RELEASE_ACQUIRE
> >  	select BINFMT_ELF
> >  	select BUILDTIME_TABLE_SORT
> > +	select PPC64_BUILD_ELF_V2_ABI		if PPC64 && CPU_LITTLE_ENDIAN
> >  	select CLONE_BACKWARDS
> >  	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
> >  	select DMA_OPS_BYPASS			if PPC64
> > @@ -561,6 +562,27 @@ config KEXEC_FILE
> >  config ARCH_HAS_KEXEC_PURGATORY
> >  	def_bool KEXEC_FILE
> >  
> > +config PPC64_BUILD_ELF_V2_ABI
> > +	bool
> > +
> > +config PPC64_BUILD_BIG_ENDIAN_ELF_V2_ABI
> > +	bool "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)"
> > +	depends on PPC64 && CPU_BIG_ENDIAN && EXPERT
> > +	depends on CC_IS_GCC && LD_VERSION >= 22400
> > +	default n
> > +	select PPC64_BUILD_ELF_V2_ABI
> > +	help
> > +	  This builds the kernel image using the "Power Architecture 64-Bit ELF
> > +	  V2 ABI Specification", which has a reduced stack overhead and faster
> > +	  function calls. This internal kernel ABI option does not affect
> > +          userspace compatibility.
> > +
> > +	  The V2 ABI is standard for 64-bit little-endian, but for big-endian
> > +	  it is less well tested by kernel and toolchain. However some distros
> > +	  build userspace this way, and it can produce a functioning kernel.
> > +
> > +	  This requires GCC and binutils 2.24 or newer.
> > +
> >  config RELOCATABLE
> >  	bool "Build a relocatable kernel"
> >  	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index 3212d076ac6a..b90b5cb799aa 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -91,10 +91,14 @@ endif
> >  
> >  ifdef CONFIG_PPC64
> >  ifndef CONFIG_CC_IS_CLANG
> > -cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
> > -cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mcall-aixdesc)
> > -aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
> > -aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
> > +ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
> > +cflags-y				+= $(call cc-option,-mabi=elfv2)
> > +aflags-y				+= $(call cc-option,-mabi=elfv2)
> > +else
> > +cflags-y				+= $(call cc-option,-mabi=elfv1)
> > +cflags-y				+= $(call cc-option,-mcall-aixdesc)
> > +aflags-y				+= $(call cc-option,-mabi=elfv1)
> > +endif
> >  endif
> >  endif
> >  
> > @@ -142,15 +146,17 @@ endif
> >  
> >  CFLAGS-$(CONFIG_PPC64)	:= $(call cc-option,-mtraceback=no)
> >  ifndef CONFIG_CC_IS_CLANG
> > -ifdef CONFIG_CPU_LITTLE_ENDIAN
> > -CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
> > +ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
> > +CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2)
> >  AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2)
> >  else
> > +# Keep these in synch with arch/powerpc/kernel/vdso64/Makefile
> >  CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
> >  CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
> >  AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
> >  endif
> >  endif
> > +
> >  CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
> >  CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
> >  
> > diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> > index 2b8da923ceca..be84a72f8258 100644
> > --- a/arch/powerpc/boot/Makefile
> > +++ b/arch/powerpc/boot/Makefile
> > @@ -40,6 +40,9 @@ BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
> >  
> >  ifdef CONFIG_PPC64_BOOT_WRAPPER
> >  BOOTCFLAGS	+= -m64
> > +ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
> > +BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
> > +endif
> >  else
> >  BOOTCFLAGS	+= -m32
> >  endif
> > @@ -50,7 +53,6 @@ ifdef CONFIG_CPU_BIG_ENDIAN
> >  BOOTCFLAGS	+= -mbig-endian
> >  else
> >  BOOTCFLAGS	+= -mlittle-endian
> > -BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
> >  endif
> >  
> >  BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc
> > diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
> > index 857d9ff24295..043e11068ff4 100644
> > --- a/arch/powerpc/include/asm/module.h
> > +++ b/arch/powerpc/include/asm/module.h
> > @@ -52,6 +52,30 @@ struct mod_arch_specific {
> >  	unsigned int num_bugs;
> >  };
> >  
> > +/*
> > + * Check kernel module ELF header architecture specific compatibility.
> > + */
> > +static inline bool elf_check_module_arch(Elf_Ehdr *hdr)
> > +{
> > +	if (!elf_check_arch(hdr))
> > +		return false;
> > +
> > +	if (IS_ENABLED(CONFIG_PPC64)) {
> > +		unsigned long abi_level = hdr->e_flags & 0x3;
> > +
> > +		if (IS_ENABLED(CONFIG_PPC64_BUILD_ELF_V2_ABI)) {
> > +			if (abi_level != 2)
> > +				return false;
> > +		} else {
> > +			if (abi_level >= 2)
> > +				return false;
> > +		}
> > +	}
> > +
> > +	return true;
> > +}
> > +#define elf_check_module_arch elf_check_module_arch
> > +
> >  /*
> >   * Select ELF headers.
> >   * Make empty section for module_frob_arch_sections to expand.
> Shouldn't this part go to the second patch?
Nevermind, this is the second patch now.
> 
> Thanks
> 
> Michal
> > diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> > index 2813e3f98db6..d783c07e558f 100644
> > --- a/arch/powerpc/kernel/vdso64/Makefile
> > +++ b/arch/powerpc/kernel/vdso64/Makefile
> > @@ -25,6 +25,19 @@ KCOV_INSTRUMENT := n
> >  UBSAN_SANITIZE := n
> >  KASAN_SANITIZE := n
> >  
> > +# Always build vdso64 with ELFv1 ABI for BE kernels
> > +ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
> > +ifdef CONFIG_CPU_BIG_ENDIAN
> > +KBUILD_CFLAGS := $(filter-out -mabi=elfv2,$(KBUILD_CFLAGS))
> > +KBUILD_AFLAGS := $(filter-out -mabi=elfv2,$(KBUILD_AFLAGS))
> > +
> > +# These are derived from arch/powerpc/Makefile
> > +KBUILD_CFLAGS += $(call cc-option,-mabi=elfv1)
> > +KBUILD_CFLAGS += $(call cc-option,-mcall-aixdesc)
> > +KBUILD_AFLAGS += $(call cc-option,-mabi=elfv1)
> > +endif
> > +endif
> > +
> >  ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
> >  	-Wl,-soname=linux-vdso64.so.1 -Wl,--hash-style=both
> >  asflags-y := -D__VDSO64__ -s
> > diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
> > index 709670d2b553..d9ccf9fc3483 100644
> > --- a/drivers/crypto/vmx/Makefile
> > +++ b/drivers/crypto/vmx/Makefile
> > @@ -5,18 +5,22 @@ vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes
> >  ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
> >  override flavour := linux-ppc64le
> >  else
> > +ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
> > +override flavour := linux-ppc64-elfv2
> > +else
> >  override flavour := linux-ppc64
> >  endif
> > +endif
> >  
> >  quiet_cmd_perl = PERL $@
> >        cmd_perl = $(PERL) $(<) $(flavour) > $(@)
> >  
> >  targets += aesp8-ppc.S ghashp8-ppc.S
> >  
> > -$(obj)/aesp8-ppc.S: $(src)/aesp8-ppc.pl FORCE
> > +$(obj)/aesp8-ppc.S: $(src)/aesp8-ppc.pl $(src)/ppc-xlate.pl FORCE
> >  	$(call if_changed,perl)
> >    
> > -$(obj)/ghashp8-ppc.S: $(src)/ghashp8-ppc.pl FORCE
> > +$(obj)/ghashp8-ppc.S: $(src)/ghashp8-ppc.pl $(src)/ppc-xlate.pl FORCE
> >  	$(call if_changed,perl)
> >  
> >  clean-files := aesp8-ppc.S ghashp8-ppc.S
> > diff --git a/drivers/crypto/vmx/ppc-xlate.pl b/drivers/crypto/vmx/ppc-xlate.pl
> > index 36db2ef09e5b..b583898c11ae 100644
> > --- a/drivers/crypto/vmx/ppc-xlate.pl
> > +++ b/drivers/crypto/vmx/ppc-xlate.pl
> > @@ -9,6 +9,8 @@ open STDOUT,">$output" || die "can't open $output: $!";
> >  
> >  my %GLOBALS;
> >  my $dotinlocallabels=($flavour=~/linux/)?1:0;
> > +my $elfv2abi=(($flavour =~ /linux-ppc64le/) or ($flavour =~ /linux-ppc64-elfv2/))?1:0;
> > +my $dotfunctions=($elfv2abi=~1)?0:1;
> >  
> >  ################################################################
> >  # directives which need special treatment on different platforms
> > @@ -40,7 +42,7 @@ my $globl = sub {
> >  };
> >  my $text = sub {
> >      my $ret = ($flavour =~ /aix/) ? ".csect\t.text[PR],7" : ".text";
> > -    $ret = ".abiversion	2\n".$ret	if ($flavour =~ /linux.*64le/);
> > +    $ret = ".abiversion	2\n".$ret	if ($elfv2abi);
> >      $ret;
> >  };
> >  my $machine = sub {
> > @@ -56,8 +58,8 @@ my $size = sub {
> >      if ($flavour =~ /linux/)
> >      {	shift;
> >  	my $name = shift; $name =~ s|^[\.\_]||;
> > -	my $ret  = ".size	$name,.-".($flavour=~/64$/?".":"").$name;
> > -	$ret .= "\n.size	.$name,.-.$name" if ($flavour=~/64$/);
> > +	my $ret  = ".size	$name,.-".($dotfunctions?".":"").$name;
> > +	$ret .= "\n.size	.$name,.-.$name" if ($dotfunctions);
> >  	$ret;
> >      }
> >      else
> > @@ -142,7 +144,7 @@ my $vmr = sub {
> >  
> >  # Some ABIs specify vrsave, special-purpose register #256, as reserved
> >  # for system use.
> > -my $no_vrsave = ($flavour =~ /linux-ppc64le/);
> > +my $no_vrsave = ($elfv2abi);
> >  my $mtspr = sub {
> >      my ($f,$idx,$ra) = @_;
> >      if ($idx == 256 && $no_vrsave) {
> > -- 
> > 2.23.0
> > 

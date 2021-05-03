Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 183323711E0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 09:11:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYZ0J0P56z30DR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 17:11:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYYzt1Zmzz2xff
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 17:11:21 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0818B048;
 Mon,  3 May 2021 07:11:17 +0000 (UTC)
Date: Mon, 3 May 2021 09:11:16 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
Message-ID: <20210503071116.GI6564@kitsune.suse.cz>
References: <20200428112517.1402927-1-npiggin@gmail.com>
 <20210502165757.GH6564@kitsune.suse.cz>
 <1620003110.kzo64haq0d.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1620003110.kzo64haq0d.astroid@bobo.none>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 03, 2021 at 10:58:33AM +1000, Nicholas Piggin wrote:
> Excerpts from Michal Suchánek's message of May 3, 2021 2:57 am:
> > On Tue, Apr 28, 2020 at 09:25:17PM +1000, Nicholas Piggin wrote:
> >> Provide an option to use ELFv2 ABI for big endian builds. This works on
> >> GCC and clang (since 2014). It is less well tested and supported by the
> >> GNU toolchain, but it can give some useful advantages of the ELFv2 ABI
> >> for BE (e.g., less stack usage). Some distros even build BE ELFv2
> >> userspace.
> > 
> > Fixes BTFID failure on BE for me and the ELF ABIv2 kernel boots.
> 
> What's the BTFID failure? Anything we can do to fix it on the v1 ABI or 
> at least make it depend on BUILD_ELF_V2?

Looks like symbols are prefixed with a dot in ABIv1 and BTFID tool is
not aware of that. It can be disabled on ABIv1 easily.

Thanks

Michal

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 678c13967580..e703c26e9b80 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -305,6 +305,7 @@ config DEBUG_INFO_BTF
 	bool "Generate BTF typeinfo"
 	depends on !DEBUG_INFO_SPLIT && !DEBUG_INFO_REDUCED
 	depends on !GCC_PLUGIN_RANDSTRUCT || COMPILE_TEST
+	depends on !PPC64 || BUILD_ELF_V2
 	help
 	  Generate deduplicated BTF type information from DWARF debug info.
 	  Turning this on expects presence of pahole tool, which will convert

> 
> > 
> > Tested-by: Michal Suchánek <msuchanek@suse.de>
> > 
> > Also can we enable mprofile on BE now?
> > 
> > I don't see anything endian-specific in the mprofile code at a glance
> > but don't have any idea how to test it.
> 
> AFAIK it's just a different ABI for the _mcount call so just running
> some ftrace and ftrace with call graph should test it reasonably well.
> 
> > 
> > Thanks
> > 
> > Michal
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 6a4ad11f6349..75b3afbfc378 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -495,7 +495,7 @@ config LD_HEAD_STUB_CATCH
> >  	  If unsure, say "N".
> >  
> >  config MPROFILE_KERNEL
> > -	depends on PPC64 && CPU_LITTLE_ENDIAN && FUNCTION_TRACER
> > +	depends on PPC64 && BUILD_ELF_V2 && FUNCTION_TRACER
> >  	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -I$(srctree)/include -D__KERNEL__)
> 
> Good idea. I can't remember if I did a grep for LITTLE_ENDIAN to check 
> for other such opportunities.
> 
> Thanks,
> Nick
> 
> >  
> >  config HOTPLUG_CPU
> >> 
> >> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> >> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >> ---
> >> Since v1:
> >> - Improved the override flavour name suggested by Segher.
> >> - Improved changelog wording.
> >> 
> >> 
> >>  arch/powerpc/Kconfig            | 19 +++++++++++++++++++
> >>  arch/powerpc/Makefile           | 15 ++++++++++-----
> >>  arch/powerpc/boot/Makefile      |  4 ++++
> >>  drivers/crypto/vmx/Makefile     |  8 ++++++--
> >>  drivers/crypto/vmx/ppc-xlate.pl | 10 ++++++----
> >>  5 files changed, 45 insertions(+), 11 deletions(-)
> >> 
> >> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> >> index 924c541a9260..d9d2abc06c2c 100644
> >> --- a/arch/powerpc/Kconfig
> >> +++ b/arch/powerpc/Kconfig
> >> @@ -147,6 +147,7 @@ config PPC
> >>  	select ARCH_WEAK_RELEASE_ACQUIRE
> >>  	select BINFMT_ELF
> >>  	select BUILDTIME_TABLE_SORT
> >> +	select BUILD_ELF_V2			if PPC64 && CPU_LITTLE_ENDIAN
> >>  	select CLONE_BACKWARDS
> >>  	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
> >>  	select DYNAMIC_FTRACE			if FUNCTION_TRACER
> >> @@ -541,6 +542,24 @@ config KEXEC_FILE
> >>  config ARCH_HAS_KEXEC_PURGATORY
> >>  	def_bool KEXEC_FILE
> >>  
> >> +config BUILD_ELF_V2
> >> +	bool
> >> +
> >> +config BUILD_BIG_ENDIAN_ELF_V2
> >> +	bool "Build big-endian kernel using ELFv2 ABI (EXPERIMENTAL)"
> >> +	depends on PPC64 && CPU_BIG_ENDIAN && EXPERT
> >> +	default n
> >> +	select BUILD_ELF_V2
> >> +	help
> >> +	  This builds the kernel image using the ELFv2 ABI, which has a
> >> +	  reduced stack overhead and faster function calls. This does not
> >> +	  affect the userspace ABIs.
> >> +
> >> +	  ELFv2 is the standard ABI for little-endian, but for big-endian
> >> +	  this is an experimental option that is less tested (kernel and
> >> +	  toolchain). This requires gcc 4.9 or newer and binutils 2.24 or
> >> +	  newer.
> >> +
> >>  config RELOCATABLE
> >>  	bool "Build a relocatable kernel"
> >>  	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
> >> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> >> index f310c32e88a4..e306b39d847e 100644
> >> --- a/arch/powerpc/Makefile
> >> +++ b/arch/powerpc/Makefile
> >> @@ -92,10 +92,14 @@ endif
> >>  
> >>  ifdef CONFIG_PPC64
> >>  ifndef CONFIG_CC_IS_CLANG
> >> -cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
> >> -cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mcall-aixdesc)
> >> -aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
> >> -aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
> >> +ifdef CONFIG_BUILD_ELF_V2
> >> +cflags-y				+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
> >> +aflags-y				+= $(call cc-option,-mabi=elfv2)
> >> +else
> >> +cflags-y				+= $(call cc-option,-mabi=elfv1)
> >> +cflags-y				+= $(call cc-option,-mcall-aixdesc)
> >> +aflags-y				+= $(call cc-option,-mabi=elfv1)
> >> +endif
> >>  endif
> >>  endif
> >>  
> >> @@ -144,7 +148,7 @@ endif
> >>  
> >>  CFLAGS-$(CONFIG_PPC64)	:= $(call cc-option,-mtraceback=no)
> >>  ifndef CONFIG_CC_IS_CLANG
> >> -ifdef CONFIG_CPU_LITTLE_ENDIAN
> >> +ifdef CONFIG_BUILD_ELF_V2
> >>  CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
> >>  AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2)
> >>  else
> >> @@ -153,6 +157,7 @@ CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
> >>  AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
> >>  endif
> >>  endif
> >> +
> >>  CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
> >>  CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
> >>  
> >> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> >> index c53a1b8bba8b..03942d08695d 100644
> >> --- a/arch/powerpc/boot/Makefile
> >> +++ b/arch/powerpc/boot/Makefile
> >> @@ -41,6 +41,10 @@ endif
> >>  
> >>  BOOTCFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
> >>  
> >> +ifdef CONFIG_BUILD_ELF_V2
> >> +BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
> >> +endif
> >> +
> >>  ifdef CONFIG_CPU_BIG_ENDIAN
> >>  BOOTCFLAGS	+= -mbig-endian
> >>  else
> >> diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
> >> index 709670d2b553..9aea34602beb 100644
> >> --- a/drivers/crypto/vmx/Makefile
> >> +++ b/drivers/crypto/vmx/Makefile
> >> @@ -5,18 +5,22 @@ vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes
> >>  ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
> >>  override flavour := linux-ppc64le
> >>  else
> >> +ifdef CONFIG_BUILD_ELF_V2
> >> +override flavour := linux-ppc64-elfv2
> >> +else
> >>  override flavour := linux-ppc64
> >>  endif
> >> +endif
> >>  
> >>  quiet_cmd_perl = PERL $@
> >>        cmd_perl = $(PERL) $(<) $(flavour) > $(@)
> >>  
> >>  targets += aesp8-ppc.S ghashp8-ppc.S
> >>  
> >> -$(obj)/aesp8-ppc.S: $(src)/aesp8-ppc.pl FORCE
> >> +$(obj)/aesp8-ppc.S: $(src)/aesp8-ppc.pl $(src)/ppc-xlate.pl FORCE
> >>  	$(call if_changed,perl)
> >>    
> >> -$(obj)/ghashp8-ppc.S: $(src)/ghashp8-ppc.pl FORCE
> >> +$(obj)/ghashp8-ppc.S: $(src)/ghashp8-ppc.pl $(src)/ppc-xlate.pl FORCE
> >>  	$(call if_changed,perl)
> >>  
> >>  clean-files := aesp8-ppc.S ghashp8-ppc.S
> >> diff --git a/drivers/crypto/vmx/ppc-xlate.pl b/drivers/crypto/vmx/ppc-xlate.pl
> >> index 36db2ef09e5b..9db0937d318b 100644
> >> --- a/drivers/crypto/vmx/ppc-xlate.pl
> >> +++ b/drivers/crypto/vmx/ppc-xlate.pl
> >> @@ -9,6 +9,8 @@ open STDOUT,">$output" || die "can't open $output: $!";
> >>  
> >>  my %GLOBALS;
> >>  my $dotinlocallabels=($flavour=~/linux/)?1:0;
> >> +my $abielfv2=(($flavour =~ /linux-ppc64le/) or ($flavour =~ /linux-ppc64-elfv2/))?1:0;
> >> +my $dotfunctions=($abielfv2=~1)?0:1;
> >>  
> >>  ################################################################
> >>  # directives which need special treatment on different platforms
> >> @@ -40,7 +42,7 @@ my $globl = sub {
> >>  };
> >>  my $text = sub {
> >>      my $ret = ($flavour =~ /aix/) ? ".csect\t.text[PR],7" : ".text";
> >> -    $ret = ".abiversion	2\n".$ret	if ($flavour =~ /linux.*64le/);
> >> +    $ret = ".abiversion	2\n".$ret	if ($abielfv2);
> >>      $ret;
> >>  };
> >>  my $machine = sub {
> >> @@ -56,8 +58,8 @@ my $size = sub {
> >>      if ($flavour =~ /linux/)
> >>      {	shift;
> >>  	my $name = shift; $name =~ s|^[\.\_]||;
> >> -	my $ret  = ".size	$name,.-".($flavour=~/64$/?".":"").$name;
> >> -	$ret .= "\n.size	.$name,.-.$name" if ($flavour=~/64$/);
> >> +	my $ret  = ".size	$name,.-".($dotfunctions?".":"").$name;
> >> +	$ret .= "\n.size	.$name,.-.$name" if ($dotfunctions);
> >>  	$ret;
> >>      }
> >>      else
> >> @@ -142,7 +144,7 @@ my $vmr = sub {
> >>  
> >>  # Some ABIs specify vrsave, special-purpose register #256, as reserved
> >>  # for system use.
> >> -my $no_vrsave = ($flavour =~ /linux-ppc64le/);
> >> +my $no_vrsave = ($abielfv2);
> >>  my $mtspr = sub {
> >>      my ($f,$idx,$ra) = @_;
> >>      if ($idx == 256 && $no_vrsave) {
> >> -- 
> >> 2.23.0
> >> 
> > 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 205FD371034
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 02:59:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYPkP10S2z302K
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 10:59:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uqQx2dGc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uqQx2dGc; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYPjw6dtQz2xZB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 10:58:42 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id e2so1941779plh.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 17:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=5a3IrejoFZBohIkPPytp/2YiZnZFoMOhOA7kYppWROQ=;
 b=uqQx2dGc92LNe9v0wHze32lors6ft8oJ7HBL8TGp6oRkB26nLJw2TJ276UDZYSlxHF
 A0Rr6am/+Yd0lP5f4kQWfuL/ZuxL1K2vbKAvHx5/xzV2LzcbBMpbmuZR2d7r/rJVcjVe
 YzeAcMBmngXdfQnReJAiqJvYcqAsu2B7ESVrrG6drn5olquY7lX2G5y1Vpj4mvqSlGB/
 AI4lTIhpTC+SZZjNCdGl+gHbYnO0SOZQXKJg32+2Cjbh5Vh6UIvu/j+WqtzwGXCCnp62
 CxgpsmMcAviidMaF40T7VQ/DIzrsVXPqp9WWTIA7Gg7wXvrsVMlBJ9Fcx4ANxj/61Bfh
 cp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5a3IrejoFZBohIkPPytp/2YiZnZFoMOhOA7kYppWROQ=;
 b=bZFsmawA/ODx5uBAlK4Kny8oyoh/QFqS7SAb0W6oL5E/LYCVxM2PVAkMO93r/B688f
 o5D5Y0bFghRV/9qX7XwSL9Q48GKGZwwm+NIzHfYv87LujJVE2pCv/xIwDA5iRXn+oVAn
 i3Hv/fHHpEnaA6xP91ajoEpDCr1223tRtLuaWKDydr2wzJr0ZJhJNPcjRY5HRy9rxIF0
 Xg1fsEzL5xR5mG8QkjqJIZ8qNcNbJiQYfeeNowNRkOyteOsQ6G0Gh/0GE6Y97E19D9xk
 Malm4SMjZ/jYI2A+PGAk4irqmp9lR6SpchpfzWnCAqg5kwZ8b2c1aL2zoEvqQg9sST8k
 5JWg==
X-Gm-Message-State: AOAM530gaUCk4Ie2QxePY+YFNG73qwgmr6NGTqJuPy43g/XQrSFWOYmC
 I5p0b0Fxl+QONp6jin0ioRM=
X-Google-Smtp-Source: ABdhPJxs+4qEQMZFZ7SKInOSWlKFiua1yeUYdrpt8JnOpFr6oEzslGJNcFz8zJM4t0qcKau4OkKLLg==
X-Received: by 2002:a17:902:6b4c:b029:ec:a55f:f4e7 with SMTP id
 g12-20020a1709026b4cb02900eca55ff4e7mr17983868plt.72.1620003518980; 
 Sun, 02 May 2021 17:58:38 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id x9sm7458232pfd.66.2021.05.02.17.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 17:58:38 -0700 (PDT)
Date: Mon, 03 May 2021 10:58:33 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>
References: <20200428112517.1402927-1-npiggin@gmail.com>
 <20210502165757.GH6564@kitsune.suse.cz>
In-Reply-To: <20210502165757.GH6564@kitsune.suse.cz>
MIME-Version: 1.0
Message-Id: <1620003110.kzo64haq0d.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from Michal Such=C3=A1nek's message of May 3, 2021 2:57 am:
> On Tue, Apr 28, 2020 at 09:25:17PM +1000, Nicholas Piggin wrote:
>> Provide an option to use ELFv2 ABI for big endian builds. This works on
>> GCC and clang (since 2014). It is less well tested and supported by the
>> GNU toolchain, but it can give some useful advantages of the ELFv2 ABI
>> for BE (e.g., less stack usage). Some distros even build BE ELFv2
>> userspace.
>=20
> Fixes BTFID failure on BE for me and the ELF ABIv2 kernel boots.

What's the BTFID failure? Anything we can do to fix it on the v1 ABI or=20
at least make it depend on BUILD_ELF_V2?

>=20
> Tested-by: Michal Such=C3=A1nek <msuchanek@suse.de>
>=20
> Also can we enable mprofile on BE now?
>=20
> I don't see anything endian-specific in the mprofile code at a glance
> but don't have any idea how to test it.

AFAIK it's just a different ABI for the _mcount call so just running
some ftrace and ftrace with call graph should test it reasonably well.

>=20
> Thanks
>=20
> Michal
>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 6a4ad11f6349..75b3afbfc378 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -495,7 +495,7 @@ config LD_HEAD_STUB_CATCH
>  	  If unsure, say "N".
> =20
>  config MPROFILE_KERNEL
> -	depends on PPC64 && CPU_LITTLE_ENDIAN && FUNCTION_TRACER
> +	depends on PPC64 && BUILD_ELF_V2 && FUNCTION_TRACER
>  	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-ker=
nel.sh $(CC) -I$(srctree)/include -D__KERNEL__)

Good idea. I can't remember if I did a grep for LITTLE_ENDIAN to check=20
for other such opportunities.

Thanks,
Nick

> =20
>  config HOTPLUG_CPU
>>=20
>> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> Since v1:
>> - Improved the override flavour name suggested by Segher.
>> - Improved changelog wording.
>>=20
>>=20
>>  arch/powerpc/Kconfig            | 19 +++++++++++++++++++
>>  arch/powerpc/Makefile           | 15 ++++++++++-----
>>  arch/powerpc/boot/Makefile      |  4 ++++
>>  drivers/crypto/vmx/Makefile     |  8 ++++++--
>>  drivers/crypto/vmx/ppc-xlate.pl | 10 ++++++----
>>  5 files changed, 45 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 924c541a9260..d9d2abc06c2c 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -147,6 +147,7 @@ config PPC
>>  	select ARCH_WEAK_RELEASE_ACQUIRE
>>  	select BINFMT_ELF
>>  	select BUILDTIME_TABLE_SORT
>> +	select BUILD_ELF_V2			if PPC64 && CPU_LITTLE_ENDIAN
>>  	select CLONE_BACKWARDS
>>  	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
>>  	select DYNAMIC_FTRACE			if FUNCTION_TRACER
>> @@ -541,6 +542,24 @@ config KEXEC_FILE
>>  config ARCH_HAS_KEXEC_PURGATORY
>>  	def_bool KEXEC_FILE
>> =20
>> +config BUILD_ELF_V2
>> +	bool
>> +
>> +config BUILD_BIG_ENDIAN_ELF_V2
>> +	bool "Build big-endian kernel using ELFv2 ABI (EXPERIMENTAL)"
>> +	depends on PPC64 && CPU_BIG_ENDIAN && EXPERT
>> +	default n
>> +	select BUILD_ELF_V2
>> +	help
>> +	  This builds the kernel image using the ELFv2 ABI, which has a
>> +	  reduced stack overhead and faster function calls. This does not
>> +	  affect the userspace ABIs.
>> +
>> +	  ELFv2 is the standard ABI for little-endian, but for big-endian
>> +	  this is an experimental option that is less tested (kernel and
>> +	  toolchain). This requires gcc 4.9 or newer and binutils 2.24 or
>> +	  newer.
>> +
>>  config RELOCATABLE
>>  	bool "Build a relocatable kernel"
>>  	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index f310c32e88a4..e306b39d847e 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -92,10 +92,14 @@ endif
>> =20
>>  ifdef CONFIG_PPC64
>>  ifndef CONFIG_CC_IS_CLANG
>> -cflags-$(CONFIG_CPU_BIG_ENDIAN)		+=3D $(call cc-option,-mabi=3Delfv1)
>> -cflags-$(CONFIG_CPU_BIG_ENDIAN)		+=3D $(call cc-option,-mcall-aixdesc)
>> -aflags-$(CONFIG_CPU_BIG_ENDIAN)		+=3D $(call cc-option,-mabi=3Delfv1)
>> -aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+=3D -mabi=3Delfv2
>> +ifdef CONFIG_BUILD_ELF_V2
>> +cflags-y				+=3D $(call cc-option,-mabi=3Delfv2,$(call cc-option,-mcall=
-aixdesc))
>> +aflags-y				+=3D $(call cc-option,-mabi=3Delfv2)
>> +else
>> +cflags-y				+=3D $(call cc-option,-mabi=3Delfv1)
>> +cflags-y				+=3D $(call cc-option,-mcall-aixdesc)
>> +aflags-y				+=3D $(call cc-option,-mabi=3Delfv1)
>> +endif
>>  endif
>>  endif
>> =20
>> @@ -144,7 +148,7 @@ endif
>> =20
>>  CFLAGS-$(CONFIG_PPC64)	:=3D $(call cc-option,-mtraceback=3Dno)
>>  ifndef CONFIG_CC_IS_CLANG
>> -ifdef CONFIG_CPU_LITTLE_ENDIAN
>> +ifdef CONFIG_BUILD_ELF_V2
>>  CFLAGS-$(CONFIG_PPC64)	+=3D $(call cc-option,-mabi=3Delfv2,$(call cc-op=
tion,-mcall-aixdesc))
>>  AFLAGS-$(CONFIG_PPC64)	+=3D $(call cc-option,-mabi=3Delfv2)
>>  else
>> @@ -153,6 +157,7 @@ CFLAGS-$(CONFIG_PPC64)	+=3D $(call cc-option,-mcall-=
aixdesc)
>>  AFLAGS-$(CONFIG_PPC64)	+=3D $(call cc-option,-mabi=3Delfv1)
>>  endif
>>  endif
>> +
>>  CFLAGS-$(CONFIG_PPC64)	+=3D $(call cc-option,-mcmodel=3Dmedium,$(call c=
c-option,-mminimal-toc))
>>  CFLAGS-$(CONFIG_PPC64)	+=3D $(call cc-option,-mno-pointers-to-nested-fu=
nctions)
>> =20
>> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
>> index c53a1b8bba8b..03942d08695d 100644
>> --- a/arch/powerpc/boot/Makefile
>> +++ b/arch/powerpc/boot/Makefile
>> @@ -41,6 +41,10 @@ endif
>> =20
>>  BOOTCFLAGS	+=3D -isystem $(shell $(BOOTCC) -print-file-name=3Dinclude)
>> =20
>> +ifdef CONFIG_BUILD_ELF_V2
>> +BOOTCFLAGS	+=3D $(call cc-option,-mabi=3Delfv2)
>> +endif
>> +
>>  ifdef CONFIG_CPU_BIG_ENDIAN
>>  BOOTCFLAGS	+=3D -mbig-endian
>>  else
>> diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
>> index 709670d2b553..9aea34602beb 100644
>> --- a/drivers/crypto/vmx/Makefile
>> +++ b/drivers/crypto/vmx/Makefile
>> @@ -5,18 +5,22 @@ vmx-crypto-objs :=3D vmx.o aesp8-ppc.o ghashp8-ppc.o a=
es.o aes_cbc.o aes_ctr.o aes
>>  ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
>>  override flavour :=3D linux-ppc64le
>>  else
>> +ifdef CONFIG_BUILD_ELF_V2
>> +override flavour :=3D linux-ppc64-elfv2
>> +else
>>  override flavour :=3D linux-ppc64
>>  endif
>> +endif
>> =20
>>  quiet_cmd_perl =3D PERL $@
>>        cmd_perl =3D $(PERL) $(<) $(flavour) > $(@)
>> =20
>>  targets +=3D aesp8-ppc.S ghashp8-ppc.S
>> =20
>> -$(obj)/aesp8-ppc.S: $(src)/aesp8-ppc.pl FORCE
>> +$(obj)/aesp8-ppc.S: $(src)/aesp8-ppc.pl $(src)/ppc-xlate.pl FORCE
>>  	$(call if_changed,perl)
>>   =20
>> -$(obj)/ghashp8-ppc.S: $(src)/ghashp8-ppc.pl FORCE
>> +$(obj)/ghashp8-ppc.S: $(src)/ghashp8-ppc.pl $(src)/ppc-xlate.pl FORCE
>>  	$(call if_changed,perl)
>> =20
>>  clean-files :=3D aesp8-ppc.S ghashp8-ppc.S
>> diff --git a/drivers/crypto/vmx/ppc-xlate.pl b/drivers/crypto/vmx/ppc-xl=
ate.pl
>> index 36db2ef09e5b..9db0937d318b 100644
>> --- a/drivers/crypto/vmx/ppc-xlate.pl
>> +++ b/drivers/crypto/vmx/ppc-xlate.pl
>> @@ -9,6 +9,8 @@ open STDOUT,">$output" || die "can't open $output: $!";
>> =20
>>  my %GLOBALS;
>>  my $dotinlocallabels=3D($flavour=3D~/linux/)?1:0;
>> +my $abielfv2=3D(($flavour =3D~ /linux-ppc64le/) or ($flavour =3D~ /linu=
x-ppc64-elfv2/))?1:0;
>> +my $dotfunctions=3D($abielfv2=3D~1)?0:1;
>> =20
>>  ################################################################
>>  # directives which need special treatment on different platforms
>> @@ -40,7 +42,7 @@ my $globl =3D sub {
>>  };
>>  my $text =3D sub {
>>      my $ret =3D ($flavour =3D~ /aix/) ? ".csect\t.text[PR],7" : ".text"=
;
>> -    $ret =3D ".abiversion	2\n".$ret	if ($flavour =3D~ /linux.*64le/);
>> +    $ret =3D ".abiversion	2\n".$ret	if ($abielfv2);
>>      $ret;
>>  };
>>  my $machine =3D sub {
>> @@ -56,8 +58,8 @@ my $size =3D sub {
>>      if ($flavour =3D~ /linux/)
>>      {	shift;
>>  	my $name =3D shift; $name =3D~ s|^[\.\_]||;
>> -	my $ret  =3D ".size	$name,.-".($flavour=3D~/64$/?".":"").$name;
>> -	$ret .=3D "\n.size	.$name,.-.$name" if ($flavour=3D~/64$/);
>> +	my $ret  =3D ".size	$name,.-".($dotfunctions?".":"").$name;
>> +	$ret .=3D "\n.size	.$name,.-.$name" if ($dotfunctions);
>>  	$ret;
>>      }
>>      else
>> @@ -142,7 +144,7 @@ my $vmr =3D sub {
>> =20
>>  # Some ABIs specify vrsave, special-purpose register #256, as reserved
>>  # for system use.
>> -my $no_vrsave =3D ($flavour =3D~ /linux-ppc64le/);
>> +my $no_vrsave =3D ($abielfv2);
>>  my $mtspr =3D sub {
>>      my ($f,$idx,$ra) =3D @_;
>>      if ($idx =3D=3D 256 && $no_vrsave) {
>> --=20
>> 2.23.0
>>=20
>=20

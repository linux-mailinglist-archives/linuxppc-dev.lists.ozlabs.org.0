Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 509DC9050ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 12:54:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ui4waySP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vzj8k1jWhz3fmk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 20:54:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ui4waySP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vzj7z2sjBz3dK1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 20:53:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 15900CE0C2F;
	Wed, 12 Jun 2024 10:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2980C3277B;
	Wed, 12 Jun 2024 10:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718189612;
	bh=z/KfEOna5zRnyotCFtLtekRnWI916pd+aCG+UoFv4io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ui4waySP8abtd6uYf8ThhAMow1unHyJdUhxZtAzalhs3IC2FxDRnJlPiytX27OI+t
	 PlKvZkLRzDt9brzu3DpzkjBWbIC7z8blsVaioitq9vOwKEHhFI0ETwEUn5hyVuUfZu
	 hgRgAEfRwS5atbBtRcd6uL0cCBXvsxSsWWE1vB/6tpSJV8F0tpLOpThl6ELMS1gfd8
	 52/oDg4njY+XB11m4hvxM73sNWejwSXJ54w3rg5FLOW3N5kZPYPo6ADXIU3c93IAwL
	 uVVIEW3CI6RESfjXWYIv7lGawtFq0BOcvU8L2xkblSsiT2N9l0xA302jQZmROTeE4S
	 ZgVPuQGVoBptA==
Date: Wed, 12 Jun 2024 16:22:01 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH v2 4/5] kbuild: Add generic hook for architectures to
 use before the final vmlinux link
Message-ID: <l3atmwvkkd6vyy3gtk67rrkkk5qnujx6fjuh5kgnxy5ojh2fin@e6k27uhokaxy>
References: <cover.1718008093.git.naveen@kernel.org>
 <a4f44ffeb6f0327639175f8aac61cd21bc23150b.1718008093.git.naveen@kernel.org>
 <CAK7LNARc2SYfNQjo78rYSc5ODmNcmBgxPjp2v6ceWju4QnxbKA@mail.gmail.com>
 <a3awlvqgr4quory52btf3zq7wyvgtttjjk5qjidumktcre6myw@geiennjv7pic>
 <CAK7LNASUiOq9otgZ4XC+9rc14S2hw+uBnToz=ig15ZH=kMRPpg@mail.gmail.com>
 <ny6cgi6wlo2jworxkco5st7gcosrrmlp64tmotw4ipgdeqwobp@mgdpojlaovsb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ny6cgi6wlo2jworxkco5st7gcosrrmlp64tmotw4ipgdeqwobp@mgdpojlaovsb>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 11:05:56PM GMT, Naveen N Rao wrote:
> On Tue, Jun 11, 2024 at 06:51:51AM GMT, Masahiro Yamada wrote:
> > On Tue, Jun 11, 2024 at 2:20 AM Naveen N Rao <naveen@kernel.org> wrote:
> > >
> > > On Mon, Jun 10, 2024 at 06:14:51PM GMT, Masahiro Yamada wrote:
> > > > On Mon, Jun 10, 2024 at 5:39 PM Naveen N Rao <naveen@kernel.org> wrote:
> > > > >
> > > > > +arch_vmlinux_o=""
> > > > > +if is_enabled CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX; then
> > > > > +       arch_vmlinux_o=.arch.vmlinux.o
> > > > > +       info "ARCH" ${arch_vmlinux_o}
> > > > > +       if ! ${srctree}/arch/${SRCARCH}/tools/vmlinux_o.sh ${arch_vmlinux_o} ; then
> > > > > +               echo >&2 "Failed to generate ${arch_vmlinux_o}"
> > > > > +               echo >&2 "Try to disable CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX"
> > > > > +               exit 1
> > > > > +       fi
> > > > > +fi
> > > >
> > > >
> > > >
> > > > This is wrong because scripts/link-vmlinux.sh is not triggered
> > > > even when source files under arch/powerpc/tools/ are changed.
> > > >
> > > > Presumably, scripts/Makefile.vmlinux will be the right place.
> > >
> > > Ah, yes. Something like this?
> > >
> > > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > > index 49946cb96844..77d90b6ac53e 100644
> > > --- a/scripts/Makefile.vmlinux
> > > +++ b/scripts/Makefile.vmlinux
> > > @@ -22,6 +22,10 @@ targets += .vmlinux.export.o
> > >  vmlinux: .vmlinux.export.o
> > >  endif
> > >
> > > +ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
> > > +vmlinux: $(srctree)/arch/$(SRCARCH)/tools/vmlinux_o.sh
> > > +endif
> > > +
> > >  ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
> > >
> > >  # Final link of vmlinux with optional arch pass after final link
> > >
> > >
> > > Thanks,
> > > Naveen
> > >
> > 
> > 
> > 
> > No.
> > 
> > Something like below.
> > 
> > Then, you can do everything in Makefile, not a shell script.
> > 
> > 
> > 
> > ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
> > vmlinux: .arch.vmlinux.o
> > 
> > .arch.vmlinux.o: FORCE
> >         $(Q)$(MAKE) $(build)=arch/$(SRCARCH)/tools .arch.vmlinux.o
> > 
> > endif
> > 
> > 
> > 
> > I did not test it, though.
> 
> Thanks for the pointer. I will try and build on that.
> 
> Just to be completely sure, does the below incremetal diff on top of the 
> existing patch capture your suggestion?
> 
> ---
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 49946cb96844..04e088d7a1ca 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -22,6 +22,13 @@ targets += .vmlinux.export.o
>  vmlinux: .vmlinux.export.o
>  endif
>  
> +ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
> +vmlinux: .arch.vmlinux.o
> +
> +.arch.vmlinux.o: FORCE
> +        $(Q)$(MAKE) $(build)=arch/$(SRCARCH)/tools .arch.vmlinux.o
> +endif
> +
>  ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>  
>  # Final link of vmlinux with optional arch pass after final link
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 07f70e105d82..f1b705b8cdca 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -227,12 +227,6 @@ ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init init/version-timestamp.o
>  arch_vmlinux_o=""
>  if is_enabled CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX; then
>         arch_vmlinux_o=.arch.vmlinux.o
> -       info "ARCH" ${arch_vmlinux_o}
> -       if ! ${srctree}/arch/${SRCARCH}/tools/vmlinux_o.sh ${arch_vmlinux_o} ; then
> -               echo >&2 "Failed to generate ${arch_vmlinux_o}"
> -               echo >&2 "Try to disable CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX"
> -               exit 1
> -       fi
>  fi
>  
>  btf_vmlinux_bin_o=""

This is what I ended up with:

---
diff --git a/arch/Kconfig b/arch/Kconfig
index 975dd22a2dbd..649f0903e7ef 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1643,4 +1643,7 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
 config ARCH_NEED_CMPXCHG_1_EMU
        bool

+config ARCH_WANTS_PRE_LINK_VMLINUX
+       def_bool n
+
 endmenu
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 49946cb96844..6410e0be7f52 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -22,6 +22,14 @@ targets += .vmlinux.export.o
 vmlinux: .vmlinux.export.o
 endif

+ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
+targets += .arch.vmlinux.o
+.arch.vmlinux.o: vmlinux.o FORCE
+       $(Q)$(MAKE) $(build)=arch/$(SRCARCH)/tools .arch.vmlinux.o
+
+vmlinux: .arch.vmlinux.o
+endif
+
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)

 # Final link of vmlinux with optional arch pass after final link
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 46ce5d04dbeb..eb5fb71f5207 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -122,7 +122,7 @@ gen_btf()
                return 1
        fi

-       vmlinux_link ${1}
+       vmlinux_link ${1} ${arch_vmlinux_o}

        info "BTF" ${2}
        LLVM_OBJCOPY="${OBJCOPY}" ${PAHOLE} -J ${PAHOLE_FLAGS} ${1}
@@ -178,7 +178,7 @@ kallsyms_step()
        kallsymso=${kallsyms_vmlinux}.o
        kallsyms_S=${kallsyms_vmlinux}.S

-       vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o}
+       vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o} ${arch_vmlinux_o}
        mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms
        kallsyms ${kallsyms_vmlinux}.syms ${kallsyms_S}

@@ -223,6 +223,11 @@ fi

 ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init init/version-timestamp.o

+arch_vmlinux_o=""
+if is_enabled CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX; then
+       arch_vmlinux_o=.arch.vmlinux.o
+fi
+
 btf_vmlinux_bin_o=""
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
        btf_vmlinux_bin_o=.btf.vmlinux.bin.o
@@ -273,7 +278,7 @@ if is_enabled CONFIG_KALLSYMS; then
        fi
 fi

-vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
+vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o} ${arch_vmlinux_o}

 # fill in BTF IDs
 if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CONFIG_BPF; then


---
Along with the below Makefile, things seem to be working properly in my 
limited tests:

diff --git a/arch/powerpc/tools/Makefile b/arch/powerpc/tools/Makefile
new file mode 100644
index 000000000000..9e2ba9a85baa
--- /dev/null
+++ b/arch/powerpc/tools/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+quiet_cmd_gen_ftrace_pfe_stubs = FTRACE  $@
+      cmd_gen_ftrace_pfe_stubs = $< $(objtree)/vmlinux.o $@
+
+targets += .arch.vmlinux.o
+.arch.vmlinux.o: $(srctree)/arch/powerpc/tools/gen-ftrace-pfe-stubs.sh $(objtree)/vmlinux.o FORCE
+       $(call if_changed,gen_ftrace_pfe_stubs)
+
+clean-files += $(objtree)/.arch.vmlinux.S $(objtree)/.arch.vmlinux.o



- Naveen

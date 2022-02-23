Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC894C074F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 02:45:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3JlY75mQz3dgJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 12:45:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zwBbz/bq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20210112.gappssmtp.com
 header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=zwBbz/bq; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3JhJ511qz3bPT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 12:42:55 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id u16so13854485pfg.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 17:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=atTO77+TkxhABJlr8wI/qCGUOeZZg0UG4WdQx8Uydms=;
 b=zwBbz/bq064k6HWUopOPQQ33xd8SBnWKxyVQyGTnl5UdREVHJP7U7rarg6Rbx4MJEY
 /LlmompnRFgBddqV3yrcMHRkZ1XgjT77hGnYmPRmiK7SIvrD4Vch3s7QM3nlzc4jBPQG
 Dxau7eU01s63zrNj7dT78K1jIhsMDH/h+ROkfwEDe1XVHxawp29OSvp0NAfAjHdSHujy
 kzod2686NE9Zur+xXABdhziFND67DT3eBW6RPh0fxHtsE6pps2SnHTA9KPiCOrej7PHD
 hESMrPnkeNEVQLz/eCMpFmWqnmmvV4+/ojlT5fXfo/apl4SdZ2uu/pOuVD05yn9BTGJL
 pJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=atTO77+TkxhABJlr8wI/qCGUOeZZg0UG4WdQx8Uydms=;
 b=QtY8VQ3xNHUd0gZqjNM6OpcSIc1wo1RrkAJ+Aa1+leWfnEqeb48f2li1fNrEgrz4OM
 L3YTcbBGoGaaMGRHCljqMO+ebvdr6RPDD1Wywjq+Y0IH0w7R/mbRJKJ9jS6nmhUHwBM2
 OZwQaOlOjhKP9pFAT/DflTyxpgeOyJMB9Lyd4PuW+1WQ2tv8ulp22Z7ZKSX8s5N3gM8h
 CWVSczMJkQnpyO5fTdQc1Yoria58FBJrEnyiU+C3eeahwnb3Do0kvVBChz/ZylOt2pAA
 AARJ6RtXftBjOnaT1jzE9E+JbsvEHt3G3bD0u2mQTFk21fifim1CyTLCYF3U+Ii1heE/
 BKnw==
X-Gm-Message-State: AOAM531jWR4pV4U9aHbwVt4nL5T1LmMcGRjvMr/AZBFgSRxT9ud3QgoX
 Fys5oXCI9q9zqZ4tjrQ1kfj2Ag==
X-Google-Smtp-Source: ABdhPJwJJUYuSykKTjU6Cuc1f55tmKxp3pv29O0QqN1rqZlo1paLjwV9+OEnvSdoG2dTX2lbqowMew==
X-Received: by 2002:a63:eb02:0:b0:370:41e4:6ae6 with SMTP id
 t2-20020a63eb02000000b0037041e46ae6mr21853093pgh.229.1645580572314; 
 Tue, 22 Feb 2022 17:42:52 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id h1sm10706771pgr.7.2022.02.22.17.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 17:42:51 -0800 (PST)
Date: Tue, 22 Feb 2022 17:42:51 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 16:26:12 PST (-0800)
Subject: Re: [PATCH V5 16/21] riscv: compat: vdso: Add rv32 VDSO base code
 implementation
In-Reply-To: <20220201150545.1512822-17-guoren@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-2ad760ea-cfeb-4243-b703-8909bb102cf8@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 guoren@linux.alibaba.com, linux-parisc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>,
 drew@beagleboard.org, anup@brainfault.org, wangjunqiang@iscas.ac.cn,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, guoren@kernel.org, liush@allwinnertech.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, wefu@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 01 Feb 2022 07:05:40 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> There is no vgettimeofday supported in rv32 that makes simple to
> generate rv32 vdso code which only needs riscv64 compiler. Other
> architectures need change compiler or -m (machine parameter) to
> support vdso32 compiling. If rv32 support vgettimeofday (which
> cause C compile) in future, we would add CROSS_COMPILE to support
> that makes more requirement on compiler enviornment.

IMO this is the wrong way to go, as there's some subtle differences 
between elf32 and elf64 (the .gnu.hash layout, for example).  I'm kind 
of surprised userspace tolerates this sort of thing at all, but given 
how easy it is to target rv32 from all toolchains (we don't need 
libraries here, so just -march should do it) I don't think it's worth 
chasing around the likely long-tail issues that will arise.

> linux-rv64/arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg:
> file format elf64-littleriscv
>
> Disassembly of section .text:
>
> 0000000000000800 <__vdso_rt_sigreturn>:
>  800:   08b00893                li      a7,139
>  804:   00000073                ecall
>  808:   0000                    unimp
>         ...
>
> 000000000000080c <__vdso_getcpu>:
>  80c:   0a800893                li      a7,168
>  810:   00000073                ecall
>  814:   8082                    ret
>         ...
>
> 0000000000000818 <__vdso_flush_icache>:
>  818:   10300893                li      a7,259
>  81c:   00000073                ecall
>  820:   8082                    ret
>
> linux-rv32/arch/riscv/kernel/vdso/vdso.so.dbg:
> file format elf32-littleriscv
>
> Disassembly of section .text:
>
> 00000800 <__vdso_rt_sigreturn>:
>  800:   08b00893                li      a7,139
>  804:   00000073                ecall
>  808:   0000                    unimp
>         ...
>
> 0000080c <__vdso_getcpu>:
>  80c:   0a800893                li      a7,168
>  810:   00000073                ecall
>  814:   8082                    ret
>         ...
>
> 00000818 <__vdso_flush_icache>:
>  818:   10300893                li      a7,259
>  81c:   00000073                ecall
>  820:   8082                    ret
>
> Finally, reuse all *.S from vdso in compat_vdso that makes
> implementation clear and readable.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/Makefile                           |  5 ++
>  arch/riscv/include/asm/vdso.h                 |  9 +++
>  arch/riscv/kernel/Makefile                    |  1 +
>  arch/riscv/kernel/compat_vdso/.gitignore      |  2 +
>  arch/riscv/kernel/compat_vdso/Makefile        | 68 +++++++++++++++++++
>  arch/riscv/kernel/compat_vdso/compat_vdso.S   |  8 +++
>  .../kernel/compat_vdso/compat_vdso.lds.S      |  3 +
>  arch/riscv/kernel/compat_vdso/flush_icache.S  |  3 +
>  .../compat_vdso/gen_compat_vdso_offsets.sh    |  5 ++
>  arch/riscv/kernel/compat_vdso/getcpu.S        |  3 +
>  arch/riscv/kernel/compat_vdso/note.S          |  3 +
>  arch/riscv/kernel/compat_vdso/rt_sigreturn.S  |  3 +
>  arch/riscv/kernel/vdso/vdso.S                 |  6 +-
>  13 files changed, 118 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kernel/compat_vdso/.gitignore
>  create mode 100644 arch/riscv/kernel/compat_vdso/Makefile
>  create mode 100644 arch/riscv/kernel/compat_vdso/compat_vdso.S
>  create mode 100644 arch/riscv/kernel/compat_vdso/compat_vdso.lds.S
>  create mode 100644 arch/riscv/kernel/compat_vdso/flush_icache.S
>  create mode 100755 arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
>  create mode 100644 arch/riscv/kernel/compat_vdso/getcpu.S
>  create mode 100644 arch/riscv/kernel/compat_vdso/note.S
>  create mode 100644 arch/riscv/kernel/compat_vdso/rt_sigreturn.S
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index a02e588c4947..f73d50552e09 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -106,12 +106,17 @@ libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
>  PHONY += vdso_install
>  vdso_install:
>  	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
> +	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
> +		$(build)=arch/riscv/kernel/compat_vdso $@)
>
>  ifeq ($(KBUILD_EXTMOD),)
>  ifeq ($(CONFIG_MMU),y)
>  prepare: vdso_prepare
>  vdso_prepare: prepare0
>  	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
> +	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
> +		$(build)=arch/riscv/kernel/compat_vdso include/generated/compat_vdso-offsets.h)
> +
>  endif
>  endif
>
> diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> index bc6f75f3a199..af981426fe0f 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -21,6 +21,15 @@
>
>  #define VDSO_SYMBOL(base, name)							\
>  	(void __user *)((unsigned long)(base) + __vdso_##name##_offset)
> +
> +#ifdef CONFIG_COMPAT
> +#include <generated/compat_vdso-offsets.h>
> +
> +#define COMPAT_VDSO_SYMBOL(base, name)						\
> +	(void __user *)((unsigned long)(base) + compat__vdso_##name##_offset)
> +
> +#endif /* CONFIG_COMPAT */
> +
>  #endif /* !__ASSEMBLY__ */
>
>  #endif /* CONFIG_MMU */
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 954dc7043ad2..88e79f481c21 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -67,3 +67,4 @@ obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>
>  obj-$(CONFIG_EFI)		+= efi.o
>  obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
> +obj-$(CONFIG_COMPAT)		+= compat_vdso/
> diff --git a/arch/riscv/kernel/compat_vdso/.gitignore b/arch/riscv/kernel/compat_vdso/.gitignore
> new file mode 100644
> index 000000000000..19d83d846c1e
> --- /dev/null
> +++ b/arch/riscv/kernel/compat_vdso/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +compat_vdso.lds
> diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
> new file mode 100644
> index 000000000000..7bbbbf94307f
> --- /dev/null
> +++ b/arch/riscv/kernel/compat_vdso/Makefile
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
> +# the inclusion of generic Makefile.
> +ARCH_REL_TYPE_ABS := R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
> +include $(srctree)/lib/vdso/Makefile
> +# Symbols present in the compat_vdso
> +compat_vdso-syms  = rt_sigreturn
> +compat_vdso-syms += getcpu
> +compat_vdso-syms += flush_icache
> +
> +# Files to link into the compat_vdso
> +obj-compat_vdso = $(patsubst %, %.o, $(compat_vdso-syms)) note.o
> +
> +ccflags-y := -fno-stack-protector
> +
> +# Build rules
> +targets := $(obj-compat_vdso) compat_vdso.so compat_vdso.so.dbg compat_vdso.lds
> +obj-compat_vdso := $(addprefix $(obj)/, $(obj-compat_vdso))
> +
> +obj-y += compat_vdso.o
> +CPPFLAGS_compat_vdso.lds += -P -C -U$(ARCH)
> +
> +# Disable profiling and instrumentation for VDSO code
> +GCOV_PROFILE := n
> +KCOV_INSTRUMENT := n
> +KASAN_SANITIZE := n
> +UBSAN_SANITIZE := n
> +
> +# Force dependency
> +$(obj)/compat_vdso.o: $(obj)/compat_vdso.so
> +
> +# link rule for the .so file, .lds has to be first
> +$(obj)/compat_vdso.so.dbg: $(obj)/compat_vdso.lds $(obj-compat_vdso) FORCE
> +	$(call if_changed,compat_vdsold)
> +LDFLAGS_compat_vdso.so.dbg = -shared -S -soname=linux-compat_vdso.so.1 \
> +	--build-id=sha1 --hash-style=both --eh-frame-hdr
> +
> +# strip rule for the .so file
> +$(obj)/%.so: OBJCOPYFLAGS := -S
> +$(obj)/%.so: $(obj)/%.so.dbg FORCE
> +	$(call if_changed,objcopy)
> +
> +# Generate VDSO offsets using helper script
> +gen-compat_vdsosym := $(srctree)/$(src)/gen_compat_vdso_offsets.sh
> +quiet_cmd_compat_vdsosym = VDSOSYM $@
> +	cmd_compat_vdsosym = $(NM) $< | $(gen-compat_vdsosym) | LC_ALL=C sort > $@
> +
> +include/generated/compat_vdso-offsets.h: $(obj)/compat_vdso.so.dbg FORCE
> +	$(call if_changed,compat_vdsosym)
> +
> +# actual build commands
> +# The DSO images are built using a special linker script
> +# Make sure only to export the intended __compat_vdso_xxx symbol offsets.
> +quiet_cmd_compat_vdsold = VDSOLD  $@
> +      cmd_compat_vdsold = $(LD) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
> +                   $(OBJCOPY) $(patsubst %, -G __compat_vdso_%, $(compat_vdso-syms)) $@.tmp $@ && \
> +                   rm $@.tmp
> +
> +# install commands for the unstripped file
> +quiet_cmd_compat_vdso_install = INSTALL $@
> +      cmd_compat_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/compat_vdso/$@
> +
> +compat_vdso.so: $(obj)/compat_vdso.so.dbg
> +	@mkdir -p $(MODLIB)/compat_vdso
> +	$(call cmd,compat_vdso_install)
> +
> +compat_vdso_install: compat_vdso.so
> diff --git a/arch/riscv/kernel/compat_vdso/compat_vdso.S b/arch/riscv/kernel/compat_vdso/compat_vdso.S
> new file mode 100644
> index 000000000000..fea4a8b0c45d
> --- /dev/null
> +++ b/arch/riscv/kernel/compat_vdso/compat_vdso.S
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#define	vdso_start	compat_vdso_start
> +#define	vdso_end	compat_vdso_end
> +
> +#define	__VDSO_PATH	"arch/riscv/kernel/compat_vdso/compat_vdso.so"
> +
> +#include <../vdso/vdso.S>
> diff --git a/arch/riscv/kernel/compat_vdso/compat_vdso.lds.S b/arch/riscv/kernel/compat_vdso/compat_vdso.lds.S
> new file mode 100644
> index 000000000000..02a9ec5dc7f6
> --- /dev/null
> +++ b/arch/riscv/kernel/compat_vdso/compat_vdso.lds.S
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <../vdso/vdso.lds.S>
> diff --git a/arch/riscv/kernel/compat_vdso/flush_icache.S b/arch/riscv/kernel/compat_vdso/flush_icache.S
> new file mode 100644
> index 000000000000..88e21a84a974
> --- /dev/null
> +++ b/arch/riscv/kernel/compat_vdso/flush_icache.S
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <../vdso/flush_icache.S>
> diff --git a/arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh b/arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
> new file mode 100755
> index 000000000000..8ac070c783b3
> --- /dev/null
> +++ b/arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +LC_ALL=C
> +sed -n -e 's/^[0]\+\(0[0-9a-fA-F]*\) . \(__vdso_[a-zA-Z0-9_]*\)$/\#define compat\2_offset\t0x\1/p'
> diff --git a/arch/riscv/kernel/compat_vdso/getcpu.S b/arch/riscv/kernel/compat_vdso/getcpu.S
> new file mode 100644
> index 000000000000..946449a15a94
> --- /dev/null
> +++ b/arch/riscv/kernel/compat_vdso/getcpu.S
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <../vdso/getcpu.S>
> diff --git a/arch/riscv/kernel/compat_vdso/note.S b/arch/riscv/kernel/compat_vdso/note.S
> new file mode 100644
> index 000000000000..67c50898b8e5
> --- /dev/null
> +++ b/arch/riscv/kernel/compat_vdso/note.S
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <../vdso/note.S>
> diff --git a/arch/riscv/kernel/compat_vdso/rt_sigreturn.S b/arch/riscv/kernel/compat_vdso/rt_sigreturn.S
> new file mode 100644
> index 000000000000..f4c98f18c053
> --- /dev/null
> +++ b/arch/riscv/kernel/compat_vdso/rt_sigreturn.S
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <../vdso/rt_sigreturn.S>
> diff --git a/arch/riscv/kernel/vdso/vdso.S b/arch/riscv/kernel/vdso/vdso.S
> index df222245be05..83f1c899e8d8 100644
> --- a/arch/riscv/kernel/vdso/vdso.S
> +++ b/arch/riscv/kernel/vdso/vdso.S
> @@ -7,12 +7,16 @@
>  #include <linux/linkage.h>
>  #include <asm/page.h>
>
> +#ifndef __VDSO_PATH
> +#define __VDSO_PATH "arch/riscv/kernel/vdso/vdso.so"
> +#endif
> +
>  	__PAGE_ALIGNED_DATA
>
>  	.globl vdso_start, vdso_end
>  	.balign PAGE_SIZE
>  vdso_start:
> -	.incbin "arch/riscv/kernel/vdso/vdso.so"
> +	.incbin __VDSO_PATH
>  	.balign PAGE_SIZE
>  vdso_end:

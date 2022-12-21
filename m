Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A66539ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 00:52:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ncqxp3gpnz3c6H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 10:52:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OwGD5+m2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=maskray@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OwGD5+m2;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ncqwq61snz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 10:51:54 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id fy4so230865pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 15:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aRolca1xLJYStXB4O+QjEQI7hBejIakh3i9Q1ikiuAU=;
        b=OwGD5+m2wcB5oZr3QQy4jQh4vye04wDMOltND8p76SrMT+vKiFD6FYB6L03PDrcIWk
         wJ/QQShugUcQKxUrdAB6BoRTqMWW5TZ/RiQM4DHgAN0p/uBL9bJSbY9a/TivzJ2DLJIr
         7KxPEPusddga+MyaPsRjLxb3qzj/El+ZGQ8QqrxAhk9WWtQchNYOzaOer7JRKMlOlWYf
         bY4OZabUVBlIF7KYhvxhRhJSlqIsobu9eXFKDaR/yqHIiKTTOffW2puHpx/yWO237nfw
         6/2LGqYQ56ON3yJufIpCvnKrE15uq5FdlkLgviTDPZn23sSuoJ/oLIAGUmvs/83qqbNm
         dtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRolca1xLJYStXB4O+QjEQI7hBejIakh3i9Q1ikiuAU=;
        b=slmbE9oGnSnNBGIPoaj2xEnqCcwos1YFLbom0LyQ8z+JoA+Xcf50MS28iH8offmHM2
         YOh3Wa5JUMHeibQti5veVEetWjvGheb+MkYD6n1+DTEjHgFGBQP0lCYtbyVmFOl3qOYo
         oIt0EUwz9Kf8uCRDx2cTculoR/Lug3U8uUwiyZIw1LKa+lRNap+GoqlDmhYQfzU8y537
         UALC74ebKslDsNwedvpAf7nUubEfsE8JP2N5QgWPjXHcndP0z6+wSGMr6Bm1qhTOKo1a
         hTYVtYgCiVh0pjiFizxvLY53nikXC2+iVYUdT/eT8w1bPmFJKhHlWqjPglq7//KnI/ng
         oTng==
X-Gm-Message-State: AFqh2kpSN4Qmqznr+Dt5yz9T6zrDRVJh9pRRObUMCBaHCQUnzFrcC+Pq
	BGlgSF+Mqa+SIyqxL0761ARQBQ==
X-Google-Smtp-Source: AMrXdXtYlPG/xjTcFb+fb2sHAhxGlovOZc1Z+Aw4PiNu9XnLCiZLq6rvraXNAyFjtQZMpDZerR+EPw==
X-Received: by 2002:a17:902:d4d1:b0:189:3a04:4466 with SMTP id o17-20020a170902d4d100b001893a044466mr928493plg.2.1671666711203;
        Wed, 21 Dec 2022 15:51:51 -0800 (PST)
Received: from google.com (25.11.145.34.bc.googleusercontent.com. [34.145.11.25])
        by smtp.gmail.com with ESMTPSA id n9-20020a170902d2c900b00176b84eb29asm11994070plc.301.2022.12.21.15.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 15:51:50 -0800 (PST)
Date: Wed, 21 Dec 2022 23:51:47 +0000
From: Fangrui Song <maskray@google.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
Message-ID: <20221221235147.45lkqmosndritfpe@google.com>
References: <20220830193701.1702962-1-maskray@google.com>
 <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
 <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu>
 <20221115004625.x4wl6zbg4iiuxl5t@google.com>
 <CAFP8O3LdSJCChGEwT57e=iZopceYkBFuW9XD=yhO1ZszVZGm4g@mail.gmail.com>
 <3ec9737e-3d1a-c014-b91a-0e2d406a3b3d@csgroup.eu>
 <CAFP8O3KZTkSbxXJ2yWt4w-F3xWHY_owCs03wN3Bhss57O-E_JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAFP8O3KZTkSbxXJ2yWt4w-F3xWHY_owCs03wN3Bhss57O-E_JQ@mail.gmail.com>
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The actual intention is that no dynamic relocation exists. However, some
GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
relocations. E.g. ld's powerpc port recently fixed
https://sourceware.org/bugzilla/show_bug.cgi?id=29540) R_*_NONE are
generally no-op in the dynamic loaders. So just ignore them.

With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
not called "absolute relocations". (The patch is motivated by the arm64
port missing R_AARCH64_RELATIVE.)

Signed-off-by: Fangrui Song <maskray@google.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Change from v1:
* rebase after 8ac3b5cd3e0521d92f9755e90d140382fc292510 (lib/vdso: use "grep -E" instead of "egrep")
* change the commit message to mention an example GNU ld bug; no longer say the patch fixes a deprecated egrep use
---
  arch/arm/vdso/Makefile            |  3 ---
  arch/arm64/kernel/vdso/Makefile   |  3 ---
  arch/arm64/kernel/vdso32/Makefile |  3 ---
  arch/csky/kernel/vdso/Makefile    |  3 ---
  arch/loongarch/vdso/Makefile      |  3 ---
  arch/mips/vdso/Makefile           |  3 ---
  arch/powerpc/kernel/vdso/Makefile |  1 -
  arch/riscv/kernel/vdso/Makefile   |  3 ---
  arch/s390/kernel/vdso32/Makefile  |  2 --
  arch/s390/kernel/vdso64/Makefile  |  2 --
  arch/x86/entry/vdso/Makefile      |  4 ----
  lib/vdso/Makefile                 | 13 ++++---------
  12 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index a7ec06ce3785..e58197bba776 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -1,8 +1,5 @@
  # SPDX-License-Identifier: GPL-2.0
  
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_ARM_JUMP_SLOT|R_ARM_GLOB_DAT|R_ARM_ABS32
  include $(srctree)/lib/vdso/Makefile
  
  hostprogs := vdsomunge
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index beaf9586338f..1f2427b13410 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -6,9 +6,6 @@
  # Heavily based on the vDSO Makefiles for other archs.
  #
  
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_AARCH64_JUMP_SLOT|R_AARCH64_GLOB_DAT|R_AARCH64_ABS64
  include $(srctree)/lib/vdso/Makefile
  
  obj-vdso := vgettimeofday.o note.o sigreturn.o
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index f59bd1a4ead6..d014162c5c71 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -3,9 +3,6 @@
  # Makefile for vdso32
  #
  
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_ARM_JUMP_SLOT|R_ARM_GLOB_DAT|R_ARM_ABS32
  include $(srctree)/lib/vdso/Makefile
  
  # Same as cc-*option, but using CC_COMPAT instead of CC
diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
index 0b6909f10667..86c8c4de1b0f 100644
--- a/arch/csky/kernel/vdso/Makefile
+++ b/arch/csky/kernel/vdso/Makefile
@@ -1,8 +1,5 @@
  # SPDX-License-Identifier: GPL-2.0-only
  
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_CKCORE_ADDR32|R_CKCORE_JUMP_SLOT
  include $(srctree)/lib/vdso/Makefile
  
  # Symbols present in the vdso
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index d89e2ac75f7b..1b2e0f149f55 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -1,9 +1,6 @@
  # SPDX-License-Identifier: GPL-2.0
  # Objects to go into the VDSO.
  
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_LARCH_32|R_LARCH_64|R_LARCH_MARK_LA|R_LARCH_JUMP_SLOT
  include $(srctree)/lib/vdso/Makefile
  
  obj-vdso-y := elf.o vgetcpu.o vgettimeofday.o sigreturn.o
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 1f7d5c6c10b0..c060f3596304 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -4,9 +4,6 @@
  # Sanitizer runtimes are unavailable and cannot be linked here.
   KCSAN_SANITIZE			:= n
  
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_MIPS_JUMP_SLOT|R_MIPS_GLOB_DAT
  include $(srctree)/lib/vdso/Makefile
  
  obj-vdso-y := elf.o vgettimeofday.o sigreturn.o
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 6a977b0d8ffc..83c347e9136f 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -2,7 +2,6 @@
  
  # List of files in the vdso, has to be asm only for now
  
-ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_PPC_ADDR16|R_PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_ADDR14|R_PPC_ADDR14_BRTAKEN|R_PPC_ADDR14_BRNTAKEN|R_PPC_REL24
  include $(srctree)/lib/vdso/Makefile
  
  obj-vdso32 = sigtramp32-32.o gettimeofday-32.o datapage-32.o cacheflush-32.o note-32.o getcpu-32.o
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 06e6b27f3bcc..d85c37e11b21 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -1,9 +1,6 @@
  # SPDX-License-Identifier: GPL-2.0-only
  # Copied from arch/tile/kernel/vdso/Makefile
  
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
  include $(srctree)/lib/vdso/Makefile
  # Symbols present in the vdso
  vdso-syms  = rt_sigreturn
diff --git a/arch/s390/kernel/vdso32/Makefile b/arch/s390/kernel/vdso32/Makefile
index 245bddfe9bc0..e795fdbbf484 100644
--- a/arch/s390/kernel/vdso32/Makefile
+++ b/arch/s390/kernel/vdso32/Makefile
@@ -2,8 +2,6 @@
  # List of files in the vdso
  
  KCOV_INSTRUMENT := n
-ARCH_REL_TYPE_ABS := R_390_COPY|R_390_GLOB_DAT|R_390_JMP_SLOT|R_390_RELATIVE
-ARCH_REL_TYPE_ABS += R_390_GOT|R_390_PLT
  
  include $(srctree)/lib/vdso/Makefile
  obj-vdso32 = vdso_user_wrapper-32.o note-32.o
diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
index 9e2b95a222a9..47dbbfdfad68 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -2,8 +2,6 @@
  # List of files in the vdso
  
  KCOV_INSTRUMENT := n
-ARCH_REL_TYPE_ABS := R_390_COPY|R_390_GLOB_DAT|R_390_JMP_SLOT|R_390_RELATIVE
-ARCH_REL_TYPE_ABS += R_390_GOT|R_390_PLT
  
  include $(srctree)/lib/vdso/Makefile
  obj-vdso64 = vdso_user_wrapper.o note.o
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 838613ac15b8..b292c24acb8e 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -3,10 +3,6 @@
  # Building vDSO images for x86.
  #
  
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_X86_64_JUMP_SLOT|R_X86_64_GLOB_DAT|R_X86_64_RELATIVE|
-ARCH_REL_TYPE_ABS += R_386_GLOB_DAT|R_386_JMP_SLOT|R_386_RELATIVE
  include $(srctree)/lib/vdso/Makefile
  
  # Sanitizer runtimes are unavailable and cannot be linked here.
diff --git a/lib/vdso/Makefile b/lib/vdso/Makefile
index e814061d6aa0..9f031eafc465 100644
--- a/lib/vdso/Makefile
+++ b/lib/vdso/Makefile
@@ -5,18 +5,13 @@ GENERIC_VDSO_DIR := $(dir $(GENERIC_VDSO_MK_PATH))
  
  c-gettimeofday-$(CONFIG_GENERIC_GETTIMEOFDAY) := $(addprefix $(GENERIC_VDSO_DIR), gettimeofday.c)
  
-# This cmd checks that the vdso library does not contain absolute relocation
+# This cmd checks that the vdso library does not contain dynamic relocations.
  # It has to be called after the linking of the vdso library and requires it
  # as a parameter.
  #
-# $(ARCH_REL_TYPE_ABS) is defined in the arch specific makefile and corresponds
-# to the absolute relocation types printed by "objdump -R" and accepted by the
-# dynamic linker.
-ifndef ARCH_REL_TYPE_ABS
-$(error ARCH_REL_TYPE_ABS is not set)
-endif
-
+# As a workaround for some GNU ld ports which produce unneeded R_*_NONE
+# dynamic relocations, ignore R_*_NONE.
  quiet_cmd_vdso_check = VDSOCHK $@
-      cmd_vdso_check = if $(OBJDUMP) -R $@ | grep -E -h "$(ARCH_REL_TYPE_ABS)"; \
+      cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
  		       then (echo >&2 "$@: dynamic relocations are not supported"; \
  			     rm -f $@; /bin/false); fi
-- 
2.39.0.314.g84b9a713c41-goog


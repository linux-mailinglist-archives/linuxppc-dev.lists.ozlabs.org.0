Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A598935B458
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 14:53:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJBcC1HhZz3byW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 22:52:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=kjqVhb62;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.90;
 helo=conssluserg-05.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=kjqVhb62; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJBbk6GMcz302H
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 22:52:34 +1000 (AEST)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 13BCq9Zr001655
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 21:52:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 13BCq9Zr001655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1618145530;
 bh=KysGK8ii+KjNMVGt48jKTBvOxWm5/Buxc9UMo0jZoFo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kjqVhb62z5+/DtDzgBw2Ts5dZYSXO93tpvFUclhBH1BdDQodq9OwdS+1FOyaJ5EG1
 0jMKJx6VEJJLYsJYjkyeOq/VRJQBhDePeNn+oOuMBczu69CfcNtrSuZMhkP8P9K3qj
 1ks3ISt07eFaqMg0H/jv4rWkyo+ySWhS4YqpE04AjyfZ+5Dsi3J1Mewzg28mIq55Qs
 H7hcaY28kjtVrMBdXsXk69OHd12j4XDvlEa+lxpJAQAA2q+6TG3bagUSTES2qdQCQh
 nb4b8GQRVFGBoXou0jLTldeHdIJTonPebLxabUfXsT979MCrMvhkqJjZ31McZTBm1/
 PTh819ezYZYCQ==
X-Nifty-SrcIP: [209.85.215.179]
Received: by mail-pg1-f179.google.com with SMTP id w10so7280855pgh.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 05:52:09 -0700 (PDT)
X-Gm-Message-State: AOAM532gscWl8kLHcppQzx51bT34qHJcg3arbGrVvxA63hUWUjF52A2o
 0V0k4FVdmKggqJC9/Il2ioaAzkLX1lKpsrU0GTQ=
X-Google-Smtp-Source: ABdhPJw9I2+YhS5Pf4UUWoDElp1ktj7We1LdFeVFiGQtC8pyYagcQUpA/NBCwoLwG3cOGVunk55XIA4AqC1FT1Qnxu4=
X-Received: by 2002:a63:e044:: with SMTP id n4mr11279209pgj.47.1618145529032; 
 Sun, 11 Apr 2021 05:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210301153019.362742-1-masahiroy@kernel.org>
In-Reply-To: <20210301153019.362742-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 11 Apr 2021 21:51:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNATUgS+5Qo8hWizQUtFWx7Fqst48qETz0fRQjTKPP5FuxQ@mail.gmail.com>
Message-ID: <CAK7LNATUgS+5Qo8hWizQUtFWx7Fqst48qETz0fRQjTKPP5FuxQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc: syscalls: switch to generic syscalltbl.sh
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>, Sean Christopherson <seanjc@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Ben Gardon <bgardon@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Tue, Mar 2, 2021 at 12:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Many architectures duplicate similar shell scripts.
>
> This commit converts powerpc to use scripts/syscalltbl.sh. This also
> unifies syscall_table_32.h and syscall_table_c32.h.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Could you check this series?

Thanks.
Masahiro


> ---
>
>  arch/powerpc/include/asm/Kbuild             |  1 -
>  arch/powerpc/kernel/syscalls/Makefile       | 22 +++----------
>  arch/powerpc/kernel/syscalls/syscalltbl.sh  | 36 ---------------------
>  arch/powerpc/kernel/systbl.S                |  5 ++-
>  arch/powerpc/platforms/cell/spu_callbacks.c |  2 +-
>  5 files changed, 10 insertions(+), 56 deletions(-)
>  delete mode 100644 arch/powerpc/kernel/syscalls/syscalltbl.sh
>
> diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
> index e1f9b4ea1c53..bcf95ce0964f 100644
> --- a/arch/powerpc/include/asm/Kbuild
> +++ b/arch/powerpc/include/asm/Kbuild
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  generated-y += syscall_table_32.h
>  generated-y += syscall_table_64.h
> -generated-y += syscall_table_c32.h
>  generated-y += syscall_table_spu.h
>  generic-y += export.h
>  generic-y += kvm_types.h
> diff --git a/arch/powerpc/kernel/syscalls/Makefile b/arch/powerpc/kernel/syscalls/Makefile
> index 9e3be295dbba..df21c731c806 100644
> --- a/arch/powerpc/kernel/syscalls/Makefile
> +++ b/arch/powerpc/kernel/syscalls/Makefile
> @@ -7,7 +7,7 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')       \
>
>  syscall := $(src)/syscall.tbl
>  syshdr := $(srctree)/$(src)/syscallhdr.sh
> -systbl := $(srctree)/$(src)/syscalltbl.sh
> +systbl := $(srctree)/scripts/syscalltbl.sh
>
>  quiet_cmd_syshdr = SYSHDR  $@
>        cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'       \
> @@ -16,10 +16,7 @@ quiet_cmd_syshdr = SYSHDR  $@
>                    '$(syshdr_offset_$(basetarget))'
>
>  quiet_cmd_systbl = SYSTBL  $@
> -      cmd_systbl = $(CONFIG_SHELL) '$(systbl)' '$<' '$@'       \
> -                  '$(systbl_abis_$(basetarget))'               \
> -                  '$(systbl_abi_$(basetarget))'                \
> -                  '$(systbl_offset_$(basetarget))'
> +      cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis $(abis) $< $@
>
>  syshdr_abis_unistd_32 := common,nospu,32
>  $(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
> @@ -29,30 +26,21 @@ syshdr_abis_unistd_64 := common,nospu,64
>  $(uapi)/unistd_64.h: $(syscall) $(syshdr) FORCE
>         $(call if_changed,syshdr)
>
> -systbl_abis_syscall_table_32 := common,nospu,32
> -systbl_abi_syscall_table_32 := 32
> +$(kapi)/syscall_table_32.h: abis := common,nospu,32
>  $(kapi)/syscall_table_32.h: $(syscall) $(systbl) FORCE
>         $(call if_changed,systbl)
>
> -systbl_abis_syscall_table_64 := common,nospu,64
> -systbl_abi_syscall_table_64 := 64
> +$(kapi)/syscall_table_64.h: abis := common,nospu,64
>  $(kapi)/syscall_table_64.h: $(syscall) $(systbl) FORCE
>         $(call if_changed,systbl)
>
> -systbl_abis_syscall_table_c32 := common,nospu,32
> -systbl_abi_syscall_table_c32 := c32
> -$(kapi)/syscall_table_c32.h: $(syscall) $(systbl) FORCE
> -       $(call if_changed,systbl)
> -
> -systbl_abis_syscall_table_spu := common,spu
> -systbl_abi_syscall_table_spu := spu
> +$(kapi)/syscall_table_spu.h: abis := common,spu
>  $(kapi)/syscall_table_spu.h: $(syscall) $(systbl) FORCE
>         $(call if_changed,systbl)
>
>  uapisyshdr-y           += unistd_32.h unistd_64.h
>  kapisyshdr-y           += syscall_table_32.h           \
>                            syscall_table_64.h           \
> -                          syscall_table_c32.h          \
>                            syscall_table_spu.h
>
>  uapisyshdr-y   := $(addprefix $(uapi)/, $(uapisyshdr-y))
> diff --git a/arch/powerpc/kernel/syscalls/syscalltbl.sh b/arch/powerpc/kernel/syscalls/syscalltbl.sh
> deleted file mode 100644
> index f7393a7b18aa..000000000000
> --- a/arch/powerpc/kernel/syscalls/syscalltbl.sh
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -
> -in="$1"
> -out="$2"
> -my_abis=`echo "($3)" | tr ',' '|'`
> -my_abi="$4"
> -offset="$5"
> -
> -emit() {
> -       t_nxt="$1"
> -       t_nr="$2"
> -       t_entry="$3"
> -
> -       while [ $t_nxt -lt $t_nr ]; do
> -               printf "__SYSCALL(%s,sys_ni_syscall)\n" "${t_nxt}"
> -               t_nxt=$((t_nxt+1))
> -       done
> -       printf "__SYSCALL(%s,%s)\n" "${t_nxt}" "${t_entry}"
> -}
> -
> -grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
> -       nxt=0
> -       if [ -z "$offset" ]; then
> -               offset=0
> -       fi
> -
> -       while read nr abi name entry compat ; do
> -               if [ "$my_abi" = "c32" ] && [ ! -z "$compat" ]; then
> -                       emit $((nxt+offset)) $((nr+offset)) $compat
> -               else
> -                       emit $((nxt+offset)) $((nr+offset)) $entry
> -               fi
> -               nxt=$((nr+1))
> -       done
> -) > "$out"
> diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.S
> index d34276f3c495..cb3358886203 100644
> --- a/arch/powerpc/kernel/systbl.S
> +++ b/arch/powerpc/kernel/systbl.S
> @@ -21,6 +21,7 @@
>  #define __SYSCALL(nr, entry)   .long entry
>  #endif
>
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)      __SYSCALL(nr, native)
>  .globl sys_call_table
>  sys_call_table:
>  #ifdef CONFIG_PPC64
> @@ -30,8 +31,10 @@ sys_call_table:
>  #endif
>
>  #ifdef CONFIG_COMPAT
> +#undef __SYSCALL_WITH_COMPAT
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)      __SYSCALL(nr, compat)
>  .globl compat_sys_call_table
>  compat_sys_call_table:
>  #define compat_sys_sigsuspend  sys_sigsuspend
> -#include <asm/syscall_table_c32.h>
> +#include <asm/syscall_table_32.h>
>  #endif
> diff --git a/arch/powerpc/platforms/cell/spu_callbacks.c b/arch/powerpc/platforms/cell/spu_callbacks.c
> index abdef9bcf432..fe0d8797a00a 100644
> --- a/arch/powerpc/platforms/cell/spu_callbacks.c
> +++ b/arch/powerpc/platforms/cell/spu_callbacks.c
> @@ -35,9 +35,9 @@
>   */
>
>  static void *spu_syscall_table[] = {
> +#define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
>  #define __SYSCALL(nr, entry) [nr] = entry,
>  #include <asm/syscall_table_spu.h>
> -#undef __SYSCALL
>  };
>
>  long spu_sys_callback(struct spu_syscall_block *s)
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada

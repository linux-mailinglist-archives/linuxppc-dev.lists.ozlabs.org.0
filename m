Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF9D307E92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 20:07:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRVN91khNzDsMP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 06:07:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=WKvya4Bn; 
 dkim-atps=neutral
X-Greylist: delayed 458 seconds by postgrey-1.36 at bilbo;
 Fri, 29 Jan 2021 06:05:55 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRVLC31hPzDrgJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 06:05:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1611860749;
 bh=zvfoTxB/oWZawXpH0SRm5ZKqx8FIDouPHHwj+K25VOQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=WKvya4BnVFis94stSaBbtvoq6ywOzkztYhhOB341vu8eDFF0RXc4n7ZCS3jyt3iDH
 n1n2+fQVcfivhqFVOhP2/G3AifoCACM6Vp9rIdXeq5p+m60ZkSc3Hgq+zGYo3wxdtV
 9Upl8rkreSrHDsv42ntP7IPElWoxyG9f7L8CLFw0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.172.59]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1l9eOb2QvA-00DKMC; Thu, 28
 Jan 2021 19:53:33 +0100
Subject: Re: [PATCH 18/27] parisc: syscalls: switch to generic syscalltbl.sh
To: Masahiro Yamada <masahiroy@kernel.org>, linux-arch@vger.kernel.org,
 x86@kernel.org
References: <20210128005110.2613902-1-masahiroy@kernel.org>
 <20210128005110.2613902-19-masahiroy@kernel.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <4f998691-73be-5bef-ecdb-d17b94110859@gmx.de>
Date: Thu, 28 Jan 2021 19:53:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210128005110.2613902-19-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KI1k4OX13Sf75xmqq+wsELU0aMx/3WqHqf/N97XLLAQisP/UTEv
 qC47b7lxfvQAEi2c0FnJ3dDzzyA1ZPV9a2VAwfi8V7JeESK2TURr3IwtJTVCx08p1MaDKhs
 CzGmw3z2TzIfwqsChpgWNbORV7QEFthQ65SabKOaErE7HBoS1787G52za9UkLCfiEkOLJVn
 4fcGlE3a8zy0MZGxK27cg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R28GwRgoj4w=:rTlderX8z2KjzWnPXFllAb
 07R0UvWbBAYpzRttt2WEk0XXJ3nHPYTYD2zKpPkkwaPmO4e6yc28coORiSxvj37zaAQaNbHB8
 M7tYlcBHfGoBF/Ql6vAyVMlTj6khsZlJJLKk2nh0osBN0SpgBwZW/wxRmMH3ustydv+CrNkuV
 fy+1juHd8UVitlyqPDqYUijeu/9fp4La6M2ndrMHueM4zWDVTRcHms85EXnLwM+h1TmSbbI2r
 yd4HR4rJweGyrGXTdJcVrRkpud8tLUQE06Glguflyayanv0HTOfPjRJx0vK6ccXc8PavA24jF
 V/VCy/+55CSrytreXZzFozcvBFujv0iefydZFtzY0YkAosVleO7E3ni9YtY2V+prMKS/zk3WB
 iZsiiDCmxFWXEbJbgFar0Sc/MZevvhfGZdNmpzg13AcdV/PMvDYDHWz9+NhWJE7nTgSVZm4Ts
 McNUYDNFB41/ZooB+zK84V1ZqWYkLHovCnoR1cj9c13SFiWDr1AXRO1JvnpcY61r8zjCQ1yjM
 NT0Fb5buVbKCGTdlMzQwfMtg47XFaop5xK2vBZPqMcG88ix4dpqPgjgY4TPrXaxeDHdAhMVp5
 CSedoMvhu4UaSyGevQJoBICFDdqBVguWBvvQ1YxDeZ9BnBbjLuD2VmuI/0xsBGSQyvnHeaGcB
 hvvT31fhGeW90qNGdW4VLk5A4whEAZgbNrDNQeH2P/MEmPNrZOI9/WXszpZDJYnrw6+ZVGmzy
 pZHjz5s6iFlJuekS3exD5XQcG4lxcHAI2w8Lk4fboTYqqumo/Nh8Ic0YZhNsSnQLif7eapwyN
 1BAZ5D/URI6XQBk07b1TjtHscevt+UrTWeE4qSQOzqsEe1DwMN4MOUclSJoeQWk9pl2U5uI8z
 1O7d861D6Xx74JyY74PQ==
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
Cc: linux-xtensa@linux-xtensa.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/28/21 1:51 AM, Masahiro Yamada wrote:
> As of v5.11-rc1, 12 architectures duplicate similar shell scripts in
> order to generate syscall table headers. My goal is to unify them into
> the single scripts/syscalltbl.sh.
>
> This commit converts parisc to use scripts/syscalltbl.sh. This also
> unifies syscall_table_64.h and syscall_table_c32.h.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the cleanup!

You may add:
Acked-by: Helge Deller <deller@gmx.de> # parisc

Helge

> ---
>
>  arch/parisc/include/asm/Kbuild            |  1 -
>  arch/parisc/kernel/syscall.S              | 16 +++++-----
>  arch/parisc/kernel/syscalls/Makefile      | 19 ++++--------
>  arch/parisc/kernel/syscalls/syscalltbl.sh | 36 -----------------------
>  4 files changed, 12 insertions(+), 60 deletions(-)
>  delete mode 100644 arch/parisc/kernel/syscalls/syscalltbl.sh
>
> diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kb=
uild
> index 4406475a2304..e6e7f74c8ac9 100644
> --- a/arch/parisc/include/asm/Kbuild
> +++ b/arch/parisc/include/asm/Kbuild
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  generated-y +=3D syscall_table_32.h
>  generated-y +=3D syscall_table_64.h
> -generated-y +=3D syscall_table_c32.h
>  generic-y +=3D kvm_para.h
>  generic-y +=3D mcs_spinlock.h
>  generic-y +=3D user.h
> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> index 322503780db6..3f24a0af1e04 100644
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -919,24 +919,24 @@ ENTRY(lws_table)
>  END(lws_table)
>  	/* End of lws table */
>
> +#ifdef CONFIG_64BIT
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
> +#else
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
> +#endif
>  #define __SYSCALL(nr, entry)	ASM_ULONG_INSN entry
>  	.align 8
>  ENTRY(sys_call_table)
>  	.export sys_call_table,data
> -#ifdef CONFIG_64BIT
> -#include <asm/syscall_table_c32.h>   /* Compat syscalls */
> -#else
> -#include <asm/syscall_table_32.h>    /* 32-bit native syscalls */
> -#endif
> +#include <asm/syscall_table_32.h>    /* 32-bit syscalls */
>  END(sys_call_table)
>
>  #ifdef CONFIG_64BIT
>  	.align 8
>  ENTRY(sys_call_table64)
> -#include <asm/syscall_table_64.h>    /* 64-bit native syscalls */
> +#include <asm/syscall_table_64.h>    /* 64-bit syscalls */
>  END(sys_call_table64)
>  #endif
> -#undef __SYSCALL
>
>  	/*
>  		All light-weight-syscall atomic operations
> @@ -961,5 +961,3 @@ END(lws_lock_start)
>  	.previous
>
>  .end
> -
> -
> diff --git a/arch/parisc/kernel/syscalls/Makefile b/arch/parisc/kernel/s=
yscalls/Makefile
> index 556fe30a6c8f..77fea5beb9be 100644
> --- a/arch/parisc/kernel/syscalls/Makefile
> +++ b/arch/parisc/kernel/syscalls/Makefile
> @@ -7,7 +7,7 @@ _dummy :=3D $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi=
)')	\
>
>  syscall :=3D $(srctree)/$(src)/syscall.tbl
>  syshdr :=3D $(srctree)/$(src)/syscallhdr.sh
> -systbl :=3D $(srctree)/$(src)/syscalltbl.sh
> +systbl :=3D $(srctree)/scripts/syscalltbl.sh
>
>  quiet_cmd_syshdr =3D SYSHDR  $@
>        cmd_syshdr =3D $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'	\
> @@ -16,10 +16,7 @@ quiet_cmd_syshdr =3D SYSHDR  $@
>  		   '$(syshdr_offset_$(basetarget))'
>
>  quiet_cmd_systbl =3D SYSTBL  $@
> -      cmd_systbl =3D $(CONFIG_SHELL) '$(systbl)' '$<' '$@'	\
> -		   '$(systbl_abis_$(basetarget))'		\
> -		   '$(systbl_abi_$(basetarget))'		\
> -		   '$(systbl_offset_$(basetarget))'
> +      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) $< $@ $(abis)
>
>  syshdr_abis_unistd_32 :=3D common,32
>  $(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
> @@ -29,23 +26,17 @@ syshdr_abis_unistd_64 :=3D common,64
>  $(uapi)/unistd_64.h: $(syscall) $(syshdr) FORCE
>  	$(call if_changed,syshdr)
>
> -systbl_abis_syscall_table_32 :=3D common,32
> +$(kapi)/syscall_table_32.h: abis :=3D common,32
>  $(kapi)/syscall_table_32.h: $(syscall) $(systbl) FORCE
>  	$(call if_changed,systbl)
>
> -systbl_abis_syscall_table_64 :=3D common,64
> +$(kapi)/syscall_table_64.h: abis :=3D common,64
>  $(kapi)/syscall_table_64.h: $(syscall) $(systbl) FORCE
>  	$(call if_changed,systbl)
>
> -systbl_abis_syscall_table_c32 :=3D common,32
> -systbl_abi_syscall_table_c32 :=3D c32
> -$(kapi)/syscall_table_c32.h: $(syscall) $(systbl) FORCE
> -	$(call if_changed,systbl)
> -
>  uapisyshdr-y		+=3D unistd_32.h unistd_64.h
>  kapisyshdr-y		+=3D syscall_table_32.h		\
> -			   syscall_table_64.h		\
> -			   syscall_table_c32.h
> +			   syscall_table_64.h
>
>  uapisyshdr-y	:=3D $(addprefix $(uapi)/, $(uapisyshdr-y))
>  kapisyshdr-y	:=3D $(addprefix $(kapi)/, $(kapisyshdr-y))
> diff --git a/arch/parisc/kernel/syscalls/syscalltbl.sh b/arch/parisc/ker=
nel/syscalls/syscalltbl.sh
> deleted file mode 100644
> index f7393a7b18aa..000000000000
> --- a/arch/parisc/kernel/syscalls/syscalltbl.sh
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -
> -in=3D"$1"
> -out=3D"$2"
> -my_abis=3D`echo "($3)" | tr ',' '|'`
> -my_abi=3D"$4"
> -offset=3D"$5"
> -
> -emit() {
> -	t_nxt=3D"$1"
> -	t_nr=3D"$2"
> -	t_entry=3D"$3"
> -
> -	while [ $t_nxt -lt $t_nr ]; do
> -		printf "__SYSCALL(%s,sys_ni_syscall)\n" "${t_nxt}"
> -		t_nxt=3D$((t_nxt+1))
> -	done
> -	printf "__SYSCALL(%s,%s)\n" "${t_nxt}" "${t_entry}"
> -}
> -
> -grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
> -	nxt=3D0
> -	if [ -z "$offset" ]; then
> -		offset=3D0
> -	fi
> -
> -	while read nr abi name entry compat ; do
> -		if [ "$my_abi" =3D "c32" ] && [ ! -z "$compat" ]; then
> -			emit $((nxt+offset)) $((nr+offset)) $compat
> -		else
> -			emit $((nxt+offset)) $((nr+offset)) $entry
> -		fi
> -		nxt=3D$((nr+1))
> -	done
> -) > "$out"
>


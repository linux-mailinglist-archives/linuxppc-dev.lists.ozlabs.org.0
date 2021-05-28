Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499B9394146
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 12:41:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fs1Sm2p1gz3060
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 20:41:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=205.139.111.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 307 seconds by postgrey-1.36 at boromir;
 Fri, 28 May 2021 20:41:07 AEST
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fs1SM4fKSz2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 20:41:07 +1000 (AEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-Ps_qvJW5N_eb3aGhV2t7Vg-1; Fri, 28 May 2021 06:34:40 -0400
X-MC-Unique: Ps_qvJW5N_eb3aGhV2t7Vg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CAC8800D55;
 Fri, 28 May 2021 10:34:38 +0000 (UTC)
Received: from bahia.lan (ovpn-112-128.ams2.redhat.com [10.36.112.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1FB56E419;
 Fri, 28 May 2021 10:34:36 +0000 (UTC)
Date: Fri, 28 May 2021 12:34:35 +0200
From: Greg Kurz <groug@kaod.org>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH] Revert "powerpc: Switch to relative jump labels"
Message-ID: <20210528123435.04e475de@bahia.lan>
In-Reply-To: <20210528012943.23192-1-r.bolshakov@yadro.com>
References: <20210528012943.23192-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Anastasia Kovaleva <a.kovaleva@yadro.com>, linux@yadro.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 May 2021 04:29:43 +0300
Roman Bolshakov <r.bolshakov@yadro.com> wrote:

> This reverts commit b0b3b2c78ec075cec4721986a95abbbac8c3da4f.
>=20
> Otherwise, direct kernel boot with initramfs no longer works in QEMU.
> It's broken in some bizarre way because a valid initramfs is not
> recognized anymore:
>=20
>   Found initrd at 0xc000000001f70000:0xc000000003d61d64
>   rootfs image is not initramfs (XZ-compressed data is corrupt); looks li=
ke an initrd
>=20
> The issue is observed on v5.13-rc3 if the kernel is built with
> defconfig, GCC 7.5.0 and GNU ld 2.32.0.
>=20
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reported-by: Anastasia Kovaleva <a.kovaleva@yadro.com>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---

I'm observing the very same issue and reverting the offending commit
fixes it indeed. Until someone has investigated the root cause, this
looks like a reasonable bug fix to me.

Reviewed-by: Greg Kurz <groug@kaod.org>

and

Tested-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/Kconfig                  |  1 -
>  arch/powerpc/include/asm/jump_label.h | 21 +++++++++++++++------
>  arch/powerpc/kernel/jump_label.c      |  4 ++--
>  3 files changed, 17 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 088dd2afcfe4..59e0d55ee01d 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -189,7 +189,6 @@ config PPC
>  =09select HAVE_ARCH_HUGE_VMALLOC=09=09if HAVE_ARCH_HUGE_VMAP
>  =09select HAVE_ARCH_HUGE_VMAP=09=09if PPC_BOOK3S_64 && PPC_RADIX_MMU
>  =09select HAVE_ARCH_JUMP_LABEL
> -=09select HAVE_ARCH_JUMP_LABEL_RELATIVE
>  =09select HAVE_ARCH_KASAN=09=09=09if PPC32 && PPC_PAGE_SHIFT <=3D 14
>  =09select HAVE_ARCH_KASAN_VMALLOC=09=09if PPC32 && PPC_PAGE_SHIFT <=3D 1=
4
>  =09select HAVE_ARCH_KFENCE=09=09=09if PPC32
> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include=
/asm/jump_label.h
> index 2d5c6bec2b4f..09297ec9fa52 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -20,8 +20,7 @@ static __always_inline bool arch_static_branch(struct s=
tatic_key *key, bool bran
>  =09asm_volatile_goto("1:\n\t"
>  =09=09 "nop # arch_static_branch\n\t"
>  =09=09 ".pushsection __jump_table,  \"aw\"\n\t"
> -=09=09 ".long 1b - ., %l[l_yes] - .\n\t"
> -=09=09 JUMP_ENTRY_TYPE "%c0 - .\n\t"
> +=09=09 JUMP_ENTRY_TYPE "1b, %l[l_yes], %c0\n\t"
>  =09=09 ".popsection \n\t"
>  =09=09 : :  "i" (&((char *)key)[branch]) : : l_yes);
> =20
> @@ -35,8 +34,7 @@ static __always_inline bool arch_static_branch_jump(str=
uct static_key *key, bool
>  =09asm_volatile_goto("1:\n\t"
>  =09=09 "b %l[l_yes] # arch_static_branch_jump\n\t"
>  =09=09 ".pushsection __jump_table,  \"aw\"\n\t"
> -=09=09 ".long 1b - ., %l[l_yes] - .\n\t"
> -=09=09 JUMP_ENTRY_TYPE "%c0 - .\n\t"
> +=09=09 JUMP_ENTRY_TYPE "1b, %l[l_yes], %c0\n\t"
>  =09=09 ".popsection \n\t"
>  =09=09 : :  "i" (&((char *)key)[branch]) : : l_yes);
> =20
> @@ -45,12 +43,23 @@ static __always_inline bool arch_static_branch_jump(s=
truct static_key *key, bool
>  =09return true;
>  }
> =20
> +#ifdef CONFIG_PPC64
> +typedef u64 jump_label_t;
> +#else
> +typedef u32 jump_label_t;
> +#endif
> +
> +struct jump_entry {
> +=09jump_label_t code;
> +=09jump_label_t target;
> +=09jump_label_t key;
> +};
> +
>  #else
>  #define ARCH_STATIC_BRANCH(LABEL, KEY)=09=09\
>  1098:=09nop;=09=09=09=09=09\
>  =09.pushsection __jump_table, "aw";=09\
> -=09.long 1098b - ., LABEL - .;=09=09\
> -=09FTR_ENTRY_LONG KEY;=09=09=09\
> +=09FTR_ENTRY_LONG 1098b, LABEL, KEY;=09\
>  =09.popsection
>  #endif
> =20
> diff --git a/arch/powerpc/kernel/jump_label.c b/arch/powerpc/kernel/jump_=
label.c
> index ce87dc5ea23c..144858027fa3 100644
> --- a/arch/powerpc/kernel/jump_label.c
> +++ b/arch/powerpc/kernel/jump_label.c
> @@ -11,10 +11,10 @@
>  void arch_jump_label_transform(struct jump_entry *entry,
>  =09=09=09       enum jump_label_type type)
>  {
> -=09struct ppc_inst *addr =3D (struct ppc_inst *)jump_entry_code(entry);
> +=09struct ppc_inst *addr =3D (struct ppc_inst *)(unsigned long)entry->co=
de;
> =20
>  =09if (type =3D=3D JUMP_LABEL_JMP)
> -=09=09patch_branch(addr, jump_entry_target(entry), 0);
> +=09=09patch_branch(addr, entry->target, 0);
>  =09else
>  =09=09patch_instruction(addr, ppc_inst(PPC_INST_NOP));
>  }


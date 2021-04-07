Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF7D356B6C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 13:39:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFj9d71gqz30Qb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 21:39:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=OFB2zo1d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.66;
 helo=condef-01.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=OFB2zo1d; 
 dkim-atps=neutral
X-Greylist: delayed 169 seconds by postgrey-1.36 at boromir;
 Wed, 07 Apr 2021 21:39:25 AEST
Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FFj9973DPz302x
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 21:39:25 +1000 (AEST)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-01.nifty.com
 with ESMTP id 137BXCc3002845
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 7 Apr 2021 20:33:12 +0900
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 137BWpBV007278
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 7 Apr 2021 20:32:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 137BWpBV007278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1617795171;
 bh=YE/3jAmw6G8yCwpeiXzDgIBF5HNw+SmvWOFzgsI9ku8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OFB2zo1di8wMHF9IPuMJoFpQMSkFi6QtvaiuuJ1uO+r6HSGOoY/60HVV5/OPcpkkx
 AFYPXTBUIVE2yyvQOVBnWJs+16lHf2BM6f5yfsVT56LyibDEAkOXenWXv2mPasSEEv
 9aMZUtRtSoJMuJD7zzFW9xgwJUJ3kWQ5E2T6ZeEt++g96C2fhpWjGcQuVojzJiy+Vt
 pANcAWFI2Ir4ab+9SxV4NGYR2+FzP43iy4eDmfa5GaXwcxKtrlPo6wUlbDPnao5PoQ
 s6iHlwO85gqYD7+jSxQ8oSw382PPfTw2nsnPPmCmdj9pUhqhOB/t7GTZYLi6JaCBRu
 hFQfwWfBpMSlA==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id g35so8066539pgg.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 04:32:51 -0700 (PDT)
X-Gm-Message-State: AOAM532CbuDkmRpAF9AC6YIZ0gSKIky9lDgSJk9E/BNLyjzXI+vF6iQb
 xG5wnZvo706PlzllCGgh01QMSAQ230DUPpCF588=
X-Google-Smtp-Source: ABdhPJyX462+iXRWfux7Z4xGcPCP6UQgdQ1H4XYGHRU9N2d8fzIA6kG7uhIhickmK5JeHy1+bAt+KLzwLmX8di1BRdc=
X-Received: by 2002:a65:41c6:: with SMTP id b6mr2830311pgq.7.1617795170674;
 Wed, 07 Apr 2021 04:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
 <20210407053419.449796-17-gregkh@linuxfoundation.org>
In-Reply-To: <20210407053419.449796-17-gregkh@linuxfoundation.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 7 Apr 2021 20:32:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASUO4XTKfmatCRcGT-nBQM15ueuS6DtU98_LCbo=9NeiA@mail.gmail.com>
Message-ID: <CAK7LNASUO4XTKfmatCRcGT-nBQM15ueuS6DtU98_LCbo=9NeiA@mail.gmail.com>
Subject: Re: [PATCH 16/20] kbuild: powerpc: use common install script
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 7, 2021 at 2:34 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The common scripts/install.sh script will now work for powerpc, all that
> is needed is to add it to the list of arches that do not put the version
> number in the installed file name.
>
> After the kernel is installed, powerpc also likes to install a few
> random files, so provide the ability to do that as well.
>
> With that we can remove the powerpc-only version of the install script.
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  arch/powerpc/boot/Makefile   |  4 +--
>  arch/powerpc/boot/install.sh | 55 ------------------------------------
>  scripts/install.sh           | 14 ++++++++-
>  3 files changed, 15 insertions(+), 58 deletions(-)
>  delete mode 100644 arch/powerpc/boot/install.sh
>
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 2b8da923ceca..bbfcbd33e0b7 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -442,11 +442,11 @@ $(obj)/zImage.initrd:     $(addprefix $(obj)/, $(initrd-y))
>
>  # Only install the vmlinux
>  install: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
> -       sh -x $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)"
> +       sh -x $(srctree)/scripts/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)"
>
>  # Install the vmlinux and other built boot targets.
>  zInstall: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
> -       sh -x $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)" $^
> +       sh -x $(srctree)/scripts/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)" $^


I want comments from the ppc maintainers
because this code is already broken.


This 'zInstall' target is unreachable.

See commit c913e5f95e546d8d3a9f99ba9908f7e095cbc1fb

It added the new target 'zInstall', but it is not hooked anywhere.
It is completely useless for 6 years, and nobody has pointed it out.
So, I think nobody is caring about this broken code.

One more thing, Kbuild does not recognize it as an installation target
because the 'I' in 'zInstall' is a capital letter.

The name of the installation target must be '*install',
all letters in lower cases.






>  PHONY += install zInstall
>
> diff --git a/arch/powerpc/boot/install.sh b/arch/powerpc/boot/install.sh
> deleted file mode 100644
> index b6a256bc96ee..000000000000
> --- a/arch/powerpc/boot/install.sh
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -#!/bin/sh
> -#
> -# This file is subject to the terms and conditions of the GNU General Public
> -# License.  See the file "COPYING" in the main directory of this archive
> -# for more details.
> -#
> -# Copyright (C) 1995 by Linus Torvalds
> -#
> -# Blatantly stolen from in arch/i386/boot/install.sh by Dave Hansen
> -#
> -# "make install" script for ppc64 architecture
> -#
> -# Arguments:
> -#   $1 - kernel version
> -#   $2 - kernel image file
> -#   $3 - kernel map file
> -#   $4 - default install path (blank if root directory)
> -#   $5 and more - kernel boot files; zImage*, uImage, cuImage.*, etc.
> -#
> -
> -# Bail with error code if anything goes wrong
> -set -e
> -
> -# User may have a custom install script
> -
> -if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
> -if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"; fi
> -
> -# Default install
> -
> -# this should work for both the pSeries zImage and the iSeries vmlinux.sm
> -image_name=`basename $2`
> -
> -if [ -f $4/$image_name ]; then
> -       mv $4/$image_name $4/$image_name.old
> -fi
> -
> -if [ -f $4/System.map ]; then
> -       mv $4/System.map $4/System.old
> -fi
> -
> -cat $2 > $4/$image_name
> -cp $3 $4/System.map
> -
> -# Copy all the bootable image files
> -path=$4
> -shift 4
> -while [ $# -ne 0 ]; do
> -       image_name=`basename $1`
> -       if [ -f $path/$image_name ]; then
> -               mv $path/$image_name $path/$image_name.old
> -       fi
> -       cat $1 > $path/$image_name
> -       shift
> -done;
> diff --git a/scripts/install.sh b/scripts/install.sh
> index e0ffb95737d4..67c0a5f74af2 100644
> --- a/scripts/install.sh
> +++ b/scripts/install.sh
> @@ -67,7 +67,7 @@ fi
>  # Some architectures name their files based on version number, and
>  # others do not.  Call out the ones that do not to make it obvious.
>  case "${ARCH}" in
> -       ia64 | m68k | nios2 | x86)
> +       ia64 | m68k | nios2 | powerpc | x86)
>                 version=""
>                 ;;
>         *)
> @@ -93,6 +93,18 @@ case "${ARCH}" in
>                         /usr/sbin/elilo
>                 fi
>                 ;;
> +       powerpc)
> +               # powerpc installation can list other boot targets after the
> +               # install path that should be copied to the correct location


Perhaps, we can remove this if the ppc maintainers approve it ?




> +               path=$4
> +               shift 4
> +               while [ $# -ne 0 ]; do
> +                       image_name=$(basename "$1")
> +                       install "$1" "$path"/"$image_name"
> +                       shift
> +               done;
> +               sync
> +               ;;
>         x86)
>                 if [ -x /sbin/lilo ]; then
>                         /sbin/lilo
> --
> 2.31.1
>


--
Best Regards
Masahiro Yamada

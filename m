Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AE451644B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 May 2022 13:58:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Krl9D0GRPz3bpj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 May 2022 21:58:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rfnAWHao;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Krl8Y4ftRz2xSh
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 May 2022 21:57:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rfnAWHao; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Krl8S2W6kz4xXh;
 Sun,  1 May 2022 21:57:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651406250;
 bh=KLrQiQd2hh/CdsUpLpsJ9wNQAuRET+XGyyixHfrk344=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rfnAWHaonFRnz6CX4sVxw3eZHjjOz4D9N7EJqBE1ipI7gaFq+MUEydrsMMkNN1XV3
 aSEu6GrtTP7fWb/wAdUbvPPqmF/Rz2J822VD/S253BRxJhKZ1XVsebbSA1zb7wE+S2
 OyKD6NReOSJoK/gmlrYpe8wMbvtLHHfzP/l++wJw7op30vjeDgZOS3wgbCsTt/+tFo
 SOb4M9LlHKENd+ypDOthi3jm1q92QnsgQ6kbrn3/slh7+IBtUoWOmTgj1uO40abV8t
 Gso3VDnoPCz7g2IkVuRgEO51oqRPkePXa/ZSKZ9dun4rFMc5uTCSXqLJ96/4shy1T6
 0YsikNdHwIWow==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: drop $(objtree)/ prefix support for clean-files
In-Reply-To: <20220430110409.256858-1-masahiroy@kernel.org>
References: <20220430110409.256858-1-masahiroy@kernel.org>
Date: Sun, 01 May 2022 21:57:24 +1000
Message-ID: <871qxda2jf.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> I think this hack is a bad idea. arch/powerpc/boot/Makefile is the
> only user. Let's stop doing this.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/powerpc/boot/Makefile | 4 ++--

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

>  scripts/Makefile.clean     | 8 +-------
>  2 files changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 4b4827c475c6..008bf0bff186 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -453,8 +453,8 @@ clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
>  clean-kernel-base := vmlinux.strip vmlinux.bin
>  clean-kernel := $(addsuffix .gz,$(clean-kernel-base))
>  clean-kernel += $(addsuffix .xz,$(clean-kernel-base))
> -# If not absolute clean-files are relative to $(obj).
> -clean-files += $(addprefix $(objtree)/, $(clean-kernel))
> +# clean-files are relative to $(obj).
> +clean-files += $(addprefix ../../../, $(clean-kernel))
>  
>  WRAPPER_OBJDIR := /usr/lib/kernel-wrapper
>  WRAPPER_DTSDIR := /usr/lib/kernel-wrapper/dts
> diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
> index 74cb1c5c3658..878cec648959 100644
> --- a/scripts/Makefile.clean
> +++ b/scripts/Makefile.clean
> @@ -36,13 +36,7 @@ __clean-files	:= \
>  
>  __clean-files   := $(filter-out $(no-clean-files), $(__clean-files))
>  
> -# clean-files is given relative to the current directory, unless it
> -# starts with $(objtree)/ (which means "./", so do not add "./" unless
> -# you want to delete a file from the toplevel object directory).
> -
> -__clean-files   := $(wildcard                                               \
> -		   $(addprefix $(obj)/, $(filter-out $(objtree)/%, $(__clean-files))) \
> -		   $(filter $(objtree)/%, $(__clean-files)))
> +__clean-files   := $(wildcard $(addprefix $(obj)/, $(__clean-files)))
>  
>  # ==========================================================================
>  
> -- 
> 2.32.0

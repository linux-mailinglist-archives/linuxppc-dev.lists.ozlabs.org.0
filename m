Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D485639866
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 23:18:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKR2z4Pfcz3f5H
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 09:18:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=IDbDsci9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.82; helo=conssluserg-03.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=IDbDsci9;
	dkim-atps=neutral
X-Greylist: delayed 221 seconds by postgrey-1.36 at boromir; Sun, 27 Nov 2022 09:18:02 AEDT
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com [210.131.2.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKR221YRqz3bjd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 09:18:01 +1100 (AEDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 2AQMHlbQ013427
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 07:17:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 2AQMHlbQ013427
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1669501068;
	bh=uMYjlILPqJ8SrLVYqEu74wUNH0+GPpNjC8d5G2tGxQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IDbDsci9+nVR6gmDtSDJ27gLlrD3FoCIDzRzjzVasT2OMAbycfkQIri8cOe3Pwjto
	 iaQUiV6xz/cGk16/IMGJDCRZF7GHQdUReg8IjN9vpgLu5kUMMDsXUTHD/DdldJ7p4D
	 c+DBjOoop1l42hsbDTwP33vav+0Z7BFtzrLTi5j4w6Zr/bKH5HesccasItRo0wBYCr
	 4EofMiJoOZVbhnhYQrAIAAcBi0MS4mZMD3ialo547Z5idYxrJ0db9fbt5jMcqwDPEe
	 Vymmw2dihAIS0nwZCMtzBV2df5IVzmpJBndTJphCSASqjoaWKAW+n3xwt3NvcnGe64
	 EiXMxQCbrZxQw==
X-Nifty-SrcIP: [209.85.167.177]
Received: by mail-oi1-f177.google.com with SMTP id t62so7893153oib.12
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 14:17:48 -0800 (PST)
X-Gm-Message-State: ANoB5pn6B+mdG/Fo/FW9b5xT53uBVXU8N8l8WjIj/QwK0LcxQUyo7efI
	eFKlRqBKtOI57ybsNr82+Uj9EZ8ObMWwbJcfDVE=
X-Google-Smtp-Source: AA0mqf7DrCgQxqlmM/2+u7mcCqohRJuQjWmra2YCG3G/NdsvlzOWmND2/oMnaB4DLAstZR1kdTqNdgKSkiGc+gfTJGg=
X-Received: by 2002:aca:1c06:0:b0:354:28ae:23b3 with SMTP id
 c6-20020aca1c06000000b0035428ae23b3mr13083821oic.287.1669501066859; Sat, 26
 Nov 2022 14:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20221126051002.123199-1-linux@weissschuh.net> <20221126051002.123199-2-linux@weissschuh.net>
In-Reply-To: <20221126051002.123199-2-linux@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 27 Nov 2022 07:17:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNATPW2QE8ZnE56hC_ayWeG9s8nBkArae9a1d9Sqw=Xy_gg@mail.gmail.com>
Message-ID: <CAK7LNATPW2QE8ZnE56hC_ayWeG9s8nBkArae9a1d9Sqw=Xy_gg@mail.gmail.com>
Subject: Re: [PATCH 2/3] powerpc/book3e: remove #include <generated/utsrelease.h>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Russ Weight <russell.h.weight@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 26, 2022 at 2:10 PM Thomas Wei=C3=9Fschuh <linux@weissschuh.net=
> wrote:
>
> Commit 7ad4bd887d27 ("powerpc/book3e: get rid of #include <generated/comp=
ile.h>")
> removed the usage of the define UTS_VERSION but forgot to drop the
> include.
>
> Fixes: 7ad4bd887d27 ("powerpc/book3e: get rid of #include <generated/comp=
ile.h>")
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---


Assuming you will fix the commit description,

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>




>  arch/powerpc/mm/nohash/kaslr_booke.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohas=
h/kaslr_booke.c
> index 0d04f9d5da8d..2fb3edafe9ab 100644
> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
> @@ -19,7 +19,6 @@
>  #include <asm/cacheflush.h>
>  #include <asm/kdump.h>
>  #include <mm/mmu_decl.h>
> -#include <generated/utsrelease.h>
>
>  struct regions {
>         unsigned long pa_start;
> --
> 2.38.1
>


--
Best Regards

Masahiro Yamada

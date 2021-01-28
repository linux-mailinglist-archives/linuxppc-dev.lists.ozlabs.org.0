Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D0D306BD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 05:06:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR6N75N0wzDrCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 15:06:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.80;
 helo=conssluserg-01.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=p1GoLVJt; 
 dkim-atps=neutral
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR6JD43vTzDrQ5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 15:02:52 +1100 (AEDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 10S42Y82030324
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 13:02:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 10S42Y82030324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611806554;
 bh=UGFEFBZO6XyE53sikxcKH18p4Hi/bQ7cwfMaMlbekaw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p1GoLVJtc6WAUhXop6XjMbAfaAGuj2ucB7PePaZf8RjP7a/xAS7Y0Q+CtkCiiw7s7
 hxPk7DMFZWb4JJ01ukPwfaouXxFRBXrLnRtVwYuoVnRp42F4jlzYin/7+hywIvHCv5
 E20P7nNm5z69P3uklPsgHIteYVrsjyd88Z313r+myyhSyWKfo35ZBWDfg/rH0+Pdo1
 gSQRHzsQsLG55mXJ1KEm6kqQpekjOqlKJcP17kAwSrz2DOtN0hqvRz5Ontyzlb8rev
 SatdqeLJLJ/J01VfEwAFHIi9sLjdKGfXmVl7pkV949G+CGcaho3jkpXz4HbYpXx3Q4
 rBsamdaS6IfEg==
X-Nifty-SrcIP: [209.85.215.178]
Received: by mail-pg1-f178.google.com with SMTP id j2so1764979pgl.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 20:02:34 -0800 (PST)
X-Gm-Message-State: AOAM533PFcTvhHAFD0xFItmpLDyYZUwLON4okFuNnFY81F1sN7EEwG1N
 V1hwIL1tTz+mOtz7qBeH0alpf34IUfnIHTDJOlI=
X-Google-Smtp-Source: ABdhPJydqxki6OSEnMrqa1NZ5TxUJLm2/BivHYqaw1ccMRHfmLbg3Xxtl5/PfyePwq4wmVGWu1nRz4xdTcu7k/HCCD8=
X-Received: by 2002:aa7:8602:0:b029:1bb:4dfd:92fc with SMTP id
 p2-20020aa786020000b02901bb4dfd92fcmr14034248pfn.63.1611806553757; Wed, 27
 Jan 2021 20:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20201223171142.707053-1-masahiroy@kernel.org>
 <20201223171142.707053-2-masahiroy@kernel.org>
In-Reply-To: <20201223171142.707053-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 28 Jan 2021 13:01:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_vvLwjBG=MSJv=-n-Y4-AgsiPsj2VpH7qO4KLkUA2dw@mail.gmail.com>
Message-ID: <CAK7LNAS_vvLwjBG=MSJv=-n-Y4-AgsiPsj2VpH7qO4KLkUA2dw@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/vdso64: remove meaningless vgettimeofday.o
 build rule
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Greentime Hu <green.hu@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 24, 2020 at 2:12 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> VDSO64 is only built for the 64-bit kernel, hence vgettimeofday.o is
> built by the generic rule in scripts/Makefile.build.
>
> This line does not provide anything useful.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Michael, please take a  look at this too.



> ---
>
>  arch/powerpc/kernel/vdso64/Makefile | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> index b50b39fedf74..422addf394c7 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -32,8 +32,6 @@ asflags-y := -D__VDSO64__ -s
>  targets += vdso64.lds
>  CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
>
> -$(obj)/vgettimeofday.o: %.o: %.c FORCE
> -
>  # link rule for the .so file, .lds has to be first
>  $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
>         $(call if_changed,vdso64ld_and_check)
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada

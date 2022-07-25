Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB0557F81A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 04:00:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrjt921qzz3c9C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 12:00:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=Pc/sWxVj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.90; helo=conssluserg-05.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=Pc/sWxVj;
	dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com [210.131.2.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrjsX0LQKz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 11:59:43 +1000 (AEST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 26P1x9gQ011817
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 10:59:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 26P1x9gQ011817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1658714351;
	bh=HVu+KaNVwvREcYnTWHIbGMhdQS80Phpv0XKr84P25VM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pc/sWxVjSjQ8XOdnwSZ7INJ72O7E7Kv/aLMlu90fMJSH1BWhuDlIK91j2vIBUj17Q
	 kaIrk1cusBO23FAWq8eQ2TkqVXQSLrSdj3dTe9Jc3SLhHuOoMgvXnIeDCfqqJ2tmCZ
	 4FF4CRlMuFClYGQMOiWq/FeVovJGofX4GSF4I2xAvBWvDsMXTyZgB3OO/EbRInmz3h
	 FhPnwEFsC9MR6pAKYaFuN/QTfMlP37lVo4noj7wedf89uSMLKu2ZVn998qk+flZmCU
	 0sdg+QDFzaghOzURKe8tXYex4zqiPwWjHg5tnv0CbZr+KupLwUFPM7yVB8fwO0JDQj
	 EwI4C5Yo8yrXw==
X-Nifty-SrcIP: [209.85.128.52]
Received: by mail-wm1-f52.google.com with SMTP id f24-20020a1cc918000000b003a30178c022so8473689wmb.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jul 2022 18:59:10 -0700 (PDT)
X-Gm-Message-State: AJIora/bZQRYcDll+m861r6JzPK6+Q0FUlIIUnV1wQcy7hsbmVp1MfnT
	BrgQ6RpA1Dev/CxjXigQe8sAc2b5K3883MAppGw=
X-Google-Smtp-Source: AGRyM1vivR05y2jgl4+ym0sl+fjMjQbBEUj0AOZjOmvOpxjP/5cSIlaorKkje5gZwtyeN7RnyVJuYRVi0J7bgCmZcPs=
X-Received: by 2002:a05:600c:a42:b0:39c:9086:8a34 with SMTP id
 c2-20020a05600c0a4200b0039c90868a34mr19832895wmq.169.1658714349182; Sun, 24
 Jul 2022 18:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220625224037.836581-1-masahiroy@kernel.org> <20220725014100.GQ25951@gate.crashing.org>
In-Reply-To: <20220725014100.GQ25951@gate.crashing.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 25 Jul 2022 10:58:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNATFT3YFz-VUu1PQWNNfCL6k4EFokxcMGq3guJo9MhmydQ@mail.gmail.com>
Message-ID: <CAK7LNATFT3YFz-VUu1PQWNNfCL6k4EFokxcMGq3guJo9MhmydQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/purgatory: Omit use of bin2c
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 25, 2022 at 10:42 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Sun, Jun 26, 2022 at 07:40:37AM +0900, Masahiro Yamada wrote:
> > The .incbin assembler directive is much faster than bin2c + $(CC).
>
> And perhaps more importantly it is simpler and less clumsy.
>
> > --- /dev/null
> > +++ b/arch/powerpc/purgatory/kexec-purgatory.S
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +     .section .rodata, "a"
> > +
> > +     .align  8
> > +kexec_purgatory:
> > +     .globl  kexec_purgatory
> > +     .incbin "arch/powerpc/purgatory/purgatory.ro"
> > +.Lkexec_purgatroy_end:
>
> Typo here (s/ro/or/)


Nice catch. Thanks.

I've sent v2.



>
> > +
> > +     .align  8
> > +kexec_purgatory_size:
> > +     .globl  kexec_purgatory_size
> > +     .quad   .Lkexec_purgatroy_end - kexec_purgatory
>
> And here again ofc.
>
> Looks good to me otherwise, nice cleanup :-)
>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
>
>
> Segher



-- 
Best Regards
Masahiro Yamada

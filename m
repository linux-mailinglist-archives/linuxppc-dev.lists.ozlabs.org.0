Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B858928E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 21:02:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lyh7V3bzdz3bkh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 05:02:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=U1JOFCXx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=U1JOFCXx;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lyh6s1mssz2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Aug 2022 05:01:55 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id x39so18130800lfu.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Aug 2022 12:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qkZyTxd6/rQH9f/Y5IC+qhxhw4OhSH1ftQVb1NFPcsg=;
        b=U1JOFCXxMfXXkGzB9FdT/ksKIuPOcGnkKRmBkfUjuQXgiavx/s0Wyi516dGWSXiwM8
         XRX4mH+8c5zi5QWMR/s9wK8DmrsfOxG2KtsLeZEc8tfnrhatfyRi8ciu731EtZRyCpls
         Wz1++EPr3IwCNUybICTzyO0CH93k/IiTLWckYU3/A6V8MxS6hBOVDJwjg60q3Thto+y/
         qRuUkQK/7EoGqvMbpbOovjUVAVP/77wjk2IzC2T+finTmw0RmV6i3gYlNlbQqAgX/qU8
         K2i4CyATckplpeJ0a3pmjQktpzBZcND2Smkins3x2I5uVPDICuSoNjQIuqsDnA+6pWFQ
         2kcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qkZyTxd6/rQH9f/Y5IC+qhxhw4OhSH1ftQVb1NFPcsg=;
        b=FOJTJlNICbTH9W/nuDeka4gAwJ/BeVif7U5WQ+TZLcbaX0ouNJwujm5pre4AbnybaR
         FMWC4GmUStqeC7T/4FmP/3Pzck0UT+awVexqFOMBQHrNcnDliK90kVVuU1C5Pi0Sdr0A
         cNsoANSllgz0UpIh6XpG7SFMWYTpGeYleiJPG2xLsgNQifu6hloEkph1qIAyMpsL5wza
         Oc6MzWK61QeqeqJJR/zg5hc8WFO+8fxRi2twVPMMsUMPUx3KmhmoG6a+oJXgcjevckId
         Ko9pmKKQywP+9X7XLYMcHiFlzhqvz1gKA9YI55NMSNzZVts9NpK9tuNYIC2eIy4gQSjL
         fXqw==
X-Gm-Message-State: AJIora+ImjsE4iefE95MHhl0vm7u+Up1yBWQH/SMoy3QDWGcjaf2ZwVB
	R3Wd1KRc9GSU2VK7YJ3oWtaCz5iAZ7AUqcdN2x5gSw==
X-Google-Smtp-Source: AGRyM1t3t7yt+To8spTqWksM/9NOUTalDKsIpmabOInlgG8TFVmqrn3hQsxt8+aNw3chFP7wBIsdfqbt2fOX56ytPf4=
X-Received: by 2002:a05:6512:1307:b0:47f:baa4:52c5 with SMTP id
 x7-20020a056512130700b0047fbaa452c5mr8906201lfu.103.1659553307081; Wed, 03
 Aug 2022 12:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <b35f275e-2e80-6f2d-92cc-d951916b5c63@csgroup.eu>
In-Reply-To: <b35f275e-2e80-6f2d-92cc-d951916b5c63@csgroup.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 3 Aug 2022 12:01:35 -0700
Message-ID: <CAKwvOdm3vdJzO2bX2v6syt0ZsSJkSkVdxQXJ=Gc6rTcawSEzFw@mail.gmail.com>
Subject: Re: clang kernel PPC32 build failure, undefined reference to `__umoddi3'
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Nathan Chancellor <nathan@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for the report; tracking the issue here:
https://github.com/ClangBuiltLinux/linux/issues/1679

clang-15 got more aggressive about eliminating loops outright; some
cases can be replaced with division/remainder.  LLVM is missing
support for expanding 64b division by constant for 32b targets; WIP.

On Wed, Aug 3, 2022 at 11:54 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Looks like since recently some clang builds fails for missing reference
> to `__umoddi3`.
>
> See exemple at:
> - https://github.com/ruscur/linux-ci/actions/runs/2789193140
> -
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/eca9251f1e1f82c4c46ec6380ddb28356ab3fdfe.1659527244.git.christophe.leroy@csgroup.eu/
>
>  From fs/mpage.o:
>
> 00000170 <do_mpage_readpage>:
> ...
>       69c:      38 60 00 00     li      r3,0
>       6a0:      38 a0 00 00     li      r5,0
>       6a4:      38 c0 00 05     li      r6,5
>       6a8:      7d c4 73 78     mr      r4,r14
>       6ac:      92 e1 00 10     stw     r23,16(r1)
>       6b0:      3a a0 00 00     li      r21,0
>       6b4:      93 81 00 18     stw     r28,24(r1)
>       6b8:      3b 80 00 05     li      r28,5
>       6bc:      92 01 00 14     stw     r16,20(r1)
>       6c0:      92 21 00 1c     stw     r17,28(r1)
>       6c4:      48 00 00 01     bl      6c4 <do_mpage_readpage+0x554>
>                         6c4: R_PPC_REL24        __umoddi3
>
>
>
> I don't understand why calling __umoddi3 when the arguments are
> obviously 32 bits are r3 and r5 are zero.
>
> Christophe



-- 
Thanks,
~Nick Desaulniers

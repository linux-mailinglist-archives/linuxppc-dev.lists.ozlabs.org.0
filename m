Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 476765BA382
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 02:31:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTFNl0lwcz3bWM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 10:31:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZaYq/b40;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZaYq/b40;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTFN90RBVz303C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 10:30:32 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id jm11so19893102plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 17:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=II/cExd0R3Sfm0KxG9Fz8eXU0tK1QDgbEbcnB0TT30w=;
        b=ZaYq/b406Ch8jO6t3Rnxdr9X48aDtaaM2aIdF9sAHI1lXLsRIbdSVmrvnT0TG/FXkK
         W4aAPpl/zJG8AyCpCDZqr4WASpiovRL7SQiIZOqUWZOqDv/zrX1dleWfxKBigSBuM9pJ
         WqvdWxajVrE3rXjCyVi9qKXVziRQikv/Z+yH4GGeaSyL1Lz9GapinnFFjYz6Qo6tLUGs
         eCtAT3VOPtYfNb6nkQZhPqvQ3X7FcHvFVQhCd7NgM97gcLtCoOSXAxa9lUzqcUi+sH6C
         yLpEs6ow23uEWeISS1EXADCQ0PJENMim0/JkpxUCnEYGi+Za6fN6V+CGsdqCyZn7dJkQ
         sUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=II/cExd0R3Sfm0KxG9Fz8eXU0tK1QDgbEbcnB0TT30w=;
        b=ez95tgyCFp4y0mvNbswPBHos6IBA4oGaGmd5yXM2LINy2xk51t8SUoflg4AIuaiaXv
         kyTc43cSKJDQrVNOz/44UcOaNfsnjZlAXJ0uG1F5L/Dig4l/N7Xm30J4EDXzR8S3ZLex
         sGDSMbt9h6XQO/Ryoce6tlYMWIuws+pJhjrUT138zKTKjU/ZPs7mU9c50yVcfMM5RVlC
         B2pS0XjclF90TyRkjBm0A8vkVVymavDaJSFgklcqxBaE5zybZKfHNcxr8oRkQ9ccZx1Z
         5AORU0NIGmkl54vrj1JDJLVWEVoO69capxJGY79R7oexKwnTd/bJqjnE6YilfrxwE5RU
         VP/A==
X-Gm-Message-State: ACrzQf0i4HIwy3tedMbD69iMH6J+2bPUWYgpRW29UBQcBotpBUK4xh7e
	OZekqXlDNGFoYdQjHqoGGw/wsy3J07E=
X-Google-Smtp-Source: AMsMyM42oImijRICUEUEqJM1hEnhE0vUOBCB2DHhl0yeulhpLZ8bEsaWsmC3xhNJefu+pmr4f5wkHA==
X-Received: by 2002:a17:902:900a:b0:178:77c7:aa28 with SMTP id a10-20020a170902900a00b0017877c7aa28mr2112540plp.3.1663288230101;
        Thu, 15 Sep 2022 17:30:30 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id b77-20020a621b50000000b00545b91e78d3sm7317548pfb.89.2022.09.15.17.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 17:30:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Sep 2022 10:30:25 +1000
Message-Id: <CMXEGU2RYP2T.2TOKN5MT8WS67@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/7] powerpc/build: put sys_call_table in .data.rel.ro
 if RELOCATABLE
X-Mailer: aerc 0.11.0
References: <20220914154746.1122482-1-npiggin@gmail.com>
 <20220914154746.1122482-2-npiggin@gmail.com>
 <2e9a7e03-f89d-15d8-d42b-f5a0b1f9c391@csgroup.eu>
 <874jx8n6lr.fsf@mpe.ellerman.id.au>
In-Reply-To: <874jx8n6lr.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Sep 15, 2022 at 10:51 PM AEST, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > Le 14/09/2022 =C3=A0 17:47, Nicholas Piggin a =C3=A9crit=C2=A0:
> >> Const function pointers live in .data.rel.ro rather than .rodata becau=
se
> >> they must be relocated. This change prevents powerpc/32 from generatin=
g
> >> R_PPC_UADDR32 relocations (which are not handled). The sys_call_table =
is
> >> moved to writeable memory, but a later change will move it back.
> >
> > Aren't you missing commit c7acee3d2f12 ("powerpc: align syscall table=
=20
> > for ppc32") ?
>
> That's in fixes. I'll sort it out when I apply this, or when I merge
> fixes into next.

Yeah that explains the relocations I was seeing, I should have dug
further into that, so they're really unrelated to this patch.

> > I can't see any R_PPC_UADDR32 relocations generated by ppc4xx_defconfig=
=20
> > + CONFIG_RELOCATABLE unless I revert that commit.
>
> Presumably this change accidentally aligns the syscall table.
>
> >> After this patch, 44x_defconfig + CONFIG_RELOCATABLE boots to busybox.
> =20
> So that's probably just because of the alignment too.
>
> I think this patch should go after .data.rel.ro is made read only.

Yeah that should be fine.

Thanks,
Nick

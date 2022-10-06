Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B92C35F70ED
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 00:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk57t2r1Lz3ds6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 09:04:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l+8brove;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l+8brove;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mk56y6XQlz3c3G
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 09:03:37 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id z20so2898075plb.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 15:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=LLlo0saXrZjOQwglFhSx/3IhwB4d7MYWIHDHWsDmD2M=;
        b=l+8brove/CQUMNYcP1N9QeWx83wlhThCFQwBdwHqQ7oKYb26R9cXGaMXmcbgmose8j
         0A6YZxM7TmDb5LL/81DhNYKZoKvd9sqTe/L2I70lKeEcUt+ODAYI/ATcMiKztNME8o07
         KEd2NtwIP1StdpJr7vlS9pSD8hvYzaIm0DSE9W9EKM0i2oSJwmQgHgjs9a5kWtMAK8ma
         uAk7HAo4BSlYv4/vVN4nrh7emrgOUcffA1HFQ+hZ+xdIbfDdfppQH/dM9VOvJOUd4gr2
         6DuHywG4EAo87Ik6Ven/OK96he+C3Bkuq8ceXl1DoVitSxoSVbHltP3kxWPu8NVzZgDq
         +4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=LLlo0saXrZjOQwglFhSx/3IhwB4d7MYWIHDHWsDmD2M=;
        b=lFrCJcTb8Fh+vCJRL1JCP7cFAD6gGTS6RMl27/Kge1EB1DBqWsa34LH+OouxMzLuhr
         t4TTOoxiZNv/WDK0rTfsd4GxEBhMMRRybpr4uuZvOctAOIFqJGLUlXdhsvvR9La9ujm5
         iXs8dUqJ5XCIwIsDoOeajfhocZlp4GkavVNF07j2uJjqQ3VfwhlloJD/kSXDrN0QRJ1I
         bqWIYLSKgK79ZBc28ekelzRZdSA/H9Hp131rkUv580zGHf9QIe/62idfiZjClTH0ywsr
         nVk/oYQggvBqQokpvzrB0jLbG/cLhSkHV/o5oUgT+R8PnhY8cyk2/FLUM1qTuK8J62d5
         uePQ==
X-Gm-Message-State: ACrzQf1ddw9Wbo0kLaM74O3ZFaczMMi4bI82+I77tBraiglp36k62rlY
	uoHGOUuz+VSrpJRUbzzpSRnT2Ryc57U=
X-Google-Smtp-Source: AMsMyM7gQ88pZp48VhuiLgKmwQq6AwjRtevy2Y1Rxp2lo0Ep3EOdsFUl50Uv5/us9vZZ7B3MFUzvqQ==
X-Received: by 2002:a17:902:b20a:b0:178:6f5b:f903 with SMTP id t10-20020a170902b20a00b001786f5bf903mr1621158plr.39.1665093814986;
        Thu, 06 Oct 2022 15:03:34 -0700 (PDT)
Received: from localhost ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id x21-20020aa79575000000b0056270d01bbcsm98083pfq.139.2022.10.06.15.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 15:03:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Oct 2022 08:03:29 +1000
Message-Id: <CNF6HS8WBIA4.1QY9749KKU4EV@bobo>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220923033004.536127-1-npiggin@gmail.com>
 <4141d141-54a8-0771-ea67-1e457e38f329@csgroup.eu>
 <CN3KCU5GOMF4.3T533MQ4U2SF0@bobo>
 <33e5c5e7-a25f-36bf-e7a1-8d6849cd4715@csgroup.eu>
In-Reply-To: <33e5c5e7-a25f-36bf-e7a1-8d6849cd4715@csgroup.eu>
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

On Fri Oct 7, 2022 at 4:07 AM AEST, Christophe Leroy wrote:
>
>
> Le 23/09/2022 =C3=A0 08:23, Nicholas Piggin a =C3=A9crit=C2=A0:
> > On Fri Sep 23, 2022 at 3:46 PM AEST, Christophe Leroy wrote:
> >>
> >>
> >> Le 23/09/2022 =C3=A0 05:30, Nicholas Piggin a =C3=A9crit=C2=A0:
> >>> This adds basic POWER10_CPU option, which builds with -mcpu=3Dpower10=
.
> >>>
> >>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >>> ---
> >>> There's quite a lot of asm and linker changes slated for the next mer=
ge
> >>> window already so I may leave the pcrel patch for next time. I think =
we
> >>> can add the basic POWER10 build option though.
> >>>
> >>> Thanks,
> >>> Nick
> >>>
> >>>    arch/powerpc/Makefile                  | 7 ++++++-
> >>>    arch/powerpc/platforms/Kconfig.cputype | 8 +++++++-
> >>>    2 files changed, 13 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> >>> index 8a3d69b02672..ea88af26f8c6 100644
> >>> --- a/arch/powerpc/Makefile
> >>> +++ b/arch/powerpc/Makefile
> >>> @@ -192,9 +192,14 @@ ifdef CONFIG_476FPE_ERR46
> >>>    		-T $(srctree)/arch/powerpc/platforms/44x/ppc476_modules.lds
> >>>    endif
> >>>   =20
> >>> -# No AltiVec or VSX instructions when building kernel
> >>> +# No prefix or pcrel
> >>> +KBUILD_CFLAGS +=3D $(call cc-option,-mno-prefixed)
> >>
> >> We have lots of code to handle prefixed instructions in code_patching,
> >> and that code complexifies stuff and has a performance impact.
> >> And it is only partially taken into account, areas like ftrace don't
> >> properly take care of prefixed instructions.
> >>
> >> Should we get rid of prefixed instruction support completely in the
> >> kernel, and come back to more simple code ?
> >=20
> > I would rather complete prefixed support in the kernel and use pcrel
> > addressing. Actually even if we don't compile with pcrel or prefixed,
> > there are some instructions and we will probably get more that require
> > prefixed, possible we might want to use them in kernel. Some of it is
> > required to handle user mode instructions too. So I think removing
> > it is premature, but I guess it's up for debate.
>
> Well ok, in fact I only had code_patching in mind.
>
> Code patching is only for kernel text. Today code patching is used for=20
> things like kprobe, ftrace, etc .... which really do not seems to be=20
> prepared for prefixed instructions.
>
> If you are adding -mno-prefixed, it is worth keeping that code which=20
> sometimes gives us some headacke ?
>
> Of course if there are plans to get real prefixed instruction in kernel=
=20
> code anytime soon, lets live with it, in that case the support should=20
> get completed. But otherwise I think it would be better to get rid of it=
=20
> for now, and implement it completely when we need it in years.

I have a series to enable it again, just not ready for upstream yet
but it's not all that far off.

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-September/248521.html

> When I see the following, I'm having hard time believing it would work=20
> with prefixed instructions in the kernel text:
>
> 	typedef u32 kprobe_opcode_t;
>
> 	struct kprobe {
> 	...
> 		/* Saved opcode (which has been replaced with breakpoint) */
> 		kprobe_opcode_t opcode;
>
>
> 	void arch_disarm_kprobe(struct kprobe *p)
> 	{
> 		WARN_ON_ONCE(patch_instruction(p->addr, ppc_inst(p->opcode)));
> 	}

Yeah that needs work for sure.

Thanks,
Nick

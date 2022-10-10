Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2265F9735
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 05:42:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm4V04Gh1z3dsw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 14:42:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oFDdnI5L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oFDdnI5L;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm4T42FSsz3bnY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 14:41:09 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id i6so4227604pli.12
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Oct 2022 20:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cy+0FU0LbTPeMM4J4tV4jF+mhlhko4NNQCQw6Xl1p/g=;
        b=oFDdnI5Lsb6I5PRVYsnl4YDIfWiD5m5O+VR12bdXeWmKjZtGSFGF99Jz2EiLWvqiUU
         oWFHogUXNbNyJNGEppTkZuRTgWegiJ/YkzT5KBhWUPb848lXWmE62X1mutOHVnM3KkJZ
         7JHh9gASqwDFPLYspI6c25iWDTHOIGNIAiKuo4OdfPzONxEteO4V6OOsPLRI+bgGVBKQ
         Hb/Bn2e1hvKmnfE8S7BqmTtA1E92vgjCUYTHxqWUKsnMSAJBepMvh3+Q/6qitgBRq+vw
         r2nAVkKLMt3Y30zxQiyNiVnD9O6FoswprmBEug8uLB+RRuTuXFRX6HTj8LeMmMalpNvw
         zanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cy+0FU0LbTPeMM4J4tV4jF+mhlhko4NNQCQw6Xl1p/g=;
        b=RxrZrDpgYyoCBDgmGE+f0to9NArVwsVfAJB9eDKU4fOD3rwkZQHiMUKUIGxufebN+H
         3o38MSKo/KAVV2nUqxiKcenLNgm0i2B0znx0a6IbooeFS0NjjPnIiSRONDVnxhVY7dCP
         2PGLmL3zf4TQINqvseQhp6mEeyCymnkO6tiCIl0MJ+d58L+wkw4pFNtHJrSagxRm8/Ra
         l7G3c8Yq/jBBzySu1geSfmGgL5UYANqiu0/Ar4R9pO2khEUCba+AfPPtEZtUWdj8q/9l
         rGel2E38d021XFWKowv+BISSLg0OQ9//UjEeTTPwBDbYU4GH/u13pnml4sW+mGjreTfA
         FHHA==
X-Gm-Message-State: ACrzQf2J34yQLUS6e7tQyapAIE+nwZQ6XvlPWPYT3qNcn07ZD5oGvEVY
	RALMgceCrWRPb6GFl648hk0=
X-Google-Smtp-Source: AMsMyM7ZBCgcHG8dJiYKO0/8u1+LEzSLfQ8wv7WlWXnW4oaMhVhNQA3UZOlZ5YMhvFj1ojSNAPv1Kw==
X-Received: by 2002:a17:90b:4f87:b0:20b:12e3:32ae with SMTP id qe7-20020a17090b4f8700b0020b12e332aemr18705828pjb.236.1665373266715;
        Sun, 09 Oct 2022 20:41:06 -0700 (PDT)
Received: from localhost ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id 137-20020a62198f000000b00561e8bbfa3dsm5799412pfz.98.2022.10.09.20.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 20:41:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Oct 2022 13:41:00 +1000
Message-Id: <CNHXJU5FCIFH.2BD0CT727YPCB@bobo>
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
>
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

This actually should work. Prefixed instructions can be patched by
patching the prefix with a trap or pnop, and by patching a trap/pnop
back to the prefix instruction.

pnop will make the suffix interpreted corretcly and skipped. trap
handler will have to know it traps for a prefixed insn if it wanted
to resume after the instructioni. So it is enough to save/restore the
first 4 bytes of the instruction so long as there are checks to
ensure we don't try to patch a suffix (which it looks like there are).

Single-stepping pc-relative instructions at an alternate address
could be a bigger problem if I read the kprobes code correctly,
I don't really see how that would be handled with existing pc relative
instructions actually like branches and addpcis. Maybe it always
relies on being able to emulate those, but in that case we might not
emulate all pcrel instructions? I'm not sure. If that is what
kprobes relies on then it should be made more robust and have a
can_single_step_at_alternate_location() filter for that. R=3D1 prefix
could be caught there.

Thanks,
Nick

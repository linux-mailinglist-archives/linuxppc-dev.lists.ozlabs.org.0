Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF5B5F7226
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 02:04:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk7pY0d0Jz3dq0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 11:04:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WFQyqeQW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WFQyqeQW;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mk7nb0K1Lz2yZ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 11:03:45 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id e129so3188226pgc.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 17:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=zJkeEcAasyfilzyqqK/2CpXQCWBGoGKKlgJvR43midY=;
        b=WFQyqeQWmMHmlqhM6wYmMtrboDc43ix8ZfpsCt7hmk6jQ7O3g6AOozGWtHSOoNk2M+
         N4qOThbHGcLxbxCks1rKpxPjosbFRwnHBPIy7nCDpAeEXAlcFHTM+OGazQ/7jTERdMCf
         cjDnzofPMPCq0Asa15WewZJiQdf6Q3QEPCj12y16iHdcHKPzG51oCfmZ9UF4+ei4bPeY
         SgSyLSB28sAZ9a+hC/m9Lc0uKf4V3b4ivOXbHXa5283hRHqQz1J7qugTCQd/MfyuQt0/
         dyGsolO7WIxLJCa1TMwxQW8M3JKqSZbLy7z3Arw7TpL9JZvq+isGJmyRCBxHneOlJ2+z
         bhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=zJkeEcAasyfilzyqqK/2CpXQCWBGoGKKlgJvR43midY=;
        b=iNRfMRWbwfsjOHcY8Ikp3uhyD+TkqlaDoXdgono/FIIgYvJWMlS4az5dVVtHhOeUg+
         IQoF2ZHO3LXtpF/31hNMrl2zeRn8BZZ53MnK36OhjhSbemWtnBZEzTAA41w4xhQ12fby
         rHodxMPLMq7nGweqvVr7g/KHYsYReMKMsyPlTWuRls+UnEV+tvx7eQEgwSMCufSgNwa6
         DqcKhg7Qi2qyN4gjgj5DUwgKQqcVr5JLyPhw10ZRFnfHyhhZUsURuWGwpD5dze05VwHL
         iduobwhxwyJpnHHP7VWllM62egFqiN9E+nMLYjMBT981OVmZqiQr6d3g8TzDVUAXCp+N
         /AqA==
X-Gm-Message-State: ACrzQf2B8YA3IzyR4ULD3XdljPtD7NXUKGDbwsVrUtdwtpznUPqk7t19
	QkBt2FdzOJfxyrYIaivgaL0=
X-Google-Smtp-Source: AMsMyM4fdZXHcNiwivoNg73dSdlX9Kk09nQc+DoDIga9ym+W2ZqbjLb4MH99F8RYEr+ioVTAx+gHTQ==
X-Received: by 2002:a05:6a00:1a8f:b0:548:8ce8:db73 with SMTP id e15-20020a056a001a8f00b005488ce8db73mr2070518pfv.10.1665101022671;
        Thu, 06 Oct 2022 17:03:42 -0700 (PDT)
Received: from localhost ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ce8200b0016dc6279ab7sm191408plg.149.2022.10.06.17.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 17:03:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Oct 2022 10:03:38 +1000
Message-Id: <CNF91RLXUENG.32NIZ5S1R3UCZ@bobo>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Segher Boessenkool" <segher@kernel.crashing.org>
X-Mailer: aerc 0.11.0
References: <20220923033004.536127-1-npiggin@gmail.com>
 <20221006195411.GS25951@gate.crashing.org>
 <CNF6C5XSIE75.3R12NULNLHEN2@bobo>
 <20221006232345.GW25951@gate.crashing.org>
In-Reply-To: <20221006232345.GW25951@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Oct 7, 2022 at 9:23 AM AEST, Segher Boessenkool wrote:
> On Fri, Oct 07, 2022 at 07:56:09AM +1000, Nicholas Piggin wrote:
> > On Fri Oct 7, 2022 at 5:54 AM AEST, Segher Boessenkool wrote:
> > > On Fri, Sep 23, 2022 at 01:30:04PM +1000, Nicholas Piggin wrote:
> > > > This adds basic POWER10_CPU option, which builds with -mcpu=3Dpower=
10.
> > >
> > > > +# No prefix or pcrel
> > > > +KBUILD_CFLAGS +=3D $(call cc-option,-mno-prefixed)
> > > > +KBUILD_CFLAGS +=3D $(call cc-option,-mno-pcrel)
> > >
> > > Why do you disable all prefixed insns?  What goes wrong if you don't?
> >=20
> > Potentially things like kprobes.
>
> So mention that?  "This patch is due to an abundance of caution".

Well it's in next now. I did say *basic*, I'm sure not changing the ABI
or adding prefix instructions isn't too mysterious.

>
> What I meant to ask is if you *saw* something going wrong, not if you
> can imagine something going wrong.  I can imagine ten gazillion things
> going wrong, that is not why I asked :-)
>
> > > Same question for pcrel.  I'm sure you want to optimise it better, bu=
t
> > > it's not clear to me how it fails now?
> >=20
> > For pcrel addressing? Bootstrapping the C environment is one, the
> > module dynamic linker is another.
>
> I don't know what either of those mean.

arch/powerpc/kernel/head_64.S and arch/powerpc/kernel/module_64.c

Can discuss in the pcrel patch series thread if you would like to know
more.

>
> > Some details in this series.
> >=20
> > https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-September/248521.h=
tml
>
> I've watched that series with great interest, but I don't remember
> anything like that?  Are you refering to the commentary in 7/7?
> "Definitely ftrace and probes, possibly BPF and KVM have some breakage.
> I haven't looked closely yet."...  This doesn't mean much does it :-)
> It can be a triviality or two.  Or it could be a massive roadblock.
>
> Just say in a comment where you disable stuff that it is to prevent
> possible problems, this is a WIP, that kind of thing?  Otherwise other
> people (like me :-) ) will read it and think there must be some deeper
> reason.  Like, changing code to work with pcrel is hard or a lot of
> work -- it isn't :-)  As you say in 0/7 yourself btw!
>

I will describe limitations and issues a bit more in changelog of patches
to enable prefix and pcrel when I submit as non-RFC candidate. It would
probably not be too hard to get things to a workable state that could be
merged.

> > > > +# No AltiVec or VSX or MMA instructions when building kernel
> > > >  KBUILD_CFLAGS +=3D $(call cc-option,-mno-altivec)
> > > >  KBUILD_CFLAGS +=3D $(call cc-option,-mno-vsx)
> > > > +KBUILD_CFLAGS +=3D $(call cc-option,-mno-mma)
> > >
> > > MMA code is never generated unless the code asks for it explicitly.
> > > This is fundamental, not just an implementations side effect.
> >=20
> > Well, now it double won't be generated :)
>
> Yeah, but there are many other things you can unnecessarily disable as
> well!  :-)
>
> VMX and VSX are disabled here because the compiler *will* use those
> registers if it feels like it (that is, if it thinks that will be
> faster).  MMA is a very different beast: the compiler can never know if
> it will be faster, to start with.

True, but now I don't have to find the exact clause and have my lawyer
confirm that it definitely probably won't change in future and break
things.

Thanks,
Nick

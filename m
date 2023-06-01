Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB2C71F6B4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 01:39:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXMzR1WVlz3dxj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 09:39:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=djZkquRB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=djZkquRB;
	dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXKV71D8gz3chT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 07:47:08 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-77489b6f68cso15526439f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 14:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685656024; x=1688248024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLtvBlY/v8HYwh0Fbm6omkkXXBfFwuezcGJpiAwvtOM=;
        b=djZkquRBAJFkGDOOepDiV+Z4UlysgoyxDBfc3o1FQDdNn/N4QHDsdeYjrdWUgK64Om
         H6vZgp4HkRR9AZTAX6AHv3vZIbMNtWEDL7zrhqYin2GxlDBHoPfYD9l0DTp9WV+0KQBe
         vm6COp7tdd/cTEWoL9dDtod27qjgGyRvkCiwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685656024; x=1688248024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLtvBlY/v8HYwh0Fbm6omkkXXBfFwuezcGJpiAwvtOM=;
        b=famJutSZqFY6o2LKvu8Q3QlCeuOzD83GaPyZHD0R5BOgdTQ1nqglNv6n9a4x3mB4o5
         ErzdgdFOVPdnrIPObYKzemI8CyfvcyBTzNMEFOiXXmjp2l7OGh/+KZ7O49IFJSiCR80b
         5Fwj+uY7cV0kMjO68ZYovK3aQ7TQtEJnDUE8Ml1Xobwmv1lJK5msKps77zStknMCf1b8
         E4hrAaKtlhLtTQdv+aXD2Jm+eUwDbQRMpXm4qclcjksU47exQRCm+Urt63sQt0DVDoi6
         PJTxaWQ42rf9gLXHI9aGr0Z691UhEgVFhmeEa1F2KlajGkT4dXhe6onv9u3q6vMuCYsU
         JWiA==
X-Gm-Message-State: AC+VfDxdzVV8AZK3ZhNd3OxKrV5j1GKGS2LMREAQpvytkdJbkhvidXGO
	VG7fI6Sgu7yacyEITur4nBvsr1BOf0xEpFLgYtY=
X-Google-Smtp-Source: ACHHUZ7On6GWb89qm/zoMhFI+tuFf/jM2hQgQdy2xjHiuEXqwX2lKqJTcXbXqOuIJ5JvgZ1C0EXB/w==
X-Received: by 2002:a05:6e02:68a:b0:338:f770:ccc3 with SMTP id o10-20020a056e02068a00b00338f770ccc3mr7287321ils.21.1685656024063;
        Thu, 01 Jun 2023 14:47:04 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id 8-20020a920d08000000b0032ab5a86443sm4143779iln.74.2023.06.01.14.47.03
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 14:47:03 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-33b398f2ab8so43585ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 14:47:03 -0700 (PDT)
X-Received: by 2002:a05:6e02:17c7:b0:33b:7a45:a950 with SMTP id
 z7-20020a056e0217c700b0033b7a45a950mr70308ilu.18.1685656003076; Thu, 01 Jun
 2023 14:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org> <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
 <ZFvGqD//pm/lZb+p@FVFF77S0Q05N.cambridge.arm.com> <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
In-Reply-To: <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Jun 2023 14:46:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vx=64ZYqNvOBRHu-+yFWtxkzCyjAxZED2xEFqoMKvAqQ@mail.gmail.com>
Message-ID: <CAD=FV=Vx=64ZYqNvOBRHu-+yFWtxkzCyjAxZED2xEFqoMKvAqQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] arm64: Add framework to turn an IPI as NMI
To: Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 02 Jun 2023 09:38:32 +1000
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Huacai Chen <chenhuacai@kernel.org>, Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Gaosheng Cui <cuigaosheng1@huawei.com>, Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>, kgdb-bugreport@lists.source
 forge.net, Ulf Hansson <ulf.hansson@linaro.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>, Ingo Molnar <mingo@kernel.org>, Pierre Gondois <Pierre.Gondois@arm.com>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Stephen Boyd <swboyd@chromium.org>, loongarch@lists.linux.dev, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>, Joey Gouly <joey.gouly@arm.com>, Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>, Sumit Garg <sumit.garg@linaro.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ito-yuichi@fujitsu.com, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3
 =A9?= <f4bug@amsat.org>, linux-perf-users@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "Eric W. Biederman" <ebiederm@xmission.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, x86@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, May 10, 2023 at 9:42=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, May 10, 2023 at 9:30=E2=80=AFAM Mark Rutland <mark.rutland@arm.co=
m> wrote:
> >
> > On Wed, May 10, 2023 at 08:28:17AM -0700, Doug Anderson wrote:
> > > Hi,
> >
> > Hi Doug,
> >
> > > On Wed, Apr 19, 2023 at 3:57=E2=80=AFPM Douglas Anderson <dianders@ch=
romium.org> wrote:
> > > > This is an attempt to resurrect Sumit's old patch series [1] that
> > > > allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs an=
d
> > > > also to round up CPUs in kdb/kgdb. The last post from Sumit that I
> > > > could find was v7, so I called this series v8. I haven't copied all=
 of
> > > > his old changelongs here, but you can find them from the link.
> > > >
> > > > Since v7, I have:
> > > > * Addressed the small amount of feedback that was there for v7.
> > > > * Rebased.
> > > > * Added a new patch that prevents us from spamming the logs with id=
le
> > > >   tasks.
> > > > * Added an extra patch to gracefully fall back to regular IPIs if
> > > >   pseudo-NMIs aren't there.
> > > >
> > > > Since there appear to be a few different patches series related to
> > > > being able to use NMIs to get stack traces of crashed systems, let =
me
> > > > try to organize them to the best of my understanding:
> > > >
> > > > a) This series. On its own, a) will (among other things) enable sta=
ck
> > > >    traces of all running processes with the soft lockup detector if
> > > >    you've enabled the sysctl "kernel.softlockup_all_cpu_backtrace".=
 On
> > > >    its own, a) doesn't give a hard lockup detector.
> > > >
> > > > b) A different recently-posted series [2] that adds a hard lockup
> > > >    detector based on perf. On its own, b) gives a stack crawl of th=
e
> > > >    locked up CPU but no stack crawls of other CPUs (even if they're
> > > >    locked too). Together with a) + b) we get everything (full locku=
p
> > > >    detect, full ability to get stack crawls).
> > > >
> > > > c) The old Android "buddy" hard lockup detector [3] that I'm
> > > >    considering trying to upstream. If b) lands then I believe c) wo=
uld
> > > >    be redundant (at least for arm64). c) on its own is really only
> > > >    useful on arm64 for platforms that can print CPU_DBGPCSR somehow
> > > >    (see [4]). a) + c) is roughly as good as a) + b).
> >
> > > It's been 3 weeks and I haven't heard a peep on this series. That
> > > means nobody has any objections and it's all good to land, right?
> > > Right? :-P
> >
> > FWIW, there are still longstanding soundness issues in the arm64 pseudo=
-NMI
> > support (and fixing that requires an overhaul of our DAIF / IRQ flag
> > management, which I've been chipping away at for a number of releases),=
 so I
> > hadn't looked at this in detail yet because the foundations are still s=
omewhat
> > dodgy.
> >
> > I appreciate that this has been around for a while, and it's on my queu=
e to
> > look at.
>
> Ah, thanks for the heads up! We've been thinking about turning this on
> in production in ChromeOS because it will help us track down a whole
> class of field-generated crash reports that are otherwise opaque to
> us. It sounds as if maybe that's not a good idea quite yet? Do you
> have any idea of how much farther along this needs to go?

I'm still very interested in this topic. Do you have anything concrete
that is broken? Your reply gives me the vibe that there have been a
bunch of bugs found recently and, while there are no known issues,
you're worried that there might be something lingering still. Is that
correct, or do you have something concrete that's broken? Is this
anything others could help with? I could make an attempt, or we might
be able to rope some of the others interested in this topic and more
GIC-knowledgeable to help?

I still have a goal for turning this on for production but obviously
don't want to make the device crashier because of it.

Also: if this really has known bugs, should we put a big WARN_ON splat
if anyone tries to turn on pseudo NMIs? Without that, it feels like
it's a bit of a footgun.


> ...of
> course, we've also run into issues with Mediatek devices because they
> don't save/restore GICR registers properly [1]. In theory, we might be
> able to work around that in the kernel.

To followup with this, we've formulated a plan for dealing with
Mediatek Chromebooks. I doubt anyone is truly interested, but if
anyone is the details are in the public Google bug tracker [1]. None
of that should block lading the NMI backtrace series.


> In any case, even if there are bugs that would prevent turning this on
> for production, it still seems like we could still land this series.
> It simply wouldn't do anything until someone turned on pseudo NMIs,
> which wouldn't happen till the kinks are worked out.
>
> ...actually, I guess I should say that if all the patches of the
> current series do land then it actually _would_ still do something,
> even without pseudo-NMI. Assuming the last patch looks OK, it would at
> least start falling back to using regular IPIs to do backtraces. That
> wouldn't get backtraces on hard locked up CPUs but it would be better
> than what we have today where we don't get any backtraces. This would
> get arm64 on par with arm32...

The more I thought about it, the more I liked the idea of going full
hog on the idea in patch #10. I've posted v9 [2] where I've really
embraced the idea of falling back to a regular IPI if NMI isn't
available. Hopefully it looks keen.

[1] https://issuetracker.google.com/281831288
[2] https://lore.kernel.org/r/20230601213440.2488667-1-dianders@chromium.or=
g

-Doug

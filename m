Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1B16FE385
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 19:56:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGjQN12Wmz3fXn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 03:56:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErO3OOcw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ErO3OOcw;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGgnD2mjrz3cj7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 02:42:53 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64384274895so5358037b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683736969; x=1686328969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4AcAs1XOdI4uJxnLDu55ay7WUOLwtVEGo1buGajIlI=;
        b=ErO3OOcwcAtWULaIxjcLAZtGhReLPXWiFGAKauQm2hkQj/5xLZq9Cm/FXwQiY3DuJ9
         G+OjlVL2xKRlC7mLVvcpFe4c2afhATTGPPJ1AlAeFVQfiLDuI3XdWAHxZymp/IE6gqum
         6hbwEkBDTqyrdeq0SdKt5dGbSbIMEG67E6kOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683736969; x=1686328969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4AcAs1XOdI4uJxnLDu55ay7WUOLwtVEGo1buGajIlI=;
        b=T8T3ImF3EThINWRYWlF4ZxE34rKLmLsKduImCW1bv2E2jbpHQP4CAhkzoNGMBC1svj
         XOxcRnFY4bcEtwFQkAKA71PrntaTkW09LeSdCDFYyS2TKBGoHymBL8t1FBTpIMAWV4IZ
         pZ8hp6tlf36VcQIRQVmBdWjQUjPSMIMy/lwZCCvmWYhBNBN72c7I4UVLXALSf5Koiwnj
         pxg2ubL9kqoc3CMaru1e24p4ufxIlWK0ZmApzUx2lnEdFJ8ZSTJnWvhs/pO6mRS1UAaH
         Da+8/940lZChMkad58qQJfXm9cdOD9iZ8jpTvLF3FmUZDHFutbarL8RJ32rWmzzlNaoc
         KGwg==
X-Gm-Message-State: AC+VfDwB+h9gtV4nHHQxc8eHqvKtGz+bQVTU3QTxIDeo5PIqfRSri7/I
	uJi5iub3qzDZvxSqk+Ob1nGcAC1ehsS9wYN1ALQaqw==
X-Google-Smtp-Source: ACHHUZ7vWfpYDjiLJ0MhSf/Qp5KQ0kDTF+Y9FzmYYRKCauHyche64Y5DifCm3I/1hqxsaG6KParEog==
X-Received: by 2002:a17:902:ecc8:b0:1ac:7245:ba5a with SMTP id a8-20020a170902ecc800b001ac7245ba5amr15235304plh.61.1683736968510;
        Wed, 10 May 2023 09:42:48 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com. [209.85.214.178])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ac2c3e54adsm4014895pls.118.2023.05.10.09.42.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 09:42:45 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1aae90f5ebcso233485ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 09:42:45 -0700 (PDT)
X-Received: by 2002:ac8:5792:0:b0:3ee:d8fe:6f5c with SMTP id
 v18-20020ac85792000000b003eed8fe6f5cmr329937qta.1.1683736943923; Wed, 10 May
 2023 09:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org> <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
 <ZFvGqD//pm/lZb+p@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZFvGqD//pm/lZb+p@FVFF77S0Q05N.cambridge.arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 May 2023 09:42:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
Message-ID: <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] arm64: Add framework to turn an IPI as NMI
To: Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 11 May 2023 03:54:00 +1000
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

On Wed, May 10, 2023 at 9:30=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Wed, May 10, 2023 at 08:28:17AM -0700, Doug Anderson wrote:
> > Hi,
>
> Hi Doug,
>
> > On Wed, Apr 19, 2023 at 3:57=E2=80=AFPM Douglas Anderson <dianders@chro=
mium.org> wrote:
> > > This is an attempt to resurrect Sumit's old patch series [1] that
> > > allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs and
> > > also to round up CPUs in kdb/kgdb. The last post from Sumit that I
> > > could find was v7, so I called this series v8. I haven't copied all o=
f
> > > his old changelongs here, but you can find them from the link.
> > >
> > > Since v7, I have:
> > > * Addressed the small amount of feedback that was there for v7.
> > > * Rebased.
> > > * Added a new patch that prevents us from spamming the logs with idle
> > >   tasks.
> > > * Added an extra patch to gracefully fall back to regular IPIs if
> > >   pseudo-NMIs aren't there.
> > >
> > > Since there appear to be a few different patches series related to
> > > being able to use NMIs to get stack traces of crashed systems, let me
> > > try to organize them to the best of my understanding:
> > >
> > > a) This series. On its own, a) will (among other things) enable stack
> > >    traces of all running processes with the soft lockup detector if
> > >    you've enabled the sysctl "kernel.softlockup_all_cpu_backtrace". O=
n
> > >    its own, a) doesn't give a hard lockup detector.
> > >
> > > b) A different recently-posted series [2] that adds a hard lockup
> > >    detector based on perf. On its own, b) gives a stack crawl of the
> > >    locked up CPU but no stack crawls of other CPUs (even if they're
> > >    locked too). Together with a) + b) we get everything (full lockup
> > >    detect, full ability to get stack crawls).
> > >
> > > c) The old Android "buddy" hard lockup detector [3] that I'm
> > >    considering trying to upstream. If b) lands then I believe c) woul=
d
> > >    be redundant (at least for arm64). c) on its own is really only
> > >    useful on arm64 for platforms that can print CPU_DBGPCSR somehow
> > >    (see [4]). a) + c) is roughly as good as a) + b).
>
> > It's been 3 weeks and I haven't heard a peep on this series. That
> > means nobody has any objections and it's all good to land, right?
> > Right? :-P
>
> FWIW, there are still longstanding soundness issues in the arm64 pseudo-N=
MI
> support (and fixing that requires an overhaul of our DAIF / IRQ flag
> management, which I've been chipping away at for a number of releases), s=
o I
> hadn't looked at this in detail yet because the foundations are still som=
ewhat
> dodgy.
>
> I appreciate that this has been around for a while, and it's on my queue =
to
> look at.

Ah, thanks for the heads up! We've been thinking about turning this on
in production in ChromeOS because it will help us track down a whole
class of field-generated crash reports that are otherwise opaque to
us. It sounds as if maybe that's not a good idea quite yet? Do you
have any idea of how much farther along this needs to go? ...of
course, we've also run into issues with Mediatek devices because they
don't save/restore GICR registers properly [1]. In theory, we might be
able to work around that in the kernel.

In any case, even if there are bugs that would prevent turning this on
for production, it still seems like we could still land this series.
It simply wouldn't do anything until someone turned on pseudo NMIs,
which wouldn't happen till the kinks are worked out.

...actually, I guess I should say that if all the patches of the
current series do land then it actually _would_ still do something,
even without pseudo-NMI. Assuming the last patch looks OK, it would at
least start falling back to using regular IPIs to do backtraces. That
wouldn't get backtraces on hard locked up CPUs but it would be better
than what we have today where we don't get any backtraces. This would
get arm64 on par with arm32...

[1] https://issuetracker.google.com/281831288

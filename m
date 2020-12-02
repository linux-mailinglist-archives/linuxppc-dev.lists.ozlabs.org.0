Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 850B12CB2DD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 03:40:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm39s2QM5zDr2K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 13:40:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.81;
 helo=conssluserg-02.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=tOIszf40; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm37c1rp6zDr2J
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 13:38:51 +1100 (AEDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 0B22cGiR027100
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 2 Dec 2020 11:38:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0B22cGiR027100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1606876697;
 bh=vuUMWsxXWrQ01Gfrdczxg27I9JGZI9RgaFpbn6oV8oY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tOIszf40xXMr7wl2vaTq0SdMqyYgNDISAPEKaMCWtPJc7Hp7VSpE9XQqWeo0wI8wa
 QJT9cmpmkD84Ula01K1MNeGpetZlJFnpGMbltg1LZRNMpk7tp87r4N6kGvOK73v+gA
 XZRLlx1I79vh+HoJvYM2zatzyPRtfXT6GA7Jr7gUbG8Ebdmh872/qj1hsRKNCkhZkR
 UzYmg9qt4B3+FXpvgo8oIQabd4iow6OW2vwHCf4IVCrJwGSqtiPxq0pwPp9aqoPKJ0
 FAGb/tPgifi/N/wKnqaYzE/FgNAfujPHc3ACXjfGSMFLaqZYu1BZbyWDZkypSc+7Yi
 BhBCJf137b8QA==
X-Nifty-SrcIP: [209.85.214.172]
Received: by mail-pl1-f172.google.com with SMTP id r2so285321pls.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 18:38:16 -0800 (PST)
X-Gm-Message-State: AOAM533nacASXqNwnExZIY/7MTxw3+6gH310XQ0ULOEPWx8iWCGOQLwg
 4HuJI2ytNvfugVhUWFRVFXBg7Q/7Eeq9QkWQCw0=
X-Google-Smtp-Source: ABdhPJwDC7vrgmZd87TnYojT5DQVV1p4zLlwe3QC9WsNK/LcmfS4g+CuJs+s5piItla/TVt9fXBTfy6W+2sB4RqB+n8=
X-Received: by 2002:a17:90a:fa0c:: with SMTP id
 cm12mr195096pjb.87.1606876696170; 
 Tue, 01 Dec 2020 18:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-2-natechancellor@gmail.com>
 <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
 <202011241421.A2F3062A70@keescook>
 <CAK7LNAR=_+1K7EtpvGzgyM+ans-iNOT0PBXdLRApnsyAzakQ3w@mail.gmail.com>
 <202012011255.9D677ED3@keescook>
In-Reply-To: <202012011255.9D677ED3@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 2 Dec 2020 11:37:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQGqcCBBFbKwe_eTuBqtNwDn_q8c0nPBJVsEoHP6F+aKA@mail.gmail.com>
Message-ID: <CAK7LNAQGqcCBBFbKwe_eTuBqtNwDn_q8c0nPBJVsEoHP6F+aKA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
 10.0.1
To: Kees Cook <keescook@chromium.org>
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 "kernelci . org bot" <bot@kernelci.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 2, 2020 at 5:56 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Dec 01, 2020 at 10:31:37PM +0900, Masahiro Yamada wrote:
> > On Wed, Nov 25, 2020 at 7:22 AM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Thu, Nov 19, 2020 at 01:13:27PM -0800, Nick Desaulniers wrote:
> > > > On Thu, Nov 19, 2020 at 12:57 PM Nathan Chancellor
> > > > <natechancellor@gmail.com> wrote:
> > > > >
> > > > > ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> > > > > along with a few others. Newer versions of ld.lld do not have these
> > > > > warnings. As a result, do not add '--orphan-handling=warn' to
> > > > > LDFLAGS_vmlinux if ld.lld's version is not new enough.
> > > > >
> > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> > > > > Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> > > > > Reported-by: kernelci.org bot <bot@kernelci.org>
> > > > > Reported-by: Mark Brown <broonie@kernel.org>
> > > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > >
> > > > Thanks for the additions in v2.
> > > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > >
> > > I'm going to carry this for a few days in -next, and if no one screams,
> > > ask Linus to pull it for v5.10-rc6.
> > >
> > > Thanks!
> > >
> > > --
> > > Kees Cook
> >
> >
> > Sorry for the delay.
> > Applied to linux-kbuild.
>
> Great, thanks!
>
> > But, I already see this in linux-next.
> > Please let me know if I should drop it from my tree.
>
> My intention was to get this to Linus this week. Do you want to do that
> yourself, or Ack the patches in my tree and I'll send it?
>
> -Kees
>
> --
> Kees Cook


I will send a kbuild pull request myself this week.




-- 
Best Regards
Masahiro Yamada

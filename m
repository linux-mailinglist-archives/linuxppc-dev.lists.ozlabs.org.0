Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A72CA3F4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 14:36:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CljnB3GyPzDqV8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 00:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.91;
 helo=conssluserg-06.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=THr+eUx4; 
 dkim-atps=neutral
X-Greylist: delayed 186 seconds by postgrey-1.36 at bilbo;
 Wed, 02 Dec 2020 00:32:40 AEDT
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CljhS12H1zDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 00:32:39 +1100 (AEDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 0B1DWG8S011889
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Dec 2020 22:32:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0B1DWG8S011889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1606829537;
 bh=BCmIt+mXGDdopPkiBBw+3x1M8rDQB/5oH9HpU4uQ5qA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=THr+eUx4SWCPegG1uRLmRHq1mlzwZIBJZfMOhYfUi9PvS1ZmkPpZzJJvSBKEXI9sU
 hGC9IjavC/i0M1vYGEAMjvM98V1iWPC3aWRaEJSIOHHtzxpNfyiU+Xwd2P6gXrIQPS
 SBI2ODfn0nhkwR8fjb1OQE+Yjh/NV9bSiWHzDE2LI9RpqgZs+QdPfBpe51hHlxXvAJ
 RCvvpEU+nYui6Z2WZAO+0K3fgTe6V0Jz2Wi18KbjOr7S2LM8NCEoX5aV0ocxOflfoN
 1puiE9MAIrJw5ZvQfSeKd0GYgw0KCnvdZxS7Qn+x0fA5AwGdHaaXZErK79XdW2aK8u
 bNGE8JRlo2tXA==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id u2so1127534pls.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 05:32:16 -0800 (PST)
X-Gm-Message-State: AOAM532+kch0hKrlAeIL4BaZtOgtUW4aXiTfZr0HazWyEdj4Ato+WGk5
 Wgzv5v3dzkl3E5Mge1hxErOcgKfxwIp9redKMzw=
X-Google-Smtp-Source: ABdhPJxkfQ9oggzotEcl6XRa/pHYRdnHTVyaDTtBNoctn5AxYzZdCy2G1D8jd7raU+usum4j5kNizUmaOheYMGClFnM=
X-Received: by 2002:a17:902:402:b029:da:2cb9:56e8 with SMTP id
 2-20020a1709020402b02900da2cb956e8mr2703980ple.1.1606829536018; Tue, 01 Dec
 2020 05:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-2-natechancellor@gmail.com>
 <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
 <202011241421.A2F3062A70@keescook>
In-Reply-To: <202011241421.A2F3062A70@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Dec 2020 22:31:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=_+1K7EtpvGzgyM+ans-iNOT0PBXdLRApnsyAzakQ3w@mail.gmail.com>
Message-ID: <CAK7LNAR=_+1K7EtpvGzgyM+ans-iNOT0PBXdLRApnsyAzakQ3w@mail.gmail.com>
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

On Wed, Nov 25, 2020 at 7:22 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Nov 19, 2020 at 01:13:27PM -0800, Nick Desaulniers wrote:
> > On Thu, Nov 19, 2020 at 12:57 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> > > along with a few others. Newer versions of ld.lld do not have these
> > > warnings. As a result, do not add '--orphan-handling=warn' to
> > > LDFLAGS_vmlinux if ld.lld's version is not new enough.
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> > > Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> > > Reported-by: kernelci.org bot <bot@kernelci.org>
> > > Reported-by: Mark Brown <broonie@kernel.org>
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> >
> > Thanks for the additions in v2.
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> I'm going to carry this for a few days in -next, and if no one screams,
> ask Linus to pull it for v5.10-rc6.
>
> Thanks!
>
> --
> Kees Cook


Sorry for the delay.
Applied to linux-kbuild.

But, I already see this in linux-next.

Please let me know if I should drop it from my tree.


-- 
Best Regards
Masahiro Yamada

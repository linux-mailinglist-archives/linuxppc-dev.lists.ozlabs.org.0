Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC292CC60E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 19:58:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmStB1Kp1zDr7P
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 05:58:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Cu7Xt7Qn; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmSr52MVfzDqD3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 05:56:50 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id w6so1839058pfu.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Dec 2020 10:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2df0cgPfG2SAK1g7NT0O8N+0jOgAdMPH5rFcEcsmtzM=;
 b=Cu7Xt7Qn/3aPgdAkS2syTqxV41qdValgrBZYQqryrysoVtGdgBLW1Umm+ymeWh5B7+
 kZqrtKf1iwCkHCjz0PqySSBrzAlqEGJUcEnELClsLXBywkDw+tIHAGkRJUpSf4r5si2X
 U71QWOp65achEjowERhc1Pgww2DGhtmolmAck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2df0cgPfG2SAK1g7NT0O8N+0jOgAdMPH5rFcEcsmtzM=;
 b=qBNGwxECoS+th1Ehxn1N81hlmC9HI/Z436NdZQGqpfLeNY+paejiOnRmgzVjGVH0Zr
 hfeXkEkOpjdCNaMHeuf+xFPfRLqTU+otp3QnOEcIGnpQmcCtD2B56yiYot9jMd0fc8x7
 5ngRveH6rMEKQrs4RqhFkV77fb2O255Jlj4VnCVgps/0kdMEfr8iPKrZZEhnAJ7egS0R
 E8NSI44DTigMcKFdIOlC5xAAjhnvOXnhg/9Ano8zey0y4++aCZdTu132W/DjD9riq0w3
 8Iae4QcZhqAeYQ8OIeu/jnIovPCexwTzYBjgmi/otXkTkWX0VgynZYy1d5gqq5ufgCOm
 sB/Q==
X-Gm-Message-State: AOAM533zyJOP6mTAxh/jv1iofigtRFptCwmPzmGB/yanvoELmsy8wc2b
 BiiWKhR8ql5MRVxBC6YOuynKyA==
X-Google-Smtp-Source: ABdhPJwDihIdf9Kj1zww9pUzlRPKReVIPkPu886DIRfJAubQGRXMJaWo5MU1jtqDrgcMhi9+DatHIQ==
X-Received: by 2002:a63:f308:: with SMTP id l8mr1179038pgh.68.1606935406993;
 Wed, 02 Dec 2020 10:56:46 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u3sm512394pfu.47.2020.12.02.10.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:56:45 -0800 (PST)
Date: Wed, 2 Dec 2020 10:56:44 -0800
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
 10.0.1
Message-ID: <202012021056.3EA0BBFDD@keescook>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-2-natechancellor@gmail.com>
 <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
 <202011241421.A2F3062A70@keescook>
 <CAK7LNAR=_+1K7EtpvGzgyM+ans-iNOT0PBXdLRApnsyAzakQ3w@mail.gmail.com>
 <202012011255.9D677ED3@keescook>
 <CAK7LNAQGqcCBBFbKwe_eTuBqtNwDn_q8c0nPBJVsEoHP6F+aKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQGqcCBBFbKwe_eTuBqtNwDn_q8c0nPBJVsEoHP6F+aKA@mail.gmail.com>
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

On Wed, Dec 02, 2020 at 11:37:38AM +0900, Masahiro Yamada wrote:
> On Wed, Dec 2, 2020 at 5:56 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Tue, Dec 01, 2020 at 10:31:37PM +0900, Masahiro Yamada wrote:
> > > On Wed, Nov 25, 2020 at 7:22 AM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > On Thu, Nov 19, 2020 at 01:13:27PM -0800, Nick Desaulniers wrote:
> > > > > On Thu, Nov 19, 2020 at 12:57 PM Nathan Chancellor
> > > > > <natechancellor@gmail.com> wrote:
> > > > > >
> > > > > > ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> > > > > > along with a few others. Newer versions of ld.lld do not have these
> > > > > > warnings. As a result, do not add '--orphan-handling=warn' to
> > > > > > LDFLAGS_vmlinux if ld.lld's version is not new enough.
> > > > > >
> > > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> > > > > > Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> > > > > > Reported-by: kernelci.org bot <bot@kernelci.org>
> > > > > > Reported-by: Mark Brown <broonie@kernel.org>
> > > > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > > > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > > >
> > > > > Thanks for the additions in v2.
> > > > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > > >
> > > > I'm going to carry this for a few days in -next, and if no one screams,
> > > > ask Linus to pull it for v5.10-rc6.
> > > >
> > > > Thanks!
> > > >
> > > > --
> > > > Kees Cook
> > >
> > >
> > > Sorry for the delay.
> > > Applied to linux-kbuild.
> >
> > Great, thanks!
> >
> > > But, I already see this in linux-next.
> > > Please let me know if I should drop it from my tree.
> >
> > My intention was to get this to Linus this week. Do you want to do that
> > yourself, or Ack the patches in my tree and I'll send it?
> 
> I will send a kbuild pull request myself this week.

Okay, thanks! I've removed it from my -next tree now.

-- 
Kees Cook

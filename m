Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 248981B88A4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 20:54:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498gFn3t83zDqfq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 04:54:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=J1HDIxyv; dkim-atps=neutral
X-Greylist: delayed 4885 seconds by postgrey-1.36 at bilbo;
 Sun, 26 Apr 2020 04:53:24 AEST
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498gD46n8CzDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 04:53:23 +1000 (AEST)
Received: from zn.tnic (p200300EC2F2A1100B46A3E12B0A6AFFD.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f2a:1100:b46a:3e12:b0a6:affd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8527F1EC0C84;
 Sat, 25 Apr 2020 20:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1587840800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=iTbPHyhUCYp1hsTKDTL6Rkak9xj3g4rssRfqZNkVLdA=;
 b=J1HDIxyv/9Q6KrgTFyzUaS9MzUgSTqUl1CHKzxt9TsfuRWCgenOsqkBAUiSvooHmIFgoYR
 xTFg4Y4kCmZjWDIrRtDZdBKr0CU76/YyCxbHLM8CBk0vP11S/rVp9yFpSmoUqaXMTtJMbC
 uoQ0v7K3Cuy7iuezi+zng5kYLFXuv0o=
Date: Sat, 25 Apr 2020 20:53:13 +0200
From: Borislav Petkov <bp@alien8.de>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] x86: Fix early boot crash on gcc-10, next try
Message-ID: <20200425185313.GD24294@zn.tnic>
References: <CAKwvOdkbcO8RzoafON2mGiSy5P96P5+aY8GySysF2my7q+nTqw@mail.gmail.com>
 <20200422212605.GI26846@zn.tnic>
 <CAKwvOd=exxhfb8N6=1Q=wBUaYcRDEq3L1+TiHDLz+pxWg8OuwQ@mail.gmail.com>
 <20200423125300.GC26021@zn.tnic> <20200423161126.GD26021@zn.tnic>
 <20200425014657.GA2191784@rani.riverdale.lan>
 <20200425085759.GA24294@zn.tnic>
 <20200425150440.GA470719@rani.riverdale.lan>
 <20200425173140.GB24294@zn.tnic>
 <20200425183701.GE17645@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200425183701.GE17645@gate.crashing.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jakub Jelinek <jakub@redhat.com>, jgross@suse.com,
 Michael Matz <matz@suse.de>, Kees Cook <keescook@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Martin =?utf-8?B?TGnFoWth?= <mliska@suse.cz>, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Sergei Trofimovich <slyfox@gentoo.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, boris.ostrovsky@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 25, 2020 at 01:37:01PM -0500, Segher Boessenkool wrote:
> That is a lot more typing then
> 	asm("");

That's why a macro with a hopefully more descriptive name would be
telling more than a mere asm("").

> but more seriously, you probably should explain why you do not want a
> tail call *anyway*, and in such a comment you can say that is what the
> asm is for.

Yes, the final version will have a comment and the whole spiel. This
diff is just me polling the maintainers: "do you want this for your arch
too?" Well, the PPC maintainers only, actually.

The other call in init/main.c would be for everybody.

> I don't see anything that prevents the tailcall in current code either,
> fwiw.

Right, and I don't see a reason why gcc-10 would do that optimization on
x86 only but I better ask first.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

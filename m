Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AB41B89C8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 00:20:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498lpP6YnszDqPm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 08:19:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=TblBEYYV; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498llz0KwPzDqbl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 08:17:50 +1000 (AEST)
Received: from zn.tnic (p200300EC2F2A110011AF566E608DBC7E.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f2a:1100:11af:566e:608d:bc7e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 882CE1EC0CFA;
 Sun, 26 Apr 2020 00:17:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1587853059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=dL/4+F/i9p4Rl9Mx/xjx1nvt6QzxFIox9qHe7WXmyFs=;
 b=TblBEYYVBE117oRluNpJNENnYeOMCXqC/PfzHUdL+2vSRmqMvQy+meocoqlRkiQ6dm3Iwc
 L2W0F0ifdIT+uqXVrfbz3xnhSFDCv99NuSUY4gzMe4QZkhhdVsZeF9dp1iEu+D0o330Nwx
 iTAQdlLBKNKi+8JkcWTj55M/pDBeSUs=
Date: Sun, 26 Apr 2020 00:17:28 +0200
From: Borislav Petkov <bp@alien8.de>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] x86: Fix early boot crash on gcc-10, next try
Message-ID: <20200425221728.GE24294@zn.tnic>
References: <CAKwvOd=exxhfb8N6=1Q=wBUaYcRDEq3L1+TiHDLz+pxWg8OuwQ@mail.gmail.com>
 <20200423125300.GC26021@zn.tnic> <20200423161126.GD26021@zn.tnic>
 <20200425014657.GA2191784@rani.riverdale.lan>
 <20200425085759.GA24294@zn.tnic>
 <20200425150440.GA470719@rani.riverdale.lan>
 <20200425173140.GB24294@zn.tnic>
 <20200425183701.GE17645@gate.crashing.org>
 <20200425185313.GD24294@zn.tnic>
 <20200425191549.GF17645@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200425191549.GF17645@gate.crashing.org>
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

On Sat, Apr 25, 2020 at 02:15:49PM -0500, Segher Boessenkool wrote:
> My point is that you should explain at *every use* of this why you cannot
> have tail calls *there*.  This is very unusual, after all.
> 
> There are *very* few places where you want to prevent tail calls, that's
> why there is no attribute for it.

Well, there is only one reason *why* so far - to prevent the stack
canary cookie from being checked before returning from the function
which set it. That could be explained once over the macro definition so
that it can be looked up.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

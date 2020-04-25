Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6581B8828
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 19:33:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498dRz46G5zDqhH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 03:33:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=BTmQGxPN; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498dQK3W3wzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 03:32:09 +1000 (AEST)
Received: from zn.tnic (p200300EC2F2A1100992835E22F06EF88.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f2a:1100:9928:35e2:2f06:ef88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E661D1EC0CD6;
 Sat, 25 Apr 2020 19:31:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1587835909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=uFkXHVwwFH85jEcy4ns2EHqg9WJsW4QYuQw8r9bQI2U=;
 b=BTmQGxPNkg4Aex6qccxM+7l3usJmduwct1PjS327BGPnactFewmsBn0SUUBJN/bLHJm8uS
 bH1n7RXre+Ch0s1AD3P0KBwk5St68VwI+8uFYYn10XCufU/CWkI+iRdM03E3fujigj8wt4
 mpPVdtWb+IP77M7zyMU6HTk4NzaAazQ=
Date: Sat, 25 Apr 2020 19:31:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Arvind Sankar <nivedita@alum.mit.edu>
Subject: Re: [PATCH] x86: Fix early boot crash on gcc-10, next try
Message-ID: <20200425173140.GB24294@zn.tnic>
References: <CAKwvOd=Dza3UBfeUzs2RW6ko5fDr3jYeGQAYpJXqyEVns6DJHg@mail.gmail.com>
 <20200422192113.GG26846@zn.tnic>
 <CAKwvOdkbcO8RzoafON2mGiSy5P96P5+aY8GySysF2my7q+nTqw@mail.gmail.com>
 <20200422212605.GI26846@zn.tnic>
 <CAKwvOd=exxhfb8N6=1Q=wBUaYcRDEq3L1+TiHDLz+pxWg8OuwQ@mail.gmail.com>
 <20200423125300.GC26021@zn.tnic> <20200423161126.GD26021@zn.tnic>
 <20200425014657.GA2191784@rani.riverdale.lan>
 <20200425085759.GA24294@zn.tnic>
 <20200425150440.GA470719@rani.riverdale.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200425150440.GA470719@rani.riverdale.lan>
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
Cc: Jakub Jelinek <jakub@redhat.com>, jgross@suse.com, x86@kernel.org,
 Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Michael Matz <matz@suse.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Sergei Trofimovich <slyfox@gentoo.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Thomas Gleixner <tglx@linutronix.de>,
 Martin =?utf-8?B?TGnFoWth?= <mliska@suse.cz>, boris.ostrovsky@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 25, 2020 at 11:04:40AM -0400, Arvind Sankar wrote:
> I'd put the clause about stack protector being disabled and the
> tail-call one together, to make clear that you still need the never
> return and always inline bits.

Done.

> Also, this function is implemented by multiple arch's and they all
> have similar comments -- might be better to consolidate the comment in
> the generic (dummy) one in include/linux/stackprotector.h laying out
> the restrictions that arch implementations should follow?

I'm not sure gcc-10 does the same thing on other arches - I'd let gcc
guys chime in here and other arch maintainers to decide what to do.

> There's also the one in init/main.c which is used by multiple
> architectures. On x86 at least, the call to arch_call_rest_init at the
> end of start_kernel does not get tail-call optimized by gcc-10, but I
> don't see anything that actually prevents that from happening. We should
> add the asm("") there as well I think, unless the compiler guys see
> something about this function that will always prevent the optimization?

Hmm, that's what I was afraid of - having to sprinkle this around. Yah, let's
wait for compiler guys to have a look here and then maybe I'll convert that
thing to a macro called

	compiler_prevent_tail_call_opt()

or so, so that it can be sprinkled around. ;-\

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

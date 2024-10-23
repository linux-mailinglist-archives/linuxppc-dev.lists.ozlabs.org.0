Return-Path: <linuxppc-dev+bounces-2502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FF49AC6E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 11:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYPL23R4Gz2yP8;
	Wed, 23 Oct 2024 20:45:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729676730;
	cv=none; b=V4bwJ1vnPZtRWAaw762LQpnn9voQ6qeNpRxCodsg/LKY0aRLVJVc3lBNqd8xQB1VEUURZgp4DU/kLk713AzuPP6PjYGMbub1g3JyCVUInLD3/WA1sWtzUznWJ204LLNXFtCEBKe7FFE88KblU7tTeGUtz4rtJ1VR0paiPUOzqeu2RBErj6onA+aMfrZTSDnS0Q3v+uco9KAo/vrBMsdlc8jY+bj0ZSTKJcbi6qpnmAOEFE1IBgLSkzQxoxgRbLTbRfilkbH90Nyb+KwCbO8qxu3Z0odomVMxVcC9rGLXSFQ9P0BOkjc1U6xAAlptE2/c0pq+iswRdF//ekMxRm58kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729676730; c=relaxed/relaxed;
	bh=xRuMdK9J2tCbYWS8krmRxv7safBbeT5X2+w+HlX8Rpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duxGdJ7U8kNdr7e0msl5DH4a986L7oH+c+1EYPJT9eHxlx4j9L8bIXuYDdsMH89kZAfTi32qOfuuNOkte9o0FpCruW0A6bfdbcqEOlFd3tgoeiU45R8f5mIE11nqn4V/ugDLLIA7OhT5DttMBQh1ndszG3fP7H6wa3jmQIPUktjNitoDyHUpq6BgBlfjKl/mFrrarXi5jnaOmmVdOL7pw+3KR3qfGZ/AuVVZ7eW7ZLTkWt7zFLHVNm6ICQp4B2TiEQ/M+D36Y/YgX9XPLAzOr63EnI/IBHsSHIkoSWE+hkGit6/m2A7LCNvlpC/8h3CltsvXcoZJDJNSrNTpU2IwBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=emjVegVn; dkim-atps=neutral; spf=pass (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=emjVegVn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYPKw34gbz2xY0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 20:45:24 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5F30840E0263;
	Wed, 23 Oct 2024 09:45:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HgmO6BCblXDQ; Wed, 23 Oct 2024 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1729676707; bh=xRuMdK9J2tCbYWS8krmRxv7safBbeT5X2+w+HlX8Rpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=emjVegVnoWx8fS8bbOm6MR9KWS1S+PcsFf63GL9pgeVJAUuaxkOvpiZTvz/X/Iasb
	 Nv0oeJZsTCuBMQBxbz9FQc81l80L46oTuJl8fbvJsY4YQ+AVlUErYh5Pfxv76sg9LA
	 ai5BDhSvHttrjizGRzlGjoLR6Jkt2jX1WGTWWcMLKR4SUH6QwAWkoCywLsaz0pw5Qz
	 voCSeQbfcG+NNzLeMqLZqgia5QVdRZgwjKwWT0svSmpTglLllD8xYIwsocmHFLTXa+
	 DuSwkhjQU9ZD6ExZznK1On+GjexKsYqtDMaf4KbNsoF3Xr3gafUOXz4EnOrnlY1crz
	 qWWGIGnKUY0SgPGVSd3L3oPPhHMBNF/BQaIT9MGZErR5p53YryCb2txVnvNJjOAY/1
	 RlkqBI1+319tfrAU57mOzthbKSD+OgGKTE2+L8I3O4KbDzckkmWVqyEBhFH8Z0C1Lh
	 ip8gXzG9xNTZeBI6lbEdt57x5fJT75SweXQXFo5CGPC7WyqYTfKLJ43zusU7cVJO3H
	 rdLSmJpOniGJEV9fBrnRBOakRa06cRo+2EPeyTI5G7tKThFzGFWtqcIi/jtjtWk7kl
	 3qrIfgoDll03zWKhdJr4bPc/lNXhJhQAGCyBfwY6T2JVn7cJLr/pl+bJN+8kj9FY1u
	 r8aUWgkmmcAbFcnQLDhSVHyw=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3FCBC40E0191;
	Wed, 23 Oct 2024 09:44:53 +0000 (UTC)
Date: Wed, 23 Oct 2024 11:44:48 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <20241023094448.GAZxjFkEOOF_DM83TQ@fat_crate.local>
References: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
 <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
 <20241020231112.erso2jzqwkbin4kh@treble>
 <CAHk-=wiUaWnHGgusaMOodypgm7bVztMVQkB6JUvQ0HoYJqDNYA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wiUaWnHGgusaMOodypgm7bVztMVQkB6JUvQ0HoYJqDNYA@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 20, 2024 at 04:35:21PM -0700, Linus Torvalds wrote:
> So I think this time we push back on the hardware people and tell them
>  it's *THEIR* damn problem, and if they can't even be bothered to say
> yay-or-nay, we just sit tight.

So I was able to get some info: CLAC/STAC in everything Zen4 and older is
serializing so there's no issue there.

Zen5 is a different story and AC is being renamed there and thus,
non-serializing. So we'd need to do something there, perhaps something
like Josh's patch...

But the good thing is we can alternative it out only for those machines, apart
from the rest.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


Return-Path: <linuxppc-dev+bounces-2275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4099E344
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 12:01:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSV3l44lhz3bkb;
	Tue, 15 Oct 2024 21:01:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728986467;
	cv=none; b=bgw/D59m08lQYSLint30UflgLGkpNBCH+HtyAwNACwaTf7ZAP0xJlv1CrzjDOuB1mkN7TlFwjYb5a+OrshGDdaMB6NZShyGQ7sWR1XXvyeHoGCDAn6wnHC9sQaH/LsOZw4kbBM2kqOuQs/fII+THNG4V9mI+8f7LpJf+Mwb79homIcf2aNqtVapVvccThKUzBdtIvhfeE30N5gi1dtYl1TPA9rKV//oCSMRH9Be45CwSU/JspE7WN+eXL2Azowk0Ryvj5opPgAMv5IFX85MrjBYrOjBZb8kRq4YjRhnkRH5d2pH+Q21SNe7TyqdOfOyBvV6lzHoFZxqMq/j/i0a0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728986467; c=relaxed/relaxed;
	bh=kd3UR45StSIkqmJZ1SJRyeGHyFRLiBEAJy/jxLUT6D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSW+6DNicN57DQlhDP90aTcbnm0uNn34ZmPfMzPlJ+FCR9ZNs3ATMEqx/zL5ZHUPSsoLrafdtPdC18iAsC3nYBOwSd/T499HK2TLcqLQLOpudCgOLyE/XsFtKPGnQrWYz7WEODWyXm/e/FKMi0K9zfi8R4amKANbylvSf2T9edfb/blH5KhAT3oYJNjn8Ab4l85yeKuk8GZWEd0uHO/9KOB1w/Qpvmsww+SgFaplZazlRBk4+p+NGBnf1bAqSv6Lnwsb3wshjsyvAi0kXliepwS/uv12O9phLm2fRsCDBq+Do9s0uIIfWYoVub7eTjobClBRaZDKHsTVRfmH7mXV9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=fail (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=au43u5ld reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=au43u5ld;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSV3d1W8Jz2xBk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 21:00:57 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E43D640E0169;
	Tue, 15 Oct 2024 10:00:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1A3lAJlfO1Zr; Tue, 15 Oct 2024 10:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1728986446; bh=d7UdafglEuJoW1ffOpnBF+TRGVFoELgg8Z190QaONYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=au43u5ldkdW7L2wvg4eZ42Wv4JWT0K+WlYZHHCdINgENDTfOPzLjEHhWLlI5DW6Re
	 d0y7iZSoqGGZrH5WWKyUB9bfatihfZxc4ScEMm0R75jYh8Q1Tndw8s9vzz+3Q1MbVu
	 RsjA7XCCSGV+g+daYRMdeNufy9rXC0bpXTz59wIOSkm3AW/Yqrk94uB9zNj+WnoUqo
	 YezzpUgATgctj6On4ywOU4nyhhdBq/L+KgYuAtbvkI/BfnDzAE6lXuV/GZ9mpzF5+O
	 ty/vP/K+igbDVc4SifpE9BF9+4XH2Sjgcxfh/a2FcivJYPjU6zEAnga1G2Lz4aDWW/
	 ARt3eQ8anJVxBjSO+6nWXwBgeDjJ3jmiP8jEnvc/aogA/tJCxKQBCcImz190UbcfxF
	 r4KgcUK0Y2RaFuutd06Kq20syJPNXGyLMM7+022b1wxMWn/ycckGXnqebQ3NPZDfgZ
	 N8IDh5DOTZcRZZF0vZI7w8QYzP0+mDu1UJOpD6Ob0VoIh5weLYcYzHHLYsG00vZyCE
	 4gzkS6sTHc7/zcVG5Mm+6MP5U08GCf71b6ZdQo8BMvy9euXRyPGZe+7zj/jsrX5iqL
	 DEZ7EqHRc65jox1raubP0Bi2TvMKHKwX+8RpGsWJ5UFQwNWgGIp2srwIHca1xH+vmt
	 1gAWkzmGbtDJ8rtWjsluROiE=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 585A740E0194;
	Tue, 15 Oct 2024 10:00:32 +0000 (UTC)
Date: Tue, 15 Oct 2024 12:00:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <20241015100026.GBZw49OozVOTZat6VO@fat_crate.local>
References: <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 14, 2024 at 04:39:26PM +0100, Andrew Cooper wrote:
> But, I expect it will malfunction on newer hardware when
> CONFIG_X86_5LEVEL=3Dn, because it causes Linux to explicitly ignore the
> LA57 bit.=C2=A0 That can be fixed by changing how CONFIG_X86_5LEVEL wor=
ks.

https://lore.kernel.org/all/80734605-1926-4ac7-9c63-006fe3ea6b6a@amd.com/

But there was some lmbench regression...

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


Return-Path: <linuxppc-dev+bounces-3025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C739C11EA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 23:38:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkxmr6swzz3bqD;
	Fri,  8 Nov 2024 09:38:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731019100;
	cv=none; b=SOtpOkh3bDG0PTw4P3wjO9SeEsIwwSk5bZLvHzQTqSryXm92Vus3k07/cSKVI3y1BIev+hZaQPE9zWhs+b3bUeXBr7W/zAUNssJHFCKWW9SaDr0IGea6g0JqDb7xBa84mq8O02HL0mMlhbA/Lu3d2nlr87nAgtDb8P+5uXsdGzmmomrm66gYV+JQxy8Vvw9C1fbMenIW+U4C93eqgvKRPX+TZNQL+pW16f4NsmVb72Ag7E0zN4q0gIOWeLLh6YkuEdGERvbaQ2n+WCCNz/pBiWOQgQHdpVp/Q04EXirtd/ZLaYMKgg2nuLS4kMVGZiqoEeD2cDfUpY4/I9cW1vJw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731019100; c=relaxed/relaxed;
	bh=XtY0CMX+eQzJ6bn37JkC0TFW1jUDE6STEsjCGv6T4mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPwLF0SfqixbPZyvTSAZAoLt4SJmfHEiDTOJXhh7TaPEhYarEr3/ks5lBgiKvH3ClUVKXLK1P1CwokWzG8HKnRLkDLSD/SiBzcnQPtv9lnTh0F8ngClNRiYUBeauPDDCFshL8KRTUuaAsPOlRtk0jbvilaCmoIbUYWWPpp79+pplzCqNk3BETLFvcD2+SnP2Xxk+soJtwrzDfvkczlwLYBTxS2tr6Q9Z9WfglC6CBd8YvfyKtEcb7AWCtd2p4PqNDd0EPUIwi0JYDp/bCBZ1Y3Ytk/+IB4vtv7lqpxH4QzB26DLgLydN41xNuqEGLcPeDCd/kXZkChMDhkWa1uc9lQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T6fjrNRK; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T6fjrNRK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkxmq1j3jz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 09:38:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0D4A5C4B87;
	Thu,  7 Nov 2024 22:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B13FC4CECC;
	Thu,  7 Nov 2024 22:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731019095;
	bh=1vresE0L3Nh3fHiQZbFLwAwAhjoMFFb+bTLtc7rSuxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6fjrNRK0H7rMGmtghlNMki/7KUUA3JkXKRGsBeHjc8CCMykYE+gcyamhcLzNFUT1
	 TPYgWtKUP50fWbzpvceAl/y5Ye4PI2/vVF6v7d6Pl7Rht23wGL+oFVUf+kZhHuu/IV
	 ZH8w2RYM443JXE4j0c8o+9E4dp8pF0UsmJ7MqlFMQ2yfFxsVDPfqDvcJf1SeEyEToy
	 qrfZ3HAy0D1q7aqZraUuZCbf8JBqF9MW2YrBZ+AWwcSlYW7d5pitli87r1Hw4CzJnZ
	 E6F8nkrNVLvi3VEEhCM5zPRItjpua5G9swipPx81U9fpAJbRA43qT1QJTXvjO14r6h
	 XJ5/Mq96LOcZQ==
Date: Thu, 7 Nov 2024 14:38:13 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
Message-ID: <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
 <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
 <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
 <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 06, 2024 at 02:19:38PM -0800, Matthew Maurer wrote:
> >
> > > If booted against an old kernel, it will
> > > behave as though there is no modversions information.
> >
> > Huh? This I don't get. If you have the new libkmod and boot
> > an old kernel, that should just not break becauase well, long
> > symbols were not ever supported properly anyway, so no regression.
> 
> Specifically, if you set NO_BASIC_MODVERSIONS, build a module, and
> then load said module with a kernel *before* EXTENDED_MODVERSIONS
> existed, it will see no modversion info on the module to check. This
> will be true regardless of symbol length.

Isn't that just the same as disabling modverisons?

If you select modversions, you get the options to choose:

  - old modversions
  - old modversions + extended modversions
  - extended modversions only

> > I'm not quite sure I understood your last comment here though,
> > can you clarify what you meant?
> >
> > Anyway, so now that this is all cleared up, the next question I have
> > is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
> > userspace requirements aren't large at all, what actual benefits does
> > using this new extended mod versions have? Why wouldn't a distro end
> > up preferring this for say a future release for all modules?
> 
> I think a distro will end up preferring using this for all modules,
> but was intending to put both in for a transitional period until the
> new format was more accepted.

The only thing left I think to test is the impact at runtime, and the
only thing I can think of is first we use find_symbol() on resolve_symbol() 
which it took me a while to review and realize that this just uses a
completely different ELF section, the the ksymtab sections which are split up
between the old and the gpl section. But after that we use check_version().
I suspect the major overhead here is in find_symbol() and that's in no way shape
or form affected by your changes, and I also suspect that since the
way you implemented for_each_modversion_info_ext() is just *one* search
there shouldn't be any penalty here at all. Given it took *me* a while
to review all this, I think it would be good for you to also expand your
cover letter to be crystal clear on these expectations to users and
developers and if anything expand on the Kconfig / and add documentation
if we don't document any of this.

I'd still like to see you guys test all this with the new TEST_KALLSYMS.

  Luis


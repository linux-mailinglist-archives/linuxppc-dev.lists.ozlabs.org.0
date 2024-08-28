Return-Path: <linuxppc-dev+bounces-690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD3C962756
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 14:40:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv3sK0j4Kz2yXd;
	Wed, 28 Aug 2024 22:40:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724848805;
	cv=none; b=Y2grX1LTr78gduOPYVkIThBY2f7OhcbVhvrRvIO+wU8GxSM4L+Q6TKiF+R5TbdJLnAXrPMqzVgkVyCzwYA03ceRFS58Iad5V8iJX3nJSGTS0AgKAbSCHUnMaAdAj+p3/nOEllMRw0xVCLmc9KsqQIql3GELG4Bit1NZS6IiA6S8xFvbLsE4/V4evqrew9j0kMCQY2FgLNK3ez0muFTTIc7mqjtCJE7WM+SqwYRBXfsVy5h0iKm+bncS8fHV9XO1Jujg7AW3NpJx2ggk8LjEPyj4i7dVBNvPPdhxJs1jdNeWMCoYaChnTH2auk6hlsoYPg2MbX5/B7/PvGeE7bkfiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724848805; c=relaxed/relaxed;
	bh=JkYTmJmrONNGhzJRE1nYc3r8lueDSK8+AxPwwEGRl0E=;
	h=Received:Received:X-Authentication-Warning:Date:From:To:Cc:
	 Subject:Message-ID:References:Mime-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=bpT7Bq44eb80wF6IsGzc5wdKJmBXFXv/2IPjle+4tiNAfOcOoPBs3sYOPksrlkvxj3keMcvPSndqUHX7etmyx1+U+wtu6FNFWxtPg/FCAWbduhmZVD8gALNVSHL+ZihEvyj/cESDNNc2wsAW8wKGsk8nVvbUtgbBeLWIiKrmAuU9/3HsPRad60HWNard1300vme8cPOpNLAMYb41JJfaB3+3iNHE2ckVPMdXm7mp72X8EyG+tnMdtifiNTnI/yjMqSOOVyP2yAckgnVB/tDy9dg6CAbPgR75ZGu4DXGiPte5zGuoOr+QcC+QnCL5s1in2Bd7isHtsqh6+4oCpucyBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv3sH4JcMz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 22:40:03 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 47SCXFAC030999;
	Wed, 28 Aug 2024 07:33:15 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 47SCXDte030998;
	Wed, 28 Aug 2024 07:33:13 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 28 Aug 2024 07:33:13 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Eric Biggers <ebiggers@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, "Theodore Ts'o" <tytso@mit.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org,
        linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
Message-ID: <20240828123313.GD29862@gate.crashing.org>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu> <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu> <20240827180819.GB2049@sol.localdomain> <20240827225330.GC29862@gate.crashing.org> <Zs8HirKLk-SrwTIu@zx2c4.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs8HirKLk-SrwTIu@zx2c4.com>
User-Agent: Mutt/1.4.2.3i

On Wed, Aug 28, 2024 at 01:18:34PM +0200, Jason A. Donenfeld wrote:
> On Tue, Aug 27, 2024 at 05:53:30PM -0500, Segher Boessenkool wrote:
> > On Tue, Aug 27, 2024 at 11:08:19AM -0700, Eric Biggers wrote:
> > > > +		for (i = 0; i < ARRAY_SIZE(params->reserved); i++)
> > > > +			params->reserved[i] = 0;

This is a loop.  With -ftree-loop-distribute-patterns, the default at
-O2, this is optimised to

    memset(params->reserved, 0, ...);

(which is perfectly fine, since memset is required to be there even
for freestanding environments, this is documented!)

> > -fno-tree-loop-distribute-patterns .  But, as always, read up on it, see
> > what it actually does (and how it avoids your problem, and mostly: learn
> > what the actual problem *was*!)
> 
> This might help with various loops, but it doesn't help with the matter
> that this patch fixes, which is struct initialization. I just tried it
> with the arm64 patch to no avail.

It very much *does* help.  Try harder?  Maybe you typoed?


Segher


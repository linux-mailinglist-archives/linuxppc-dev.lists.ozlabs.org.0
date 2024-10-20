Return-Path: <linuxppc-dev+bounces-2432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0212E9A5760
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 00:44:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWtmk0Crjz2xjh;
	Mon, 21 Oct 2024 09:44:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729464293;
	cv=none; b=XHKb2m3pDFaoPhBtwuBK6nY232dXUAri7JjcDp2fozB8Y/CzLHOoPWMdiw+XwOXMyRoMe63cRSSRJBffZvGr+bpcGqZsqO2fOklaYSQKZCtG/ijaEmdDp6/Khdm32SlJC7EtBrFgnIBllH0J/sehNcvWftl9BEUyKmTytXnS8SWXv2wXn5gMmBFM1sCA/ASMOj7oCJeqew92zrXcCBeh9FiFCibx7eBR+M/ImMPLPkIBu+NZao/V+xoUfZsZFGBCRlSJmsStISzC951xCT+OhtR8qEw3AKljgZPLMiQSM2JeMnM6E4Ad8ppZAT6z82DTaQ/v4R12fd72fYz10h24ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729464293; c=relaxed/relaxed;
	bh=EERVXx27zJf+O8uePCU4xovDw2DzRgUy9TVLdSXFGsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9E5N4SD8cnJNClZcH3FcP4xp1wdYV3qV8pPAEesFqi1OAPufUp0+jm+QBKUX16HU2szLKXVASdvkLLN5KkXb2vilFo1wB3r1v0dNr0R/XHMB7zf+eMyn/5XdccObJEz4eTW9iH0P6wyY952cjzXCKHaTW3adfj2ZE8aRbRjAUnpxxrzG+pge6Ejg5MZTRaqwhDxefByoNh21EYF2sv8LIE9psGzTcByQeckyl1Z3yaRKtsUwuszKf84KTzIUEOnKxIdqYBVbW+P7wWlZJx2SiE52UMCvB/MO24ZCyXMegVs4vryoiuXKcwwc+9moftXYOrVvC9SQVbQvQ1FmahH2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RuMNYfcu; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RuMNYfcu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWtmh2dPYz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 09:44:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1E3A1A40A4D;
	Sun, 20 Oct 2024 22:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F9DC4CEC6;
	Sun, 20 Oct 2024 22:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729464286;
	bh=LPSUckUjJehLE7ADDOoCufWP+OAHZF3mS2lwPtB+Kn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RuMNYfcurpcqUXcm+CnQ1fvfq4kSedMjKExk2gurYTjokAxg5KP7Fahx5HtJK/iTc
	 GtX8stQ4uX3p5kfY4Smlw2/kQ793gfz/kKC78wMmmdtYLv0nuM9/+CDI66On06PdK6
	 cJtpAaiwCI9zW85tfUaCXxyBMpoh6AQUh6Se9iLoRmfkDA++V/kwEMeUqzokat4oqV
	 yoSBQTW44FmmpDpmVqYIbMi8uyQ3PkV/+Tcp6RCORYZXycspAN1wm8MuUZ9rGK+X0/
	 kaorOFU0tq7+gsxMKzkmj82uqQMUrrdUA4cVE9kUstl6q05kuGBEP3C76jXGi3l1jM
	 XbFYQMy+h7Qig==
Date: Sun, 20 Oct 2024 15:44:44 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <20241020224444.zhoscljpe7di5yv3@treble>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 14, 2024 at 04:39:26PM +0100, Andrew Cooper wrote:
> On 14/10/2024 1:30 pm, Kirill A. Shutemov wrote:
> > +++ b/arch/x86/lib/getuser.S
> > @@ -37,9 +37,14 @@
> > +#define SHIFT_LEFT_TO_MSB ALTERNATIVE \
> > +	"shl $(64 - 48), %rdx", \
> > +	"shl $(64 - 57), %rdx", X86_FEATURE_LA57
> > +
> >  .macro check_range size:req
> >  .if IS_ENABLED(CONFIG_X86_64)
> >  	mov %rax, %rdx
> > +	SHIFT_LEFT_TO_MSB
> >  	sar $63, %rdx
> >  	or %rdx, %rax
> >  .else
> 
> That looks like it ought to DTRT in some cases, but I'll definitely ask
> AMD for confirmation.
> 
> But, I expect it will malfunction on newer hardware when
> CONFIG_X86_5LEVEL=n, because it causes Linux to explicitly ignore the
> LA57 bit.  That can be fixed by changing how CONFIG_X86_5LEVEL works.
> 
> I also expect it will malfunction under virt on an LA57-capable system
> running a VM in LA48 mode (this time, Linux doesn't get to see the
> relevant uarch detail), and I have no good suggestion here.

BTW the paper [1] nonchalantly mentions:

  "All Intel CPUs that are vulnerable to MDS attacks inherently have the
  same flaw described here."

Anyway, I'd really like to make forward progress on getting rid of the
LFENCEs in copy_from_user() and __get_user(), so until if/when we hear
back from both vendors, how about we avoid noncanonical exceptions
altogether (along with the edge cases mentioned above) and do something
like the below?

Sure, it could maybe be optimized by a few bytes if we were given more
concrete recommendations, but that can be done later if/when that
happens.  In the meantime we'd have no canonical exception worries and
can use a similar strategy to get rid of the LFENCEs.

[1] https://arxiv.org/ftp/arxiv/papers/2108/2108.10771.pdf

diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
index 112e88ebd07d..dfc6881eb785 100644
--- a/arch/x86/lib/getuser.S
+++ b/arch/x86/lib/getuser.S
@@ -41,12 +41,21 @@
 	"shl $(64 - 57), %rdx", X86_FEATURE_LA57,				\
 	"", ALT_NOT(X86_BUG_CANONICAL)
 
#ifdef CONFIG_X86_5LEVEL
#define LOAD_TASK_SIZE_MINUS_N(n) \
	ALTERNATIVE __stringify(mov $((1 << 47) - 4096 - (n)),%rdx), \
		    __stringify(mov $((1 << 56) - 4096 - (n)),%rdx), X86_FEATURE_LA57
#else
#define LOAD_TASK_SIZE_MINUS_N(n) \
	mov $(TASK_SIZE_MAX - (n)),%_ASM_DX
#endif

 .macro check_range size
 .if IS_ENABLED(CONFIG_X86_64)
 	/* If above TASK_SIZE_MAX, convert to all 1's */
	LOAD_TASK_SIZE_MINUS_N(size - 1)
	cmp %rax, %rdx
	sbb %rdx, %rdx
	or  %rdx, %rax


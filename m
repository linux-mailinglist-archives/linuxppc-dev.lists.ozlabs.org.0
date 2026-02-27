Return-Path: <linuxppc-dev+bounces-17429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCR/Nv8uommQ0gQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 00:55:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 176001BF3E4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 00:55:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fN4vs4TFDz30VV;
	Sat, 28 Feb 2026 10:55:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772236537;
	cv=none; b=a2+VI4SYS62sqbvm6fJFouoBK8cCBl4DUSpu2QmC+zO7YRrA7v8sB5ZI7SbLMFCMXi0NNZxZqDA03OfxTgjyNHyo5anCWZlWYTWFoUZ4HcDzl3TW4yeRsLS53QnN8It1eT/wt2o6xGByUtkhEB1eSa3sdiOlA5DjJwTYcgQnj6Zpest1zrgXfRKqSWX/UlQDL9lc+ykGEOjAcNPELWHdWmCcV9UtA1cjjFljqLDXOu6xN9ggx3ctISUIj4kJnbl1F7XJfOaMvYD6XL8qbNkJj8rbS4cKYMcGW+g7pBG2c4lec33p7a/HomMiPhmzrxW5ILDFumv9bhStcxLCEgpWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772236537; c=relaxed/relaxed;
	bh=OapKvdiEwQYu8NOR3j/Rtm7Hb+46RUg9fRdsdH5rsws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0ES3RVP1+KDed2HM4J0YX4kYspPwRllpUimiu8LSG6TBtk60Ji5RQrdbz4EXVCV2b9zN6ZUIOnmZixVu8yVcCyGBblQjZtB203JZyOxCNnzgzjCy2HLYGXX3OxrVVBZYMupDROLSLbuVi5oKlN8YoDsjW8zfoNl4Tkua8Jt2xWp9/oDRNO/7m0ne0Qq6ljRRw2wQgcrg9sAmyVclqjcjVxSCLltb8XI2ZdFjr0he4zCYpsruu1jR1ulRBmjLE5GZJJ69hiwdXoOC1RvKGYLC/Tt9qUd4dX55CUZjj/MxcjGtaXZxZh7a+sbC+8D3Sv64SEwfGXsBfGoXtAfNRwZLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XVTF8TDa; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XVTF8TDa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fN4vr10Ctz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 10:55:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9859C6111B;
	Fri, 27 Feb 2026 23:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97119C116C6;
	Fri, 27 Feb 2026 23:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772236532;
	bh=9epsKT1Tqv7365SBQ+LgdgBkS+QLvJq0YDfqzGCQppg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVTF8TDa48poxgWx9OMrHOWcWeX+DIvF8W0Cz9PzVZzIIYVyeCBp8CVqVCQqnKv6k
	 5zzYRJst/PHEWqq92j85maQBi7plq+GNVhfHcc+9Pog+YMNqi1zTL7+4Ehtq9UJ7o9
	 QJHa0cD62wS9Zi36AMnb9/VkZXXyv/qc0FNC/OF8hsDCWgrlGfX7gqqn/VNAfN6Fee
	 CkNTC4E/BHSyzLgTwiN6IqzHfjJo9okaT9JcgxYGTsEHUQc31er3WUHfK/2Gx865yY
	 ogRz41c7RbSVwCM0hpH/O2zyx2nKKDpUW5eh/FdyMQPRe2Q68ih/qS1f7bbUEX5IYc
	 3kMoxNtkaet5g==
Date: Fri, 27 Feb 2026 15:55:29 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-raid@vger.kernel.org
Subject: Re: [PATCH 18/25] x86: move the XOR code to lib/raid/
Message-ID: <20260227235529.GA31321@quark>
References: <20260226151106.144735-1-hch@lst.de>
 <20260226151106.144735-19-hch@lst.de>
 <20260227143016.GH1282955@noisy.programming.kicks-ass.net>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227143016.GH1282955@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17429-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:hch@lst.de,m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@v
 ger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lst.de,linux-foundation.org,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[56];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 176001BF3E4
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:30:16PM +0100, Peter Zijlstra wrote:
> On Thu, Feb 26, 2026 at 07:10:30AM -0800, Christoph Hellwig wrote:
> > Move the optimized XOR code out of line into lib/raid.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  arch/x86/include/asm/xor.h                    | 518 ++----------------
> >  arch/x86/include/asm/xor_64.h                 |  32 --
> >  lib/raid/xor/Makefile                         |   8 +
> >  .../xor_avx.h => lib/raid/xor/x86/xor-avx.c   |  14 +-
> >  .../xor_32.h => lib/raid/xor/x86/xor-mmx.c    |  60 +-
> >  lib/raid/xor/x86/xor-sse.c                    | 476 ++++++++++++++++
> 
> I gotta ask, why lib/raid/xor/$arch/ instead of something like
> arch/$arch/lib/xor ?

Similar to lib/crypto/ and lib/crc/, it allows the translation units
(either .c or .S files) containing architecture-optimized XOR code to be
included directly in the xor.ko module, where they should be.

Previously, these were always built into the core kernel even if
XOR_BLOCKS was 'n' or 'm', or they were built into a separate module
xor-neon.ko which xor.ko depended on.  So either the code was included
unnecessarily, or there was an extra module.

Technically we could instead have the lib makefile compile stuff in
arch/, but that would be unusual.  It's much cleaner to have the
directory structure match the build system.

If we made this code always built-in, like memcpy(), then we could put
it anywhere.  But (like many of the crypto and CRC algorithms) many
kernels don't need this code, and even if they do it may be needed only
by 'm' code.  So it makes sense to support tristate.

- Eric


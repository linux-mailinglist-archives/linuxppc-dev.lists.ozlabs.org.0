Return-Path: <linuxppc-dev+bounces-14165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F60C5B4BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 05:23:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d73sR0kK8z2yv7;
	Fri, 14 Nov 2025 15:23:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763094186;
	cv=none; b=j98xS4Gu0u9I9X7KV0WilMkRk8clupOF53k2a1ipHnN/r/RjsUnO9AxxDVLO4PZXicfKEKQZzj1SsvOszzSZ4UH4V8MfV505/6gtiTLVnNBrAZyv8ric7tZ8jrlYL4xVwUp981eCuttop/R/hZGYONRTWPpP4wupz8qmVjT95Ny27KorXJOUbEfWL0q4OpTM4BHKsKMkicm4iDRRlUmqSR5swBTXXTz6Tb61ZAT+QwmyoowP8Iml9/SL7oP05QafI7vPHFgdQHfecWEzcQoElTtooMqgF48iF+lLd9ZGkH4KUuD5UeKO9PDFgM3EUR7B7h/BQRN7tL76jHZub8cqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763094186; c=relaxed/relaxed;
	bh=a6f2FRAe2fU1NCaPQP2OUDliuay5JwLFzyNHjSupUVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FROcTPjaADM7Tsk6haZWQKJSbHPI10Y68HUWgkWtyfuTr3/Xgec3OuFX8WWJYQ57w37Z4lPeakqagPtO/l6jvT8XG9DfgAULc8dnJkTMiJRC6owjNCgBe7PDjokXGSYVgNPJLhR4g0BfwgIgVIyQ9o5TPEbJQ4veSJb13XyRjbu0yie7Udu7q+QVW8FBjks4Ur0K4yM3DAmrh4M5P4XVbTiOSaITq55d8wEL7FfoN/QmMZ475adiB/CAwguYl6LCVEbESPcWQ/2npAAdyh1K6wJcBXaOBbCOFaLTo/C8M3w0p30QbwLntfy2n6c59x1mDlvS/eqjoQVuvKfuqTE++Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JpQ9qeou; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JpQ9qeou;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d73sP5WlQz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 15:23:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C07E4004E;
	Fri, 14 Nov 2025 04:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C574FC16AAE;
	Fri, 14 Nov 2025 04:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094183;
	bh=RobVRCgZWKDAOE0gDSu7wYFNPR+HLgdW/UejZYDDlGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpQ9qeouOkhcbiv4XbYPE+RA9hjIDmMQ+z1O63pqvJGFha1JCpQaMOcKWJgzbo8tk
	 XJ4yA30qSWHnrF0Xbwx9XxwaF0nqeyeu8ltfDqZPbN3oex3L07o5IThMLseHcDg6Bv
	 1fAuESBIcya76J7XaQggkHMa4Yk+pn7g9Vu2i9/p55spB0NQ8CVygWnFp30/HA2jVh
	 P2AYeyhI/xe9XkmCwZgHndjonZMsbW6q7wfnGOteYAV8PYxLE0bQz5bLBmRsnPFe95
	 PgIaRb96v6thoR4zQ8OxMZQCYI5p7PTlsPB72vjiLqaxbzH5FAExUCREc5KTbvjwxG
	 7NLMjsjSUxLpA==
Date: Thu, 13 Nov 2025 21:22:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
Message-ID: <20251114042254.GB2566209@ax162>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <aRToC77bNUy2sKAK@derry.ads.avm.de>
 <20251113102307-ca2180c8-4876-46ea-8678-aaedd9ba36f0@linutronix.de>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113102307-ca2180c8-4876-46ea-8678-aaedd9ba36f0@linutronix.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 13, 2025 at 10:31:10AM +0100, Thomas Weißschuh wrote:
> On Wed, Nov 12, 2025 at 09:03:23PM +0100, Nicolas Schier wrote:
> > Thanks for the patch set and all the work behind!  I found only one
> > issue in patch 3, the rest looks good to me as they are.
> > 
> > I haven't reviewed the compiler flags for the archs, but from the formal
> > point of view they look good to me, too.
> > 
> > How shall we proceed with here?  I think, easiest would be if we get
> > appropriate acks from the architecture maintainers, so we could take
> > this via kbuild.
> 
> That would surely be the best option. Unfortunately quite frequently it is hard
> to get architecture maintainer's feedback on a cross-architecture series.
> 
> > Other opinions?
> 
> It would also work to only take the first three patches through the kbuild tree
> and push the other ones through the architecture trees.
> 
> I don't really have a clear preference.

If you do not have a preference, I think it would be easier if Nicolas
picks up the first three patches (which I will go review formally
shortly, sorry again for the delay on that) to make sure they make
6.19-rc1 then you can send out the architecture changes individually
with plans to pick up any ones that have been left behind after a
development cycle? That should give architecture maintainers enough time
to properly react and review the series (since they will know if those
flags are appropriate). We could probably send the last patch as a fix
if those changes do not land until 6.20-rc1.

Cheers,
Nathan


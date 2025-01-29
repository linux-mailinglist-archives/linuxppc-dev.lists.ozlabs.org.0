Return-Path: <linuxppc-dev+bounces-5677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 926E1A21C00
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 12:17:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjflD0pWBz2ydG;
	Wed, 29 Jan 2025 22:17:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738149464;
	cv=none; b=e4hduD7mmG6oexMrbpGgPvGmC0Gq/cG7kw+AvZABfatdnwuma1uHDB7FQnSpdw2vmRoirfVy+bnxXCwdxJ4PTok+QaZVm/dKQlIEr+y1lZvgZlNCbECR84NDJQDb4voHWUS+8PmJx3mckDLu1kkAWyA79dVaWyyiCKkqRyqP0otFuQfsZ4XPu8v9SnDpSfzNx73RwVLD7orsIAXhqCd5ncZp185w0i3d8PAXpFSBbZ2adcbDzivJjP6vLmi+6IXrXhhSQr/NtqhtpAzsm8EvsbOylw/cOPIA16MJLOvggbwx4dvfociEQwA/K8hYC4rVueAKOHA1TAUp5aCirJr2og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738149464; c=relaxed/relaxed;
	bh=MS1Ilxy4hOyzecXeFPA4oqg+t1IpH9/88mCwRe4ZJQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyNddHmht96PKjkcpDlpFAzkaCQtrKZ9SxhLL4NewShgbQRyvEQw5YVUnZKRAjKTmWWPpDM3OjEKGRcc5JGG+lIlwqec+1ON7U2DZ+08cA2s/ZRvyRTtsp33MpQW21eB/7dMWj5+/qddZBUkCmPHWsZiP6R9NE9EXDKBfMoL4ogxh/MYkqdJj4fpIujE9XFJFlX9MofeSZHHOA0iX+brG7pg0bMEOncpH+mcfxZVjuaU+5GoVmwupb8AgPKAP5Mx8nhv946jzP3U1DQR9Uw8e/ufW+12nLxNqv3HGqrI++ng/kb4sqLf+wz4KSZokenMhK76THKTCH9yHIRcvjINOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjflB276Hz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 22:17:38 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 50TBEA5E021333;
	Wed, 29 Jan 2025 05:14:10 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 50TBE7gG021329;
	Wed, 29 Jan 2025 05:14:07 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 29 Jan 2025 05:14:06 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Julian Vetter <julian@outer-limits.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] powerpc: Remove eieio() in PowerPC IO functions
Message-ID: <20250129111406.GW20626@gate.crashing.org>
References: <20250129094510.2038339-1-julian@outer-limits.org>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129094510.2038339-1-julian@outer-limits.org>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=2.3 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 10:45:10AM +0100, Julian Vetter wrote:
> Remove the eieio() calls in IO functions for PowerPC. While other
> architectures permit prefetching, combining, and reordering, the eieio()
> calls on PowerPC prevent such optimizations.

Yes, and it is crucial to prevent combining, it is part of the semantics
of these functions.  This is a much bigger problem on PowerPC than on
architectures which optimise memory accesses much less.  So most other
archs can get away with it much easier (but it is still completely wrong
there).

You are keeping the trap;isync things, which a) have a way bigger
performance impact, and b) are merely a debugging aid (if some i/o
access kills the system, it will be clear where that came from).  And
that isn't even the biggest thing of course, there is a heavyweight
sync in there as well.  Is there any benefit to this patch, or is it
only sabotage?


Segher


Return-Path: <linuxppc-dev+bounces-102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B028952BE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 12:22:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r9W0oxFI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wl1QM4mKbz2xm5;
	Thu, 15 Aug 2024 20:22:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r9W0oxFI;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wl1QK48myz2xfb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 20:22:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723717337;
	bh=EWxKiICgYw457W0OxIAbS4ICNjCgsrxlUPJj1DSYvMA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r9W0oxFI3PMSbGzqzdAAZOWA+0y5W+GtaV7IId3LEmP9+lPytcuqu0YwsROHNaaAy
	 p5y9KSp0ll1m/379CbaySg0yzpTV2PtlhfSvheyKkMD+UQijvfglaiJttpfDUYLCaD
	 P6GJPUy5/kZOpUhr6o9sJMIhac6xVLPSO0in4uDBJ3ugjTzCP9YiiYOdE6+7++ON5j
	 n5kvFN5VvaxMMrqQo2oLQohGdkc1KSz7BLmUV/bxPvUXNBOetWOU+dt+D45teEPXjL
	 YCAueunI1hokOjOjsO/EvCji/xWzq6BJA+ibEE1TfwetYjsB/CtCA9ZaN92ekmRGTS
	 f/4o6JwYZ8mwA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wl1QJ4WHZz4wp0;
	Thu, 15 Aug 2024 20:22:16 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ryan Sullivan <rysulliv@redhat.com>, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Cc: rysulliv@redhat.com, joe.lawrence@redhat.com, pmladek@suse.com,
 mbenes@suse.cz, jikos@kernel.org, jpoimboe@kernel.org,
 naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu, npiggin@gmail.com
Subject: Re: [PATCH] powerpc/ftrace: restore r2 to caller's stack on
 livepatch sibling call
In-Reply-To: <20240729150246.8939-1-rysulliv@redhat.com>
References: <878qxkp9jl.fsf@mail.lhotse>
 <20240729150246.8939-1-rysulliv@redhat.com>
Date: Thu, 15 Aug 2024 20:22:15 +1000
Message-ID: <87ed6q13xk.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Ryan Sullivan <rysulliv@redhat.com> writes:
> Hello Michael,
>
> In the case of no sibling call within the livepatch then the store is
> only "restoring" the r2 value that was already there as it is stored
> and retrieved from the livepatch stack.

But what guarantee do we have that it's the value that was already
there?

Notice that the current livepatch_handler doesn't store to the (normal)
stack at all, because it doesn't know the context it's called in.

Does kpatch do anything special to induce the sibling call? Is it doing
objcopy or anything else weird?

I tried writing a selftest (in tools/testing/selftests/livepatch) to
trigger this case but couldn't get it to work. The compiler never
generates a sibling call across modules.

cheers


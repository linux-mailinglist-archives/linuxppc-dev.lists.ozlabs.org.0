Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F439568CC0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 17:29:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdNk573JNz3fBJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 01:29:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=MfGZXb8n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=igxa=xl=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=MfGZXb8n;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdNdV5TKHz3cd6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 01:25:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B8B061FB1;
	Wed,  6 Jul 2022 15:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E98C3411C;
	Wed,  6 Jul 2022 15:24:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="MfGZXb8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1657121096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vjqdS21oaUKcKvXC0EcJ6AHi+otxfA3EET5R3nVpN+M=;
	b=MfGZXb8npvpYoU43hWe25DYKHe0PBhy4Xe+NehRnPfmEif7iB9fxcAooznnS+za/0ewMYi
	zAuB8WvEvrHWRsucspGtZ/xyQEiJKL7mObMLaa3ZFdb6jvrPRV4NLOYKbwZbbuDHhY9G4/
	PSj7+iJoPiYNS8XRwJYx0lk1+GuwlcE=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 36d0362c (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Wed, 6 Jul 2022 15:24:55 +0000 (UTC)
Date: Wed, 6 Jul 2022 17:24:49 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH] random: remove CONFIG_ARCH_RANDOM and "nordrand"
Message-ID: <YsWpQWXVeDFXvq0F@zx2c4.com>
References: <20220705190121.293703-1-Jason@zx2c4.com>
 <YsWiSH4BrY5oNJuM@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsWiSH4BrY5oNJuM@mit.edu>
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
Cc: linux-s390@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ted,

On Wed, Jul 06, 2022 at 10:55:04AM -0400, Theodore Ts'o wrote:
> On Tue, Jul 05, 2022 at 09:01:21PM +0200, Jason A. Donenfeld wrote:
> > Later the thinking evolved. With a properly designed RNG, using RDRAND
> > values alone won't harm anything, even if the outputs are malicious.
> 
> I personally think it's totally fine to remove nordrand.  However, the
> reason why it was there was that there were some rather extreme
> tin-foil-hatters who believed that if (the completely unavailable to
> the public for auditing) RDRAND implementation *were* malicious *and*
> the microcode had access to the register file and/or the instruction
> pipeline, then in theory, a malicious CPU could subvert how the RDRAND
> is mixed into the getrandom output to force a particular output.
> 
> Personally, I've always considered it to be insane, since a much
> easier way to compromise a CPU would be to drop a Minix system hidden
> into the CPU running a web server that had massive security bugs in it
> that were only discovered years later.  And if you don't trust the CPU
> manufacture to that extent, you should probably simply not use CPU's
> from that manufacturer.  :-)

That specific attack scenario is actually something I've fixed over the
last few months, by ensuring that all RDRAND values go through the hash
function. So even if the CPU is super malicious, it'd still need a hash
preimage, which isn't considered to be computable for blake2s.

Minix in the cpu... haha.. surely that would never happen... haha
surely...

Jason

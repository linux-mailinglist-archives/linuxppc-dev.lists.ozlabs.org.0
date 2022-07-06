Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD6568C05
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 16:59:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdN3l6zW6z3c71
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 00:59:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=jicRkedU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mit.edu (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=jicRkedU;
	dkim-atps=neutral
X-Greylist: delayed 166 seconds by postgrey-1.36 at boromir; Thu, 07 Jul 2022 00:58:41 AEST
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdN356L5Wz3blD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 00:58:40 +1000 (AEST)
Received: from cwcc.thunk.org (pool-173-48-118-63.bstnma.fios.verizon.net [173.48.118.63])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 266Et4Za026327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Jul 2022 10:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1657119313; bh=ifFZJvbfIGVslUHWRDtftSqDp9BgS1ySpd5as638KpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jicRkedUge0cSrNp9dsPHkw4QFRERSGTRFWvzKMGECE7ezizOgSv9HxyR9V4F8S7F
	 B3Z4cvkvhwTV+vUCLQyyRapiOOXIrh6qq6H06KmAU7CGQ4aXhLrDnNGj3ClQF1Na0r
	 MfGlG/hzw6ibcSaN/qBTJnkql+Zzo+d40NlqpzyzX5ybtU1W3uQ2ySVzntVa7l0jYs
	 tkDnbU64G7GfM2KZH9XpIvp8dnasZ7d1RvfrjUt2khPyFMDRUSqvqcK3+Ex61hsi7X
	 BhyDG4ghY/zpMytxNISsWRBgmgGJllOR34RpeYEAVqRhNsCrgwz8QoCs3CgyKgd2Qk
	 zZPwW6kHfDl3A==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 75A9215C3E94; Wed,  6 Jul 2022 10:55:04 -0400 (EDT)
Date: Wed, 6 Jul 2022 10:55:04 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] random: remove CONFIG_ARCH_RANDOM and "nordrand"
Message-ID: <YsWiSH4BrY5oNJuM@mit.edu>
References: <20220705190121.293703-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705190121.293703-1-Jason@zx2c4.com>
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

On Tue, Jul 05, 2022 at 09:01:21PM +0200, Jason A. Donenfeld wrote:
> Later the thinking evolved. With a properly designed RNG, using RDRAND
> values alone won't harm anything, even if the outputs are malicious.

I personally think it's totally fine to remove nordrand.  However, the
reason why it was there was that there were some rather extreme
tin-foil-hatters who believed that if (the completely unavailable to
the public for auditing) RDRAND implementation *were* malicious *and*
the microcode had access to the register file and/or the instruction
pipeline, then in theory, a malicious CPU could subvert how the RDRAND
is mixed into the getrandom output to force a particular output.

Personally, I've always considered it to be insane, since a much
easier way to compromise a CPU would be to drop a Minix system hidden
into the CPU running a web server that had massive security bugs in it
that were only discovered years later.  And if you don't trust the CPU
manufacture to that extent, you should probably simply not use CPU's
from that manufacturer.  :-)

							- Ted

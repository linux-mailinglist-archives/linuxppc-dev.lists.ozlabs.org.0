Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F3D57AE41
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 05:04:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LngWy5LSZz3cjK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 13:03:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VBUywPF7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LngWJ3vlFz2xkg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 13:03:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VBUywPF7;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LngWD5dzkz4x7X;
	Wed, 20 Jul 2022 13:03:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658286203;
	bh=07a5cjF0e9SE4ghrWPN59Y1xcS8Op+XIj+zd97Y/sD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VBUywPF7BJl/iHXB6z0aZcik5dkO6ISMryTwHHBOfdsHO/F7DusRlENuecPpb0ocU
	 h0aptq1KpohsSf3IbkKyI8f/yuYSR1zSllHmHraP+a2MZhaIo0+7L6e50EE+01F76G
	 phcNILJZ/UkLOwibUep6WX+/H3wRxrGPwmLv8gGFpgLZV+3zJCq9ePTtD4Z+2l0JX6
	 qTSYLwY1fVjmsG5ebVAceqlzLnx4mIDtEmy+qrMvPYMF6f58UUhgep38kjZhOXRySi
	 5zet7uxpBCKVR+InMq55C9PgjnZUsRY+/vkd5H1wFqmQ6FjMy34sVQ45g1LvS6H0Ty
	 Ff7032tCwAY/Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gabriel Paubert <paubert@iram.es>
Subject: Re: [PATCH v2] random: handle archrandom in plural words
In-Reply-To: <YtUB3Iola9R0OwN6@lt-gp.iram.es>
References: <YtP1+MJ1tNdJA60l@zx2c4.com>
 <20220717200356.75060-1-Jason@zx2c4.com>
 <87a697dj9s.fsf@mpe.ellerman.id.au> <YtUB3Iola9R0OwN6@lt-gp.iram.es>
Date: Wed, 20 Jul 2022 13:03:19 +1000
Message-ID: <87y1wocwp4.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-s390@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Harald Freudenberger <freude@linux.ibm.com>, "H . Peter Anvin" <hpa@zytor.com>, Johannes Berg <johannes@sipsolutions.net>, Borislav Petkov <bp@suse.de>, linuxppc-dev@lists.ozlabs.org, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gabriel Paubert <paubert@iram.es> writes:
> On Mon, Jul 18, 2022 at 04:31:11PM +1000, Michael Ellerman wrote:
>> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
>> > The archrandom interface was originally designed for x86, which supplies
>> > RDRAND/RDSEED for receiving random words into registers, resulting in
>> > one function to generate an int and another to generate a long. However,
>> > other architectures don't follow this.
>> >
>> > On arm64, the SMCCC TRNG interface can return between 1 and 3 words. On
>> > s390, the CPACF TRNG interface can return between 1 and 32 words for the
>> > same cost as for one word. On UML, the os_getrandom() interface can return
>> > arbitrary amounts.
>> >
>> > So change the api signature to take a "words" parameter designating the
>> > maximum number of words requested, and then return the number of words
>> > generated.
>> 
>> On powerpc a word is 32-bits and a doubleword is 64-bits (at least
>> according to the ISA). I think that's also true on other 64-bit
>> architectures.
>
> IIRC, this is (or was) not the case on Alpha, where word was defined as
> 16 bits. All assembly mnemonics had w for 16 bits, l for 32 bits, and q
> for 64 bits.

Yeah I should have said on *some* other 64-bit arches.

Seems to be a common feature/hack on arches that have evolved over time,
or been inspired by earlier arches.

The latest Power ISA has octwords :)

cheers

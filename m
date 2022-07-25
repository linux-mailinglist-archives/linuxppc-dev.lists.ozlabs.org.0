Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D357FC62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 11:27:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrvnr3Tpnz3c9p
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 19:27:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=LZX4uVNM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=5dt6=x6=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=LZX4uVNM;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrvnD2pXkz2xKk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 19:26:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 04006B80E1A;
	Mon, 25 Jul 2022 09:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF553C341D2;
	Mon, 25 Jul 2022 09:26:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LZX4uVNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1658741191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zvNrHbTIYzgB0tkOGhVVxAdAHnHebTQeizi3weVIsK0=;
	b=LZX4uVNMACi/jB4HVvKJPq0/mnjxBgfqakoAfLysChDi3HgisD6QaHOYw75ZyyrX1xLahm
	XBKjHTCSVOHHHqTDjtlokbIDkMCdeoLQsma7KWe93PAIV8RSzydcGwPf7ehG3FWP89FhMN
	/bS3mQsDtxO03rpH0kQYPGkVIqqeD5I=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d5a3a065 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Mon, 25 Jul 2022 09:26:30 +0000 (UTC)
Date: Mon, 25 Jul 2022 11:26:27 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v3] random: handle archrandom with multiple longs
Message-ID: <Yt5hwxC1xgvA8Asw@zx2c4.com>
References: <CAHmME9qTA90=GEr6h1GZh0CjS+6tpe5uuqkYoJVv79h0zd0w1w@mail.gmail.com>
 <20220719130207.147536-1-Jason@zx2c4.com>
 <Yt5gBZe9F1BE0MVF@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yt5gBZe9F1BE0MVF@zn.tnic>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Harald Freudenberger <freude@linux.ibm.com>, "H . Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Boris,

On Mon, Jul 25, 2022 at 11:19:01AM +0200, Borislav Petkov wrote:
> On Tue, Jul 19, 2022 at 03:02:07PM +0200, Jason A. Donenfeld wrote:
> > Since callers need to check this return value and loop anyway, each arch
> > implementation does not bother implementing its own loop to try again to
> > fill the maximum number of longs. Additionally, all existing callers
> > pass in a constant max_longs parameter.
> 
> Hmm, maybe this has come up already but it reads weird.
> 
> If I have a function arch_get_random_longs(), I'd expect it to give me
> the number of longs I requested or say, error.
> 
> Why do the callers need to loop?
> 
> If I have to loop, I'd call the "get me one long" function and loop N
> times.

Answered partially in the commit message you quoted and partially here:
https://lore.kernel.org/lkml/YtqIbrds53EuyqPE@zx2c4.com/

Note that arch_get_random_longs() is not a general purpose function. For
that there used to be get_random_bytes_arch(), but that no longer exists
as people shouldn't be using this stuff directly. arch_get_random_longs()
is a special purpose function mainly intended for use by the RNG itself.

More directly, the reason we don't want to error is because the use case
has fallbacks meant to handle errors. The cascade looks like this
(quoting from the other email):

    unsigned long array[whatever];
    for (i = 0; i < ARRAY_SIZE(array);) {
        longs = arch_get_random_seed_longs(&array[i], ARRAY_SIZE(array) - i);
        if (longs) {
            i += longs;
            continue;
        }
        longs = arch_get_random_longs(&array[i], ARRAY_SIZE(array) - i);
        if (longs) {
            i += longs;
            continue;
        }
        array[i++] = random_get_entropy();
    }

It tries to get the best that it can as much as it can, but isn't going
to block or do anything too nuts for that.

Anyway, from an x86 perspective, I can't imagine you object to this
change, right? Codegen is the same.

Jason

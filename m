Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87309567823
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 21:57:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lctkd35rvz3c5s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 05:57:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=DiwfS7Ub;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=DiwfS7Ub;
	dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lctk26Ydbz300x
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 05:57:14 +1000 (AEST)
Received: from zn.tnic (p200300ea970ff625329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:970f:f625:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 563241EC0513;
	Tue,  5 Jul 2022 21:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1657051028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=Y0U35vMX74kXxtKME+uItAJHsSwmFddMjvSCpjyQPj8=;
	b=DiwfS7UbthNvF8uPkSvMWijUr+9SR1Oegvu9M94gxrifro3VGXsAzTZgbkkfR+bTkof9CU
	NEcWkSCBrtbKJnT/X+6bhlEH/oXTb9HMZwuAieiM/e3LdzZe/20wFDfVdGBl07ojky6143
	L0dNZFDKdpgatJx+Wz78IitJ+up+C8E=
Date: Tue, 5 Jul 2022 21:57:04 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] random: remove CONFIG_ARCH_RANDOM and "nordrand"
Message-ID: <YsSXkNBtB6Ciy9iN@zn.tnic>
References: <20220705190121.293703-1-Jason@zx2c4.com>
 <YsSStCQQf008hF2F@zn.tnic>
 <YsSUkapje04MP2a1@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsSUkapje04MP2a1@zx2c4.com>
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

On Tue, Jul 05, 2022 at 09:44:17PM +0200, Jason A. Donenfeld wrote:
> Oh, huh. Maybe in that case I should adjust the message to say "consider
> using `random.trust_cpu=0`," which is the thing that would actually make
> a security difference.

Why isn't that option documented in
Documentation/admin-guide/kernel-parameters.txt?

> But actually, one thing that wasn't clear to me was: does `nordrand`
> affect what userspace sees? While random.c is okay in lots of
> circumstances, I could imagine `nordrand` playing a role in preventing
> userspace from using it, which might be desirable. Is this the case? If
> so, I can remove the nordrand chunk from this patch for v2. If not, I'll
> adjust the text to mention `random.trust_cpu=0`.

Unfortunately, it doesn't disable the instruction. It would be lovely if
we had a switch like that...

That's why this message is supposed to be noisy so that people can pay
attention at least.

> In the sense that random.c can handle mostly any input without making
> the quality worse. So, you can't accidentally taint it. The only risk is
> if it thinks RDRAND is good and trustable when it isn't, but that's what
> `random.trust_cpu=0` is for.

And that's why I'm saying that if you detect RDRAND returning the
same thing over and over again, you should simply stop using it.
Automatically. Not rely on the user to do anything.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

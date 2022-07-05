Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 361785679D1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 00:00:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcxSf1BRqz3bZY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 08:00:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=rFDWw5O9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=rFDWw5O9;
	dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LcxS04zRTz2xf8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 08:00:16 +1000 (AEST)
Received: from zn.tnic (p200300ea970ff625329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:970f:f625:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7D98D1EC0513;
	Wed,  6 Jul 2022 00:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1657058408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=lOz+oyOsjcEjoVAd2V3Hhq+u+4OkEJ2jkFkxcvzXIp4=;
	b=rFDWw5O9FPqZ2ZGYqsf0oadvjBlURlepN3Il5jgiRH6uCMr2vSxWAKsVvY2JWqML4mf/sj
	K/RRPabIwevvNUNRlwHJPHF9g/MwhM4B9ks25BK+Z70zV3IxaYGx4hwS5Z15WYzM4SbxTQ
	ksG6jTJzlhCJibf0zj16UVr1u6l+cOo=
Date: Wed, 6 Jul 2022 00:00:04 +0200
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] random: remove CONFIG_ARCH_RANDOM and "nordrand"
Message-ID: <YsS0ZLQw+QFA7XdJ@zn.tnic>
References: <20220705190121.293703-1-Jason@zx2c4.com>
 <YsSStCQQf008hF2F@zn.tnic>
 <YsSUkapje04MP2a1@zx2c4.com>
 <YsSXkNBtB6Ciy9iN@zn.tnic>
 <11C903CC-22A7-48EE-AD63-E71CC8D28B88@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <11C903CC-22A7-48EE-AD63-E71CC8D28B88@zytor.com>
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
Cc: linux-s390@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 05, 2022 at 02:50:34PM -0700, H. Peter Anvin wrote:
> It's just math. The only variable is your confidence level, i.e. at
> what level do you decide that the likelihood of pure chance is way
> smaller than the likelihood of hardware failure.

That might be but the likelyhood of certain BIOSes dropping the ball
after resume is 100%:

7879fc4bdc75 ("x86/rdrand: Sanity-check RDRAND output")

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

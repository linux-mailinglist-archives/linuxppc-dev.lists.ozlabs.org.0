Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28995677FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 21:46:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LctTr4b1vz3c5n
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 05:46:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=CYAJFqLP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=CYAJFqLP;
	dkim-atps=neutral
X-Greylist: delayed 565 seconds by postgrey-1.36 at boromir; Wed, 06 Jul 2022 05:46:06 AEST
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LctTB2KSnz2yn5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 05:46:06 +1000 (AEST)
Received: from zn.tnic (p200300ea970ff625329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:970f:f625:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DE0E71EC0628;
	Tue,  5 Jul 2022 21:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1657049785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=s8J8d5ZD1NtUU5JRSS/ItcYuS6F4P47XpllivMzf87o=;
	b=CYAJFqLPSx1ehm7wcUphSX9EWalTFYzy2s5e2vW1knuJ2MgMxhOyXFZiKJxRnn65i1LTXx
	z6QxxfrgCmuNCUqEFoukAoKTL/2V6JEeQCCX4HCRrDpCeDWCRbeLyIZPGE82Hs3kg+czu+
	9EUDiQHULEW8UFb3P8zZIkSHwIX4AB8=
Date: Tue, 5 Jul 2022 21:36:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] random: remove CONFIG_ARCH_RANDOM and "nordrand"
Message-ID: <YsSStCQQf008hF2F@zn.tnic>
References: <20220705190121.293703-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
> @@ -26,7 +18,6 @@ __setup("nordrand", x86_rdrand_setup);
>   */
>  #define SANITY_CHECK_LOOPS 8
>  
> -#ifdef CONFIG_ARCH_RANDOM
>  void x86_init_rdrand(struct cpuinfo_x86 *c)
>  {
>  	unsigned int changed = 0;
> @@ -59,8 +50,6 @@ void x86_init_rdrand(struct cpuinfo_x86 *c)
>  	}
>  
>  	if (WARN_ON_ONCE(!changed))
> -		pr_emerg(
> -"RDRAND gives funky smelling output, might consider not using it by booting with \"nordrand\"");
> +		pr_emerg("RDRAND gives funky smelling output; update microcode or firmware.");

It is highly unlikely to get a BIOS or microcode update for that matter,
for old systems:

7879fc4bdc75 ("x86/rdrand: Sanity-check RDRAND output")

so I guess here you're better off saying that the kernel simply disables
rdrand support and do

	clear_cpu_cap(c, X86_FEATURE_RDRAND);

here too.

If I read the commit message above correctly, it sounds like RDRAND
output is not that important anyway...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

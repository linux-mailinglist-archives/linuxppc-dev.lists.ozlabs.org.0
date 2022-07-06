Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE99568856
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 14:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdJmq6rs4z3c6W
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 22:31:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=UydwJakm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=UydwJakm;
	dkim-atps=neutral
X-Greylist: delayed 60828 seconds by postgrey-1.36 at boromir; Wed, 06 Jul 2022 22:30:34 AEST
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdJmB0VSSz2xKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 22:30:33 +1000 (AEST)
Received: from zn.tnic (p200300ea970ff625329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:970f:f625:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CC75E1EC0554;
	Wed,  6 Jul 2022 14:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1657110621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=A8YeipasNUa+nZK2qY6DMG4HWJuyiUL/qtd8MoraKqk=;
	b=UydwJakmDSfmpaKz40d0a+zNKNFI7iga7v2uaNqZ/4B/8XS8bL/H8k++sM7V/gnhE9Rr1O
	EcopuNzg9Kg+kVR20v0qEqUqBfhI4vIaJZZ5Yy9UPH7snM78Ii+XZY+bPGmbYoeSEwCXBv
	s/QKl04EfA0Hi3H2Kcan8PKuQESvmHM=
Date: Wed, 6 Jul 2022 14:30:21 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] random: remove CONFIG_ARCH_RANDOM and "nordrand"
Message-ID: <YsWAXYhyuh2WXVuL@zn.tnic>
References: <20220705190121.293703-1-Jason@zx2c4.com>
 <YsSStCQQf008hF2F@zn.tnic>
 <YsSUkapje04MP2a1@zx2c4.com>
 <YsSXkNBtB6Ciy9iN@zn.tnic>
 <11C903CC-22A7-48EE-AD63-E71CC8D28B88@zytor.com>
 <YsTXI3J+ptkN/vb4@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsTXI3J+ptkN/vb4@zx2c4.com>
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
Cc: linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 06, 2022 at 02:28:19AM +0200, Jason A. Donenfeld wrote:
> Maybe you're not grepping the right tree?
> 
> zx2c4@thinkpad ~/Projects/random-linux $ grep trust_cpu Documentation/admin-guide/kernel-parameters.txt
>         random.trust_cpu={on,off}

I was looking at the wrong option, sorry about that.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

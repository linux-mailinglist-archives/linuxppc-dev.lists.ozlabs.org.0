Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F336568871
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 14:35:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdJtP27jhz3c6s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 22:35:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=KCUu0L2d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=KCUu0L2d;
	dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdJsm11CGz3bkW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 22:35:23 +1000 (AEST)
Received: from zn.tnic (p200300ea970ff625329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:970f:f625:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6447F1EC0554;
	Wed,  6 Jul 2022 14:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1657110917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=aOfghTrex1dSH5ya2NTo53o75SOki07wRbpatW6WuBk=;
	b=KCUu0L2dkP2XI8FBDBFzdO0NWi8TMtHxuIX9sQgc8hqhPWfiDc3DIkWjRmLn/A5w4jes+W
	Kdp/Bzg5kTu+nf6MBnNBJTADx5tph7Hm3ovWxLGauzcr2XCZznaaWbyvFkNYCST3UF4uBO
	rmMjNumRUWoX4RY3dD2SpM+CD9QRTo4=
Date: Wed, 6 Jul 2022 14:35:17 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v3] random: remove CONFIG_ARCH_RANDOM
Message-ID: <YsWBhaZT5dCQHfwp@zn.tnic>
References: <20220706003225.335768-1-Jason@zx2c4.com>
 <20220706105411.406259-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220706105411.406259-1-Jason@zx2c4.com>
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

On Wed, Jul 06, 2022 at 12:54:11PM +0200, Jason A. Donenfeld wrote:
> So this commit simplifies things by removing CONFIG_ARCH_RANDOM, keeping

No need to say "this commit" or "this patch" - just write "as if you are
giving orders to the codebase to change its behaviour."

In this case, "So simplify things by ... "

>  arch/x86/Kconfig                                  |  9 ---------
>  arch/x86/include/asm/archrandom.h                 | 14 +++++---------
>  arch/x86/kernel/cpu/rdrand.c                      |  2 --

For those:

Acked-by: Borislav Petkov <bp@suse.de>

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

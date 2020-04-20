Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA61B1764
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 22:45:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495dxJ16lXzDqsH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 06:45:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=vX206r13; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495dtd0ntjzDqgn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 06:42:48 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50BB9207FC;
 Mon, 20 Apr 2020 20:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587415366;
 bh=/Lm2cTmavSfvPwo3EnY/skppJ5i7CHKipIJNiAMzESE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vX206r139s9j+s4JKnaMI4JpxtutoxgTKEzqEw3LnEF+8MAWjTABg/8ixx8KpUvhJ
 aBeW060QZCReO+UrYVjtFosA573ZmpGd4EEAhYESWJJ38YU2e8uDaSguoFjd9eEoa2
 GF7apirwkq/9qg8hWCNZ5P1q630+XpFbjnKHsvw4=
Date: Mon, 20 Apr 2020 21:42:39 +0100
From: Will Deacon <will@kernel.org>
To: George Spelvin <lkml@sdf.org>
Subject: Re: [RFC PATCH v1 40/50] arch/*/include/asm/stackprotector.h: Use
 get_random_canary() consistently
Message-ID: <20200420204238.GB29998@willie-the-truck>
References: <202003281643.02SGhM0T009250@sdf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202003281643.02SGhM0T009250@sdf.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Paul Burton <paulburton@kernel.org>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 10, 2019 at 12:35:14AM -0500, George Spelvin wrote:
> ... in boot_init_stack_canary().
> 
> This is the archetypical example of where the extra security of
> get_random_bytes() is wasted.  The canary is only important as
> long as it's stored in __stack_chk_guard.
> 
> It's also a great example of code that has been copied around
> a lot and not updated.
> 
> Remove the XOR with LINUX_VERSION_CODE as it's pointless; the inclusion
> of utsname() in init_std_data in the random seeding obviates it.
> 
> The XOR with the TSC on x86 and mtfb() on powerPC were left in,
> as I haven't proved them redundant yet.  For those, we call
> get_random_long(), xor, and mask manually.
> 
> FUNCTIONAL CHANGE: mips and xtensa were changed from 64-bit
> get_random_long() to 56-bit get_random_canary() to match the
> others, in accordance with the logic in CANARY_MASK.
> 
> (We could do 1 bit better and zero *one* of the two high bytes.)
> 
> Signed-off-by: George Spelvin <lkml@sdf.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: linux-sh@vger.kernel.org
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc:  "H. Peter Anvin" <hpa@zytor.com>
> Cc: x86@kernel.org
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/arm/include/asm/stackprotector.h     | 9 +++------
>  arch/arm64/include/asm/stackprotector.h   | 8 ++------
>  arch/mips/include/asm/stackprotector.h    | 7 ++-----
>  arch/powerpc/include/asm/stackprotector.h | 6 ++----
>  arch/sh/include/asm/stackprotector.h      | 8 ++------
>  arch/x86/include/asm/stackprotector.h     | 4 ++--
>  arch/xtensa/include/asm/stackprotector.h  | 7 ++-----
>  7 files changed, 15 insertions(+), 34 deletions(-)

Just found this kicking around in the depths of my inbox. Is the series
dead?

Will

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1EB1CD349
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 09:52:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LCpR1tWQzDqYP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 17:52:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=0mQ7t5as; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LCmt38R9zDqSx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 17:51:25 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15B2F20735;
 Mon, 11 May 2020 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589183483;
 bh=ujV3u+dsl5PKS0aIWtuPo2XlUIWTrnZfhH9932lJ3Ck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0mQ7t5as8jZps7eSFkQLnwLtzVeQdo1iP3qe/Hftt/g3zJxfzwQVDrNcWnrxBfusE
 WGRRbC87hk6tU7Y02J552JkiWyPKHGmHG8/2xNIIubv0rRSCeTtP6ug62nSc345L3i
 YbZ4edSRI7cSRvmZAntksnLnC8c2Z4vBB1WMY+EY=
Date: Mon, 11 May 2020 08:51:15 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>, james.morse@arm.com,
 catalin.marinas@arm.com
Subject: Re: [PATCH 02/31] arm64: fix the flush_icache_range arguments in
 machine_kexec
Message-ID: <20200511075115.GA16134@willie-the-truck>
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510075510.987823-3-hch@lst.de>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Roman Zippel <zippel@linux-m68k.org>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Jessica Yu <jeyu@kernel.org>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+James and Catalin]

On Sun, May 10, 2020 at 09:54:41AM +0200, Christoph Hellwig wrote:
> The second argument is the end "pointer", not the length.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm64/kernel/machine_kexec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
> index 8e9c924423b4e..a0b144cfaea71 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -177,6 +177,7 @@ void machine_kexec(struct kimage *kimage)
>  	 * the offline CPUs. Therefore, we must use the __* variant here.
>  	 */
>  	__flush_icache_range((uintptr_t)reboot_code_buffer,
> +			     (uintptr_t)reboot_code_buffer +
>  			     arm64_relocate_new_kernel_size);

Urgh, well spotted. It's annoyingly different from __flush_dcache_area().

But now I'm wondering what this code actually does... the loop condition
in invalidate_icache_by_line works with 64-bit arithmetic, so we could
spend a /very/ long time here afaict. It's also a bit annoying that we
do a bunch of redundant D-cache maintenance too.

Should we use invalidate_icache_range() here instead? (and why does that
thing need to toggle uaccess)? Argh, too many questions!

Will

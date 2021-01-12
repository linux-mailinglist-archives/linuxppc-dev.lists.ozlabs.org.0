Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B78302F32B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 15:13:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFXbp201MzDrQ6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 01:13:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S+ljzYYL; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFXQd579MzDrQ7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 01:05:13 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A42AE22CE3;
 Tue, 12 Jan 2021 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610460310;
 bh=YIZSFd4ngdBu3d+V+tCrhUDlUF7epBaWbFsCZCkzGJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S+ljzYYL3QMPhhApX5VwhFNyceVrA27EHM0FStNvwzUR1cQ7GFOIPOcEYTO0fdDaA
 Kj7O7lmy0yWuWK+AZisJL2LrmlkoM/j63MxdM7S787vyvaT4LD71jTgKDStmGrzxuQ
 L0/NqqEzqp6wU8ndgl0gsmTuxMJL2Vz98cUyPebone1iHGoyH3HLXEv/yY8kVzE9/C
 3JxXpkug6tFhHh2/KJ9Ii5coAgelm+gr542ObqppAE3GEOphOgXDNiAJFxaofg4s3u
 N68pjfATVrUXDVMPlwIcydiug5iK5JLd2AIK2alwIqlmLf7Si7Qy4TLd2kqk9nbCgG
 c2IYKYoLXP3bw==
Date: Tue, 12 Jan 2021 14:05:00 +0000
From: Will Deacon <will@kernel.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH v2] arch: consolidate pm_power_off callback
Message-ID: <20210112140459.GC9277@willie-the-truck>
References: <20201227140129.19932-1-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201227140129.19932-1-info@metux.net>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 jcmvbkbc@gmail.com, paulus@samba.org, linux-csky@vger.kernel.org,
 hpa@zytor.com, linux-riscv@lists.infradead.org, tglx@linutronix.de,
 jonas@southpole.se, linux-s390@vger.kernel.org, sstabellini@kernel.org,
 linux-c6x-dev@linux-c6x.org, ysato@users.sourceforge.jp,
 linux-hexagon@vger.kernel.org, deller@gmx.de, x86@kernel.org,
 ley.foon.tan@intel.com, mingo@redhat.com, geert@linux-m68k.org,
 catalin.marinas@arm.com, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linux-pm@vger.kernel.org, msalter@redhat.com,
 jacquiot.aurelien@gmail.com, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, bp@alien8.de, shorne@gmail.com,
 stefan.kristiansson@saunalahti.fi, christian@brauner.io, chris@zankel.net,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 27, 2020 at 03:01:28PM +0100, Enrico Weigelt, metux IT consult wrote:
> Move the pm_power_off callback into one global place and also add an
> function for conditionally calling it (when not NULL), in order to remove
> code duplication in all individual archs.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

[...]

> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index eb1b15850761..ec4cd66dd1ae 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -53,6 +53,16 @@ int reboot_force;
>  void (*pm_power_off_prepare)(void);
>  EXPORT_SYMBOL_GPL(pm_power_off_prepare);
>  
> +void (*pm_power_off)(void);
> +EXPORT_SYMBOL_GPL(pm_power_off);
> +
> +void do_power_off(void)
> +{
> +	if (pm_power_off)
> +		pm_power_off();
> +}
> +EXPORT_SYMBOL_GPL(do_power_off);

Could this just live as a static inline in pm.h to avoid having to export
the extra symbol?

Will

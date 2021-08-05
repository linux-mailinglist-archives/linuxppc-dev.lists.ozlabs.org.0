Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3635C3E1B8F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 20:41:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgcsJ1Lfsz3cVg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 04:41:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yLSS8767;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=yLSS8767; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggcrr5KJDz30Qm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 04:41:31 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0F0C60F01;
 Thu,  5 Aug 2021 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628188887;
 bh=DJstyoIneDhJWe2M45tnolj4HGCE0gCrRv38Ul0FPvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yLSS87676hn106VIngpXBP/rOEU9YnrWCbO+LvhheiKjxKARCwKmpPaCV3EXfwCgP
 eswsJEhyB34IGotQMI4++5xN+H6/H2Zsa8YN4zRquACi04W3hFcBWcF1DF3HWEIxIo
 hfvqM78wNk4u3fnnSgFl6tYnBJF7uBTAQJcXiptc=
Date: Thu, 5 Aug 2021 20:41:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 1/3] arch: Export machine_restart() instances so they can
 be called from modules
Message-ID: <YQww08x2whx/LIIT@kroah.com>
References: <20210805075032.723037-1-lee.jones@linaro.org>
 <20210805075032.723037-2-lee.jones@linaro.org>
 <20210805173625.GH6719@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805173625.GH6719@arm.com>
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
 John Crispin <john@phrozen.org>, Sebastian Reichel <sre@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-snps-arc@lists.infradead.org,
 Jeff Dike <jdike@addtoit.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 05, 2021 at 06:36:25PM +0100, Catalin Marinas wrote:
> On Thu, Aug 05, 2021 at 08:50:30AM +0100, Lee Jones wrote:
> > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > index b4bb67f17a2ca..cf89ce91d7145 100644
> > --- a/arch/arm64/kernel/process.c
> > +++ b/arch/arm64/kernel/process.c
> > @@ -212,6 +212,7 @@ void machine_restart(char *cmd)
> >  	printk("Reboot failed -- System halted\n");
> >  	while (1);
> >  }
> > +EXPORT_SYMBOL(machine_restart);
> 
> Should we make this EXPORT_SYMBOL_GPL? I suppose it's not for general
> use by out of tree drivers and it matches the other pm_power_off symbol
> we export in this file.

Yes please.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E59701AC3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 May 2023 01:06:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QJh8N0Q95z3fLp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 May 2023 09:06:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tCnekFwZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tCnekFwZ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QJh7R6SvNz3c7S
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 09:05:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35B1E60EF3;
	Sat, 13 May 2023 23:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D38C433D2;
	Sat, 13 May 2023 23:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684019135;
	bh=NC/4k6idYM8q5OXvy5ko2aM3jnNAcvzlrnr9hZdq2vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCnekFwZHAPy4yc+M7eRwfX/4LFgCA2N6JPAH/eFQ+E9jo37+d6elhM580FWxeSpK
	 WqDEkq1jJNh5pPzB0pcJbF0EQiBYh4m3uKx29ezHJR4kAPjJioLETHe7bJAYHnA3u5
	 MvCwTnlVkO2pllUe90JWjQF263Bgev4ypwNUNx2TnBlH3sHCOvlJCV+ns8tLzTYjb4
	 J6fyAmjcx0WADvr57oulthmatNgV5uhKbribjbYcKjh1F8lG2yski1vm2azMQKrIVD
	 iSiv92UJkIyP5kiMzUoUUsXyK/1pYPRwNrM/+2hadRJVE7I//Lqf49t9VHDO1dlu7d
	 BrKikUsbpvNPQ==
Received: by pali.im (Postfix)
	id 864537F9; Sun, 14 May 2023 01:05:32 +0200 (CEST)
Date: Sun, 14 May 2023 01:05:32 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [RFC PATCH] powerpc: udbg: export udbg_putc
Message-ID: <20230513230532.ojjf2xkmkx4v4zdo@pali>
References: <20230513055804.23775-1-rdunlap@infradead.org>
 <20230513091358.pzlexqnff5ydhlzf@pali>
 <af2ca59b-b5ba-a154-991f-536d9170cc05@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af2ca59b-b5ba-a154-991f-536d9170cc05@infradead.org>
User-Agent: NeoMutt/20180716
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Saturday 13 May 2023 15:53:19 Randy Dunlap wrote:
> Hi Pali,
> 
> On 5/13/23 02:13, Pali Rohár wrote:
> > On Friday 12 May 2023 22:58:04 Randy Dunlap wrote:
> >> In a randconfig with CONFIG_SERIAL_CPM=m and
> >> CONFIG_PPC_EARLY_DEBUG_CPM=y, there is a build error:
> >> ERROR: modpost: "udbg_putc" [drivers/tty/serial/cpm_uart/cpm_uart.ko] undefined!
> >>
> >> The build can be fixed by exporting "udbg_putc" in udbg.c.
> >>
> >> OTOH, maybe something like this is more appropriate in
> >> arch/powerpc/Kconfig.debug?
> >>
> >> config PPC_EARLY_DEBUG_CPM
> >> 	bool "Early serial debugging for Freescale CPM-based serial ports"
> >> -	depends on SERIAL_CPM
> >> +	depends on SERIAL_CPM=y
> >>
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >> Cc: Nicholas Piggin <npiggin@gmail.com>
> >> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Cc: linuxppc-dev@lists.ozlabs.org
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Cc: "Pali Rohár" <pali@kernel.org>
> >> ---
> >>  arch/powerpc/kernel/udbg.c |    1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff -- a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
> >> --- a/arch/powerpc/kernel/udbg.c
> >> +++ b/arch/powerpc/kernel/udbg.c
> >> @@ -14,6 +14,7 @@
> >>  #include <asm/udbg.h>
> >>  
> >>  void (*udbg_putc)(char c);
> >> +EXPORT_SYMBOL(udbg_putc);
> >>  void (*udbg_flush)(void);
> >>  int (*udbg_getc)(void);
> >>  int (*udbg_getc_poll)(void);
> > 
> > Hello! I do not think that it is a good idea to export udbg functions
> > for kernel modules. I have quickly looked at the cpm_uart driver file
> 
> Sure, that was just a conversation starter.
> 
> > drivers/tty/serial/cpm_uart/cpm_uart_core.c and it looks like that once
> > udbg from it is registered then there is no code for unregistering it.
> > So I have feeling that compiling cpm_uart driver as module should not be
> > allowed when CONFIG_SERIAL_CPM_CONSOLE is enabled, and early debug
> > should depend on CONFIG_CONSOLE_POLL || CONFIG_SERIAL_CPM_CONSOLE.
> 
> The other change above also fixes the build error: (Option 2)
> 
> >> config PPC_EARLY_DEBUG_CPM
> >> 	bool "Early serial debugging for Freescale CPM-based serial ports"
> >> -	depends on SERIAL_CPM
> >> +	depends on SERIAL_CPM=y
> 
> 
> Also, making SERIAL_CPM (cpm_uart driver) be restricted to not allow it
> as a module when SERIAL_CPM_CONSOLE is enabled [how does one express that
> in Kconfig language?] will cause a circular dependency since SERIAL_CPM_CONSOLE
> depends on SERIAL_CPM=y. It looks like you are suggesting reversing the
> dependencies.

I see that SERIAL_CPM_CONSOLE has already "depends on SERIAL_CPM=y".
Am I right that this already disallow compiling cpm_uart driver as
module when SERIAL_CPM_CONSOLE is enabled?

> > Any other opinion?
> 
> Yes, please. Otherwise I prefer my option 2.
> 
> -- 
> ~Randy

Option 2 looks like a better solution.

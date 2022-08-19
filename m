Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9793059A894
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 00:39:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8cBR3j3xz3dwd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 08:39:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vE2QLHiQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vE2QLHiQ;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8c9s1lkZz3bcZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 08:38:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id DFB7ECE27FC;
	Fri, 19 Aug 2022 22:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32AEC433D7;
	Fri, 19 Aug 2022 22:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660948732;
	bh=8vfZJjYZxjxPbLQfL+NBtrngpHfWy/iPrGe/EGv0rns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vE2QLHiQT4kpjISpg4qib1zdhqag6aqzkgwkAFjrEC03gSZM/HsX0wFScku3eRPem
	 nV5m3EI8OvjlRJCZgW9nHPJA6rgXxnycpe2/Drly368tUrDggVbTqkhwxR8S4ILSI4
	 MShMz0GQOI2oCXNcvlEBJrj6SMZ+D5vfNgy3vuMAgfTA5YWdOsCvU6xHyTW2opGGtF
	 yX6N7xptoJx+KJZkCFN8JOQhCdAUjkqM8aTQZMkABwREU4909Vo7RyjYnKh0BwgId7
	 9/jRNBZNNjn7QaUPGTV40Ww2EF5v9Ki64RYLEe2b1H/fPkyqfKQn2cszbtpVMJLPIA
	 nemmay0WVmbtg==
Received: by pali.im (Postfix)
	id 9C4072980; Sat, 20 Aug 2022 00:38:48 +0200 (CEST)
Date: Sat, 20 Aug 2022 00:38:48 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] powerpc: Add support for early debugging via Serial
 16550 console
Message-ID: <20220819223848.lvxakjjzfdjvyqgu@pali>
References: <20220819211254.22192-1-pali@kernel.org>
 <35c0ff6a-387d-3c01-66b3-f659cfe67c2a@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35c0ff6a-387d-3c01-66b3-f659cfe67c2a@infradead.org>
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
Cc: Nick Child <nick.child@ibm.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 19 August 2022 15:34:14 Randy Dunlap wrote:
> Hi--
> 
> On 8/19/22 14:12, Pali Rohár wrote:
> > Currently powerpc early debugging contains lot of platform specific
> > options, but does not support standard UART / serial 16550 console.
> > 
> > Later legacy_serial.c code supports registering UART as early debug console
> > from device tree but it is not early during booting, but rather later after
> > machine description code finishes.
> > 
> > So for real early debugging via UART is current code unsuitable.
> > 
> > Add support for new early debugging option CONFIG_PPC_EARLY_DEBUG_16550
> > which enable Serial 16550 console on address defined by new option
> > CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR and by stride by option
> > CONFIG_PPC_EARLY_DEBUG_16550_STRIDE.
> > 
> > With this change it is possible to debug powerpc machine descriptor code.
> > For example this early debugging code can print on serial console also
> > "No suitable machine description found" error which is done before
> > legacy_serial.c code.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> > Tested on P2020 board. It allowed me do debug and implement this patch series:
> > https://lore.kernel.org/linuxppc-dev/20220819191557.28116-1-pali@kernel.org/
> > ---
> >  arch/powerpc/Kconfig.debug       | 14 ++++++++++++++
> >  arch/powerpc/include/asm/udbg.h  |  1 +
> >  arch/powerpc/kernel/udbg.c       |  2 ++
> >  arch/powerpc/kernel/udbg_16550.c | 33 ++++++++++++++++++++++++++++++++
> >  4 files changed, 50 insertions(+)
> > 
> > diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> > index 9f363c143d86..a4e7d90a45d2 100644
> > --- a/arch/powerpc/Kconfig.debug
> > +++ b/arch/powerpc/Kconfig.debug
> > @@ -276,6 +276,11 @@ config PPC_EARLY_DEBUG_OPAL_HVSI
> >  	  Select this to enable early debugging for the PowerNV platform
> >  	  using an "hvsi" console
> >  
> > +config PPC_EARLY_DEBUG_16550
> > +	bool "Serial 16550"
> > +	help
> > +	  Select this to enable early debugging via Serial 16550 console
> > +
> >  config PPC_EARLY_DEBUG_MEMCONS
> >  	bool "In memory console"
> >  	help
> > @@ -355,6 +360,15 @@ config PPC_EARLY_DEBUG_CPM_ADDR
> >  	  platform probing is done, all platforms selected must
> >  	  share the same address.
> >  
> > +config PPC_EARLY_DEBUG_16550_PHYSADDR
> > +	hex "Early debug Serial 16550 physical address"
> > +	depends on PPC_EARLY_DEBUG_16550
> 
> Is there any chance that you could provide a default value here
> so that 'make olddefconfig' does not end up like it does
> without having a default value?

No. Because there is not any default value. Physical address of 16550 is
hardly HW dependent. Possibly also bootloader dependent (if it can remap
peripherals to different physical addresses).

User _has to_ specify correct physical address if want to use early
debug 16550 console.

> CONFIG_PPC_EARLY_DEBUG_16550=y
> # CONFIG_PPC_EARLY_DEBUG_MEMCONS is not set
> CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR=
> CONFIG_PPC_EARLY_DEBUG_16550_STRIDE=1
> 
> which then causes a kconfig prompt when starting
> the build...

Cannot we set somehow that PPC_EARLY_DEBUG_16550 would be disabled by
default when upgrading defconfig?

> > +
> > +config PPC_EARLY_DEBUG_16550_STRIDE
> > +	int "Early debug Serial 16550 stride"
> > +	depends on PPC_EARLY_DEBUG_16550
> > +	default 1
> > +
> >  config FAIL_IOMMU
> >  	bool "Fault-injection capability for IOMMU"
> >  	depends on FAULT_INJECTION
> 
> Thanks.
> -- 
> ~Randy

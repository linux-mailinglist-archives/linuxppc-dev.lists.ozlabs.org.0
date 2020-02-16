Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBE516040C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 13:36:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48L6794NPBzDqdt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 23:36:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=lHvJhsvI; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48L64V6tGczDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2020 23:34:18 +1100 (AEDT)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E02E5206D7;
 Sun, 16 Feb 2020 12:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581856456;
 bh=CK9AGexnenOmXyQKve9YVghVQRdcBjvKQyQ8y5gDoSM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lHvJhsvIL0eGKudTZzeOYp4p2dz5PjS6mB71vznX2KqIJass3jnGJFwrzZf5GxR7i
 M7hqLXVApLt9JLwbOJk6kWnneMXdQQb1gJmhn1M0xPa4+pdAxme8i2G5/73pnWmZhK
 UFmja6IjRgj9NmU+KzXu6B6cKE8Zd+4FxwXwBjW4=
Date: Sun, 16 Feb 2020 21:34:11 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/kprobes: Fix trap address when trap happened in
 real mode
Message-Id: <20200216213411.824295a321d8fa979dedbbbe@kernel.org>
In-Reply-To: <e09d3c42-542e-48c1-2f1e-cfe605b05bec@c-s.fr>
References: <b1451438f7148ad0e03306a1f1409f4ad1d6ec7c.1581684263.git.christophe.leroy@c-s.fr>
 <20200214225434.464ec467ad9094961abb8ddc@kernel.org>
 <e09d3c42-542e-48c1-2f1e-cfe605b05bec@c-s.fr>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Paul Mackerras <paulus@samba.org>, stable@kernel.vger.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 15 Feb 2020 11:28:49 +0100
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> Hi,
> 
> Le 14/02/2020 à 14:54, Masami Hiramatsu a écrit :
> > Hi,
> > 
> > On Fri, 14 Feb 2020 12:47:49 +0000 (UTC)
> > Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> > 
> >> When a program check exception happens while MMU translation is
> >> disabled, following Oops happens in kprobe_handler() in the following
> >> test:
> >>
> >> 		} else if (*addr != BREAKPOINT_INSTRUCTION) {
> > 
> > Thanks for the report and patch. I'm not so sure about powerpc implementation
> > but at where the MMU translation is disabled, can the handler work correctly?
> > (And where did you put the probe on?)
> > 
> > Your fix may fix this Oops, but if the handler needs special care, it is an
> > option to blacklist such place (if possible).
> 
> I guess that's another story. Here we are not talking about a place 
> where kprobe has been illegitimately activated, but a place where there 
> is a valid trap, which generated a valid 'program check exception'. And 
> kprobe was off at that time.

Ah, I got it. It is not a kprobe breakpoint, but to check that correctly,
it has to know the address where the breakpoint happens. OK.

> 
> As any 'program check exception' due to a trap (ie a BUG_ON, a WARN_ON, 
> a debugger breakpoint, a perf breakpoint, etc...) calls 
> kprobe_handler(), kprobe_handler() must be prepared to handle the case 
> where the MMU translation is disabled, even if probes are not supposed 
> to be set for functions running with MMU translation disabled.

Can't we check the MMU is disabled there (as same as checking the exception
happened in user space or not)?

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>

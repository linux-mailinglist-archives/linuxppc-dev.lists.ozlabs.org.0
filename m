Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFC83552BF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 13:51:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF5Td735bz30C8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 21:51:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=elvis.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de;
 envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FF5TK4nBTz2yyx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 21:51:15 +1000 (AEST)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lTkEe-00062N-00; Tue, 06 Apr 2021 13:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 639BBC210F; Tue,  6 Apr 2021 13:36:38 +0200 (CEST)
Date: Tue, 6 Apr 2021 13:36:38 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 6/9] mips: netlogic: Use irq_domain_simple_ops for XLP PIC
Message-ID: <20210406113638.GA8277@alpha.franken.de>
References: <20210406093557.1073423-1-maz@kernel.org>
 <20210406093557.1073423-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406093557.1073423-7-maz@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-sh@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 06, 2021 at 10:35:54AM +0100, Marc Zyngier wrote:
> Use the generic irq_domain_simple_ops structure instead of
> a home-grown one.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/mips/netlogic/common/irq.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEC22F494A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 12:03:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG4L01sGrzDq94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 22:03:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=elvis.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de;
 envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=alpha.franken.de
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DG4GL58w3zDrbv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 21:59:49 +1100 (AEDT)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kzdsF-0002Aa-00; Wed, 13 Jan 2021 11:59:35 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id F1ACBC02B1; Wed, 13 Jan 2021 11:59:24 +0100 (CET)
Date: Wed, 13 Jan 2021 11:59:24 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 3/4] mips/mm/highmem: Use set_pte() for kmap_local()
Message-ID: <20210113105924.GA10822@alpha.franken.de>
References: <20210112170136.078559026@linutronix.de>
 <20210112170411.187513575@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210112170411.187513575@linutronix.de>
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
Cc: Andreas Larsson <andreas@gaisler.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 12, 2021 at 06:01:39PM +0100, Thomas Gleixner wrote:
> set_pte_at() on MIPS invokes update_cache() which might recurse into
> kmap_local(). Use set_pte() like the original MIPS highmem implementation
> did.
> 
> Fixes: a4c33e83bca1 ("mips/mm/highmem: Switch to generic kmap atomic")
> Reported-by: Paul Cercueil <paul@crapouillou.net>
> Reported-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  arch/mips/include/asm/highmem.h |    1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

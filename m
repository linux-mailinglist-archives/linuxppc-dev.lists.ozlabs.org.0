Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7C6348BCA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 09:45:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5dwp5kjLz3bcb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 19:45:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5dwT4byrz304d
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 19:45:26 +1100 (AEDT)
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 821681BF20C;
 Thu, 25 Mar 2021 08:45:19 +0000 (UTC)
Date: Thu, 25 Mar 2021 09:45:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "heying (H)" <heying24@huawei.com>
Subject: Re: [PATCH V3 -next] powerpc: kernel/time.c - cleanup warnings
Message-ID: <YFxNneWEFO4m5Glt@piout.net>
References: <20210324090939.143477-1-heying24@huawei.com>
 <YFsGYgdNH5HrlqDJ@piout.net>
 <18a8d444-f1a5-61e0-b9f2-f85c03d71686@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18a8d444-f1a5-61e0-b9f2-f85c03d71686@huawei.com>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, geert+renesas@glider.be,
 peterz@infradead.org, frederic@kernel.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, kernelfans@gmail.com, paulus@samba.org,
 geert@linux-m68k.org, tglx@linutronix.de, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/03/2021 17:46:19+0800, heying (H) wrote:
> Many thanks for your suggestion. As you suggest, rtc_lock should be local to
> platforms.
> 
> Does it mean not only powerpc but also all other platforms should adapt this
> change?

Not all the other ones, in the current state, x86 still needs it. I'll
work on that. Again, the patch is fine as is.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

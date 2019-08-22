Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCB298A2A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 06:08:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DWGW4m58zDqWn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 14:08:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DWDn2MlxzDqB3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 14:06:29 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 640F6152474BD;
 Wed, 21 Aug 2019 21:06:22 -0700 (PDT)
Date: Wed, 21 Aug 2019 21:06:21 -0700 (PDT)
Message-Id: <20190821.210621.1830113293142016068.davem@davemloft.net>
To: julietk@linux.vnet.ibm.com
Subject: Re: [PATCH 1/2] net/ibmvnic: unlock rtnl_lock in reset so
 linkwatch_event can run
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190820213120.19880-1-julietk@linux.vnet.ibm.com>
References: <20190820213120.19880-1-julietk@linux.vnet.ibm.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 21 Aug 2019 21:06:22 -0700 (PDT)
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Juliet Kim <julietk@linux.vnet.ibm.com>
Date: Tue, 20 Aug 2019 17:31:19 -0400

> Commit a5681e20b541 ("net/ibmnvic: Fix deadlock problem in reset") 
> made the change to hold the RTNL lock during a reset to avoid deadlock 
> but linkwatch_event is fired during the reset and needs the RTNL lock.  
> That keeps linkwatch_event process from proceeding until the reset 
> is complete. The reset process cannot tolerate the linkwatch_event 
> processing after reset completes, so release the RTNL lock during the 
> process to allow a chance for linkwatch_event to run during reset. 
> This does not guarantee that the linkwatch_event will be processed as 
> soon as link state changes, but is an improvement over the current code
> where linkwatch_event processing is always delayed, which prevents 
> transmissions on the device from being deactivated leading transmit 
> watchdog timer to time-out. 
> 
> Release the RTNL lock before link state change and re-acquire after 
> the link state change to allow linkwatch_event to grab the RTNL lock 
> and run during the reset.
> 
> Fixes: a5681e20b541 ("net/ibmnvic: Fix deadlock problem in reset")
> Signed-off-by: Juliet Kim <julietk@linux.vnet.ibm.com>

Conditional locking, especialy such extensive use of conditional
locking as is being done here, is strongly discouraged and is always
indicative of bad design.

Please try to rework this change such that the code paths that want
to lock things a certain way are %100 segregated functionally into
different code paths and functions.

Or feel free to find a cleaner way to fix this.

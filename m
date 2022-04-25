Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB350EB3A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 23:16:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnHrn4LVhz3bpr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 07:16:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hwaE9jDa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hwaE9jDa; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnHr95BCkz3bd3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 07:16:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B1DE2B818A1;
 Mon, 25 Apr 2022 21:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C828DC385A7;
 Mon, 25 Apr 2022 21:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650921380;
 bh=hYLOMTe1/Z2MH6N3yk6aVKeMHTDRSg9Z2C4T2OGqECc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=hwaE9jDaUpBkOfLikisxRqEQgrwvFHBLfDX94LCe6d9c+B89thcG5+fzwWzRgnd4F
 UqUXrmcbmYubtRf7FE8Jwkk5GeEGdqgd1W0d9M3Ortq26Qx+Pzo3/WPJEIVTC7WQXV
 UqJS35401jf9zTe5lsxkUy0T166bIgMuSSN7lwxzplqPNpJ/wNdQpLoMCC6TtgHccT
 M0cMO7eNzOkzlE9ZBqaO/uL2DyV2iLpQzQsHCdz5Ps55sIkShx2Z0vt3n4IP50CnBE
 Hd2GnEAYbJXgRkBeNmR+2LIgqx7mu2Vli7MtwrWAnKBbTjJt82hvzuQRfEDmUCGo1Y
 JC8dirsrUmtgw==
Date: Mon, 25 Apr 2022 16:16:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 0/7] Remove unused SLOW_DOWN_IO
Message-ID: <20220425211617.GA1658400@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422104828.75c726d0@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Chas Williams <3chas3@gmail.com>, linux-alpha@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Paul Mackerras <paulus@samba.org>,
 Matt Turner <mattst88@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 10:48:28AM -0700, Jakub Kicinski wrote:
> On Fri, 15 Apr 2022 14:08:10 -0500 Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Only alpha, ia64, powerpc, and sh define SLOW_DOWN_IO, and there are no
> > actual uses of it.  The few references to it are in situations that are
> > themselves unused.  Remove them all.
> > 
> > It should be safe to apply these independently and in any order.  The only
> > place SLOW_DOWN_IO is used at all is the lmc_var.h definition of DELAY,
> > which is itself never used.
> 
> Hi Bojrn! Would you mind reposting just patches 1 and 3 for networking?
> LMC got removed in net-next (commit a5b116a0fa90 ("net: wan: remove the
> lanmedia (lmc) driver")) so the entire series fails to apply and therefore 
> defeats all of our patch handling scripts :S

Sure, coming up, with reduced cc: list.

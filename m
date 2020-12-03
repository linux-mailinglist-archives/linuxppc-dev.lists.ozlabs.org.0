Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B92CDD56
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 19:26:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cn46w2P9PzDrLv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 05:26:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=rylAs9dP; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn44h6zdXzDrF5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 05:24:49 +1100 (AEDT)
Date: Thu, 3 Dec 2020 19:25:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607019887;
 bh=7POOkLn/pGoxGwO2tQdCyFK5VE+L2sQPNH6OYXqq6sc=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=rylAs9dPfCHUKOsnHMEM9KUR4CMhPVNrvs3yV2m1x/YdJ2hstQweiFWD1YLchYbUt
 90OuedVL4/YwhfzxR+ySNpnLdeluzi9Fr3QROoxAYh61Z0zGo9cPmJsVP3kJMn3wzg
 3KzYzxT2GI+fUn0VTAdcskq9hMOkYaSEPBNaOXUY=
From: Greg KH <gregkh@linuxfoundation.org>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] powerpc/hotplug: assign hot added LMB to the right node
Message-ID: <X8ktsoAv4/h+p1/8@kroah.com>
References: <20201203101514.33591-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203101514.33591-1-ldufour@linux.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 03, 2020 at 11:15:14AM +0100, Laurent Dufour wrote:
> This patch applies to 5.9 and earlier kernels only.
> 
> Since 5.10, this has been fortunately fixed by the commit
> e5e179aa3a39 ("pseries/drmem: don't cache node id in drmem_lmb struct").

Why can't we just backport that patch instead?  It's almost always
better to do that than to have a one-off patch, as almost always those
have bugs in them.

thanks,

greg k-h

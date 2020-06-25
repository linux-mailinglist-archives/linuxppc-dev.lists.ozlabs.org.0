Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B3A20A705
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 22:48:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tBtw6g1PzDqww
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 06:48:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fieldses.org (client-ip=2600:3c00:e000:2f7::1; helo=fieldses.org;
 envelope-from=bfields@fieldses.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fieldses.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fieldses.org header.i=@fieldses.org header.a=rsa-sha256
 header.s=default header.b=gj0MuGKT; dkim-atps=neutral
X-Greylist: delayed 336 seconds by postgrey-1.36 at bilbo;
 Fri, 26 Jun 2020 06:46:11 AEST
Received: from fieldses.org (fieldses.org [IPv6:2600:3c00:e000:2f7::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tBr31T4jzDqd7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 06:46:10 +1000 (AEST)
Received: by fieldses.org (Postfix, from userid 2815)
 id 1C8E879A1; Thu, 25 Jun 2020 16:40:29 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 1C8E879A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fieldses.org;
 s=default; t=1593117629;
 bh=grAX8yggjJQZeEuTqT849+RECeUjWPrYL7L8CDwHWzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gj0MuGKTpqfBnugVSHAllzwtU32mbRNrz5LhpqXoB8FX/dI6FdoUiXA6zXnyorll9
 J8Wg0vYTe1AOKJQyhZwkkl/QiRqNB70nQBPja5EppPVNzeFep+Z8g/ySzPNxVjIaPi
 XVxnHn82AD79SvIa9xchcmtUWE/pnD9cata6TvZo=
Date: Thu, 25 Jun 2020 16:40:29 -0400
From: Bruce Fields <bfields@fieldses.org>
To: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: [PATCH v2] SUNRPC: Add missing definition of
 ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
Message-ID: <20200625204029.GD6605@fieldses.org>
References: <9e9882a2fb57b6f9d98a0a5d8b6bf9cff9fcbd93.1592202173.git.christophe.leroy@csgroup.eu>
 <733E4CAF-A9E5-491F-B0C7-69CA84E5DFA5@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <733E4CAF-A9E5-491F-B0C7-69CA84E5DFA5@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, Jakub Kicinski <kuba@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 08:33:40AM -0400, Chuck Lever wrote:
> 
> 
> > On Jun 15, 2020, at 2:25 AM, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> > 
> > Even if that's only a warning, not including asm/cacheflush.h
> > leads to svc_flush_bvec() being empty allthough powerpc defines
> > ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE.
> > 
> >  CC      net/sunrpc/svcsock.o
> > net/sunrpc/svcsock.c:227:5: warning: "ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE" is not defined [-Wundef]
> > #if ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
> >     ^
> > 
> > Include linux/highmem.h so that asm/cacheflush.h will be included.
> > 
> > Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Cc: Chuck Lever <chuck.lever@oracle.com>
> > Fixes: ca07eda33e01 ("SUNRPC: Refactor svc_recvfrom()")
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> LGTM.
> 
> Acked-by: Chuck Lever <chuck.lever@oracle.com>

Thanks, applying for 5.8.--b.

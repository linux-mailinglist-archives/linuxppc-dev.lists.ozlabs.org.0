Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B6CA0505
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 16:33:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JSs70d3vzDqmb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 00:33:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JShh1SwZzDqxg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 00:25:53 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1E6C668B05; Wed, 28 Aug 2019 16:25:47 +0200 (CEST)
Date: Wed, 28 Aug 2019 16:25:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: use the generic dma coherent remap allocator
Message-ID: <20190828142546.GA29960@lst.de>
References: <20190814132230.31874-1-hch@lst.de>
 <20190814132230.31874-2-hch@lst.de> <20190828061023.GB21592@lst.de>
 <87blw9v2ge.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87blw9v2ge.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 28, 2019 at 11:34:09PM +1000, Michael Ellerman wrote:
> Christoph Hellwig <hch@lst.de> writes:
> > Michael,
> >
> > do oyu plan to pick this up?  Otherwise I'd love to pick it up through
> > the dma-mapping tree as that would avoid one trivial conflict with
> > another pending patch.
> 
> It conflicts a bit with the ioremap changes I already have in next.
> 
> And it would be good for it to get some testing on my machines here. So
> I guess I'd rather it went via the powerpc tree?

Sure, feel free to queue it up through the ppc tree.  I am about to
queue up a patch to move the dma_atomic_pool_init call to common code,
so as linux-next / Linus fixup we'll have to eventually remove
atomic_pool_init() again.

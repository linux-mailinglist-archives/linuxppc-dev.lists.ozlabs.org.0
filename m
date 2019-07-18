Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F216CB50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 10:56:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q7KW0lmyzDqK9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 18:56:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45q79Z3bx3zDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 18:49:38 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CF83D68B05; Thu, 18 Jul 2019 10:49:34 +0200 (CEST)
Date: Thu, 18 Jul 2019 10:49:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
Message-ID: <20190718084934.GF24562@lst.de>
References: <20190717235437.12908-1-shawn@anastas.io>
 <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
 <f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
 <CAOSf1CGA_fDH7aAqRkc4maJUByaX7adGcjyt3cj4KFsMJNnocA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CGA_fDH7aAqRkc4maJUByaX7adGcjyt3cj4KFsMJNnocA@mail.gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shawn Anastasio <shawn@anastas.io>, Christoph Hellwig <hch@lst.de>,
 Sam Bobroff <sbobroff@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2019 at 01:45:16PM +1000, Oliver O'Halloran wrote:
> > Other than m68k, mips, and arm64, everybody else that doesn't have
> > ARCH_NO_COHERENT_DMA_MMAP set uses this default implementation, so
> > I assume this behavior is acceptable on those architectures.
> 
> It might be acceptable, but there's no reason to use pgport_noncached
> if the platform supports cache-coherent DMA.
> 
> Christoph (+cc) made the change so maybe he saw something we're missing.

I always found the forcing of noncached access even for coherent
devices a little odd, but this was inherited from the previous
implementation, which surprised me a bit as the different attributes
are usually problematic even on x86.  Let me dig into the history a
bit more, but I suspect the righ fix is to default to cached mappings
for coherent devices.

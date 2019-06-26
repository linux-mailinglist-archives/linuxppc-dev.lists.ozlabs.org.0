Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B86056299
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 08:50:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YYZd2S84zDqJP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 16:50:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=newverein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YYXm3MZyzDqFK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 16:49:11 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 0462268B05; Wed, 26 Jun 2019 08:48:38 +0200 (CEST)
Date: Wed, 26 Jun 2019 08:48:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mark Greer <mgreer@animalcreek.com>
Subject: Re: DMA coherency in drivers/tty/serial/mpsc.c
Message-ID: <20190626064837.GA24531@lst.de>
References: <20190625122641.GA4421@lst.de>
 <20190625163722.GA18626@animalcreek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190625163722.GA18626@animalcreek.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>,
 linux-serial@vger.kernel.org, Dale Farnsworth <dale@farnsworth.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2019 at 09:37:22AM -0700, Mark Greer wrote:
> Yeah, the mpsc driver had lots of ugly cache related hacks because of
> cache coherency bugs in the early version of the MV64x60 bridge chips
> that it was embedded in.  That chip is pretty much dead now and I've
> removed core support for it from the powerpc tree.  Removing the mpsc
> driver is on my todo list but I've been busy and lazy.  So, to sum it
> up, don't spend any more time worrying about it as it should be removed.
> 
> I'll post a patch to do that tonight and I'm sorry for any time you've
> spent looking at it so far.

No problem.  And if future such broken chips show up we now have
support for per-device DMA coherency settings and could actually
handle it in a reaѕonably clean way.

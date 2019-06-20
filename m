Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 646D14C855
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 09:23:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TtZn2bDszDrBq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 17:23:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TsD66Tm0zDr3m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 16:21:58 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id ACC1868B05; Thu, 20 Jun 2019 08:21:26 +0200 (CEST)
Date: Thu, 20 Jun 2019 08:21:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 3/4] powerpc/powernv: remove dead NPU DMA code
Message-ID: <20190620062126.GA20765@lst.de>
References: <20190523074924.19659-1-hch@lst.de>
 <20190523074924.19659-4-hch@lst.de>
 <db502ec4-2e8f-fbc3-9db2-3fe98464a62c@ozlabs.ru>
 <20190619072837.GA6858@lst.de>
 <b0ce7d72-5de7-63d3-cb4e-ea78342cb3fa@ozlabs.ru>
 <20190620060354.GA20279@lst.de>
 <309781b5-108f-c219-2cda-49179dca6b13@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <309781b5-108f-c219-2cda-49179dca6b13@ozlabs.ru>
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
Cc: linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2019 at 04:20:08PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 20/06/2019 16:03, Christoph Hellwig wrote:
> > Hi Linus,
> > 
> > this goes back to the discussion at last years kernel summit, where
> > we had the discussion on removing code never used by any in-kernel
> > user an no prospects of one.  The IBM folks are unfortunately still
> > dragging their feet on the powerpc side.  Can we revise this discussion?
> > 
> > The use case here is a IBM specific bus for which they only have an
> > out of tree driver that their partner doesn't want to submit for mainline,
> > but keep insisting on keeping the code around (which is also built
> > uncondіtionally for the platform).
> 
> 
> I personally keep insisting on correct commit logs, i.e. not calling
> working code dead and providing actual reasons for the change. Thanks,

If that is the only thing you are complaining about I can clarify it
a little of course.  But it didn't sound like that was the actual
problem.

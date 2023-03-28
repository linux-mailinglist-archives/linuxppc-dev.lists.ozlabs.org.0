Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C820B6CB87C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 09:46:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm1wR5FS8z3ch5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 18:46:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alpha.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de; envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm1vr4cWXz3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 18:46:13 +1100 (AEDT)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1ph41q-0003r6-00; Tue, 28 Mar 2023 09:46:02 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 2C9BFC1C6A; Tue, 28 Mar 2023 09:45:11 +0200 (CEST)
Date: Tue, 28 Mar 2023 09:45:11 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 0/4] Use dma_default_coherent for devicetree default
 coherency
Message-ID: <20230328074511.GA6188@alpha.franken.de>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
 <20230323072944.GA18524@lst.de>
 <60D7FE31-D708-4495-949F-3F64DDC11377@flygoat.com>
 <20230323213930.GA7730@lst.de>
 <CB41D3AF-20F6-42F3-9168-C0D6E716431A@flygoat.com>
 <20230328011812.GA21977@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328011812.GA21977@lst.de>
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
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 28, 2023 at 03:18:12AM +0200, Christoph Hellwig wrote:
> On Fri, Mar 24, 2023 at 09:17:38AM +0000, Jiaxun Yang wrote:
> > > 
> > > Is patch a 6.3 candidate or should all of it go into 6.4?
> > 
> > Please leave it for 6.4, as corresponding MIPS arch part will be a part of 6.4.
> 
> Ok.  I'll really need review from the MIPS and drivers/of/ maintainers,
> through.

I don't see any MIPS changes in the series besides the ifdef CONFIG_MIPS
part in patch 1, which gets removed again in patch 4 (chance to drop
that completely ?).

I've merged the corresponding MIPS patches into mips-next last week.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

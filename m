Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D8341DA3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 14:04:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F23xw2nChz3c7F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 00:04:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F23xc0gZSz2xZF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 00:04:02 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6CB8568BFE; Fri, 19 Mar 2021 14:03:57 +0100 (CET)
Date: Fri, 19 Mar 2021 14:03:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 08/10] MIPS: disable CONFIG_IDE in malta*_defconfig
Message-ID: <20210319130356.GA2624@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-9-hch@lst.de>
 <20210318141900.GA10554@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318141900.GA10554@alpha.franken.de>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-doc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 18, 2021 at 03:19:00PM +0100, Thomas Bogendoerfer wrote:
> On Thu, Mar 18, 2021 at 05:57:04AM +0100, Christoph Hellwig wrote:
> >  arch/mips/configs/malta_kvm_guest_defconfig | 3 ---
> 
> that file is gone in mips-next.
> 
> I could take all MIPS patches into mips-next, if you want...

Fine with me - it shouldn't really matter if the defconfig updates
go in independently.  Do you want a resend with the typos fixed
against mips-next or are you simply going to fix these things up?

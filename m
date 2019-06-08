Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A039B85
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 09:25:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LWBp69nSzDqGS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 17:25:22 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LW965tV1zDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 17:23:52 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 7E63E68B02; Sat,  8 Jun 2019 09:23:22 +0200 (CEST)
Date: Sat, 8 Jun 2019 09:23:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
Message-ID: <20190608072322.GA18896@lst.de>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <7697a9d10777b28ae79fdffdde6d0985555f6310.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7697a9d10777b28ae79fdffdde6d0985555f6310.camel@kernel.crashing.org>
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 08, 2019 at 02:21:23PM +1000, Benjamin Herrenschmidt wrote:
> 
> > Please try the attached patch. I'm not really pleased with it and I will 
> > continue to determine why the fallback to a 30-bit mask fails, but at least this 
> > one works for me.
> 
> Your patch only makes sense if the device is indeed capable of
> addressing 31-bits.
> 
> So either the driver is buggy and asks for a too small mask in which
> case your patch is ok, or it's not and you're just going to cause all
> sort of interesting random problems including possible memory
> corruption.

Well, my patches changes ZONE_DMA to be 30-bits instead of 31, and
thus should allow requesting a 30-bit mask to succeed.

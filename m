Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3AB3723D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 12:58:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KN1W2wlrzDqRP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 20:58:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KN0949RWzDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 20:57:13 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x56Aus22032180;
 Thu, 6 Jun 2019 05:56:55 -0500
Message-ID: <d87ac9a7faac0d5522cb496d74afc586410fed9c.camel@kernel.crashing.org>
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Date: Thu, 06 Jun 2019 20:56:54 +1000
In-Reply-To: <20190606093149.GA11598@darkstar.musicnaut.iki.fi>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <dfe6451c93574b61d4bdde4a05c5f8ccf86b31a0.camel@kernel.crashing.org>
 <20190606093149.GA11598@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-06-06 at 12:31 +0300, Aaro Koskinen wrote:
> Hi,
> 
> On Thu, Jun 06, 2019 at 10:54:51AM +1000, Benjamin Herrenschmidt
> wrote:
> > On Thu, 2019-06-06 at 01:50 +0300, Aaro Koskinen wrote:
> > > Hi,
> > > 
> > > When upgrading from v5.0 -> v5.1 on G4 PowerBook, I noticed WLAN
> > > does
> > > not work anymore:
> > > 
> > > [   42.004303] b43legacy-phy0: Loading firmware version 0x127,
> > > patch level 14 (2005-04-18 02:36:27)
> > > [   42.184837] b43legacy-phy0 debug: Chip initialized
> > > [   42.184873] b43legacy-phy0 ERROR: The machine/kernel does not
> > > support the required 30-bit DMA mask
> > > 
> > > The same happens with the current mainline.
> > 
> > How much RAM do you have ?
> 
> The system has 1129 MB RAM. Booting with mem=1G makes it work.

Wow... that's an odd amount. One thing we could possibly do is add code
to limit the amount of RAM when we detect that device....

Cheers,
Ben.



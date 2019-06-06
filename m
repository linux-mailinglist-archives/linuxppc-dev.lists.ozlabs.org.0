Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 948C536FF3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 11:33:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KL7s4DwpzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 19:33:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=iki.fi
 (client-ip=62.142.5.108; helo=emh02.mail.saunalahti.fi;
 envelope-from=aaro.koskinen@iki.fi; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=iki.fi
Received: from emh02.mail.saunalahti.fi (emh02.mail.saunalahti.fi
 [62.142.5.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KL5r2PmZzDqRt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 19:31:56 +1000 (AEST)
Received: from darkstar.musicnaut.iki.fi (85-76-64-161-nat.elisa-mobile.fi
 [85.76.64.161])
 by emh02.mail.saunalahti.fi (Postfix) with ESMTP id 9530B2002D;
 Thu,  6 Jun 2019 12:31:49 +0300 (EEST)
Date: Thu, 6 Jun 2019 12:31:49 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
Message-ID: <20190606093149.GA11598@darkstar.musicnaut.iki.fi>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <dfe6451c93574b61d4bdde4a05c5f8ccf86b31a0.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfe6451c93574b61d4bdde4a05c5f8ccf86b31a0.camel@kernel.crashing.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

Hi,

On Thu, Jun 06, 2019 at 10:54:51AM +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2019-06-06 at 01:50 +0300, Aaro Koskinen wrote:
> > Hi,
> > 
> > When upgrading from v5.0 -> v5.1 on G4 PowerBook, I noticed WLAN does
> > not work anymore:
> > 
> > [   42.004303] b43legacy-phy0: Loading firmware version 0x127, patch level 14 (2005-04-18 02:36:27)
> > [   42.184837] b43legacy-phy0 debug: Chip initialized
> > [   42.184873] b43legacy-phy0 ERROR: The machine/kernel does not support the required 30-bit DMA mask
> > 
> > The same happens with the current mainline.
> 
> How much RAM do you have ?

The system has 1129 MB RAM. Booting with mem=1G makes it work.

A.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C5164F8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 02:28:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kcN53YvKzDqgb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 10:28:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=telegraphics.com.au
 (client-ip=98.124.60.144; helo=kvm5.telegraphics.com.au;
 envelope-from=fthain@telegraphics.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 45kcLK0GJ0zDqg8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 10:26:32 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id DAB0F297D3;
 Wed, 10 Jul 2019 20:26:27 -0400 (EDT)
Date: Thu, 11 Jul 2019 10:26:27 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: linuxppc-dev@lists.ozlabs.org, linux-ide@vger.kernel.org
Subject: Re: pata-macio on PowerBook G3: stuck interrupt with MATSHITA CR-174
 CD-ROM
In-Reply-To: <alpine.LNX.2.21.1906271717080.68@nippy.intranet>
Message-ID: <alpine.LNX.2.21.1906291014050.119@nippy.intranet>
References: <alpine.LNX.2.21.1906271717080.68@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stan <userm57@yahoo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 Jun 2019, Finn Thain wrote:

> Hi All,
> 
> I've received a bug report concerning the pata-macio driver, when running 
> on a PowerBook G3 (Wallstreet).
> 
> With CONFIG_PATA_MACIO=n && CONFIG_BLK_DEV_IDE_PMAC=y, everything works.
> 
> With CONFIG_PATA_MACIO=y && CONFIG_BLK_DEV_IDE_PMAC=n, the CD-ROM fails.
> 
> When the CD-ROM mediabay module is swapped for a DVD-ROM mediabay module, 
> everything works (either pata-macio or ide-pmac driver works fine).
> 
> I'm not familiar with ATA device drivers or the "Heathrow" chipset and its 
> ATA interfaces so any hints as to how to debug this would be appreciated.
> 
...
> 
> These logs are from v4.20 but the problem is the same in v5.2-rc2.
> 

In the linux-ide list archive I found the same bug reported in 2.6.33-rc2, 
shortly after the pata-macio driver was merged.

https://lore.kernel.org/linux-ide/19254.17766.674348.933702@pilspetsen.it.uu.se/

That report also involves a Matshita CD-ROM and a Heathrow controller 
(beige G3).

In that thread Ben suggested that the cause may be a firmware bug in the 
drive. Is there a quirk or other workaround for that kind of bug?

I tried removing the controller reset but there was no improvement...

diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
index 57f2ec71cfc3..b2fd5e20367f 100644
--- a/drivers/ata/pata_macio.c
+++ b/drivers/ata/pata_macio.c
@@ -1096,7 +1096,7 @@ static int pata_macio_common_init(struct pata_macio_priv *priv,
 	priv->host->ports[0]->private_data = priv;
 
 	/* hard-reset the controller */
-	pata_macio_reset_hw(priv, 0);
+//	pata_macio_reset_hw(priv, 0);
 	pata_macio_apply_timings(priv->host->ports[0], 0);
 
 	/* Enable bus master if necessary */

-- 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 191F8367A0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 00:52:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K3w719H5zDqYh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 08:52:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=iki.fi
 (client-ip=62.142.5.107; helo=emh01.mail.saunalahti.fi;
 envelope-from=aaro.koskinen@iki.fi; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=iki.fi
Received: from emh01.mail.saunalahti.fi (emh01.mail.saunalahti.fi
 [62.142.5.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K3tP5WzCzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 08:51:06 +1000 (AEST)
Received: from darkstar.musicnaut.iki.fi (85-76-64-161-nat.elisa-mobile.fi
 [85.76.64.161])
 by emh01.mail.saunalahti.fi (Postfix) with ESMTP id DAC592002F;
 Thu,  6 Jun 2019 01:50:59 +0300 (EEST)
Date: Thu, 6 Jun 2019 01:50:59 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Christoph Hellwig <hch@lst.de>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Larry Finger <Larry.Finger@lwfinger.net>
Subject: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
Message-ID: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

When upgrading from v5.0 -> v5.1 on G4 PowerBook, I noticed WLAN does
not work anymore:

[   42.004303] b43legacy-phy0: Loading firmware version 0x127, patch level 14 (2005-04-18 02:36:27)
[   42.184837] b43legacy-phy0 debug: Chip initialized
[   42.184873] b43legacy-phy0 ERROR: The machine/kernel does not support the required 30-bit DMA mask

The same happens with the current mainline.

Bisected to:

	commit 65a21b71f948406201e4f62e41f06513350ca390
	Author: Christoph Hellwig <hch@lst.de>
	Date:   Wed Feb 13 08:01:26 2019 +0100

	    powerpc/dma: remove dma_nommu_dma_supported

	    This function is largely identical to the generic version used
	    everywhere else.  Replace it with the generic version.

	    Signed-off-by: Christoph Hellwig <hch@lst.de>
	    Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
	    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

A.

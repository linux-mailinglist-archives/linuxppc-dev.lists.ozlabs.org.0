Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AA241860
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 00:48:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NlX173GnzDr0N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 08:48:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=iki.fi
 (client-ip=62.142.5.116; helo=emh06.mail.saunalahti.fi;
 envelope-from=aaro.koskinen@iki.fi; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=iki.fi
Received: from emh06.mail.saunalahti.fi (emh06.mail.saunalahti.fi
 [62.142.5.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NlVK5M96zDqsJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 08:46:30 +1000 (AEST)
Received: from darkstar.musicnaut.iki.fi (85-76-70-161-nat.elisa-mobile.fi
 [85.76.70.161])
 by emh06.mail.saunalahti.fi (Postfix) with ESMTP id 692A23007D;
 Wed, 12 Jun 2019 01:46:24 +0300 (EEST)
Date: Wed, 12 Jun 2019 01:46:23 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
Message-ID: <20190611224623.GC26504@darkstar.musicnaut.iki.fi>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
 <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
 <20190610081825.GA16534@lst.de>
 <153c13f5-a829-1eab-a3c5-fecfb84127ff@lwfinger.net>
 <20190611060521.GA19512@lst.de>
 <5aaa600b-5b59-1f68-454f-20403c318f1a@lwfinger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5aaa600b-5b59-1f68-454f-20403c318f1a@lwfinger.net>
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
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, Jun 11, 2019 at 05:20:12PM -0500, Larry Finger wrote:
> It is obvious that the case of a mask smaller than min_mask should be
> handled by the IOMMU. In my system, CONFIG_IOMMU_SUPPORT is selected. All
> other CONFIG variables containing IOMMU are not selected. When
> dma_direct_supported() fails, should the system not try for an IOMMU
> solution? Is the driver asking for the wrong type of memory? It is doing a
> dma_and_set_mask_coherent() call.

I don't think we have IOMMU on G4. On G5 it should work (I remember fixing
b43 issue on G5, see 4c374af5fdee, unfortunately all my G5 Macs with b43
are dead and waiting for re-capping).

A.

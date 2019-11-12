Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A51E0F92EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 15:47:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C9ZP0XvkzF56h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 01:47:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C9RP3M2dzF48p
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 01:41:16 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 16B2D68BE1; Tue, 12 Nov 2019 15:41:10 +0100 (CET)
Date: Tue, 12 Nov 2019 15:41:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: Bug 205201 - overflow of DMA mask and bus mask
Message-ID: <20191112144109.GA11805@lst.de>
References: <71A251A5-FA06-4019-B324-7AED32F7B714@xenosoft.de>
 <1b0c5c21-2761-d3a3-651b-3687bb6ae694@xenosoft.de>
 <3504ee70-02de-049e-6402-2d530bf55a84@xenosoft.de>
 <46025f1b-db20-ac23-7dcd-10bc43bbb6ee@xenosoft.de>
 <20191105162856.GA15402@lst.de>
 <2f3c81bd-d498-066a-12c0-0a7715cda18f@xenosoft.de>
 <d2c614ec-c56e-3ec2-12d0-7561cd30c643@xenosoft.de>
 <af32bfcc-5559-578d-e1f4-75e454c965bf@xenosoft.de>
 <0c5a8009-d28b-601f-3d1a-9de0e869911c@xenosoft.de>
 <a794864f-04ae-9b90-50e7-01b416c861fe@xenosoft.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a794864f-04ae-9b90-50e7-01b416c861fe@xenosoft.de>
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
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net,
 mad skateman <madskateman@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, paulus@samba.org, rtd2@xtra.co.nz,
 "contact@a-eon.com" <contact@a-eon.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 01:22:55PM +0100, Christian Zigotzky wrote:
> Now, I can definitely say that this patch does not solve the issue.
>
> Do you have another patch for testing or shall I bisect?

I'm still interested in the .config and dmesg.  Especially if the
board is using arch/powerpc/sysdev/fsl_pci.c, which is the only
place inside the powerpc arch code doing funny things with the
bus_dma_mask, which Robin pointed out looks fishy.

>
> Thanks,
> Christian
---end quoted text---

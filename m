Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E7526AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 10:31:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Xzrt2JDNzDq8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 18:31:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Xzpg4Q7nzDq83
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 18:29:15 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id F2E2768B02; Tue, 25 Jun 2019 10:28:40 +0200 (CEST)
Date: Tue, 25 Jun 2019 10:28:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/4] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
Message-ID: <20190625082840.GA31969@lst.de>
References: <20190625081512.16704-1-hch@lst.de>
 <20190625081512.16704-2-hch@lst.de>
 <113fb518-0f5a-8ced-8391-abe48869a0cb@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <113fb518-0f5a-8ced-8391-abe48869a0cb@kaod.org>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2019 at 10:26:03AM +0200, Cédric Le Goater wrote:
> > @@ -280,13 +280,6 @@ int64_t opal_xive_allocate_irq(uint32_t chip_id);
> >  int64_t opal_xive_free_irq(uint32_t girq);
> >  int64_t opal_xive_sync(uint32_t type, uint32_t id);
> >  int64_t opal_xive_dump(uint32_t type, uint32_t id);
> > -int64_t opal_xive_get_queue_state(uint64_t vp, uint32_t prio,
> > -				  __be32 *out_qtoggle,
> > -				  __be32 *out_qindex);
> > -int64_t opal_xive_set_queue_state(uint64_t vp, uint32_t prio,
> > -				  uint32_t qtoggle,
> > -				  uint32_t qindex);
> > -int64_t opal_xive_get_vp_state(uint64_t vp, __be64 *out_w01);
> 
> 
> This hunk seems unrelated.
> 
> These OPAL calls are new. They are used by the XIVE KVM device 
> to get/set the interrupt controller state of a guest. 
> 
> 
> >  int64_t opal_pci_set_p2p(uint64_t phb_init, uint64_t phb_target,
> >  			uint64_t desc, uint16_t pe_number);
> 
> I suppose this is the one ^ you wanted to remove.

Thanks.  I'm pretty sure I had this fixed up before due to a builtbot
warning, but somehow the old version popped up again.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 275CF5E72C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 16:53:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f3yb2FdbzDqCF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 00:53:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f3Vq05qqzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 00:33:05 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F177968B05; Wed,  3 Jul 2019 16:33:00 +0200 (CEST)
Date: Wed, 3 Jul 2019 16:33:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/4] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
Message-ID: <20190703143300.GA10125@lst.de>
References: <20190625145239.2759-2-hch@lst.de> <45f3Mt388Xz9sPD@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45f3Mt388Xz9sPD@ozlabs.org>
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
 Oliver O'Halloran <oohall@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 04, 2019 at 12:27:06AM +1000, Michael Ellerman wrote:
> On Tue, 2019-06-25 at 14:52:36 UTC, Christoph Hellwig wrote:
> > This function has never been used anywhere in the kernel tree since it
> > was added to the tree.  We also now have proper PCIe P2P APIs in the core
> > kernel, and any new P2P support should be using those.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Series applied to powerpc next, thanks.
> 
> https://git.kernel.org/powerpc/c/63982618662e2a05e5c5c3e4247456d1d3467f32

Thanks.  For P2P it would be good if you guys could chime in for
the "Removing struct page from P2PDMA" where we are discussion PCIe
P2P requirements so that our future changes can accommodate Power 9
and we can help upstreaming the P2P support in a proper way.

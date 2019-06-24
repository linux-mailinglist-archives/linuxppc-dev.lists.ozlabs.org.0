Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC0E51DC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 23:59:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XjrV2WmSzDqTY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 07:59:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=imre.deak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Xbzs2qYDzDqRX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 03:35:39 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 10:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,412,1557212400"; d="scan'208";a="187988905"
Received: from ideak-desk.fi.intel.com ([10.237.72.204])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2019 10:35:33 -0700
Date: Mon, 24 Jun 2019 20:35:33 +0300
From: Imre Deak <imre.deak@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v4 1/4] lib/scatterlist: Fix mapping iterator when
 sg->offset is greater than PAGE_SIZE
Message-ID: <20190624173533.GA809@ideak-desk.fi.intel.com>
References: <cover.1560805614.git.christophe.leroy@c-s.fr>
 <f28c6b0e2f9510f42ca934f19c4315084e668c21.1560805614.git.christophe.leroy@c-s.fr>
 <20190620060221.q4pbsqzsza3pxs42@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620060221.q4pbsqzsza3pxs42@gondor.apana.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:57:27 +1000
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
Reply-To: imre.deak@intel.com
Cc: horia.geanta@nxp.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Jun 20, 2019 at 02:02:21PM +0800, Herbert Xu wrote:
> On Mon, Jun 17, 2019 at 09:15:02PM +0000, Christophe Leroy wrote:
> > All mapping iterator logic is based on the assumption that sg->offset
> > is always lower than PAGE_SIZE.
> > 
> > But there are situations where sg->offset is such that the SG item
> > is on the second page.

could you explain how sg->offset becomes >= PAGE_SIZE?

--Imre


> > In that case sg_copy_to_buffer() fails
> > properly copying the data into the buffer. One of the reason is
> > that the data will be outside the kmapped area used to access that
> > data.
> > 
> > This patch fixes the issue by adjusting the mapping iterator
> > offset and pgoffset fields such that offset is always lower than
> > PAGE_SIZE.
> > 
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > Fixes: 4225fc8555a9 ("lib/scatterlist: use page iterator in the mapping iterator")
> > Cc: stable@vger.kernel.org
> > ---
> >  lib/scatterlist.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> Good catch.
> 
> > @@ -686,7 +686,12 @@ static bool sg_miter_get_next_page(struct sg_mapping_iter *miter)
> >  		sg = miter->piter.sg;
> >  		pgoffset = miter->piter.sg_pgoffset;
> >  
> > -		miter->__offset = pgoffset ? 0 : sg->offset;
> > +		offset = pgoffset ? 0 : sg->offset;
> > +		while (offset >= PAGE_SIZE) {
> > +			miter->piter.sg_pgoffset = ++pgoffset;
> > +			offset -= PAGE_SIZE;
> > +		}
> 
> How about
> 
> 	miter->piter.sg_pgoffset += offset >> PAGE_SHIFT;
> 	offset &= PAGE_SIZE - 1;
> 
> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

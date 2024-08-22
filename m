Return-Path: <linuxppc-dev+bounces-294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D683795AB80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 05:00:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq7Gm52jCz2xHW;
	Thu, 22 Aug 2024 13:00:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wq7Gl5Rmqz2xGQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 12:59:59 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2C504227A8E; Thu, 22 Aug 2024 04:59:53 +0200 (CEST)
Date: Thu, 22 Aug 2024 04:59:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, cassel@kernel.org,
	dlemoal@kernel.org, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	hch@lst.de, linux-ppc@kolla.no, vidra@ufal.mff.cuni.cz
Subject: Re: [PATCH v2] ata: pata_macio: Use WARN instead of BUG
Message-ID: <20240822025952.GA32067@lst.de>
References: <20240820030407.627785-1-mpe@ellerman.id.au> <6b2208d1-c18f-14d5-e6d0-acd5c82b4db1@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b2208d1-c18f-14d5-e6d0-acd5c82b4db1@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Aug 22, 2024 at 12:13:52AM +0300, Sergei Shtylyov wrote:
> On 8/20/24 6:04 AM, Michael Ellerman wrote:
> 
> > The overflow/underflow conditions in pata_macio_qc_prep() should never
> > happen. But if they do there's no need to kill the system entirely, a
> > WARN and failing the IO request should be sufficient and might allow the
> > system to keep running.
> 
>    WARN*() can kill your system with panic_on_warn -- Android is particularly
> fond of this kernel parameter but I guess it's not your case... :-)
>    Greg KH usually advices against using these macros. :-)

And in this case he is simply totally wrong.  The whole poing of WARN_ON
is to have a standardized way to assert conditions.



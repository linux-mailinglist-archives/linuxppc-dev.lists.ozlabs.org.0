Return-Path: <linuxppc-dev+bounces-153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA77955767
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 13:24:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WmGj65g36z2xfC;
	Sat, 17 Aug 2024 21:24:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wm4Dr2KC5z2x99
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2024 13:32:42 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2521D68AA6; Sat, 17 Aug 2024 05:32:36 +0200 (CEST)
Date: Sat, 17 Aug 2024 05:32:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Niklas Cassel <cassel@kernel.org>,
	=?iso-8859-1?Q?Kolbj=F8rn?= Barmen <linux-ppc@kolla.no>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	=?utf-8?B?Sm9uw6HFoQ==?= Vidra <vidra@ufal.mff.cuni.cz>,
	Christoph Hellwig <hch@lst.de>, linux@roeck-us.net
Subject: Re: Since 6.10 - kernel oops/panics on G4 macmini due to change in
 drivers/ata/pata_macio.c
Message-ID: <20240817033235.GA28774@lst.de>
References: <62d248bb-e97a-25d2-bcf2-9160c518cae5@kolla.no> <3b6441b8-06e6-45da-9e55-f92f2c86933e@ufal.mff.cuni.cz> <Zrstcei9WN9sRfdX@x1-carbon.wireless.wdc> <87sev81u3f.fsf@mail.lhotse> <Zrt028rSVT5hVPbU@ryzen.lan> <87jzgj1ejc.fsf@mail.lhotse> <Zry58qB80V80uS38@ryzen.lan> <87jzgg2fqg.fsf@mail.lhotse>
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
In-Reply-To: <87jzgg2fqg.fsf@mail.lhotse>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Aug 17, 2024 at 09:46:31AM +1000, Michael Ellerman wrote:
> Same behaviour on a kernel with PAGE_SIZE = 4KB.
> 
> I don't know why max_sectors_kb starts out with a different value on my
> system, but anyway the bug is lurking there, even if it doesn't trip by
> default in some configurations.

Various distributions use udev rules to increase it.



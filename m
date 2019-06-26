Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 051F256E6B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 18:11:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Yp1T2pFWzDqTT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 02:11:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=fail (mailfrom) smtp.mailfrom=animalcreek.com
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=animalcreek.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" (0-bit key;
 unprotected) header.d=animalcreek.com header.i=@animalcreek.com
 header.b="Rg7zOvfi"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="1DI51m1d"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YnzS3m9dzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 02:09:38 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5FE46159D;
 Wed, 26 Jun 2019 12:09:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 26 Jun 2019 12:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=mesmtp;
 bh=UP9Jtb98ATwN3hSuXszNgoQd5vNoaG1jrBI+gVsRe+o=; b=Rg7zOvfioVGQ
 bAU/QB7jkqq3sywB0OidJQfTUXkUVo02+sP6Fs9FaUGu2euTFXNw5TVVS76L1D+y
 RSk80oJlaSRXjODpWsDSKsVBYFKaHl6MKQZ/qR4mVlN2um9bGep1nzcPPgcfVhv2
 D+gH1d8OVHNfM8n2DhxPMN3lOY9tbVU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=UP9Jtb98ATwN3hSuXszNgoQd5vNoaG1jrBI+gVsRe
 +o=; b=1DI51m1dqlPROi0LYunyNniDnOUUdpwcCrHvUxwwjIB/Vb6BKSZK/X2GN
 K2EpjhcppZOu3UoCen+ySDMqftxM3igLzR3ZZIgW1KZDWqZJfkxyWmCVIyCDmHgP
 JZLgzZU9rHXAMIQz5kHWZPkuvS5LQt6JtF+VCUWT08bB9hafQC9tgdV7r8XM/3c1
 NJkoVMDN3epXGZyO+esZGI6jb7AdM2QSEYwjZ8HWUHAR3VvZDXXYJaU7wOj88xNu
 1rUH2bQYYeI9yWI3Xv7kK28rns5z+zOsMgiSpFK/1X7UK2J8yZN/Z6+DpQJ8Zy6a
 OfgLJVK9ZQhvDyTjQtbYmwgXyrk5A==
X-ME-Sender: <xms:vpgTXbO-LW4RNDxGD7f9wNUWyu34SKdHAR_iz80Er86svLrtiuCraA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjohgfsehtkeertddtreejnecuhfhrohhmpeforghr
 khcuifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecukf
 hppeeikedrvddrkeejrdelheenucfrrghrrghmpehmrghilhhfrhhomhepmhhgrhgvvghr
 segrnhhimhgrlhgtrhgvvghkrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:vpgTXcejQG_pJqDnTRZCZS63okZImP3YD6svvUH8Q1B__WViFQ3q5g>
 <xmx:vpgTXYSQCJhjfmgebXssCxu1nG0Tw3qaYXqCYHofgFe1ddnwumRBww>
 <xmx:vpgTXSds1ixUKfmqdhW0ly5FMSygZPcodcGFu0K61V2mmzw8aJmAiA>
 <xmx:v5gTXfFaYeZf_KBM2Z5DgejBifD9zi-qk7KBcVvDOVdihrzvfY6RPA>
Received: from blue.animalcreek.com (ip68-2-87-95.ph.ph.cox.net [68.2.87.95])
 by mail.messagingengine.com (Postfix) with ESMTPA id C7E6E8005C;
 Wed, 26 Jun 2019 12:09:33 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
 id 2FFDDA2233F; Wed, 26 Jun 2019 09:09:33 -0700 (MST)
Date: Wed, 26 Jun 2019 09:09:33 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: DMA coherency in drivers/tty/serial/mpsc.c
Message-ID: <20190626160933.GA28939@animalcreek.com>
References: <20190625122641.GA4421@lst.de>
 <20190625163722.GA18626@animalcreek.com>
 <20190626064837.GA24531@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190626064837.GA24531@lst.de>
Organization: Animal Creek Technologies, Inc.
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Mark Greer <mgreer@animalcreek.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>, linux-serial@vger.kernel.org,
 Dale Farnsworth <dale@farnsworth.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2019 at 08:48:37AM +0200, Christoph Hellwig wrote:
> On Tue, Jun 25, 2019 at 09:37:22AM -0700, Mark Greer wrote:
> > Yeah, the mpsc driver had lots of ugly cache related hacks because of
> > cache coherency bugs in the early version of the MV64x60 bridge chips
> > that it was embedded in.  That chip is pretty much dead now and I've
> > removed core support for it from the powerpc tree.  Removing the mpsc
> > driver is on my todo list but I've been busy and lazy.  So, to sum it
> > up, don't spend any more time worrying about it as it should be removed.
> > 
> > I'll post a patch to do that tonight and I'm sorry for any time you've
> > spent looking at it so far.
> 
> No problem.  And if future such broken chips show up we now have
> support for per-device DMA coherency settings and could actually
> handle it in a reaѕonably clean way.

Ah, good to know - thanks.

BTW, I just submitted a patch to remove the driver.

Mark
--

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A23C257D16
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 09:24:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZBHF6GlJzDqkK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 17:24:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZBFd6ZZbzDqWj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 17:23:15 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id DCFEF68B20; Thu, 27 Jun 2019 09:22:40 +0200 (CEST)
Date: Thu, 27 Jun 2019 09:22:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 3/4] powerpc/powernv: remove unused NPU DMA code
Message-ID: <20190627072240.GA9916@lst.de>
References: <20190625145239.2759-1-hch@lst.de>
 <20190625145239.2759-4-hch@lst.de>
 <7bde96e0-7bc5-d5fe-f151-52c29660633c@ozlabs.ru>
 <20190626074935.GA25452@lst.de>
 <027a5095-a22c-2799-8ff6-42d0bc4d2bc9@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <027a5095-a22c-2799-8ff6-42d0bc4d2bc9@ozlabs.ru>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2019 at 10:21:55AM +1000, Alexey Kardashevskiy wrote:
> > Which comment?  Last time I asked you complaint "it is still used in
> > exactly the same way as before" which you later clarified that you
> > have a hidden out of tree user somewhere, and you only objected to
> 
> It is not hidden, anyone can download and inspect that GPL driver.

For one no one has ever posted a link.  And second as mentioned
countless times it doesn't matter, it only matters if it is in mainline,
or as a special exception actively trying to go mainline.

> > the word "dead".  That has been fixed and there were no further
> > comments.
> 
> You still have it in the cover letter so at very least 3/4 is not a part
> of this patchset then.
> 
> And I still want to see a formal statement about out-of-tree drivers
> support/tolerance. If you manage to remove this code, I'll have to post
> a revert (again and again) but I would rather know the exact list of
> what we do and what we do not do about such drivers and if the list 1)
> exists 2) is reasonable then I could try to come up with a better
> solution or point others to the policy and push them to do the right
> thing. Right now it is just you pretending that the nVidia driver does
> not exist, this is not helping. Thanks,

We had that discussion at kernel summit and it was reported.  Anyway,
adding Greg, who usually has some pretty good prewritten letters for
this kind of thing.

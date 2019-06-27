Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F8D587B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 18:53:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZQvH6HYzzDqgZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 02:53:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="mZ148xhh"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZQsC1wDVzDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 02:51:26 +1000 (AEST)
Received: from localhost (unknown [89.205.136.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89D8C2054F;
 Thu, 27 Jun 2019 16:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561654283;
 bh=ZJeG6e/5ex7Oi3+NrkGCaYVu2coSPS31gk3u5jQWWjo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mZ148xhhRuY36EaSXlOq2p/UuE2/te/REcS9lHEb28ZfBZTo1mpl3owe357ai8X+g
 dMqgFdvIOf4atRjO1kkZ0Ze2AabPXt4HhkDiO1d16DWrBC6Md2kCSJOOd/tEoUzLqT
 LKgTrlyB/AduI6aU7BnoiU6rwCqmu2NvJCH7m6oQ=
Date: Fri, 28 Jun 2019 00:51:16 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 3/4] powerpc/powernv: remove unused NPU DMA code
Message-ID: <20190627165116.GA9855@kroah.com>
References: <20190625145239.2759-1-hch@lst.de>
 <20190625145239.2759-4-hch@lst.de>
 <7bde96e0-7bc5-d5fe-f151-52c29660633c@ozlabs.ru>
 <20190626074935.GA25452@lst.de>
 <027a5095-a22c-2799-8ff6-42d0bc4d2bc9@ozlabs.ru>
 <20190627072240.GA9916@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627072240.GA9916@lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2019 at 09:22:40AM +0200, Christoph Hellwig wrote:
> On Thu, Jun 27, 2019 at 10:21:55AM +1000, Alexey Kardashevskiy wrote:
> > > Which comment?  Last time I asked you complaint "it is still used in
> > > exactly the same way as before" which you later clarified that you
> > > have a hidden out of tree user somewhere, and you only objected to
> > 
> > It is not hidden, anyone can download and inspect that GPL driver.
> 
> For one no one has ever posted a link.  And second as mentioned
> countless times it doesn't matter, it only matters if it is in mainline,
> or as a special exception actively trying to go mainline.
> 
> > > the word "dead".  That has been fixed and there were no further
> > > comments.
> > 
> > You still have it in the cover letter so at very least 3/4 is not a part
> > of this patchset then.
> > 
> > And I still want to see a formal statement about out-of-tree drivers
> > support/tolerance. If you manage to remove this code, I'll have to post
> > a revert (again and again) but I would rather know the exact list of
> > what we do and what we do not do about such drivers and if the list 1)
> > exists 2) is reasonable then I could try to come up with a better
> > solution or point others to the policy and push them to do the right
> > thing. Right now it is just you pretending that the nVidia driver does
> > not exist, this is not helping. Thanks,
> 
> We had that discussion at kernel summit and it was reported.  Anyway,
> adding Greg, who usually has some pretty good prewritten letters for
> this kind of thing.

I used to have one but it's been so long since anyone tried to even
think about defending the removal of functions that are not used in the
kernel tree anymore, that I can't seem to find it anymore :)

Christoph is completely correct here, if it isn't in the tree, it
doesn't matter.  We have made this "formal" statement again and again
over the years, starting with the old "stable api nonsense" document
that is in the kernel tree itself.

And he is also correct in that we talked about this specific issue, in
detail, at the maintainers summit last year, see lwn.net for the details
if you somehow missed it then.

thanks,

greg k-h

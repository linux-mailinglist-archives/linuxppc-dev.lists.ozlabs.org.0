Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF385432901
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 23:22:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HY8w71Yctz3cBS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 08:22:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jkM+1QBL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gustavoars@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jkM+1QBL; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HY8vS3Zrqz2yV4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 08:21:40 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08D676113D;
 Mon, 18 Oct 2021 21:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634592097;
 bh=r+U+HRVQuA0YbQnhsffBIKTPjNzgnGyVqS2dVQNn2D0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jkM+1QBLNmmr2PR2zw2SC8iGjREGbYOVerrkSYv8jxLrqA9IIHJg+L/VcMTBqG8hh
 huAmTTF47wai2Ksr+eiVkQgaVJXGZASCP0F/JIkO4EM9DVuXLchxXbF41zo1naYbNx
 JXYUgmJ4QuUfYnGD1HBMdVuKulpF4MuJYhKj+SnFw6F5O7dycf75FOu5OcnxlFnQa6
 X6UGocjlHew9R39KPk3JbWDddBMFKJjbBmWHhC3MtkXTIaOFGvkPtDXgZtmY5vsV3D
 tdZyp1/wtkTwabinzQahybxs1JiXRYZCtYO/3jbIGJPAk5B/pbC/dw+sGQSlhMVzB0
 rj/96f25tNgvA==
Date: Mon, 18 Oct 2021 16:26:12 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH][next] powerpc/vas: Fix potential NULL pointer dereference
Message-ID: <20211018212612.GA1237121@embeddedor>
References: <20211015050345.GA1161918@embeddedor>
 <97c42e43-15b9-5db6-d460-dbb16f31954d@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97c42e43-15b9-5db6-d460-dbb16f31954d@linux.ibm.com>
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
Cc: Haren Myneni <haren@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 18, 2021 at 02:09:31PM -0700, Tyrel Datwyler wrote:
> On 10/14/21 10:03 PM, Gustavo A. R. Silva wrote:
> > (!ptr && !ptr->foo) strikes again. :)
> > 
> > The expression (!ptr && !ptr->foo) is bogus and in case ptr is NULL,
> > it leads to a NULL pointer dereference: ptr->foo.
> > 
> > Fix this by converting && to ||
> > 
> > This issue was detected with the help of Coccinelle, and audited and
> > fixed manually.
> > 
> > Fixes: 1a0d0d5ed5e3 ("powerpc/vas: Add platform specific user window operations")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Looking at the usage pattern it is obvious that if we determine !ptr attempting
> to also confirm !ptr->ops is going to blow up.
> 
> LGTM.
> 
> Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

Thanks, Tyrel.
--
Gustavo

> 
> > ---
> >  arch/powerpc/platforms/book3s/vas-api.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
> > index 30172e52e16b..4d82c92ddd52 100644
> > --- a/arch/powerpc/platforms/book3s/vas-api.c
> > +++ b/arch/powerpc/platforms/book3s/vas-api.c
> > @@ -303,7 +303,7 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
> >  		return -EINVAL;
> >  	}
> > 
> > -	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->open_win) {
> > +	if (!cp_inst->coproc->vops || !cp_inst->coproc->vops->open_win) {
> >  		pr_err("VAS API is not registered\n");
> >  		return -EACCES;
> >  	}
> > @@ -373,7 +373,7 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
> >  		return -EINVAL;
> >  	}
> > 
> > -	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->paste_addr) {
> > +	if (!cp_inst->coproc->vops || !cp_inst->coproc->vops->paste_addr) {
> >  		pr_err("%s(): VAS API is not registered\n", __func__);
> >  		return -EACCES;
> >  	}
> > 
> 

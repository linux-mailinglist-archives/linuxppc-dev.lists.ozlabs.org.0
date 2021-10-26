Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53E43B9B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 20:37:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf0td4dR4z2yZx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 05:37:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g30x3pZv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gustavoars@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g30x3pZv; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf0sz5nLXz2xCd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 05:37:11 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D25DF60E05;
 Tue, 26 Oct 2021 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635273428;
 bh=1xQXVhbF8/BGLuvjiPQZc83KtW2+s7akCS60PQNrPZg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g30x3pZvp/LbCs0Ax/nHYsd74I1JEAOKbTMArMvXnNkfibGEYWkLJSFx4Zytob6Bl
 F1iMT7y2fiD6zrj/XCf6jOAgGtDVvBg5gxOJcaZMoMO6MCAm4MmSWUh7cNAbG0hsWp
 ki9rEZgjxnq43vVD/BUU2qEJX3Evz4S9ttVDkFK5xVQsAiZq/r0lA/ptW4GANCPQmO
 raVqRcux30VB2ahlzI9+PnTXjazdX0SySkBbWjXHYc1MDw4zw2Xo5ABQvPpKr6Afoi
 koSXsza+Ospt210rf7g2WHLxvkljZOkaszX1Tkkr38o4AWaSI2FRkH0Wty5/q27pIJ
 iGjvwPiqXqKPQ==
Date: Tue, 26 Oct 2021 13:42:01 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH][next] powerpc/vas: Fix potential NULL pointer dereference
Message-ID: <20211026184201.GB1457721@embeddedor>
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

I think I'll take this in my tree.

Thanks, Tyrel.
--
Gustavo

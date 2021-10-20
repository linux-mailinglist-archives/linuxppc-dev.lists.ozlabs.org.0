Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2205435679
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 01:24:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZRXd0znnz305J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 10:24:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kVF6fvmt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gustavoars@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kVF6fvmt; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZRWx1jnKz2xKJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 10:24:13 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B2CD610A1;
 Wed, 20 Oct 2021 23:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634772250;
 bh=GoOxfVhzMaSH83/PPC4fKRkQJxI67w6NPcUG959R24Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kVF6fvmtL4Mu1Xj7uTGncdFr/ePyJYT/b6WZhUm5wUy+PGfRbO0ToTHqhEsLNpBFy
 28epgObVph/WB2G922TqXd++kxaJcPC8S9IRZtszlzlmkF4dMVtoDJuPaXz5iY63aL
 U2gVd6o9o4Cv2I/Z7VDw6KG8VVar5IaETUmz5ELQXbxMvR39grhgyPbWhSCCFtjmdy
 REOtw6Rwg/pCXc0FWjAb+WZ5Kr3z/dDWCeL5C82MylddzkcsUSrlaQel4o2youov6E
 55x2lsri162oQGFcL4Fm+WhNt4d86Fq3ihrMe8saqCQtEaE5Url2wNs8sBZtoVeLwv
 KqrRs9ePNTrPA==
Date: Wed, 20 Oct 2021 18:28:49 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] KVM: PPC: Replace zero-length array with flexible array
 member
Message-ID: <20211020232849.GA1315641@embeddedor>
References: <20210918142138.17709-1-len.baker@gmx.com>
 <bb4faf3a-9fe9-280b-cb4c-e4904b0b2a8f@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb4faf3a-9fe9-280b-cb4c-e4904b0b2a8f@embeddedor.com>
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, Len Baker <len.baker@gmx.com>,
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 20, 2021 at 07:05:07PM -0500, Gustavo A. R. Silva wrote:
> 
> 
> On 9/18/21 09:21, Len Baker wrote:
> > There is a regular need in the kernel to provide a way to declare having
> > a dynamically sized set of trailing elements in a structure. Kernel code
> > should always use "flexible array members" [1] for these cases. The
> > older style of one-element or zero-length arrays should no longer be
> > used[2].
> > 
> > Also, make use of the struct_size() helper in kzalloc().
> > 
> > [1] https://en.wikipedia.org/wiki/Flexible_array_member
> > [2] https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays
> > 
> > Signed-off-by: Len Baker <len.baker@gmx.com>
> 
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

I'm taking this in my -next tree.

Thanks
--
Gustavo

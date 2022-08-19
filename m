Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA567599A74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8K104DmBz3dwt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 21:15:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DhppuO0t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DhppuO0t;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8K0S0FN9z3cFJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 21:14:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 252BA61772;
	Fri, 19 Aug 2022 11:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3613CC433D6;
	Fri, 19 Aug 2022 11:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1660907683;
	bh=kDXswYVpUCYLT3UTIkFVumBaq4rqupxUuITGN/kJSOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhppuO0tmOnh2os/5LwxBu29Woali0ev9vHWguiB1aWmdck4cF0H1IbjIBO763iCx
	 HoU4jQFvQn666hO1lgnEnG43SMmSLh9HxeUYwBJZwz+VTIF7DS3QpMl2fugR40UDWs
	 NKFcioAuHWKdSbWNsfj/F6IlQ1J35FNqyfdVqE9A=
Date: Fri, 19 Aug 2022 13:14:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] [backport for 4.14] powerpc/ptdump: Fix display of RW
 pages on FSL_BOOK3E
Message-ID: <Yv9woV6S3VmwEibv@kroah.com>
References: <2cf5dabc5d295a1591055a042aa1b791214a2f47.1660639498.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cf5dabc5d295a1591055a042aa1b791214a2f47.1660639498.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 16, 2022 at 10:45:29AM +0200, Christophe Leroy wrote:
> [ Upstream commit dd8de84b57b02ba9c1fe530a6d916c0853f136bd ]
> 
> On FSL_BOOK3E, _PAGE_RW is defined with two bits, one for user and one
> for supervisor. As soon as one of the two bits is set, the page has
> to be display as RW. But the way it is implemented today requires both
> bits to be set in order to display it as RW.
> 
> Instead of display RW when _PAGE_RW bits are set and R otherwise,
> reverse the logic and display R when _PAGE_RW bits are all 0 and
> RW otherwise.
> 
> This change has no impact on other platforms as _PAGE_RW is a single
> bit on all of them.
> 
> Fixes: 8eb07b187000 ("powerpc/mm: Dump linux pagetables")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://lore.kernel.org/r/0c33b96317811edf691e81698aaee8fa45ec3449.1656427391.git.christophe.leroy@csgroup.eu
> ---
>  arch/powerpc/mm/dump_linuxpagetables.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 

Now queued up.

greg k-h

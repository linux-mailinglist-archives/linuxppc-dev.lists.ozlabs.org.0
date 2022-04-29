Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B619D5144EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 10:57:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqRFX4x3Sz3bf9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 18:57:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=e2nGX41q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=e2nGX41q; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqRDt6VsPz3bYS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 18:56:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBE5761F38;
 Fri, 29 Apr 2022 08:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43274C385A7;
 Fri, 29 Apr 2022 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651222601;
 bh=Rl+6+buQzIjMCGUJrzA1ThjzE/MbV4yb4ikXjQMyLpg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2nGX41qlHe0+nZjlgJXv7NGDMisYhBA9JscP3NqqsCfYFNQqreb7nJ5wzqmsnci6
 QNKl+l+lNaBpevib2n1qQa8Qqs+eKNnYgr2ErgCxpPMpTRe79FqVLamgjeZUupWtiY
 FKHVBlm3ZRt6/DbVRofx10+2NLj0Z//74uzWZ298=
Date: Fri, 29 Apr 2022 10:56:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4.19 0/2] Custom backports for powerpc SLB issues
Message-ID: <YmuoRmZHtJpx5pzT@kroah.com>
References: <20220428124150.375623-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428124150.375623-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 28, 2022 at 10:41:48PM +1000, Michael Ellerman wrote:
> Hi Greg,
> 
> Here are two custom backports to v4.19 for some powerpc issues we've discovered.
> Both were fixed upstream as part of a large non-backportable rewrite. Other stable
> kernel versions are not affected.
> 
> cheers
> 
> Michael Ellerman (1):
>   powerpc/64s: Unmerge EX_LR and EX_DAR
> 
> Nicholas Piggin (1):
>   powerpc/64/interrupt: Temporarily save PPR on stack to fix register
>     corruption due to SLB miss
> 
>  arch/powerpc/include/asm/exception-64s.h | 37 ++++++++++++++----------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> -- 
> 2.35.1
> 

Both now queued up, thanks.

greg k-h

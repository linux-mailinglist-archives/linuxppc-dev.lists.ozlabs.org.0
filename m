Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3541E7DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 07:19:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453jXx2T1KzDqRd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 15:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="JsOUXGgu"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453jWc6ndjzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 15:18:36 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34DCE2084E;
 Wed, 15 May 2019 05:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557897514;
 bh=r8mPtehsJJWWWKTFtaDkiAyjHz2G/dad5Gh3ld9AS+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JsOUXGgu2HtJPvwKm2McD8jqARO2uzseZN4bwGYeAFYiry/Hmt518DzHkhe35dpmI
 LrFTlzLy9PhK2LzprfytE+8TYvsnm+e/5ym0R9n/K49Fzp23PegM7eJWj9uKjIQS7G
 XWGnvzHEk3wYzC8q+bMM20vaaZJc/rn8lK2S46NE=
Date: Wed, 15 May 2019 07:18:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] powerpc/security: Fix build break
Message-ID: <20190515051830.GA18166@kroah.com>
References: <20190515045206.10610-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190515045206.10610-1-joel@jms.id.au>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2019 at 02:22:06PM +0930, Joel Stanley wrote:
> This fixes a build break introduced in with the recent round of CPU
> bug patches.
> 
>   arch/powerpc/kernel/security.c: In function ‘setup_barrier_nospec’:
>   arch/powerpc/kernel/security.c:59:21: error: implicit declaration of
>   function ‘cpu_mitigations_off’ [-Werror=implicit-function-declaration]
>     if (!no_nospec && !cpu_mitigations_off())
>                        ^~~~~~~~~~~~~~~~~~~
> 
> Fixes: 782e69efb3df ("powerpc/speculation: Support 'mitigations=' cmdline option")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> This should be applied to the 4.14 and 4.19 trees. There is no issue
> with 5.1. The commit message contains a fixes line for the commit in
> Linus tree.
> ---
>  arch/powerpc/kernel/security.c | 1 +
>  1 file changed, 1 insertion(+)

Isn't this just commit 42e2acde1237 ("powerpc/64s: Include cpu header")?

thanks,

greg k-h

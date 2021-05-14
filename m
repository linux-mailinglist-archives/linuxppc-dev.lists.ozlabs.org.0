Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A06963808C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 13:43:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhRW94sQ6z3brs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 21:43:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=z+k3QNWQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=z+k3QNWQ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhRVm3zJyz2ym6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 21:43:27 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19E6B61457;
 Fri, 14 May 2021 11:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620992604;
 bh=gIAAi7Doig6rhs/h2Olonq+YDcMN+whb09ZfjqXO6Cw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z+k3QNWQExai9fOKQaRZxECkKCK6tMUELvHKYCRFw4aESU7Tixrndvzt0Ah5fZfaE
 tN/WVMn76uhSE/xQY3gu1oGFO/LmVHa4yk8n5vYPlp1cMvbhOwYf8OLIU4M2w19skk
 +zTtT5VAqmR/TiQPStTzrdZ/nX4flTvQv1yXRJgQ=
Date: Fri, 14 May 2021 13:43:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] cxl: Fix an error message
Message-ID: <YJ5iWao53ELg4yTC@kroah.com>
References: <fa2b2c9c72335ab4c3d5e6a33415e7f020b1d51b.1620243401.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa2b2c9c72335ab4c3d5e6a33415e7f020b1d51b.1620243401.git.christophe.jaillet@wanadoo.fr>
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, arnd@arndb.de,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 imunsie@au1.ibm.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 05, 2021 at 09:38:49PM +0200, Christophe JAILLET wrote:
> 'rc' is known to be 0 here.
> Initialize 'rc' with the expected error code before using it.
> 
> While at it, avoid the affectation of 'rc' in a 'if' to make things more
> obvious and linux style.
> 
> Fixes: f204e0b8ce ("cxl: Driver code for powernv PCIe based cards for userspace access")

You need a full 12 digits for the SHA1, otherwise our scripts complain
about it :(

I'll fix it up here, but please fix your tools.

thanks,

greg k-h

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E7334CF56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 13:49:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F89pV2gVjz30Gv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 22:49:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UWtdSj5j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=UWtdSj5j; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F89p64DBtz2yZ0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 22:48:45 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7B6B6195B;
 Mon, 29 Mar 2021 11:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1617018522;
 bh=7bOjh2VBV6ORFq+hCMAwT1T3XPaqoe4QhuhPDGs1AAs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=UWtdSj5jytB4yinCTIl3uubMK3m15sgaJtDCKH4UDmRTzMxypBr8y8V81cmTfFm0M
 srtX9TghLWGx+Ep76clREiLK59I/9LFZrkw/NAqR/q5/Bwjvxm3c5aV4hyPSPoQTJo
 xfqlBmY7r+HQbjNRQKB/IDAmJg0CoWggrzQOzLDE=
Date: Mon, 29 Mar 2021 13:48:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/30] DMA: Mundane typo fixes
Message-ID: <YGG+l1EfRuWp0J3A@kroah.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
 <20210329052910.GB26495@lst.de> <YGFrvwX8QngvwPbA@Gentoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGFrvwX8QngvwPbA@Gentoo>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 29, 2021 at 11:25:11AM +0530, Bhaskar Chowdhury wrote:
> On 07:29 Mon 29 Mar 2021, Christoph Hellwig wrote:
> > I really don't think these typo patchbomb are that useful.  I'm all
> > for fixing typos when working with a subsystem, but I'm not sure these
> > patchbombs help anything.
> > 
> I am sure you are holding the wrong end of the wand and grossly failing to
> understand.

Please stop statements like this, it is not helpful and is doing nothing
but ensure that your patches will not be looked at in the future.

> Anyway, I hope I give a heads up ...find "your way" to fix those damn
> thing...it's glaring....

There is no requirement that anyone accept patches that are sent to
them.  When you complain when receiving comments on them, that
shows you do not wish to work with others.

Sorry, but you are now on my local blacklist for a while, and I
encourage other maintainers to just ignore these patches as well.

thanks,

greg k-h

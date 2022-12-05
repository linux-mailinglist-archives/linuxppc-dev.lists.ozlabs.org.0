Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C020E642C6B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:01:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQpFr49cWz3bm9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:01:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EXkPiPH9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EXkPiPH9;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQpDt1H1mz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 03:01:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BC54BB81144;
	Mon,  5 Dec 2022 16:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D945AC433B5;
	Mon,  5 Dec 2022 16:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670256055;
	bh=trNrKrfKjsfA/iJHoM4RlcQMgCcsX15/LCiL4T/xuJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXkPiPH9jpu2QDhpC1k592OE6zoYsvZ6Cm6TtkRBZj9flj8DPe/+/ck94MscE/Hy+
	 PVn+ynbqHg6LhzriIAOKH+7f1fPldEuUHPztcK+v0tQmwdicxIaCw7If8OtrPmpjh+
	 OYAzWhpAg9ucHwpcZ/6qG8GRvR0WojmPy76I8FYg=
Date: Mon, 5 Dec 2022 17:00:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dawei Li <set_pte_at@outlook.com>
Subject: Re: [PATCH 0/6] Make remove() of any bus based driver void returned
Message-ID: <Y44VtN/rmjIU6sDC@kroah.com>
References: <TYCP286MB23234ABCCF40E3FC42FD09A4CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB23234ABCCF40E3FC42FD09A4CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
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
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org, linux-hyperv@vger.kernel.org, haiyangz@microsoft.com, linuxppc-dev@lists.ozlabs.org, decui@microsoft.com, alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com, robert.jarzmik@free.fr, roger.pau@citrix.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 05, 2022 at 11:36:38PM +0800, Dawei Li wrote:
> For bus-based driver, device removal is implemented as:
> device_remove() => bus->remove() => driver->remove()
> 
> Driver core needs no feedback from bus driver about the result of
> remove callback. In which case, commit fc7a6209d571 ("bus: Make
> remove callback return void") forces bus_type::remove be void-returned.
> 
> Now we have the situation that both 1st & 2nd part of calling chain
> are void returned, so it does not make much sense for the last one
> (driver->remove) to return non-void to its caller.
> 
> So the basic idea behind this patchset is making remove() callback of
> any bus-based driver to be void returned.
> 
> This patchset includes changes for drivers below:
> 1. hyperv
> 2. macio
> 3. apr
> 4. xen
> 5. ac87
> 6. soundbus

Then that should be 6 different patchsets going to 6 different
subsystems.  No need to make this seems like a unified set of patches at
all.

> Q: Why not platform drivers?
> A: Too many of them.(maybe 4K+)

That will have to be done eventually, right?

thanks,

greg k-h

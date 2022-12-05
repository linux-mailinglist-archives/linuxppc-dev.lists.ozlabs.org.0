Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD3642C70
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:03:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQpHW30tTz3bjx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:03:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=o8sllyzq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=o8sllyzq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQpGc3JBzz30Qx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 03:02:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 822B661188;
	Mon,  5 Dec 2022 16:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59369C433D6;
	Mon,  5 Dec 2022 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670256148;
	bh=fUCRk5umyyi3F3OQ84Ugjf+XIjegvMCAtqFGwoNUqqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8sllyzqWv2DzA+KUc9+w2ABl/BVpS0Lah/qIWLxT+W/phFpqpqdbXN1oOWepc2y6
	 1CM6I2RlaNDAfcFYCSOSYzTwNVhYoEmdiIQoSi0gEVkPf+sgz5otQ4QNZFNjb4x0YQ
	 NNzgKtGndHDakAGEC+w4etUgbRYKrSRN7qSWH+MA=
Date: Mon, 5 Dec 2022 17:02:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dawei Li <set_pte_at@outlook.com>
Subject: Re: [PATCH 4/6] xen: make remove callback of xen driver void returned
Message-ID: <Y44WEkKh9tdNjMlW@kroah.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB232333CB411691110A8B9D96CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB232333CB411691110A8B9D96CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
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

On Mon, Dec 05, 2022 at 11:36:42PM +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.

Please wrap changelogs at 72 columns.

And this should go through the maintainers of the Xen bus code, not me,
right?

And why wasn't this attached to the 0/6 email properly?  Did you use
different tools?  If so, our tools can't find the link to keep them in
sync either :(

thanks,

greg k-h

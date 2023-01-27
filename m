Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3025767E553
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 13:34:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3H8Y0jSbz3fJl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 23:34:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AOIO/dmB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AOIO/dmB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3H7c35KGz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 23:34:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE15C61B94;
	Fri, 27 Jan 2023 12:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3CDC433D2;
	Fri, 27 Jan 2023 12:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674822839;
	bh=TS2+CpKa2cp61H4L2xyxqqO1Xa+9EPd/tgoYGYbo2PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AOIO/dmBppqhBtGmbssqspC6gF08zWXRP3blx3PpWb0QrYlXVWOIZA8xnJc3C+eWu
	 5kyaDq09s3nJoxaQTN1VT1ciyn4JxcwsT9/Jl/kmN/S2+jN0xhoMHwTeCOCpIUG7wd
	 bvY4O/P0xk2eSogKpMu0lC1ZQFj2jr5pjAoJdOX4=
Date: Fri, 27 Jan 2023 13:33:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 01/16] of: device: make of_device_uevent_modalias()
 take a const device *
Message-ID: <Y9PEtP7oLjRJTxFM@kroah.com>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-2-gregkh@linuxfoundation.org>
 <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Liang He <windhl@126.com>, Zou Wei <zou_wei@huawei.com>, Samuel Holland <samuel@sholland.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe@baylibre.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Lyude Paul <lyude@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Nicholas Piggin <npiggin@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 08:54:04AM -0600, Rob Herring wrote:
> On Wed, Jan 11, 2023 at 5:30 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > of_device_uevent_modalias() does not modify the device pointer passed to
> > it, so mark it constant.  In order to properly do this, a number of
> > busses need to have a modalias function added as they were attempting to
> > just point to of_device_uevent_modalias instead of their bus-specific
> > modalias function.  This is fine except if the prototype for a bus and
> > device type modalias function diverges and then problems could happen.  To
> > prevent all of that, just wrap the call to of_device_uevent_modalias()
> > directly for each bus and device type individually.
> 
> Why not just put the wrapper function in the DT code instead of making
> 4 copies of it?

Ok, I looked at doing this today, but in the end, making "4" copies of
this is simpler overall.  To do it your way would require a "const"
version of the function be added to the core, and then convert these 4
busses to use that, and then when the real function is converted to be
const, move all of these functions back over to use that again.

Lots of churn, and then in the end, we still have the mismatch of a
the same function callback being used in two different types of
callbacks (one a bus, one a class).  This way we separate them to make
things much more obvious and self-contained.

So I'll keep this as-is for now, thanks.

greg k-h

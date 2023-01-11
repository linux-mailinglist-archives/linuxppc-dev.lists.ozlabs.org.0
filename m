Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB3E665E81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 15:55:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsW1r18yBz3cFH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 01:55:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KPh/G+50;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KPh/G+50;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsW0t59QYz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 01:54:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B599F61D52
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 14:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6260AC433A4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673448857;
	bh=5991q1wXtvebgUykJ5NYVRTE1uZrMxXzr1nAKepdlS8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KPh/G+50T7UA6MM56f8kwkC7JRGti8dM8QkU7Fxa5slwTvHjNEgCot25mpm4QZ7BP
	 ZBiebJftwP7lOO7l+7g9JUlFg7H37CsriodR+cmKmP3WA8anAwD0dF+LYaaRDO26p1
	 OnLNrFsdAaguSc26UyRsKv6n5rvjOdI9h/kQDs7+Tkw5bjqa5w+wpiwhCnOP90YEUe
	 FkKBJ74jTS+659FEb3pPjJ1FoRZki0Njj420eOTO+i2/E/Q+ID9LNtC2t/d0NzBOBx
	 LU9qQQBY30RDoh7gKDyBIh6Ske1YYN3CZHHhjPZA0B0j59JTFQKeNyNZvgh4yzCXPO
	 D6vi0GpD34NYg==
Received: by mail-vk1-f180.google.com with SMTP id t2so7313785vkk.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 06:54:17 -0800 (PST)
X-Gm-Message-State: AFqh2kookWbBx4li62nyIMbJdsR7paaXelNLiXHdVkPrPDkJ2YMZASC8
	IHf5d5Miar3k6hABLsZZL8YZo1nk5yx2P/VelA==
X-Google-Smtp-Source: AMrXdXuLjGWkrJgzvCsRL34zMGz/o9XODdn1icG/0kwllXKQUYcQoLyaKOC+UHWHVBhznJfC3GM3r3lDlYFHXzS35BM=
X-Received: by 2002:a1f:1e50:0:b0:3c1:1c3b:c4d9 with SMTP id
 e77-20020a1f1e50000000b003c11c3bc4d9mr9659628vke.19.1673448856184; Wed, 11
 Jan 2023 06:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20230111113018.459199-1-gregkh@linuxfoundation.org> <20230111113018.459199-2-gregkh@linuxfoundation.org>
In-Reply-To: <20230111113018.459199-2-gregkh@linuxfoundation.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 11 Jan 2023 08:54:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
Message-ID: <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] of: device: make of_device_uevent_modalias()
 take a const device *
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Jan 11, 2023 at 5:30 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> of_device_uevent_modalias() does not modify the device pointer passed to
> it, so mark it constant.  In order to properly do this, a number of
> busses need to have a modalias function added as they were attempting to
> just point to of_device_uevent_modalias instead of their bus-specific
> modalias function.  This is fine except if the prototype for a bus and
> device type modalias function diverges and then problems could happen.  To
> prevent all of that, just wrap the call to of_device_uevent_modalias()
> directly for each bus and device type individually.

Why not just put the wrapper function in the DT code instead of making
4 copies of it?

Rob

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A8F673D4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 16:19:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyR9r5v5vz3fGb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 02:19:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MQJbriCT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MQJbriCT;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyR8x6qmcz3c7h
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 02:18:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C5A3AB8253A
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 15:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB48C433EF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 15:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674141501;
	bh=JcHAprxViTW27LiN8vECaU2CDGOIsbYEXbyr3dIH3Pg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MQJbriCTVVBLobWOhIwXqh595aJQQN0hw412H4Da3v44pBPrIKIGK6Aws+uGa5R+d
	 LyHGdwE3FIHfEOncXp/VSo9THXfVa6ycdf0/MoEJFrdUsH0p4AliCE8BklwoPcNIj7
	 VnL03ATDnyXBGwICKebR7m3f+JRB+BHhSR6UloYVAv7r9tJilqZOuHwj0vX07jZRcx
	 glOWzBBMQpztIXqYLEC1ONxR+nEV1JabYcQhovw6y3bB31OHQEb63GSxMP/Cu+wMBK
	 YKIc9AmKnu58V6UOL7rKZ2rFM1oT9PmuGGYb1YdDLvWvD694jyjNa1r4+5rhRKxa6C
	 IPJ9535BJ65eg==
Received: by mail-vs1-f52.google.com with SMTP id d66so2447611vsd.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 07:18:21 -0800 (PST)
X-Gm-Message-State: AFqh2konZegtD+aVSFYQyc3x2Ms0FByIVLie4arbkwZC0iRNbIXS1UGF
	TRyEiHl8LRMt/iqIrM2Gza0NofcR6PpIY2V+ng==
X-Google-Smtp-Source: AMrXdXvkUacgq+O0G+DNQxSt4Q01vk5Rv0h4bouueIFI45ImsXgVxNixuhePotF+178agY5GuSDYnJJrey3NDEoWHXs=
X-Received: by 2002:a67:eb86:0:b0:3b1:4b76:5b44 with SMTP id
 e6-20020a67eb86000000b003b14b765b44mr1479061vso.53.1674141500420; Thu, 19 Jan
 2023 07:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20230118215045.5551-1-msuchanek@suse.de> <20230119095323.4659-1-msuchanek@suse.de>
In-Reply-To: <20230119095323.4659-1-msuchanek@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 19 Jan 2023 09:18:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL-0Mi_QgNnZS4UNheKhOUx8uYZWG58EK7kRGFk7QW0iA@mail.gmail.com>
Message-ID: <CAL_JsqL-0Mi_QgNnZS4UNheKhOUx8uYZWG58EK7kRGFk7QW0iA@mail.gmail.com>
Subject: Re: [PATCH v2] of: Fix of platform build on powerpc due to bad of
 disaply code
To: Michal Suchanek <msuchanek@suse.de>
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
Cc: "Erhard F." <erhard_f@mailbox.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, open list <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 19, 2023 at 3:53 AM Michal Suchanek <msuchanek@suse.de> wrote:
>
> The commit 2d681d6a23a1 ("of: Make of framebuffer devices unique")
> breaks build because of wrong argument to snprintf. That certainly
> avoids the runtime error but is not the intended outcome.
>
> Also use standard device name format of-display.N for all created
> devices.
>
> Fixes: 2d681d6a23a1 ("of: Make of framebuffer devices unique")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v2: Update the device name format
> ---
>  drivers/of/platform.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

As this is the only fix I have queued, if you respin, send the
original fix with fixes squashed.

Rob

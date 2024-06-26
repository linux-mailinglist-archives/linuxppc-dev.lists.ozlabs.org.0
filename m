Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 821E9917A5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 10:01:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ag8ok4Yf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8Dg26nxdz3cXK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 18:01:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ag8ok4Yf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8DfL03Fyz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 18:00:54 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso76152061fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 01:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719388846; x=1719993646; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=whiJiQULxxjVU5JYMGY4dR9TuAgnrWcS7amyjh3Lhhk=;
        b=ag8ok4YfDavjQMlNmKRTS+sBpQ/qrkTH+eO5UIlYsfM2bnM8w+A5x7XHPTsVDVeAGh
         H5QDSY7QOXapD0c88dSze7PQwDhGXhCO063+L0+aPeXlyNpOw48KpFeAiQYbtpoUbSEl
         JeubkqZs09e3tm/dUAn21wsSX4fv0f1x8HJjbX+BP+HSZV094dGqMe9mggHQKCBv1g/E
         BvC0kbCM/T/O6aDUiwe1qNDoVpGd26M2S4btk4TUVSFhfRpMonv5lTStYa4mA4uplnnV
         W0wKmjNg5joLRex27A6tT5jAnHxl2Fb1NxrrEwjQ5FBHE1u14wpdogNoVvklhT1BhPXD
         pwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719388846; x=1719993646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whiJiQULxxjVU5JYMGY4dR9TuAgnrWcS7amyjh3Lhhk=;
        b=cajtJRqbm1lpjd7QPUxy50zc806tuZqUQ0uTHxszqFlA0i0LqFhbbRid6EYU5s56D0
         5a4euwDI1Dj/xLTkVyJ7uG6Ubw/gQly5WCx/sVnx2yhcIJ5k+JFs5W787FI2Y1sP6f6a
         XzTRkLz3pETOIZ3JkI9h8hjuoTp7//hYU3HYz6DX1lTWfY0sxc0llJ4TsTBWqXBWeT0r
         K0Jn3u0GQlBOzO+HVzrykvAHTk/uWUspQdEmL7iUgo21QhPvnWJwjsGdnOdDksa6yhmY
         zBsi6ysLvuSerUiyCH31xy6/uE8ODl2xUglg92bR6/yzCqjEIlwGY/3A1Hnw+IWL8wWg
         5jxA==
X-Forwarded-Encrypted: i=1; AJvYcCXnHoetOfbq60dMgi3aPpKIpo7ULYea9+xVgyaI1IEmnMlMFzI5PE2wnNS57NiIcS/Cr8MfLO+oO7ISXPatPEUTslZnYNRUmdqLJm/+xw==
X-Gm-Message-State: AOJu0YwYB6hmqEoR9hAuJ7eU3EiH7yyjGy4EK5+haIx+OFBZcChwIxw6
	/vzMuMCSapC0A/2j8VKhQsQAvymenyecZ6RDmU1Trhq5dzvXrx0R5mTPa5Ld2U0=
X-Google-Smtp-Source: AGHT+IFNePKBHG9JpceEuNMrhp5ms+q4nwziDYVudYAAE2EIYWBHCuZo7vzBBRTi5aESxDL6rd8szA==
X-Received: by 2002:a2e:3a13:0:b0:2ec:5019:bec3 with SMTP id 38308e7fff4ca-2ec593e0cd9mr61741411fa.21.1719388846249;
        Wed, 26 Jun 2024 01:00:46 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70676a2113csm6032019b3a.214.2024.06.26.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 01:00:45 -0700 (PDT)
Date: Wed, 26 Jun 2024 10:00:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
Message-ID: <ZnvKcnC9ruaIHYij@pathway.suse.cz>
References: <20240625123954.211184-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625123954.211184-1-jfalempe@redhat.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Wei Liu <wei.liu@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Dexuan Cui <decui@microsoft.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>, John Ogness <john.ogness@linutronix.de>, Jani Nikula <jani.nikula@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2024-06-25 14:39:29, Jocelyn Falempe wrote:
> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> callback.
> This patch adds a new parameter "const char *desc" to the kmsg_dumper
> dump() callback, and update all drivers that are using it.
> 
> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> function and a macro for backward compatibility.
> 
> I've written this for drm_panic, but it can be useful for other
> kmsg_dumper.
> It allows to see the panic reason, like "sysrq triggered crash"
> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  arch/powerpc/kernel/nvram_64.c             |  3 ++-
>  arch/powerpc/platforms/powernv/opal-kmsg.c |  3 ++-
>  drivers/gpu/drm/drm_panic.c                |  3 ++-
>  drivers/hv/hv_common.c                     |  3 ++-
>  drivers/mtd/mtdoops.c                      |  3 ++-
>  fs/pstore/platform.c                       |  3 ++-
>  include/linux/kmsg_dump.h                  | 13 ++++++++++---
>  kernel/panic.c                             |  2 +-
>  kernel/printk/printk.c                     |  8 +++++---
>  9 files changed, 28 insertions(+), 13 deletions(-)

The parameter is added into all dumpers. I guess that it would be
used only drm_panic() because it is graphics and might be "fancy".
The others simply dump the log buffer and the reason is in
the dumped log as well.

Anyway, the passed buffer is static. Alternative solution would
be to make it global and export it like, for example, panic_cpu.

Best Regards,
Petr

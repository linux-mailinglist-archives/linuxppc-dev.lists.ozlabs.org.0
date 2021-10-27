Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 160AE43D19F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 21:26:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfdwZ73c0z3bXv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 06:26:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PxUBtFES;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=PxUBtFES; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfdvq5H2kz2xDv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 06:25:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=g0dH9lUH9vPuYQ5RBQpLLtCKZuNR2X5ACKtS00x71Kw=; b=PxUBtFESwlvjxxr6Dimbwj55Tl
 eW5mYYUtBZSQwqGOGj647EFkxq6N6Znmn7EJYhiMZd2ZgrOngPZJkot34TISXBQbg4OK0I5sf66VN
 LABs5hSzkQddb7+0GC1ZYeytLjXzCf45XXjkePzy0HEeO8ce0X3yZob7Z8uKfSGoowKKTMLhiFAQJ
 gwNmPL9VIJIOZ2sNP06QvlTJywZOd+CUGxgEB6o8CAe9aSQlHwo57Vba6AMhUCJk9v7cjlT8x545C
 7BuNJyH/0fCMqkEk+fkIrymdMpf6ZOPiGZ8P7Nd+iLGltiWJ9hyV0CcOBSnHowTDGLUliTjlpqQDA
 y0jXwaoA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfoYX-005url-4B; Wed, 27 Oct 2021 19:25:49 +0000
Subject: Re: [PATCH 2/3] fbdev: rework backlight dependencies
To: Arnd Bergmann <arnd@kernel.org>, dri-devel@lists.freedesktop.org
References: <20211027132732.3993279-1-arnd@kernel.org>
 <20211027132732.3993279-2-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e19f3eeb-e1c4-ff0e-cf97-f98bd420f842@infradead.org>
Date: Wed, 27 Oct 2021 12:25:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027132732.3993279-2-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Jens Frederich <jfrederich@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-staging@lists.linux.dev, Lars Poeschel <poeschel@lemonage.de>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 linuxppc-dev@lists.ozlabs.org, Jon Nettleton <jon.nettleton@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/27/21 6:27 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Rather than having CONFIG_FB_BACKLIGHT select CONFIG_BACKLIGHT_CLASS_DEVICE,
> make any driver that needs it have a dependency on the class device
> being available, to prevent circular dependencies.
> 
> This is the same way that the backlight is already treated for the DRM
> subsystem.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/auxdisplay/Kconfig        |  1 +
>   drivers/macintosh/Kconfig         |  1 +
>   drivers/staging/fbtft/Kconfig     |  1 +
>   drivers/staging/olpc_dcon/Kconfig |  2 +-
>   drivers/video/fbdev/Kconfig       | 14 +++++++++++---
>   5 files changed, 15 insertions(+), 4 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infraded.org>

Thanks.

-- 
~Randy

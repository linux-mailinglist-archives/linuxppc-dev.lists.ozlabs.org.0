Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4457684C5AA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 08:32:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AP/KQB0c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVBfQ1BYVz3cDR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 18:32:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AP/KQB0c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVBdc0gTNz2yVL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 18:32:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VBy0lm1YU3coKSkFq55oL6SDo4AuSJkW2B09HFeXe1s=; b=AP/KQB0cUwVhwXyVG15RN0C/OC
	dlgge4Clq7o0kmod9h+xTi2Zh0xUzGi0p9bq+ziIilAVlR0Y50IY/zLHc1hoU+6Jzg6u4VcFOqD2L
	ExB8AjF4IDLH7TLYUl7Lre2/Dg6r3zwzScGCKz50hFBMRhfOMFtjo9vQOba+Tn7QsS9ycES8sqJep
	K9gHzc2OQ5c1I/1h33Tk8h/Itk4kGxhUO4q8XeV2KWxvETbUdRJiRbGENaGGrWPzGQyAgwr8+BWhM
	ngpd/FcK9kAAZWKmi3MfNioghK5cY1BhETIz7l98MP0d86CmQi+jAaW42qagmIm1tvsGn68fZSRl9
	ZfZgc/Sw==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.6])
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcPD-0000000Cs4G-352s;
	Wed, 07 Feb 2024 07:31:40 +0000
Message-ID: <dcca34fc-18b9-471f-82ed-3d455587ad8d@infradead.org>
Date: Wed, 7 Feb 2024 16:31:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/ps3: select VIDEO to provide cmdline functions
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20240207033744.13028-1-rdunlap@infradead.org>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20240207033744.13028-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2/7/24 12:37, Randy Dunlap wrote:
> When VIDEO is not set, there is a build error. Fix that by selecting
> VIDEO for PS3_PS3AV.
> 
> ERROR: modpost: ".video_get_options" [drivers/ps3/ps3av_mod.ko] undefined!
> 
> Fixes: dae7fbf43fd0 ("driver/ps3: Include <video/cmdline.h> for mode parsing")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Geoff Levand <geoff@infradead.org>
> ---
>  arch/powerpc/platforms/ps3/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff -- a/arch/powerpc/platforms/ps3/Kconfig b/arch/powerpc/platforms/ps3/Kconfig
> --- a/arch/powerpc/platforms/ps3/Kconfig
> +++ b/arch/powerpc/platforms/ps3/Kconfig
> @@ -67,6 +67,7 @@ config PS3_VUART
>  config PS3_PS3AV
>  	depends on PPC_PS3
>  	tristate "PS3 AV settings driver" if PS3_ADVANCED
> +	select VIDEO
>  	select PS3_VUART
>  	default y
>  	help

Seems good.

Acked-by: Geoff Levand <geoff@infradead.org>



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27094874C70
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 11:33:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qg/46i44;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr5Hr6x6qz3vY0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:33:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qg/46i44;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr5H52GRvz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 21:33:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709807585;
	bh=wMkf3YBzzlJjow/0vVDRQvuksnXHfscP5DgovGq9Jug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qg/46i44H7pLCx54yhzkQgWVg4qZBTTKQD/Q8Bx1IRr8kgzzhEugpAN1Y2OEGOkGa
	 oQOAWA19qY0L/SK4mQ00DydQh7P4PNpcK3IMibi3IeUjnyKgdicvq1f+/ZxQDmBuS/
	 LoGul/mSORMBJrLlhh3VqPkSPQ3tnsgZ+gH+lYI900OncOg8nfTmLTTggZlnfcpxCa
	 j5tTTxmPyzavMUc3zNNuiVVFdCM8i4cgRVATCxL7hNgvC01y1VnnbmkIgw2ATnYMes
	 W45h2k28FZndeHFogXTQFJYwTYK9CRw3VDuYH39GZmpy0vNy2jFm33252OVfCS5SN2
	 Vg/T4X/gy3Hww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tr5H31vRTz4wbh;
	Thu,  7 Mar 2024 21:33:02 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@intel.com,
 naresh.kamboju@linaro.org, deller@gmx.de, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH v3 3/3] arch/powerpc: Remove <linux/fb.h> from backlight
 code
In-Reply-To: <20240306122935.10626-4-tzimmermann@suse.de>
References: <20240306122935.10626-1-tzimmermann@suse.de>
 <20240306122935.10626-4-tzimmermann@suse.de>
Date: Thu, 07 Mar 2024 21:33:00 +1100
Message-ID: <87msranxgj.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:
> Replace <linux/fb.h> with a forward declaration in <asm/backlight.h> to
> resolve an unnecessary dependency. Remove pmac_backlight_curve_lookup()
> and struct fb_info from source and header files. The function and the
> framebuffer struct are unused. No functional changes.
>
> v3:
> 	* Add Fixes tag (Christophe)
> 	* fix typos in commit message (Jani)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: d565dd3b0824 ("[PATCH] powerpc: More via-pmu backlight fixes")
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  arch/powerpc/include/asm/backlight.h        |  5 ++--
>  arch/powerpc/platforms/powermac/backlight.c | 26 ---------------------
>  2 files changed, 2 insertions(+), 29 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

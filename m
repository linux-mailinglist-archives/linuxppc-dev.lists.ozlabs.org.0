Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9B74251FA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 13:28:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ8GY35j8z306M
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 22:28:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DOGfBEHe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ8Fs586qz2yfZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 22:28:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DOGfBEHe; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQ8Fp4Lgmz4xR9;
 Thu,  7 Oct 2021 22:28:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633606095;
 bh=6XmEiUcJBUQ8ZFQRxDdulMZQn/HEizswWC5HCbgLKv4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DOGfBEHeWO47bjBBHSHsqxFr8+O8sec9YHMOV06w07chkyLOXFhiy33LfNn5VlWDC
 cKjYQVSHWpXovo4+4sITrz7gih9V9V4AXN2Wcdazpm+o5eAgii7U43m1xogcjaQacD
 qjhiWYCHziZAWNYDXzUAGSREejHv2cc/u5ySDu+uRZC81Uxd2+WmbuUTmnYW0Po+TB
 Sf5ivALvgxG2JTs/QmsZ6tIHV9JvFkIFw91QNK2C7Fl7c8uzlqWsCWXqGN8kCJuve4
 jwITcpfEw9wlw82uh2lulpy0eFqLA76uFzeA8+J4vJxxk8fxUBIynWjzD9Opa3CuYE
 mEmRv4WpkTXKw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] video: fbdev: use memset_io() instead of memset()
In-Reply-To: <884a54f1e5cb774c1d9b4db780209bee5d4f6718.1631712563.git.christophe.leroy@csgroup.eu>
References: <884a54f1e5cb774c1d9b4db780209bee5d4f6718.1631712563.git.christophe.leroy@csgroup.eu>
Date: Thu, 07 Oct 2021 22:28:10 +1100
Message-ID: <87lf35nkfp.fsf@mpe.ellerman.id.au>
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
Cc: linux-fbdev@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>,
 Stan Johnson <userm57@yahoo.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> While investigating a lockup at startup on Powerbook 3400C, it was
> identified that the fbdev driver generates alignment exception at
> startup:
...
>
> Use fb_memset() instead of memset(). fb_memset() is defined as
> memset_io() for powerpc.
>
> Fixes: 8c8709334cec ("[PATCH] ppc32: Remove CONFIG_PMAC_PBOOK")
> Reported-by: Stan Johnson <userm57@yahoo.com>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/video/fbdev/chipsfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks like drivers/video/fbdev is orphaned, so I'll pick this up via
powerpc.

cheers

Return-Path: <linuxppc-dev+bounces-1695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C20B698A9A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 18:24:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHRGr3s3nz2yyR;
	Tue,  1 Oct 2024 02:24:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::224"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727713459;
	cv=none; b=Pqb9I3/7kah2jsL4KqT9wHX1rMNkT68hY+LT84M8XK25GypLXo6f93pbjFmHcwq7TV7OsTw48H0fldyjoFgH7AVs9TYe7cWAJJlHn2kEZirCDr6oPaPHQaZ7QNYp4wJRnEh977A2KDoo61MPWmBhlRCxurAhclFnCIS+lGuA5bImHLsdgJIpuQjePdDtXFadPlT8/GQRVS8VK5U5iZJz1a833pjWm7sd1sAs1isZqKJtGARhUAptiNl1870xF0nnIH0EqOf3tDNjR6ZfMIJB/WgQyKkrp4FRDe9KLikl67hQabtls9WaAZ82o50gwngl0hbkEp6ubeiTpaA9ULLzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727713459; c=relaxed/relaxed;
	bh=Ak/OpaHZla/c5uUaOqdAyJ559kbBrFZymGfhIpH/FxU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GMpYGQnpYK/XSDhcAMDOflKC+2PI+/313+Nbta5IClnfJtb8Ek+du3H4OAlanpjoixIwv7dQI/TSGz6YU2HAj5oFQrG0LQJR3RuhxkYeHBLFkIfbdnCXQxEl4cT7Y2XAA7aWmS0OC2cKfVm6ydGdwJJFYxXkTgdxBMnkpmBpSHWFzDMPsulo8B5WiTzLTdyGSYkdJU7oYkhF6Vy3KQUihmw5pnwmPxNiFu5DRNf2ltbgJ511HBlRkWyxKYfIeBYijU/KQc2kWyu/xHMQYiW37jMmSGCG2IWepMo1ZogZ51zga4Be/YVSETvgWliCfur0M1Db79Ym90j8RDSBvvsrJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=N5riAqBg; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=N5riAqBg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHRGp4mnQz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 02:24:15 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD5FEE0004;
	Mon, 30 Sep 2024 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727713443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ak/OpaHZla/c5uUaOqdAyJ559kbBrFZymGfhIpH/FxU=;
	b=N5riAqBg5lyO1VUxKxPagcwP2FZzNvzdMFcKizPj+jDk0tofSyjgNg2xdso0NxS/uQe/qk
	ylcLtuChL/mF9pp9os7j3nPbhcIfMERAt9Uf9y0kpf8e38O7CTfgnU8bHa+Vvckb43MmgQ
	qQytaOBRZNO31P3uurZsEI8XFAbr3dE0ZCRbKsnvglGTrR0METsx8JAIFh9/cPo3tOVnMf
	YZEO0N8xPkjCHRM8amWhfnpNMVNZSNsHzKeYD1mzdQULVRXR0lOl1SoqUvSRRhUzyE+Gd0
	K8wxLHahoXSNIK+Oco0JEQ3Vbo9Z6tAe05Knrl0xmILzqOzwy/W4fxV5TcBggw==
Date: Mon, 30 Sep 2024 18:24:01 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: cpm1: qmc: Do not use IS_ERR_VALUE() on error
 pointers
Message-ID: <20240930182401.3dd15aaa@bootlin.com>
In-Reply-To: <8b113596b2c8cdda6655346232cc603efdeb935a.1727708905.git.geert+renesas@glider.be>
References: <8b113596b2c8cdda6655346232cc603efdeb935a.1727708905.git.geert+renesas@glider.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Geert,

On Mon, 30 Sep 2024 17:08:31 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> ppc64_book3e_allmodconfig:
> 
>     drivers/soc/fsl/qe/qmc.c: In function ‘qmc_qe_init_resources’:
>     include/linux/err.h:28:49: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>        28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
> 	  |                                                 ^
>     include/linux/compiler.h:77:45: note: in definition of macro ‘unlikely’
>        77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
> 	  |                                             ^
>     drivers/soc/fsl/qe/qmc.c:1764:13: note: in expansion of macro ‘IS_ERR_VALUE’
>      1764 |         if (IS_ERR_VALUE(info)) {
> 	  |             ^~~~~~~~~~~~
> 
> IS_ERR_VALUE() is only meant for pointers.  Fix this by checking for a
> negative error value instead, which matches the documented behavior of
> devm_qe_muram_alloc() aka devm_cpm_muram_alloc().
> While at it, remove the unneeded print in case of a memory allocation
> failure, and propagate the returned error code.
> 
> Fixes: eb680d563089e55b ("soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) implementation")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/soc/fsl/qe/qmc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Thanks for the patch.
Works on my side, no regressions found on my MPC8321 system.
Tested-by: Herve Codina <herve.codina@bootlin.com>

And of course:
Acked-by: Herve Codina <herve.codina@bootlin.com>

Sorry for this mistake.
Best regards,
Hervé


Return-Path: <linuxppc-dev+bounces-15959-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD43D3A367
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 10:41:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvlpp16X2z2xjb;
	Mon, 19 Jan 2026 20:41:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768815714;
	cv=none; b=f4pIBgc95XExwzaM0q4tVXmsdz/OoKH2TVX/4mXfAkOfb6ZAQHJaE0JC3BThcTOpM8UUD/SV8l1V2LV2xn5CQ/RcFwLyhy10tzclmM0qeFY2kix3i67cjwra7l+PqlY59YD4HVZPGnRD8irWi4TYFEybWMQddDecg6sj58NgY4C/cFzeZ/2D9bn8OPiJvqLnILinliz4TF2cCUGu4vJOyKhWBf13VqsjkcbMOMYulf06boA02crMu/dRJ9EfFPWatGk6nSMvHxBRpreLksmuDKhaeg9CoCUfr8GjNfRA+4vkULWp9ciES7ZqFIfU2fkPi1u/5U6hX5RTWUO6nrJKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768815714; c=relaxed/relaxed;
	bh=b6jR+pPpmmxL9GWUs7UU5UKh6Ofo8tk+3ob6BEcKnJg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxuNKtDpIyvuFOjhiQ4F2yiq0wIHTZz8OojVESWFFyrgn621ZLGKpBqOpVuBgiRZg30CgloSaCECsnKLTQezYQjNhH0yzCr9tu0Kxy6nxr1Frz3KabLp5GynE1UwwQiZYRLlVMPDVGIrD4A9e1LKLnjv5ubPEvHk85qkU89RQtZ4Z4T+id9z3MEXwjwSLCOkvMbVJIx/5YQT0LCC5yLffCTD3N4BPL/AUXzdH26cqooCeFCL+VA0KJe0mh4fjENdjdkc2ZWuLZo/SXObSMiKPUYJVBj6Id/qnUIShMwrKS0MUObPWpNBDQhKioIO96ggNS9wYs0WqOetkhNvk+EWFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vjucln0G; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vjucln0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvlpn1JXsz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 20:41:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1051060151
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 09:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDD5C16AAE
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 09:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768815710;
	bh=HKQr8whUj/Z04va1LrYo8qpRlzoB2yfYhXr2d+a6mHg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Vjucln0GeeF/zebKoysEJUyYIGCEriqB3ByV6cyEhAadnXsg5myFb7cc192Uz+CnR
	 VN2aAk+hX2m+Axj0EYL0IUzGoN8HfKj9Pw9fVd88Hy1Ar9loB/voewq+gWljQkPYPa
	 k8rANj0AEAJAQsWH4Q/7AfPwQTXwQ+Whn5gqwlTbNFJ5TMsAu8WvLL/rG4xBnPBnzZ
	 g2P9n32SRctF12GYu1kMfGFWFKpK9rCi0z38VTqOGyiI9PIlXDw+DVSgaY1/LN8f+b
	 /u0oYYRPyfsOyGhNJUh2ABMQV6dI3AJ0uley0OKCpTcdBeMxSgMTuLNA4PYrpMo+kI
	 5+FCstdaZWE+w==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-383122fbc9bso31664591fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 01:41:49 -0800 (PST)
X-Gm-Message-State: AOJu0Yxj7lLLJeLbIFnoo9sK+vxo7BNlay0FgyKWgEi1uxgigHI7oobQ
	Ifb1JIEsvY6d0wwWUGDM8E74t6WuUEOzW7vkg8/ABOcenwAS1u9lESUrhXXDtPXNxqHsKGhoxpC
	JPi5mZyeY3naZuUp9mf25xQpDiYOihpudSHjaY7oL1g==
X-Received: by 2002:a05:6512:3d0f:b0:59b:b32f:2df3 with SMTP id
 2adb3069b0e04-59bb32f30e0mr3520280e87.3.1768815708407; Mon, 19 Jan 2026
 01:41:48 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 09:41:46 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 09:41:46 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260119061232.889236-1-nichen@iscas.ac.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260119061232.889236-1-nichen@iscas.ac.cn>
Date: Mon, 19 Jan 2026 09:41:46 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdcbihCL8MLoh4-WQuQ5L+BEOkurFmgsEB3FszyHYZdyg@mail.gmail.com>
X-Gm-Features: AZwV_Qhh8A2bghkymii2QxaeEH6AueQ8-ql_o7R_Ox9CPomihBimsTaLBAYSupg
Message-ID: <CAMRc=MdcbihCL8MLoh4-WQuQ5L+BEOkurFmgsEB3FszyHYZdyg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/52xx/mpc52xx_gpt: consolidate chained IRQ handler install/remove
To: Chen Ni <nichen@iscas.ac.cn>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, agust@denx.de, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, tglx@kernel.org, brgl@kernel.org, jirislaby@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 19 Jan 2026 07:12:32 +0100, Chen Ni <nichen@iscas.ac.cn> said:
> The driver currently sets the handler data and the chained handler in
> two separate steps. This creates a theoretical race window where an
> interrupt could fire after the handler is set but before the data is
> assigned, leading to a NULL pointer dereference.
>
> Replace the two calls with irq_set_chained_handler_and_data() to set
> both the handler and its data atomically under the irq_desc->lock.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> index 7748b6641a3c..e8163fdee69a 100644
> --- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> +++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> @@ -253,8 +253,7 @@ mpc52xx_gpt_irq_setup(struct mpc52xx_gpt_priv *gpt, struct device_node *node)
>  		return;
>  	}
>
> -	irq_set_handler_data(cascade_virq, gpt);
> -	irq_set_chained_handler(cascade_virq, mpc52xx_gpt_irq_cascade);
> +	irq_set_chained_handler_and_data(cascade_virq, mpc52xx_gpt_irq_cascade, gpt);
>
>  	/* If the GPT is currently disabled, then change it to be in Input
>  	 * Capture mode.  If the mode is non-zero, then the pin could be
> --
> 2.25.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


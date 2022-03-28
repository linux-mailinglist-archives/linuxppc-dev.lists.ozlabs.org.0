Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 610C94EA27E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 23:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS5bl21SBz3cfQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 08:36:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oLet0tAN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32b;
 helo=mail-wm1-x32b.google.com; envelope-from=daniel.thompson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oLet0tAN; dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRv000lXFz3071
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 00:37:51 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id p189so8410643wmp.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=X9xolOBuBIa4R0vTxvv45W6wXO+HEw6pqnTDDTRpzds=;
 b=oLet0tANev/NadSGG5WygX6a9PHbV48R0OGVzTFAK66vgaFAFv+6FEqLK0G3/3ySP4
 b/d5orpZAPqedkx1AD7rtFEyiwXnPvIQaUt3cb5bANbLFAp1PP9b3VM5x83B+LE5bpZX
 Mqfb0YdcPylnkm3GgwX0FkcVIyeIpzrHW1Ztm1YCPJWhtEm6b0R7UxTKqyLkp9X86tDh
 RTML6mUvAc9b6cJ7rPhuh5vgMUf407AdVPTSrPRQBy/Qnb76rcY+JlipO/P3K/LBqKBX
 q692XNYucimXULVF/VqoaavfK2r3MAlFNO2DaqNE8kM6/YoLSPlUhjDCWMHA+GVsdYK9
 BlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=X9xolOBuBIa4R0vTxvv45W6wXO+HEw6pqnTDDTRpzds=;
 b=CAX0nfbeEuoTfL0efK4e+im1SXbBcxgqCeDzebIEKXUTydoqeFf2cUVGjvW22TfqBD
 IoULkWdcfqlzv0LAkh0qv/rBbtJboZPgDuxDClDIu+1j0KCZQjRxEG20AkWG54P193Am
 vmWX1vjNURFPwGR/XcPD7ki7mOoqd9aVwjOSvtF0+YM/hyTJd2P8w4VOIKhZqwuf/cfi
 xXLSXJQkOT8udeZOExPek3nm6WuyA1sqnsUtOdDcxbV6ovRH1x6HBIFdzaovF8BwpVsU
 Z2ZjD3OpS0ZlPqzkszvb5YpU1p8cBySAMKu3pnHlYGy0QIvrp1+YlciBEb3/wC0VL08B
 OQtQ==
X-Gm-Message-State: AOAM530U01Hy6euXUQ2JjQaC4cxcV27Ehrr6dfuOlvkE1yscJXVC5IKa
 NW0siAw8at83MSiFvYTHzxZHrw==
X-Google-Smtp-Source: ABdhPJzgqImTJvpGFyUqZPtbBODfMsZThR+EI0nK3Vy5a8rcSuNNZ7ZoSJ0lC0b5BDudwRR5EvwIkg==
X-Received: by 2002:a05:600c:a08:b0:38c:93c8:36e9 with SMTP id
 z8-20020a05600c0a0800b0038c93c836e9mr36701865wmp.97.1648474666793; 
 Mon, 28 Mar 2022 06:37:46 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 p14-20020a5d59ae000000b00203dcc87d39sm19694611wrr.54.2022.03.28.06.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 06:37:46 -0700 (PDT)
Date: Mon, 28 Mar 2022 14:37:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Benjamin =?utf-8?B?U3TDvHJ6?= <benni@stuerz.xyz>
Subject: Re: [PATCH 02/22] s3c: Replace comments with C99 initializers
Message-ID: <20220328133743.xhdzmprlc7a6jxxy@maple.lan>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-2-benni@stuerz.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220326165909.506926-2-benni@stuerz.xyz>
X-Mailman-Approved-At: Tue, 29 Mar 2022 08:33:34 +1100
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
Cc: andrew@lunn.ch, linux-atm-general@lists.sourceforge.net,
 linux-ia64@vger.kernel.org, linus.walleij@linaro.org,
 dave.hansen@linux.intel.com, linux-pci@vger.kernel.org, robert.moore@intel.com,
 laforge@gnumonks.org, alim.akhtar@samsung.com, hpa@zytor.com,
 wcn36xx@lists.infradead.org, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 26, 2022 at 05:58:49PM +0100, Benjamin Stürz wrote:
> This replaces comments with C99's designated
> initializers because the kernel supports them now.

I'm a bit puzzled by "because the kernel supports them now". Designated
initializers are not purely a C99 feature... it is also a GNU C extension
to C89. This language feature has been used by the kernel for a very long time
(well over a decade).

On other words it would be much more effective to advocate for the
change by saying "because the code is clearer and easier to read" rather
than "because we can".


> Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
> ---
>  arch/arm/mach-s3c/bast-irq.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c/bast-irq.c b/arch/arm/mach-s3c/bast-irq.c
> index d299f124e6dc..bd5471f9973b 100644
> --- a/arch/arm/mach-s3c/bast-irq.c
> +++ b/arch/arm/mach-s3c/bast-irq.c
> @@ -29,22 +29,22 @@
>   * the irq is not implemented
>  */
>  static const unsigned char bast_pc104_irqmasks[] = {
> -	0,   /* 0 */
> -	0,   /* 1 */
> -	0,   /* 2 */
> -	1,   /* 3 */
> -	0,   /* 4 */
> -	2,   /* 5 */
> -	0,   /* 6 */
> -	4,   /* 7 */
> -	0,   /* 8 */
> -	0,   /* 9 */
> -	8,   /* 10 */
> -	0,   /* 11 */
> -	0,   /* 12 */
> -	0,   /* 13 */
> -	0,   /* 14 */
> -	0,   /* 15 */
> +	[0]  = 0,
> +	[1]  = 0,
> +	[2]  = 0,
> +	[3]  = 1,
> +	[4]  = 0,
> +	[5]  = 2,
> +	[6]  = 0,
> +	[7]  = 4,
> +	[8]  = 0,
> +	[9]  = 0,
> +	[10] = 8,
> +	[11] = 0,
> +	[12] = 0,
> +	[13] = 0,
> +	[14] = 0,
> +	[15] = 0,

Shouldn't this just be as follows (in order to match bast_pc104_irqs)?

+static const unsigned char bast_pc104_irqmasks[16] = {
+	[3]  = 1,
+	[5]  = 2,
+	[7]  = 4,
+	[10] = 8,
 };
 
 static const unsigned char bast_pc104_irqs[] = { 3, 5, 7, 10 };


Daniel.

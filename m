Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE35C3AC51B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:41:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5rTS4Crdz3bxj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 17:41:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cKE7FALV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=7bmb=lm=gmail.com=npiggin@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cKE7FALV; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5rSx703cz3001
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 17:41:05 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4G5rSk2WwCz9sVt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 17:40:54 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G5rSk2HrCz9sVp; Fri, 18 Jun 2021 17:40:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cKE7FALV; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G5rSj5gG3z9sTD;
 Fri, 18 Jun 2021 17:40:51 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id x16so7021336pfa.13;
 Fri, 18 Jun 2021 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=bZzLNDbbdHV8HM/rEJNrmKDwViIWP6NjzVrTr8F42DE=;
 b=cKE7FALV9UQl6VnRGT0wUK2j8/baAPrswcRetbsPEMFFHphEe8F4A5RVJ2i5AE9UJs
 q1zat8QhItAEFQobouZyddgwC3bjHe9re/Fo9z8ELg7/V+XAOfcNutzS64JpM9JpSlvd
 KwewNkULqZ8s221zW/8o+yIFenrSFbqHWizWK6XWlF0beprYuv9/yvO5i2t61JID2TEv
 sryOmij9ouiAXEgwA7f2/L8Qfsv9cVsOiEHA7M6KMqUv5jb7+Ujg4C1TZLUoRcCGSjqZ
 xfZ59fW/tK2RHAyhCgy9qRRzA6XUtSa8MQ51OBtSbo4OTUml3+rkkq5ldAmYPYvfv7/0
 knBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=bZzLNDbbdHV8HM/rEJNrmKDwViIWP6NjzVrTr8F42DE=;
 b=cAYqfR0sZmTvi88flLH/ks/GlotHTp7ougwkJo5l2K8m2b5RzBnlMyf9ESeh43bvAk
 pJuYMNR4HyYwsSEkXbO7r6gs8u6Qhpz+0awYVf92Ejydxw0XAqq9FA3KtqTCHilnObm3
 uJbJrQ9Rco/YeZJTSooA7q2FRwvM8zf9DqCjFhMe1/v0XhvdVtW/sPi6t8HV5trrMOJs
 XK3kSwm7kgGfpMSMqhMV8p5/UxpYRWLjpY3Okx11xfn28ZFKQ1DHGIdBIUasq7HnTpl7
 6on80EVGpxIE1vtXDjZvWMrh4VcVe5PDnDlDDVr2g35lUkTUqL48hvzlTEXIfsRSw74h
 un2w==
X-Gm-Message-State: AOAM533Wtj8MTPWLBBny+QraFOnvUNgn8Dyp2V0f5ro6lMnV708q4ydI
 asUSbZehAkBSfdbO7PWstz76rEr2G10=
X-Google-Smtp-Source: ABdhPJzIx2bVmItw/RB9yusM+qNgDJwUqXX+8x/eYkucHYmguT+N23azNcy4b/VelgvBBUD/qOzl6g==
X-Received: by 2002:a62:dd8b:0:b029:2e9:731a:e22e with SMTP id
 w133-20020a62dd8b0000b02902e9731ae22emr3796534pff.69.1624002047011; 
 Fri, 18 Jun 2021 00:40:47 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id h186sm7218857pfe.4.2021.06.18.00.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 00:40:46 -0700 (PDT)
Date: Fri, 18 Jun 2021 17:40:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 5/9] powerpc/microwatt: Use standard 16550 UART for
 console
To: linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@ozlabs.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
 <YMwXGCTzedpQje7r@thinks.paulus.ozlabs.org>
In-Reply-To: <YMwXGCTzedpQje7r@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1624001539.de8wj3qkjv.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of June 18, 2021 1:46 pm:
> From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>=20
> This adds support to the Microwatt platform to use the standard
> 16550-style UART which available in the standalone Microwatt FPGA.
>=20
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>  arch/powerpc/boot/dts/microwatt.dts      | 27 ++++++++++++----
>  arch/powerpc/kernel/udbg_16550.c         | 39 ++++++++++++++++++++++++
>  arch/powerpc/platforms/microwatt/Kconfig |  1 +
>  arch/powerpc/platforms/microwatt/setup.c |  2 ++
>  4 files changed, 63 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/=
microwatt.dts
> index 04e5dd92270e..974abbdda249 100644
> --- a/arch/powerpc/boot/dts/microwatt.dts
> +++ b/arch/powerpc/boot/dts/microwatt.dts
> @@ -6,6 +6,10 @@ / {
>  	model-name =3D "microwatt";
>  	compatible =3D "microwatt-soc";
> =20
> +	aliases {
> +		serial0 =3D &UART0;
> +	};
> +
>  	reserved-memory {
>  		#size-cells =3D <0x02>;
>  		#address-cells =3D <0x02>;
> @@ -89,12 +93,6 @@ PowerPC,Microwatt@0 {
>  		};
>  	};
> =20
> -	chosen {
> -		bootargs =3D "";
> -		ibm,architecture-vec-5 =3D [19 00 10 00 00 00 00 00 00 00 00 00 00 00 =
00 00
> -					  00 00 00 00 00 00 00 00 40 00 40];
> -	};
> -
>  	soc@c0000000 {
>  		compatible =3D "simple-bus";
>  		#address-cells =3D <1>;
> @@ -119,5 +117,22 @@ ICS: interrupt-controller@5000 {
>  			#interrupt-cells =3D <2>;
>  		};
> =20
> +		UART0: serial@2000 {
> +			device_type =3D "serial";
> +			compatible =3D "ns16550";
> +			reg =3D <0x2000 0x8>;
> +			clock-frequency =3D <100000000>;
> +			current-speed =3D <115200>;
> +			reg-shift =3D <2>;
> +			fifo-size =3D <16>;
> +			interrupts =3D <0x10 0x1>;
> +		};
> +	};
> +
> +	chosen {
> +		bootargs =3D "";
> +		ibm,architecture-vec-5 =3D [19 00 10 00 00 00 00 00 00 00 00 00 00 00 =
00 00
> +					  00 00 00 00 00 00 00 00 40 00 40];
> +		stdout-path =3D &UART0;
>  	};
>  };
> diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_=
16550.c
> index 9356b60d6030..8513aa49614e 100644
> --- a/arch/powerpc/kernel/udbg_16550.c
> +++ b/arch/powerpc/kernel/udbg_16550.c
> @@ -296,3 +296,42 @@ void __init udbg_init_40x_realmode(void)
>  }
> =20
>  #endif /* CONFIG_PPC_EARLY_DEBUG_40x */
> +
> +#ifdef CONFIG_PPC_EARLY_DEBUG_MICROWATT
> +
> +#define UDBG_UART_MW_ADDR	((void __iomem *)0xc0002000)
> +
> +static u8 udbg_uart_in_isa300_rm(unsigned int reg)
> +{
> +	uint64_t msr =3D mfmsr();
> +	uint8_t  c;
> +
> +	mtmsr(msr & ~(MSR_EE|MSR_DR));
> +	isync();
> +	eieio();
> +	c =3D __raw_rm_readb(UDBG_UART_MW_ADDR + (reg << 2));
> +	mtmsr(msr);
> +	isync();
> +	return c;
> +}

Why is realmode required? No cache inhibited mappings yet?

mtmsrd with L=3D0 is defined to be context synchronizing in isa 3, so I=20
don't think the isync would be required. There is a bit of code around=20
arch/powerpc that does this, maybe it used to be needed or some other
implementations needed it?

That's just for my curiosity, it doesn't really hurt to have them
there.

Thanks,
Nick

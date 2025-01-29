Return-Path: <linuxppc-dev+bounces-5665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DD6A217C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 07:36:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjXVc43CDz30J8;
	Wed, 29 Jan 2025 17:36:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738132584;
	cv=none; b=ZxK2s4EqaMWmyzILtf1PKuVUzt4G6kqqJU4lhx1OxWiKwlc26w3KIUKsUEl3xyQ49PECUhBjbFvP+jzwaPu6BX1xrEKvNmbUlO0nZ7B+fkUmhXBhy7YxupLy6BlAF1Ew+0bGYo46N4+QMJelPCFaBa63XDMWKaGjEHw2METZTqnLHPkAlib3QZakaUHYIkS7gaIX4lEbiBNgZpDgC3gaChmQMUtCLGRnahPbPSCJaDSDG5ShS87gX7/hisM4ofCpjh7kEwgcLOsCk/NjIMrp6wPTLHw+yZ2R1P74EOE+G1v9Hfg393Hc4pktZv7GSZtTFAki9ssMs8erzCzF3zV+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738132584; c=relaxed/relaxed;
	bh=wxeSqaP0ktVOoP2NsvkSviR6g6HacqHJVNBbPVO9jGw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=ZUvCiPoaJ0aXadNtDZcU/JYJ45z+ZmYCvY0I+dSt6wB6JUBDLNUgLyfX/LNaNg6nGDnAUA5FLu/mlp21c8J3kxuBgxIkZs6A48iOHDHyG030kpPx5Jnfwtg5wG/x7r33Zcgd5Du7dgF/2kPKB7lRtRFtrWC0RuRpTVW96HLYgsbTw9RS6oUXRniYrkdcTbY5iVFxQVteKukpKDbICzrJYG4QYtimiavNFlvpzLcrDLF1s+tr2aZzVQ8C+Eu5+x3mD0agGifcR7lRxa8c4WW/XCVgdCeoUwhZLfxm/NkNiar3WYZ1RJWmUvoSRyPxoyuSVpw3SVqeZpaLWUnGA+FM7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iBS2UbeG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iBS2UbeG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjXVb38D0z2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 17:36:23 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-218c8aca5f1so155322325ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 22:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738132581; x=1738737381; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxeSqaP0ktVOoP2NsvkSviR6g6HacqHJVNBbPVO9jGw=;
        b=iBS2UbeGDx2Qn/a94nWgUxDSouSyQ/0Az0Agdhg925uQl6alQVsFvVkt2ILniXCenb
         GmUuZj+91yBhl3SW6DGaZI4z170Rmnl5SrMssfitKJpP73xQFFrZAuXP4+fLl34e1o2H
         3iYhguvdNI6qIEQXO9fAA3R0jt1vB1f4bIC6OgHF/pGat3gsapfNxVV493w/qeFj6NY7
         kVFlwr84tggIzXKSBYcZN2Xx+4rx1QR4yHpBIZ6D+4i1LNTV66dkTEpDQtr+8AFS5UYG
         ZkBu9IMZQ2HEBFXN+CwF3C6mgwTyPSBvgS5y0mtzpL34NtYBqzBKuxBzjgL2nFeRRtHE
         aVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738132581; x=1738737381;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wxeSqaP0ktVOoP2NsvkSviR6g6HacqHJVNBbPVO9jGw=;
        b=BvT5P4k9x1L455nYw9l9jAnl6gI4ZmYpxG4NmmXXEZ8o0ewBG52mAud/3JagRwNY5D
         5xQdSzQKPGNPp1il/qlcPQI6+h0sqlLBTVLk5xvbg8n3HxPMTuuYNexdqnL2Ly8/LFcO
         FP+m0xfR9QsO5Vp6GDCgbfyYBQqnMpMIhOP8zuMPv91RsZv18mwhq4b1MmU2fvLE03Ya
         bXTSNxmEr/AAkNoBrqAk2SlBWGQOblYkJFpwQJ0jEgwW5b5VaAhLbEjkLJUeMWMHLbKZ
         YFWRLVKJGubD4YacdkhMkTOfcX6wop2tBrULo2VR7LazauarHtzOwulKCop0Up0HI2s7
         5eEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWzY3Fc23bUEsGQYBQaQzgzcKmxigrsbS7H8Y830dVp0dZB1AZ8d8LGbxY5a3wSrir+w0W3Pav6igqRGQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwRDRhItVUABXSj8GBWAJNiECAtj8/LDVEdvpRU06uRAR3ysKqM
	d5M/Yq48CtN9D5/p+tt2WxEbIvj7Fp6Y0aBOnBRy2eZPrZVlIJByNISOiWup
X-Gm-Gg: ASbGncs/GW7Izm7zXbX5Y9Hy1aGfFufGH7gVHYl+3DU74UtXAeIkdlSv8+WrN6+i4az
	HDRcRb5yEm6KDUSqExAeT6PiSQhiNvdEGoLBHpqeJaSDTh7fiJQ/+Y4Bn4mDA2kUiOLGn0bwE2j
	Hzai//9jTJ7ZwEZxf1BTScPmozd8EU0NTweoPqIO4xVPorpf+ImLizNahvNlBy0q4EDWCvtEut7
	sRVxMZ7nTFd9fKp2JTppHuM/iTylHUaMIgZAPu0lp/jXXsTSBL96K1gOFfyuUOFI135xMP0ve4Y
	60ePfTiW
X-Google-Smtp-Source: AGHT+IFFQsdDJLBt7xG9sEs9t/W3xiIO0fH0dFcNixQ+UBk5nLiVsD308vjLFw9Eh4O1hIc+O7JtiA==
X-Received: by 2002:a17:903:2a88:b0:20c:9936:f0ab with SMTP id d9443c01a7336-21dd7e00f28mr30903255ad.47.1738132580929;
        Tue, 28 Jan 2025 22:36:20 -0800 (PST)
Received: from localhost ([1.146.123.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac495d58077sm9380319a12.53.2025.01.28.22.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 22:36:20 -0800 (PST)
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 16:36:14 +1000
Message-Id: <D7ECKPNWAU7O.39PRDJ4PIG0P9@gmail.com>
Subject: Re: [PATCH 2/5] powerpc/microwatt: Device-tree updates
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Paul Mackerras" <paulus@ozlabs.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.19.0
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lfmZtfHD7t2IvK@thinks.paulus.ozlabs.org>
In-Reply-To: <Z5lfmZtfHD7t2IvK@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed Jan 29, 2025 at 8:52 AM AEST, Paul Mackerras wrote:
> Microwatt now implements ISA v3.1 (SFFS compliancy subset), including
> prefixed instructions, scv/rfscv, and the FSCR, HFSCR, TAR, and CTRL
> registers.  The privileged mode of operation is now hypervisor mode
> and there is no privileged non-hypervisor mode; the MSR[HV] bit is
> forced to 1.

Cool. Lots of development in microwatt.

Come to think of it we should have put a broadcast-tlbie feature
in there and you wouldn't need the other patch. That can go on
the todo list I guess.

system-call-vectored was available in ISA v3.0. Not that we do much
with it at the moment IIRC, but there were dreams of wiring it in for
compat guests. With that fixed,

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

>
> Besides updating the ibm,powerpc-cpu-features property to reflect the
> above, this also makes the following changes relating to peripheral
> devices:
>
> - Add gpio controller.
> - Remove high-speed property from SD controller, for the case where
>   the interface is connected through 200 ohm protection resisters.
> - Put an alias for the ethernet in /chosen.
>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>  arch/powerpc/boot/dts/microwatt.dts | 73 ++++++++++++++++++++++++-----
>  1 file changed, 62 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/=
microwatt.dts
> index 269e930b3b0b..6e575e841a7b 100644
> --- a/arch/powerpc/boot/dts/microwatt.dts
> +++ b/arch/powerpc/boot/dts/microwatt.dts
> @@ -1,4 +1,5 @@
>  /dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> =20
>  / {
>  	#size-cells =3D <0x02>;
> @@ -8,6 +9,7 @@ / {
> =20
>  	aliases {
>  		serial0 =3D &UART0;
> +		ethernet =3D &enet0;
>  	};
> =20
>  	reserved-memory {
> @@ -35,40 +37,79 @@ cpus {
> =20
>  		ibm,powerpc-cpu-features {
>  			display-name =3D "Microwatt";
> -			isa =3D <3000>;
> +			isa =3D <3010>;
>  			device_type =3D "cpu-features";
>  			compatible =3D "ibm,powerpc-cpu-features";
> =20
>  			mmu-radix {
>  				isa =3D <3000>;
> -				usable-privilege =3D <2>;
> +				usable-privilege =3D <6>;
> +				os-support =3D <0>;
>  			};
> =20
>  			little-endian {
> -				isa =3D <2050>;
> -				usable-privilege =3D <3>;
> +				isa =3D <0>;
> +				usable-privilege =3D <7>;
> +				os-support =3D <0>;
>  				hwcap-bit-nr =3D <1>;
>  			};
> =20
>  			cache-inhibited-large-page {
> -				isa =3D <2040>;
> -				usable-privilege =3D <2>;
> +				isa =3D <0>;
> +				usable-privilege =3D <6>;
> +				os-support =3D <0>;
>  			};
> =20
>  			fixed-point-v3 {
>  				isa =3D <3000>;
> -				usable-privilege =3D <3>;
> +				usable-privilege =3D <7>;
>  			};
> =20
>  			no-execute {
> -				isa =3D <2010>;
> +				isa =3D <0x00>;
>  				usable-privilege =3D <2>;
> +				os-support =3D <0>;
>  			};
> =20
>  			floating-point {
> +				hfscr-bit-nr =3D <0>;
>  				hwcap-bit-nr =3D <27>;
>  				isa =3D <0>;
> -				usable-privilege =3D <3>;
> +				usable-privilege =3D <7>;
> +				hv-support =3D <1>;
> +				os-support =3D <0>;
> +			};
> +
> +			prefixed-instructions {
> +				hfscr-bit-nr =3D <13>;
> +				fscr-bit-nr =3D <13>;
> +				isa =3D <3010>;
> +				usable-privilege =3D <7>;
> +				os-support =3D <1>;
> +				hv-support =3D <1>;
> +			};
> +
> +			tar {
> +				hfscr-bit-nr =3D <8>;
> +				fscr-bit-nr =3D <8>;
> +				isa =3D <2070>;
> +				usable-privilege =3D <7>;
> +				os-support =3D <1>;
> +				hv-support =3D <1>;
> +				hwcap-bit-nr =3D <58>;
> +			};
> +
> +			control-register {
> +				isa =3D <0>;
> +				usable-privilege =3D <7>;
> +			};
> +
> +			system-call-vectored {
> +				isa =3D <2070>;
> +				usable-privilege =3D <7>;
> +				os-support =3D <1>;
> +				fscr-bit-nr =3D <12>;
> +				hwcap-bit-nr =3D <52>;
>  			};
>  		};
> =20
> @@ -138,7 +179,18 @@ UART0: serial@2000 {
>  			interrupts =3D <0x10 0x1>;
>  		};
> =20
> -		ethernet@8020000 {
> +		gpio: gpio@7000 {
> +			device_type =3D "gpio";
> +			compatible =3D "faraday,ftgpio010";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			reg =3D <0x7000 0x80>;
> +			interrupts =3D <0x14 1>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +		};
> +
> +		enet0: ethernet@8020000 {
>  			compatible =3D "litex,liteeth";
>  			reg =3D <0x8021000 0x100
>  				0x8020800 0x100
> @@ -160,7 +212,6 @@ mmc@8040000 {
>  			reg-names =3D "phy", "core", "reader", "writer", "irq";
>  			bus-width =3D <4>;
>  			interrupts =3D <0x13 1>;
> -			cap-sd-highspeed;
>  			clocks =3D <&sys_clk>;
>  		};
>  	};



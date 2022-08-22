Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F7E59C483
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 19:01:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBJY82z1vz3cjK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 03:01:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.54; helo=mail-oo1-f54.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBJXj6K7fz3bmC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 03:01:07 +1000 (AEST)
Received: by mail-oo1-f54.google.com with SMTP id c128-20020a4a4f86000000b0044b0247f650so1611819oob.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 10:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=vllOTj75NMj9Xtj4lVknt1y4y0/yrOawPpDzQK1s7XY=;
        b=5PgWtUa6TPz8UojCDEZfrEoCAT5NVpyRix0ZHkv8AddPkUIDuPuJdFkwoYzWE9RWXs
         TdJQoHlbYB31G8W2TmfLCedqRkuLO7vK0DtilQ9SXB5UTooCgqXBtbziWVn8mMexujzH
         EaRPXJDgU3VhJmy68ileFwNMdxua4ZAyrvEDTg7CawZFgWn4yK3b93b1d8JBxmYRgfNr
         N0U1g5pC9hBHPxC8KnGtFckUMd7C4hoGnaf35SiB0I9bR9jy8o1J1npU7rIxnZGeCKNm
         UjV757+Rn30gWgcmVebdjLsbMemR9HJ/z335/1/RuPmyoGx/Ca+y2+VwZ/HFwPfBTpOM
         zHlQ==
X-Gm-Message-State: ACgBeo1F70dLHJjL9V/lm5FmBu9wc5RL2U+XlcSvcS7k6L7Dmy1gGxeu
	7RpBEm0YHBwZg19DGnxh+Q==
X-Google-Smtp-Source: AA6agR7f7iG5WZv9hUN29PKotnQLZ188Y9PJABNFzMfCJeDdQBw7SZ57RoQtRac3zi8ntAyYvNRADQ==
X-Received: by 2002:a4a:abcf:0:b0:428:47bc:4bc0 with SMTP id o15-20020a4aabcf000000b0042847bc4bc0mr7000784oon.15.1661187664664;
        Mon, 22 Aug 2022 10:01:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q12-20020a9d630c000000b0061c80e20c7dsm3019384otk.81.2022.08.22.10.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 10:00:59 -0700 (PDT)
Received: (nullmailer pid 4151205 invoked by uid 1000);
	Mon, 22 Aug 2022 17:00:56 -0000
Date: Mon, 22 Aug 2022 12:00:56 -0500
From: Rob Herring <robh@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH] powerpc/85xx: DTS: Add CPLD definitions for P1021RDB
 Combo Board CPL Design
Message-ID: <20220822170056.GA4135542-robh@kernel.org>
References: <20220819084433.26011-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819084433.26011-1-pali@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 19, 2022 at 10:44:33AM +0200, Pali Rohár wrote:
> P1021RDB Combo Board CPLD Design is used on following Freescale boards:
> P1021RDB-PC, P1020RDB-PD, P1020MBG-PC, P1020UTM-PC and P2020RDB-PCA.
> 
> Add CPLD definitions for all these boards for which already exist DTS file.
> 
> CPLD has bank size 128kB, it is connected via CS3 on LBC and mapped to
> memory range 0xFFA00000~0xFFA1FFFF.
> 
> As CPLD firmware is common on all these boards, use just one compatible
> string "fsl,p1021rdb-pc-cpld".
> 
> In some DTS files is CPLD already defined, but definition is either
> incomplete or wrong. So fix it.
> 
> All these boards have via CPLD connected max6370 watchdog at offset 0x2
> with GPIO 11, status led at offset 0x8 and reset controller at offset 0xd.
> Additionally P1020MBG-PC and P1020RDB-PD boards have FXO led at offset 0x9
> and FXS leds at offset 0xa.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi    | 92 +++++++++++++++++++
>  arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts |  6 +-
>  arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts |  6 +-
>  arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts     | 44 +++++++--
>  arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi    | 37 ++++++++
>  arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts |  4 +-
>  arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts |  4 +-
>  arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi    | 37 ++++++++
>  arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts |  5 +-
>  arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts |  5 +-
>  arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi    | 33 ++++++-
>  11 files changed, 251 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi b/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi
> index a24699cfea9c..c73996dcd809 100644
> --- a/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi
> @@ -83,6 +83,95 @@
>  		compatible = "vitesse-7385";
>  		reg = <0x2 0x0 0x20000>;
>  	};
> +
> +	cpld@3,0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "fsl,p1021rdb-pc-cpld", "simple-bus", "syscon";
> +		reg = <0x3 0x0 0x20000>;
> +		ranges = <0x0 0x3 0x0 0x20000>;
> +
> +		watchdog@2 {
> +			compatible = "maxim,max6370";
> +			reg = <0x2 0x1>;
> +			gpios = <&gpio 11 1>;
> +		};
> +
> +		led@8 {

The register-bit-led schema says this should be 'led@8,0'. Did you 
run 'dtbs_check'? 

But that's going to conflict with what simple-bus schema says. I don't 
know that 'simple-bus' is really appropriate here. The CPLD isn't really 
just a bus. 'simple-mfd' is what's more commonly used with 'syscon'.


> +			compatible = "register-bit-led";
> +			reg = <0x8 0x1>;
> +			offset = <0x8>;
> +			mask = <0x1>;
> +			active-low;
> +			default-state = "keep";
> +			label = "status";
> +			function = "status";
> +			color = <6>; /* LED_COLOR_ID_YELLOW */
> +		};


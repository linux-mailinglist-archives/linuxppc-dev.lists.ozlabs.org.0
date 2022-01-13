Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 155CC48D810
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 13:36:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZP746y4Wz30NB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 23:36:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hYIWlIYn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hYIWlIYn; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZP6L06Ypz2xD4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 23:35:35 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id t24so22438624edi.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 04:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LftLg0r0Faw+W6UND9T0SXsUaqtJ0ZRucKUPsxlKlXc=;
 b=hYIWlIYnpsLWMFOV8ltzNbs8XDcKpvGbzs+nnSbI/PBIgULVwJ7cEpXfqH+d4nHJh1
 rEGAf0ZTTkAwky3PhZfJXabZaUcy9Khsn/GsO5ift9lfdrcPPKXOA/TaI+qJKpWNgTjk
 7H19U57b2TiDXmtRVczH+sYbHveb2BJvXk+OnE69uzL8um5TBqqlKT+Z0Jf2Wj7Vmgt+
 FwUjaB8v3YVh7zbdqFrC/dSM2qXDz9Tt7MAVKXDcDWza0ttWs+OSWrsHqMOLk4IvCNhv
 AJhKj+ARGsf+K9wcw11aJzcQ/FVIzdhDvKD1N0WvjOg4NBF+tGTf8iJbQZef2/J6pPIo
 HZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LftLg0r0Faw+W6UND9T0SXsUaqtJ0ZRucKUPsxlKlXc=;
 b=CUWKYH0u+zUq1HFy1clcIUkEArCthfytdprCPekIF5Ngji6VaZWfF54IeDLs0s+dP9
 b3LlQ2yyykY5BZoR/LvDCpjz5/M7wUDXEg/41vpgzpB4KdXaWnAw3MVVhfheBG5Z7poq
 IJ5wsgn/nY8khkwFj9DWa7Fx075U57BdAPk7i3yBPK5yOEummIMTqdS/9JC+VwNwLdaM
 jh1VF6lrFQaYVQSmmWcZqPNPcYo5Wed/6VKl666LCvXpCw+oQhagAwaVpW8Od8XKgnYC
 084GPa6Wn06hVQiHMFJBV7wvftMDtBCuCaNSpSW+hlBaRK96piOs/KGAiseZTDxw0poq
 Ef1Q==
X-Gm-Message-State: AOAM530hhm19eGUAjJnHMYJ24NZ2Z5HDgNYVCHbVKVF6Yi+BNpse0/CW
 2skXMCU5j3yVSW3efxffqv4=
X-Google-Smtp-Source: ABdhPJyqdzUl4Aa3NbTKIeeuDRq1eL9MwIEfCFaL0CYvjb77VO6b8ZIIh7qD5UrrkpxX6b75E6U1RA==
X-Received: by 2002:a17:906:4fcc:: with SMTP id
 i12mr3386976ejw.529.1642077332873; 
 Thu, 13 Jan 2022 04:35:32 -0800 (PST)
Received: from skbuf ([188.25.255.2])
 by smtp.gmail.com with ESMTPSA id lb11sm829889ejc.216.2022.01.13.04.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 04:35:32 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
X-Google-Original-From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Thu, 13 Jan 2022 14:35:30 +0200
To: Maxim Kiselev <bigunclemax@gmail.com>
Subject: Re: [PATCH] powerpc: dts: t104xrdb: fix phy type for FMAN 4/5
Message-ID: <20220113123530.dn33ze7yvg2jlnfv@skbuf>
References: <20211230151123.1258321-1-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211230151123.1258321-1-bigunclemax@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, fido_max@inbox.ru,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 30, 2021 at 06:11:21PM +0300, Maxim Kiselev wrote:
> T1040RDB has two RTL8211E-VB phys which requires setting
> of internal delays for correct work.
> 
> Changing the phy-connection-type property to `rgmii-id`
> will fix this issue.
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  arch/powerpc/boot/dts/fsl/t104xrdb.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
> index 099a598c74c00..bfe1ed5be3374 100644
> --- a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
> @@ -139,12 +139,12 @@ pca9546@77 {
>  		fman@400000 {
>  			ethernet@e6000 {
>  				phy-handle = <&phy_rgmii_0>;
> -				phy-connection-type = "rgmii";
> +				phy-connection-type = "rgmii-id";
>  			};
>  
>  			ethernet@e8000 {
>  				phy-handle = <&phy_rgmii_1>;
> -				phy-connection-type = "rgmii";
> +				phy-connection-type = "rgmii-id";
>  			};
>  
>  			mdio0: mdio@fc000 {
> -- 
> 2.32.0
> 


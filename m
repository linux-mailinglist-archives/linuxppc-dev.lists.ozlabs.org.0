Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 028934641B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 23:44:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3chd65dHz3cYT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 09:44:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.46; helo=mail-ot1-f46.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3ch90tgrz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 09:43:36 +1100 (AEDT)
Received: by mail-ot1-f46.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso32358574otj.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 14:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bgNkZ9Km7uslGW9spgB64Ff0uwinA/sUJ4dW12Hx5NQ=;
 b=2hn6kZNwNSYYCnL94/ckv5u3d9i9jWzLxTbSlcD18s6tm9VAlWkJkUOMU59wFEGgIV
 makgvyPCH873KnZ1njORipQhr7SKjNfK2a3nmrLIr77OQ8ISCEWGJuF2qVJuhnY2Rr07
 rhibQjKnUrN3KjVr2wSp/GetuuUuFCIhrd0t0+ZqdY1PH+zSrPTdCKJbGC7NwiBhSoD9
 NwYWVWtg4hlA6XAd2+J37DIyVQLwgVr2vj0Ng4W75RdGjtV0l6zHYbXUQliMbCSuW1+K
 G3c0wT7+9HcFeNLut4onW+zr0S4kTxbkvnMsc0RoGTxiMSsJtWbj7dhIx8jyjSGc2NNB
 y6hA==
X-Gm-Message-State: AOAM5320LOghY28GUUkPiApClHMZ2pJ9itPmE69l6qNVKMdawrdFULBs
 xPOpJUDCGL1RjRejEoOH6A==
X-Google-Smtp-Source: ABdhPJzzNxeCz/g28KThw4laZ7VZ4CBNkktlUh1TUdViKWztFqJrvQFOHaXnbD/wHUUc+yOXcVd/+Q==
X-Received: by 2002:a9d:364b:: with SMTP id w69mr2131689otb.18.1638312212779; 
 Tue, 30 Nov 2021 14:43:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g1sm2943995ooq.2.2021.11.30.14.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 14:43:31 -0800 (PST)
Received: (nullmailer pid 3146302 invoked by uid 1000);
 Tue, 30 Nov 2021 22:43:31 -0000
Date: Tue, 30 Nov 2021 16:43:31 -0600
From: Rob Herring <robh@kernel.org>
To: Calvin Zhang <calvinzhang.cool@gmail.com>
Subject: Re: [PATCH] of: unmap memory regions in /memreserve node
Message-ID: <YaapE8oys5zQEdD5@robh.at.kernel.org>
References: <20211124133347.3861391-1-calvinzhang.cool@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124133347.3861391-1-calvinzhang.cool@gmail.com>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+linuxppc-dev

On Wed, Nov 24, 2021 at 09:33:47PM +0800, Calvin Zhang wrote:
> Reserved memory regions in /memreserve node aren't and shouldn't
> be referenced elsewhere. So mark them no-map to skip direct mapping
> for them.

I suspect this has a high chance of breaking some platform. There's no 
rule a region can't be accessed.

> 
> Signed-off-by: Calvin Zhang <calvinzhang.cool@gmail.com>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index bdca35284ceb..9e88cc8445f6 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -638,7 +638,7 @@ void __init early_init_fdt_scan_reserved_mem(void)
>  		fdt_get_mem_rsv(initial_boot_params, n, &base, &size);
>  		if (!size)
>  			break;
> -		early_init_dt_reserve_memory_arch(base, size, false);
> +		early_init_dt_reserve_memory_arch(base, size, true);
>  	}
>  
>  	fdt_scan_reserved_mem();
> -- 
> 2.30.2
> 
> 

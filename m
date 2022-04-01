Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 593304EE91B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 09:29:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVBcs1Py4z3cCW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 18:29:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aLVtx7qP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aLVtx7qP; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KV91y0F3Kz2yHD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Apr 2022 17:17:23 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id bg10so3716729ejb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 23:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2TwJKrePsfMG+vTEocsT56Q0z7ebW1hBFsv6Y12aibY=;
 b=aLVtx7qPaGlbo7sC9oaFRHo6sy3YxvNEi1YbDdnBX0tdlJV2Iec401aNv5l+WOJ4Ft
 TRrCBOrXCVMJq2HtqciitvAi2coYs9KPozl9trDHNdqD6bOeotOatK4vpdC01We+E8/m
 1RBFRn2qcyilCs0Jfxa1lgWdfVQb0vsisLeCHNZuaN6pVBr/KZPiylqwTsp1j1J5WP3v
 JYP6GK53acRgy4zZzE5mkE4iIULUE8jN3KRs/N8nn0HYu5qYD0BteYidJWR/RdCTvhV3
 jlTw6c2tsJvFFkeLlqffXRlngyYTjHRBffyVEZq387TvjThgLKXamxHS7xJjscmVbub0
 k9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2TwJKrePsfMG+vTEocsT56Q0z7ebW1hBFsv6Y12aibY=;
 b=dhjLbzRaPNLRSAWfPlQi/eBkh1pCAscTuPVkNmSLno/rOvWVBzA073bw+hOI4hPvgF
 02ZRk4LE4XJbjsX5tNNnbrvp7E5ICfn2aQ+aC+wzFPMdGZAbdUBGFJ7vo7dzYP6/E7NM
 YSV6rVVrTcLNm9zTHz2yUdVJzrck+qZiLV2VyOjkpDbm6MF3/rfoK/wQKnRwZ8T6kv/r
 kWqIq9/WGVcA89OgbTXGJKpqM6nPPz8IpNluVdxq3on4AHH50uJmb0oVXEXgdYs4QAHL
 I3WfYQLylu0JEasJqgYu9C9i5MrJy6sZTgXw36+s5UDl6snxNLhDrDOQUEKGDZ8pOmnQ
 ts6w==
X-Gm-Message-State: AOAM53186tR+F3c7ZU9oR6wJgPxQwnh4c7l4BxUvJj9D8De5ayePk51B
 ZEhGMYv7dc/oozhyPBwfqwxQ/Q==
X-Google-Smtp-Source: ABdhPJx0+06TUOISc+VO1MjT01uD6Ml5n1QTeFunR8KRUAfAhDO43QTr7KtZezI5fbtl0e7HJ6cyaw==
X-Received: by 2002:a17:907:1614:b0:6df:678a:a7d5 with SMTP id
 hb20-20020a170907161400b006df678aa7d5mr7836538ejc.719.1648793835880; 
 Thu, 31 Mar 2022 23:17:15 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 fx3-20020a170906b74300b006daecedee44sm634137ejb.220.2022.03.31.23.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 23:17:15 -0700 (PDT)
Message-ID: <9fe715a5-8ab5-ff86-7d8f-de72eac72c97@linaro.org>
Date: Fri, 1 Apr 2022 08:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] powerpc/85xx: Remove fsl,85... bindings
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Rob Herring <robh+dt@kernel.org>, Scott Wood <oss@buserror.net>,
 Johannes Thumshirn <morbidrsa@gmail.com>
References: <82a8bc4450a4daee50ee5fada75621fecb3703ff.1648721299.git.christophe.leroy@csgroup.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <82a8bc4450a4daee50ee5fada75621fecb3703ff.1648721299.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 01 Apr 2022 18:27:09 +1100
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
Cc: devicetree@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Robert Richter <rric@kernel.org>, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Paul Mackerras <paulus@samba.org>, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31/03/2022 12:13, Christophe Leroy wrote:
> Since commit 8a4ab218ef70 ("powerpc/85xx: Change deprecated binding
> for 85xx-based boards"), those bindings are not used anymore.
> 
> A comment in drivers/edac/mpc85xx_edac.c say they are to be removed
> with kernel 2.6.30.
> 
> Remove them now.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../bindings/memory-controllers/fsl/fsl,ddr.yaml   |  6 ------
>  .../devicetree/bindings/powerpc/fsl/l2cache.txt    |  6 ------
>  drivers/edac/mpc85xx_edac.c                        | 14 --------------
>  3 files changed, 26 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

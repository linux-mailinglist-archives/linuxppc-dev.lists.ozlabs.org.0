Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BAE44B26
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 20:53:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PtDM09BszDrL9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 04:53:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QciANm+R"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PtBW2zXczDrJD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 04:51:47 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id j184so150029oih.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/UPxWSlC5sa2bqOyrgAL69/GdR1/OE8Ch9dSPjw4HAw=;
 b=QciANm+ReKrJ0szbSi1fGnbMist6Yz1rN7pI3bws0+TWRIzZdQkCmN6AUFv2/KsdzD
 IN9IgdWsxE98VftCdxsxJmKPuG6hJUUmFifIuIokGVUuk+viIemj86pXrJbpvLP3UDV4
 d03z93Bc+SwF6rBiezP5ABz+B6NXLmfzQ1LPyoYl4aqi8NdQQbwu5Z1Y+UccvWvKVGgL
 UBdowE/ZPsjVfKaoCbhIJshixaflZXTTpw4XJIZLJOgFtPz8lk7Tb9SX4zwI7rAfWt/B
 ju4Uw/3/rppXw6skGIETJAeoOPlzBvLXtKIa9JiHtWVoZa6xoP5p4ViZoDoPLc/HaxY7
 yuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/UPxWSlC5sa2bqOyrgAL69/GdR1/OE8Ch9dSPjw4HAw=;
 b=byaYYNs7Pe1Na8LR3dd/OM110nuDyRFNh7jzwAb+vpdg7jcJj/ImZIaxnIPSkNayW4
 e1xhU5Ix8l61G7/YFwut+IURkZKN6jx1slPpd5hHSJbmUkvnBrGDRpUMkumVhB/dVgrd
 Kcin5NwXLekUvr/29GxL6dGXkRn4Un3XAP+uUmtn/N/HaywHNlyQtHg+CmmUYcY+kO9s
 K4rNKgkyGoSIiM3IVSZ+kumLYVxVOe0qusUcrvyYfv92UrJs9/vGXonZe6RxLeH2k3Nh
 JsXHj4PeChOcqe9MW59APw3E+7gusPC7WVpZSyKvSaALYc+eXs2L922hy/40ZZmT5Cq/
 qRYA==
X-Gm-Message-State: APjAAAXMNo9Dly3dkmb0HXxW5aFZ4svqgixS1vrbl7pnJqmPdkRfP0eo
 s1jRyPP0fUD7Jz5t/qRSOq4=
X-Google-Smtp-Source: APXvYqxN7mmhXH/KLQY6oeLzDB+2IeuUjevbypQYE7vAYi0s8uy3XJkg3sdKQjMN7GdBPQGLpYJmJA==
X-Received: by 2002:aca:80f:: with SMTP id 15mr3802774oii.118.1560451904574;
 Thu, 13 Jun 2019 11:51:44 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id l65sm186063oif.20.2019.06.13.11.51.42
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:51:43 -0700 (PDT)
Subject: Re: [PATCH] powerpc: enable a 30-bit ZONE_DMA for 32-bit pmac
To: Christoph Hellwig <hch@lst.de>, benh@kernel.crashing.org,
 paulus@samba.org, mpe@ellerman.id.au
References: <20190613082446.18685-1-hch@lst.de>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <334280df-9002-c92f-d381-9fd79e2a9036@lwfinger.net>
Date: Thu, 13 Jun 2019 13:51:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613082446.18685-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 aaro.koskinen@iki.fi
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/13/19 3:24 AM, Christoph Hellwig wrote:
> With the strict dma mask checking introduced with the switch to
> the generic DMA direct code common wifi chips on 32-bit powerbooks
> stopped working.  Add a 30-bit ZONE_DMA to the 32-bit pmac builds
> to allow them to reliably allocate dma coherent memory.
> 
> Fixes: 65a21b71f948 ("powerpc/dma: remove dma_nommu_dma_supported")
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

As expected, it works. The patch needs
Cc: Stable <stable*vger.kernel.org> # v5.1+

Tested-by: Larry Finger <Larry.Finger@lwfinger.net>
Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks for the help, and the patience with my debugging problems with u64 variables.

Larry

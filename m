Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A414BA9E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 15:40:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486Tms4LpkzDq9G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 01:40:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486TT92bZczDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 01:26:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 486TT66k5Tz8sxV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 01:26:50 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 486TT652FCzB3w3; Wed, 29 Jan 2020 01:26:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 486TT62r8hzB3w2
 for <linuxppc-dev@ozlabs.org>; Wed, 29 Jan 2020 01:26:50 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id z9so12131626oth.5
 for <linuxppc-dev@ozlabs.org>; Tue, 28 Jan 2020 06:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qQkCUlHSeSutqpYYYEuSpgaq1CGRr1gMxP5zgQMXFLE=;
 b=bUOWzdFiSaBFdqZFs82XXGPl+bNlhFz5LKzL9n/Ju+mpQUzBXiwHv8TYzAsVcl8XtP
 uXNQ3yym7+zNxz+h9rw8o+SMXze3hXOiXKeuT+BzJfi9ebryheXD6y3LnjhvMDstazvo
 g/4tTWBuTWee7nltVv0kdrUSKgQLpzQVIl558h5jygfLmT1m1BOHVALWipoJiSuIarvU
 AW2dyShv1/KVwM6stJC5Y1cttTZP64DUUQcL6bNpQ04qYIdR9aT/fUDn3EnijjLHcjIW
 iYK7gE+t1L+vtfHuKaTpNli4gtqQGVfwOFym3XzM+C5/RWBVKoVM4O/NOw2Dzp+nHUjX
 WWYQ==
X-Gm-Message-State: APjAAAU/rdQroNtBjHqhcejaCLRAybdt4OugNAYNhLBaFD4i+0JxAip2
 VDVQfen7Lw75SjuDsqc1wA==
X-Google-Smtp-Source: APXvYqwFJVk0FJAugT05thhhxD8ynpQt6Xxwj2dYD7xIOhRcGHbVx5Pc86KH1o6GE7zkGGtDMoAw+w==
X-Received: by 2002:a05:6830:1116:: with SMTP id
 w22mr16929063otq.63.1580221607750; 
 Tue, 28 Jan 2020 06:26:47 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f37sm5770746otb.33.2020.01.28.06.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 06:26:46 -0800 (PST)
Received: (nullmailer pid 18064 invoked by uid 1000);
 Tue, 28 Jan 2020 14:26:46 -0000
Date: Tue, 28 Jan 2020 08:26:46 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] of: Add OF_DMA_DEFAULT_COHERENT & select it on powerpc
Message-ID: <20200128142646.GA17341@bogus>
References: <20200126115247.13402-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200126115247.13402-1-mpe@ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, robh+dt@kernel.org,
 chzigotzky@xenosoft.de, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 26 Jan 2020 22:52:47 +1100, Michael Ellerman wrote:
> There's an OF helper called of_dma_is_coherent(), which checks if a
> device has a "dma-coherent" property to see if the device is coherent
> for DMA.
> 
> But on some platforms devices are coherent by default, and on some
> platforms it's not possible to update existing device trees to add the
> "dma-coherent" property.
> 
> So add a Kconfig symbol to allow arch code to tell
> of_dma_is_coherent() that devices are coherent by default, regardless
> of the presence of the property.
> 
> Select that symbol on powerpc when NOT_COHERENT_CACHE is not set, ie.
> when the system has a coherent cache.
> 
> Fixes: 92ea637edea3 ("of: introduce of_dma_is_coherent() helper")
> Cc: stable@vger.kernel.org # v3.16+
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/Kconfig | 1 +
>  drivers/of/Kconfig   | 4 ++++
>  drivers/of/address.c | 6 +++++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 

Applied, thanks.

Rob

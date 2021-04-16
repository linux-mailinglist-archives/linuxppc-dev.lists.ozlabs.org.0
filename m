Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E3361A62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 09:15:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM6tW2SLgz3bvx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 17:15:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=YXGCN5pL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=YXGCN5pL; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM6t43WR7z2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 17:15:06 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso15830047pji.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 00:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=BzihCKLSn5zDahlSfxZpVN+H6HlVaY3GCUyxBAUfdLQ=;
 b=YXGCN5pL3en+V1lnsbKkewxe6z62T9YCtJrt5Qgn59jA+RTQ7H/kg+KlNAoD2/aSeZ
 E9Flt7AmhulS59kAeBj7Rh/lNrPoV8fHug6KFClhT8g7WbGvhSAcrhJ1oNtCE/Z+0L1+
 E0kBN5F6PriHe9zTWzS6ewqJA2NBOlokLxLhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=BzihCKLSn5zDahlSfxZpVN+H6HlVaY3GCUyxBAUfdLQ=;
 b=FcU7V6aPLEDEwKp7tRhjdPWDsgD5WNhbFQud2cVAanR9puDVCau0EMuqZRUta4W29Q
 8DE0p/k9+OMH5fU2NOVhgYjgB4ScKien+5lbZyDLwFN5hl2zIcIgYG57wnY8QB88pKtX
 vGHr+s0t4pKgwICSpDWOTAnZpE60cCM9RnQmpA5hdV2fl+e7ib2gMQbVG/yB32YaPISY
 D6w19TMrOsFdid0dQXFa3THq7w7eeQw8wf0vr1KjsuhTDpwqWHClHXmTdatOzEJD0CD4
 6+wP7onlSXhe36vpM/0dK5aKekPFm+4/tX3KDDN2PgGObpRAKwf6Hqrc12CmJA0tINxF
 9Caw==
X-Gm-Message-State: AOAM532Cq8Xejlk2IS6M9uNgjpeITND8lj+VJ+NmyeBB3pRemZAy6Vp8
 LBlGCEHHZMqxjncIqAsNchuDofbhNOQCxw==
X-Google-Smtp-Source: ABdhPJyL/bVQGB2j1SyQSTZxiabgYxoP8rXxgYmkXLPKRCg/zorqcQ8i+YMrNm90RtJGI2WRnMDxQg==
X-Received: by 2002:a17:90b:3b4e:: with SMTP id
 ot14mr7907331pjb.81.1618557303436; 
 Fri, 16 Apr 2021 00:15:03 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-09c3-a49e-2955-78c6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:9c3:a49e:2955:78c6])
 by smtp.gmail.com with ESMTPSA id e65sm4107570pfe.9.2021.04.16.00.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 00:15:03 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/pseries: extract host bridge from pci_bus prior
 to bus removal
In-Reply-To: <20210211182435.47968-1-tyreld@linux.ibm.com>
References: <20210211182435.47968-1-tyreld@linux.ibm.com>
Date: Fri, 16 Apr 2021 17:15:00 +1000
Message-ID: <878s5ig0p7.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Tyrel,

> The pci_bus->bridge reference may no longer be valid after
> pci_bus_remove() resulting in passing a bad value to device_unregister()
> for the associated bridge device.
>
> Store the host_bridge reference in a separate variable prior to
> pci_bus_remove().
>
The patch certainly seems to do what you say. I'm not really up on the
innards of PCI, so I'm struggling to figure out by what code path
pci_bus_remove() might invalidate pci_bus->bridge? A quick look at
pci_remove_bus was not very illuminating but I didn't chase down every
call it made.

Kind regards,
Daniel

> Fixes: 7340056567e3 ("powerpc/pci: Reorder pci bus/bridge unregistration during PHB removal")
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/pci_dlpar.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
> index f9ae17e8a0f4..a8f9140a24fa 100644
> --- a/arch/powerpc/platforms/pseries/pci_dlpar.c
> +++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
> @@ -50,6 +50,7 @@ EXPORT_SYMBOL_GPL(init_phb_dynamic);
>  int remove_phb_dynamic(struct pci_controller *phb)
>  {
>  	struct pci_bus *b = phb->bus;
> +	struct pci_host_bridge *host_bridge = to_pci_host_bridge(b->bridge);
>  	struct resource *res;
>  	int rc, i;
>  
> @@ -76,7 +77,8 @@ int remove_phb_dynamic(struct pci_controller *phb)
>  	/* Remove the PCI bus and unregister the bridge device from sysfs */
>  	phb->bus = NULL;
>  	pci_remove_bus(b);
> -	device_unregister(b->bridge);
> +	host_bridge->bus = NULL;
> +	device_unregister(&host_bridge->dev);
>  
>  	/* Now release the IO resource */
>  	if (res->flags & IORESOURCE_IO)
> -- 
> 2.27.0

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA655018E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 03:07:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPySP31kBz3bpy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 11:07:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mYCiRA6j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mYCiRA6j;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPyRj2XCDz3086
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 11:06:55 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id k12-20020a17090a404c00b001eaabc1fe5dso5951644pjg.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 18:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=KRIeihzYwpT99jVYyWrBvkWlYlvrvIZJfg260Yku6Lc=;
        b=mYCiRA6jX3TZBBpH5i1bdKxf86pnFybirRcUnA7+QegXGbzOVw+vVyBSconShTfcN0
         cCwY9Lg+Wp1DUlN7ZuDKZXZp+Lq9oTrhj5Egt9NASpHMRY0WFnq2TqiOXmxGI5seYlbP
         q0BPpHgaiqex7reMZd7eeiSPLbAesZfnXOSNpNddBnH0OtREDZ0fHr/GsKwCbGO2CEAh
         0hN2+Q0eH6pq4ZYITkDSH3pFg/hKtXahXOuIosfi8Y0II3BWuxt8tZ5GTulif6PPtR6w
         mWvi9cySEswvHdKCNsD70zRyxq32NFDfKs677RtcCSsSo3yIFNheD9lUFe9of5dO2FCw
         T3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=KRIeihzYwpT99jVYyWrBvkWlYlvrvIZJfg260Yku6Lc=;
        b=lghOoZ4KnShAjfX2z5dGuj5KFNVDwzKGSIBO3x0fx/7HwI6j9ExbKzg/uVydQkJ39W
         YoW435SwI/KjUOkzd+UysjKl9AQHF9dCVnWStUpCx5BHEms9rAWtsBz7Y2zgLsSZud3Q
         oMQtNU2HR9Ri5YI+CJMWJk4ylee1LUwWqSEM9L0aCar393yfbflSuU9pv3AkMi6WmQP7
         2vlNXRCymmlRNkpc6xic2I/Jl5BnE+Lhu7N0zDMx5Uvv/uBUiTvzHIZ2tkTXNHKw1VkS
         MOBr7HBxcxCMKxJ4yeHKAGHzJ9Eepx2B5e/e7hgje9IGpKzOioXJ0H0JnulK2UtMsQto
         wR9Q==
X-Gm-Message-State: AJIora8fBwrwWM5IFoalgymon53u/1yDYSlI3Ne9LZ6SvcOZGyQQ4JR5
	pLMngv48PcEbmegABfRXcRI=
X-Google-Smtp-Source: AGRyM1u1j6XUfwl32yRCm+A4vEBywEwNGmaCfY9KqlZE6/HghD6w2fj/KwvqmOMndnHwj1ctiT07Vw==
X-Received: by 2002:a17:90b:4ac9:b0:1e3:1dca:d995 with SMTP id mh9-20020a17090b4ac900b001e31dcad995mr13457922pjb.111.1655514413476;
        Fri, 17 Jun 2022 18:06:53 -0700 (PDT)
Received: from [10.1.1.24] (222-155-0-244-adsl.sparkbb.co.nz. [222.155.0.244])
        by smtp.gmail.com with ESMTPSA id j3-20020a170903024300b00161947ecc82sm4126766plh.199.2022.06.17.18.06.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2022 18:06:52 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
To: Arnd Bergmann <arnd@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
Date: Sat, 18 Jun 2022 13:06:40 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20220617125750.728590-4-arnd@kernel.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
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
Cc: linux-arch@vger.kernel.org, Miquel van Smoorenburg <mikevs@xs4all.net>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, "Maciej W . Rozycki" <macro@orcam.me.uk>, linux-m68k@lists.linux-m68k.org, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, Matt Wang <wwentao@vmware.com>, linux-alpha@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd,

Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All architecture-independent users of virt_to_bus() and bus_to_virt()
> have been fixed to use the dma mapping interfaces or have been
> removed now.  This means the definitions on most architectures, and the
> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
>
> The only exceptions to this are a few network and scsi drivers for m68k
> Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
> with the old interfaces and are probably not worth changing.

The Amiga SCSI drivers are all old WD33C93 ones, and replacing 
virt_to_bus by virt_to_phys in the dma_setup() function there would 
cause no functional change at all.

drivers/vme/bridges/vme_ca91cx42.c hasn't been used at all on m68k (it 
is a PCI-to-VME bridge chipset driver that would be needed on 
architectures that natively use a PCI bus). I haven't found anything 
that selects that driver, so not sure it is even still in use??

That would allow you to drop the remaining virt_to_bus define from 
arch/m68k/include/asm/virtconvert.h.

I could submit a patch to convert the Amiga SCSI drivers to use 
virt_to_phys if Geert and the SCSI maintainers think it's worth the churn.

32bit powerpc is a different matter though.

Cheers,

	Michael

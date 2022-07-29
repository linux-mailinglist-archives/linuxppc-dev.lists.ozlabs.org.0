Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4399E5849F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 04:54:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvBtK17Zhz3blb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 12:54:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XaXVR+jY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XaXVR+jY;
	dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvBsk4rTDz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 12:53:29 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id c20so2495942qtw.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 19:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JPLI0WWwSnl4pZNOOpeBG8692rahbBSQ0znuFgYvBFg=;
        b=XaXVR+jYg2staz8aCLZqU9DmuYK80sPqSTynrBms0nahy22/otZr48Z9zu6Fy3ZkcZ
         T/uaQyWwib4ZFMB2j9e4q5EEjXqPjH5pAz6uBcXG7UURRkXa/6z3JjIQ9qYn209z0fAw
         YhpSc1DAPZqDyvc9h9VprGCqOiXJZr9qbyQrFI53Mx5FclEkYi6mTiHzsoaPIEp561al
         +EIbzKMjcQHq8e23ErwIUU+hDTS87GCiYvH2/1qQ4xcGWDHUR7DDehP9K8zzEUOrLvYq
         D8uT6XI7RyLvAN7hoTJuh7n9xSnPCW34gydyHr/uxqlKtIp4xk4zsRMxpY6/pNAH6dCK
         hktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JPLI0WWwSnl4pZNOOpeBG8692rahbBSQ0znuFgYvBFg=;
        b=wdAhn10ZTxJ71oomsAj+HOlzXNXt1enCvRmmNFBDHhgtX9WVF3M9eA3/uqRhU9AIG9
         ziexY/0mAPDSQaPUqIz8q68nrfktPJQizhduc9CDUyHjtbo7X7mhfvgNA5buZbpi6SHr
         Ik2EzYGdlFFiGLL+5jYrtbJdg9xEsZlNLywoDMD+XfiLEyyPevVG14DMFSGPeV4reydP
         eG0vv25ZcaFM6EIImEH+28JMcBRiYUIFXonKArIY3Bzc7AKQq6GYESFHcQv/7C9LFv1e
         Ah1sEiLQnOmmk6dIZTAsBDeI0yoGdxUslUiEoc72bkU4wD/DDTjShBveragQ+Cl1NEQF
         x62Q==
X-Gm-Message-State: AJIora/guwu7/2wXmR1yW6c5xfUvRzYCk02TrnP5Gr6dgNYTeWpQkZ8W
	I5kpiT//1JgzVqwlHB+lSEckoms2fprnqCFQWsY=
X-Google-Smtp-Source: AGRyM1uXyM/GFYf79M1B6V4cB/eppkGvUk8CIrlhehEw6hNZFNiIz4Ghf2U/AYDYrQtEAwc7i78DK2UJy4GlCfrWvJE=
X-Received: by 2002:a05:622a:1911:b0:31e:eef1:9d5a with SMTP id
 w17-20020a05622a191100b0031eeef19d5amr1746740qtc.233.1659063206009; Thu, 28
 Jul 2022 19:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220707135552.3688927-1-aik@ozlabs.ru> <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru> <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <BN9PR11MB527690152FE449D26576D2FE8C829@BN9PR11MB5276.namprd11.prod.outlook.com>
 <300aa0fe-31c5-4ed2-d0a2-597c2c305f91@ozlabs.ru>
In-Reply-To: <300aa0fe-31c5-4ed2-d0a2-597c2c305f91@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 29 Jul 2022 12:53:14 +1000
Message-ID: <CAOSf1CHxkSxGXopT=9i3N9xUmj0=13J1V_M=or23ZamucXyu7w@mail.gmail.com>
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Rodel, Jorg" <jroedel@suse.de>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Joel Stanley <joel@jms.id.au>, Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 29, 2022 at 12:21 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> *snip*
>
> About this. If a platform has a concept of explicit DMA windows (2 or
> more), is it one domain with 2 windows or 2 domains with one window each?
>
> If it is 2 windows, iommu_domain_ops misses windows manipulation
> callbacks (I vaguely remember it being there for embedded PPC64 but
> cannot find it quickly).
>
> If it is 1 window per a domain, then can a device be attached to 2
> domains at least in theory (I suspect not)?
>
> On server POWER CPUs, each DMA window is backed by an independent IOMMU
> page table. (reminder) A window is a bus address range where devices are
> allowed to DMA to/from ;)

I've always thought of windows as being entries to a top-level "iommu
page table" for the device / domain. The fact each window is backed by
a separate IOMMU page table shouldn't really be relevant outside the
arch/platform.

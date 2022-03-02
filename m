Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F104CA079
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 10:19:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7pTh1LJrz3byS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 20:19:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YwA2Tp9/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=matorola@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YwA2Tp9/; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7pT03k5Bz30RD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 20:18:42 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id d10so2280408eje.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 01:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4LuLQynsRS5ZDdiypHmCRhWOSK0fPQgMoxmBubsA8FA=;
 b=YwA2Tp9/WRHVf+AhpCscraLQ5YZMBIbTnjRD9qXALixvArniZHwws+D5eKFYJ4w9RG
 r5YPECm/lP0oAUKfe9WRJhv6+FML2S+XIXHKeVDBXWzTRzpq8V5VyDtMBBLt+RgC4uif
 rGbJjiYJ+RaebcdTWE+lgavU2sjB3KE2oYMSI2g0SnLEMM8BFRLk6tjS00Xev2qK5BZV
 5Ssf9EZ0tsmaxYSBGN+JYRBhKcBJnRtyUIj9fj+nmKF1+vj7CNwKABPlCEiIkg4HqhVl
 prjve+Nrt6ySEZf00Hzlz9gQ4nrt4ykYynGeggVTPypi2WOB4Q0/x8pbTwKWJmRWzNiw
 F8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4LuLQynsRS5ZDdiypHmCRhWOSK0fPQgMoxmBubsA8FA=;
 b=m9dT/bfGKrhX8RKSiyzIyH944jlSjJwnvvDaFwHOxL4FyDge6johVCOadEbrPEqgv8
 wU9CjVqcLYHWObO2Ofa2HRKI3Kb9gDSHH/sPMTonRcDhL6XJeB4FQm60Yg4P0PZMxy4R
 Krmpf+FmBNN9KiYjgKtFukgOIhjyMSDHRKdHsS5ry3YzmM4Ak+YvdnOYMawW8kVyh/J0
 3IeJsVLDtVS1AjWWSCx5fTUjRTr3qcnfLszAwhm8dIkB9jvtALwQZgiB6IlxzTfa0dVt
 YIqvfskdgIWXJZlJA/IG10+MxUlIh6vhEPErSUUgNydnk95lV/OqCRsZRrp3eDgp0lky
 /2fQ==
X-Gm-Message-State: AOAM531MRJkeH84wZ8qmVBDKmnbDlxzJF84ONb+D3igBKaA5HFyvazyX
 JvCsrk/dLWvYoOJfh34+b8foTPI7+wAz8XmlZ9o=
X-Google-Smtp-Source: ABdhPJxefZcxfzkkMgbjOK8FTIKDUrSjhwIhlbq76ukZRP/HPSQoF7TsleylqvSIE+LRhSKcwrjAT6lGtFvgDJjKhNk=
X-Received: by 2002:a17:906:9f06:b0:6ce:36da:8247 with SMTP id
 fy6-20020a1709069f0600b006ce36da8247mr21813101ejc.651.1646212718008; Wed, 02
 Mar 2022 01:18:38 -0800 (PST)
MIME-Version: 1.0
References: <20220227143055.335596-1-hch@lst.de>
 <20220227143055.335596-8-hch@lst.de>
In-Reply-To: <20220227143055.335596-8-hch@lst.de>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Wed, 2 Mar 2022 12:18:26 +0300
Message-ID: <CADxRZqxrjp4erFNorH+XqubZWLRNjw2E14z7vOW537no1eKnhw@mail.gmail.com>
Subject: Re: [PATCH 07/11] x86: remove the IOMMU table infrastructure
To: Christoph Hellwig <hch@lst.de>
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
Cc: Juergen Gross <jgross@suse.com>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-hyperv@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux-foundation.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 27, 2022 at 7:31 PM Christoph Hellwig <hch@lst.de> wrote:
>
> The IOMMU table tries to separate the different IOMMUs into different
> backends, but actually requires various cross calls.
>
> Rewrite the code to do the generic swiotlb/swiotlb-xen setup directly
> in pci-dma.c and then just call into the IOMMU drivers.
...
> --- a/arch/x86/include/asm/iommu_table.h
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_X86_IOMMU_TABLE_H
> -#define _ASM_X86_IOMMU_TABLE_H
> -
> -#include <asm/swiotlb.h>
> -
> -/*
> - * History lesson:
> - * The execution chain of IOMMUs in 2.6.36 looks as so:
> - *
> - *            [xen-swiotlb]
> - *                 |
> - *         +----[swiotlb *]--+
> - *        /         |         \
> - *       /          |          \
> - *    [GART]     [Calgary]  [Intel VT-d]
> - *     /
> - *    /
> - * [AMD-Vi]
> - *
> - * *: if SWIOTLB detected 'iommu=soft'/'swiotlb=force' it would skip
> - * over the rest of IOMMUs and unconditionally initialize the SWIOTLB.
> - * Also it would surreptitiously initialize set the swiotlb=1 if there were
> - * more than 4GB and if the user did not pass in 'iommu=off'. The swiotlb
> - * flag would be turned off by all IOMMUs except the Calgary one.
> - *
> - * The IOMMU_INIT* macros allow a similar tree (or more complex if desired)
> - * to be built by defining who we depend on.
> - *
> - * And all that needs to be done is to use one of the macros in the IOMMU
> - * and the pci-dma.c will take care of the rest.
> - */

Christoph,

Is it possible to keep documentation comments in source files? Or are
they completely irrelevant now?

Thanks.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B281FFD00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 03:03:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GXLd4MB7zDqbk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 13:03:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="m8R/79rU"; 
 dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GXJf3w29zDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 13:02:08 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id k1so7509559pgg.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 18:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=qZJBdhWK727yndyazC34ddPVn/oIad/xcHuZwrkmMBw=;
 b=m8R/79rUlykrlnw/3JZw2C3GeRODhRDfpisMyNo/NInr4wEIc2BFnbDsJbDUGRaASJ
 rpiBQOu3fI54dKqkgI0/gxm8ykM12HUh4DTNRUo+TzSNSt2AAKFRVT1CLwzyFfm2YyS3
 XY+tEQujpN8SNBmJ5fBa+xsD+fOCDmb+T/MnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qZJBdhWK727yndyazC34ddPVn/oIad/xcHuZwrkmMBw=;
 b=ECwY4GtvaOFUzI5U0nvQeqtF4A2BdtFoHlKhB1HI+FKd+Qa3jjdLkpH3H/NyNsgJRZ
 LGCjEgDccMS6y/IeeKcdjhryxUANzMg6JlnE0O+6tX6ZWhTilCtghRH0iQqZgmJ6a6aw
 I1PbwWVYpKO8QRJPWwAYemp5TCz0s414kw9XoNSE+FkNYWWvSpxaw/XNIaGpHjXZWoh2
 4j9rQbWgYG7beqQLd8IedJINNKar15bCVhcxXI4EY8RVR2gb4IA4Xwn2q/dloZLBHVcv
 HMxqqiT6ajgY8i+Vq2XzeTm+AcY30hs2aNkr8cFYM86gVA5P4mvtFMwhG4W+jdbdDbbw
 DCQg==
X-Gm-Message-State: APjAAAXl2q+Z/wauufP3DIJTo6B3tqDug+MHHe5AcX9+L08BOG10gdoq
 g2dO1Xc1a88Z4WWNWzRs9h18ow==
X-Google-Smtp-Source: APXvYqxVwUsjv9Qip62nwc4V7qc5/1Bo2TITt1dtdH3dYNLr7v8VSLiGbqBSKw8tVq6X0L+K9q4YXg==
X-Received: by 2002:a62:fb02:: with SMTP id x2mr24646729pfm.254.1574042525278; 
 Sun, 17 Nov 2019 18:02:05 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-f1d8-c2a6-5354-14d8.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:f1d8:c2a6:5354:14d8])
 by smtp.gmail.com with ESMTPSA id v26sm19375902pfm.126.2019.11.17.18.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 18:02:04 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Roman Bolshakov <r.bolshakov@yadro.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: HPT allocation failures on POWER8 KVM hosts
In-Reply-To: <20191115152826.hvcu3borgx4hp275@SPB-NB-133.local>
References: <20191115152826.hvcu3borgx4hp275@SPB-NB-133.local>
Date: Mon, 18 Nov 2019 13:02:00 +1100
Message-ID: <874kz2gcx3.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, qemu-ppc@nongnu.org, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Roman,

> We're running a lot of KVM virtual machines on POWER8 hosts and
> sometimes new VMs can't be started because there are no contiguous
> regions for HPT because of CMA region fragmentation.
>
> The issue is covered in the LWN article: https://lwn.net/Articles/684611/
> The article points that you raised the problem on LSFMM 2016. However I
> couldn't find a follow up article on the issue.
>
> Looking at the kernel commit log I've identified a few commits that
> might reduce CMA fragmentaiton and overcome HPT allocation failure:
>   - bd2e75633c801 ("dma-contiguous: use fallback alloc_pages for single pages")
>   - 678e174c4c16a ("powerpc/mm/iommu: allow migration of cma allocated
>     pages during mm_iommu_do_alloc")
>   - 9a4e9f3b2d739 ("mm: update get_user_pages_longterm to migrate pages allocated from
>     CMA region")
>   - d7fefcc8de914 ("mm/cma: add PF flag to force non cma alloc")
>
> Are there any other commits that address the issue? What is the first
> kernel version that shouldn't have the HPT allocation problem due to CMA
> fragmentation?

I've had some success increasing the CMA allocation with the
kvm_cma_resv_ratio boot parameter - see
arch/powerpc/kvm/book3s_hv_builtin.c

The default is 5%. In a support case in a former job we had a customer
who increased this to I think 7 or 8% and saw the symptoms subside
dramatically.

HTH,
Daniel

>
> Thank you,
> Roman

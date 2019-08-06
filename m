Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC1F82A16
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 05:44:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462gVX1fXszDqcx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 13:44:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=thegavinli.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=gavinli@thegavinli.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=thegavinli.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=thegavinli.com header.i=@thegavinli.com
 header.b="UanfDFFy"; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462fQt6qc8zDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 12:56:01 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id p15so80873035eds.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Aug 2019 19:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thegavinli.com; s=google;
 h=sender:mime-version:references:in-reply-to:from:date:message-id
 :subject:to:cc;
 bh=ymynYvUaAJ/fSsk8dTF47gjXr8CYua8YobOOSKegPcM=;
 b=UanfDFFyXJgYSA7QqCuSdaCf5p+I3v2GUlvbhA8+2qe6l86pJKL0lTlbCFnTx3gBOk
 jjw0CPJdEKovLTwXtm6Go48h8/Y8NunT8oKKFGaMd9OyBH8HT4SxYQbIV6jerO9zgRB+
 DhQfv6wnIBUjLqio5JTWuVL4Tjft7woEGwUdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:references:in-reply-to:from
 :date:message-id:subject:to:cc;
 bh=ymynYvUaAJ/fSsk8dTF47gjXr8CYua8YobOOSKegPcM=;
 b=WLx1GHGuvJfVBso1DX0yCxIxYiNEJ83DbYOtVoZk80MRS300YqEUGzpRC3rULCtsG+
 9Fwgz0xrK7yZ+pAj753R3MSRl3j4WFSugptPcwB7pyUSuA0KbklgBcMpMWE5/v7F/xog
 usaELCHFQpxjKRfoWbOW+EyjNgvBkFgd80EyMoEXcOhng60fkWncdfeibHEEfU/xYmsf
 CAkEeg2MNXszQkdEGpa+yRsOjjKkha25iE4ILNkjSO0dEMOrlW1wdXykCdPxxn4QX6hG
 g7k6zQFkp02m2DmxCr0fUoN/AKUCPqD0CfAEJTlPRgf0hABcmvja8XCFcdx5bSTRdfRd
 j1eA==
X-Gm-Message-State: APjAAAW8FR1xHM2A3jANC/62nBYasDFoJvHSOUE4u7I8AaXZRKvBIC4C
 w11rx8ksiNwgKER+Np1Tnd9tGcmAS69TQQ==
X-Google-Smtp-Source: APXvYqwhjAH+tGX/gl0r0oLijDpuVDxfiKYbFv9J9y0m6F8hmdciZHRqQBb7GBAt4JjFPjIrflWLUw==
X-Received: by 2002:a17:906:9410:: with SMTP id
 q16mr1038322ejx.90.1565060158105; 
 Mon, 05 Aug 2019 19:55:58 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43])
 by smtp.gmail.com with ESMTPSA id g11sm14448840ejm.86.2019.08.05.19.55.55
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 19:55:56 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id d4so80954621edr.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Aug 2019 19:55:55 -0700 (PDT)
X-Received: by 2002:a17:906:b315:: with SMTP id
 n21mr1014103ejz.312.1565060155502; 
 Mon, 05 Aug 2019 19:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190805080145.5694-1-hch@lst.de>
 <20190805080145.5694-2-hch@lst.de>
 <CAP_+7SzPdNCMKuuXMjHjpCzxsey2YWR_e6mTAWtNSZ6kKBvKFw@mail.gmail.com>
In-Reply-To: <CAP_+7SzPdNCMKuuXMjHjpCzxsey2YWR_e6mTAWtNSZ6kKBvKFw@mail.gmail.com>
From: Gavin Li <gavinli@thegavinli.com>
Date: Mon, 5 Aug 2019 19:55:44 -0700
X-Gmail-Original-Message-ID: <CA+GxvY5C_rrukCzC5K-h72bePyW8PS_Rfj3uxh-K6UrcAextUQ@mail.gmail.com>
Message-ID: <CA+GxvY5C_rrukCzC5K-h72bePyW8PS_Rfj3uxh-K6UrcAextUQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-mapping: fix page attributes for dma_mmap_*
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 06 Aug 2019 13:42:56 +1000
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
Cc: Gavin Li <git@thegavinli.com>, Shawn Anastasio <shawn@anastas.io>,
 Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-mips@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>         /* create a coherent mapping */
>         ret = dma_common_contiguous_remap(page, size, VM_USERMAP,
> -                       arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs),
> +                       dma_pgprot(dev, PAGE_KERNEL, attrs),
>                         __builtin_return_address(0));
>         if (!ret) {
>                 __dma_direct_free_pages(dev, size, page);

Is dma_common_contiguous_remap() still necessary in the
DMA_ATTR_NON_CONSISTENT case? I would presume it would be fine to just
return a linearly mapped address in that case.

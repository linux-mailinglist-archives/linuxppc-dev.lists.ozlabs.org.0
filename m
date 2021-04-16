Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC943621D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 16:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMJ662pg2z3c31
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 00:11:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bWtljR/0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bWtljR/0; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMJ5f1rhBz30Dr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 00:10:46 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3D986121F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618582242;
 bh=1s9sCrJo44Veolfwl+MwQWl66gowBJVDh4jCcMWmw20=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bWtljR/0v+ciclhWmYZDIUGhhvFJ3qQ7nO0uU82MghhOsGFdSMyacApx9Rv+nHL6X
 W5cY5QnPwP6g7dxd13lON+NP7T3wxEgswnDncwfQXbUpDa1noe9/ic1qeaxTeqr1An
 xJUGxVeiTwbDQol4BcT+uJeJ/K8GtjgPzMatA+QGLBn8/pwaCrhafWYek6SKXGeGJX
 JrnAkRBsacpGTrsZXVT6wqIi5rnqa1PtXSpagwrGhkYyDEvybabUi7RBZVXZcudA+H
 4dZgdBI6yZkxxw1SMBUj5RKBCe9Uqk2xt0sX7dm9fywiRJ0wfW8Bx5Y3FStVzaPeVS
 VyQ7HbK3kn2jA==
Received: by mail-wm1-f48.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso3089604wmq.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 07:10:42 -0700 (PDT)
X-Gm-Message-State: AOAM53090YTVCjBEjz2bmfQ88UhFri3wgCuuQh3JXBMorheZhLXHxzj5
 JOMIQEGjqgX86C/FHCIdtoGfAVH74g/ixGHAOHg=
X-Google-Smtp-Source: ABdhPJwer78kcpt2KUTk7pLNWv4YpxxYqG4ncdMLFchwkUndSOMZjtA8z9tZUxzlPor4R9hASXWQZTamma1KWyeXMwk=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr8250595wmi.75.1618582241293; 
 Fri, 16 Apr 2021 07:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210409185105.188284-3-willy@infradead.org>
 <202104100656.N7EVvkNZ-lkp@intel.com>
 <20210410024313.GX2531743@casper.infradead.org>
 <20210410082158.79ad09a6@carbon>
 <CAC_iWjLXZ6-hhvmvee6r4R_N64u-hrnLqE_CSS1nQk+YaMQQnA@mail.gmail.com>
 <ab9f1a6c-4099-2b59-457d-fcc45d2396f4@ti.com>
In-Reply-To: <ab9f1a6c-4099-2b59-457d-fcc45d2396f4@ti.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 16 Apr 2021 16:10:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1+Dpu3ef+VYA+owTVGoGqfK6APbYbLSH1_ZKT0aMYQCw@mail.gmail.com>
Message-ID: <CAK8P3a1+Dpu3ef+VYA+owTVGoGqfK6APbYbLSH1_ZKT0aMYQCw@mail.gmail.com>
Subject: Re: Bogus struct page layout on 32-bit
To: Grygorii Strashko <grygorii.strashko@ti.com>
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 clang-built-linux@googlegroups.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 "David S. Miller" <davem@davemloft.net>, Linux-MM <linux-mm@kvack.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-fsdevel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Matteo Croce <mcroce@linux.microsoft.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 11:27 AM 'Grygorii Strashko' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
> On 10/04/2021 11:52, Ilias Apalodimas wrote:
> > +CC Grygorii for the cpsw part as Ivan's email is not valid anymore
> The TI platforms am3/4/5 (cpsw) and Keystone 2 (netcp) can do only 32bit DMA even in case of LPAE (dma-ranges are used).
> Originally, as I remember, CONFIG_ARCH_DMA_ADDR_T_64BIT has not been selected for the LPAE case
> on TI platforms and the fact that it became set is the result of multi-paltform/allXXXconfig/DMA
> optimizations and unification.
> (just checked - not set in 4.14)
>
> Probable commit 4965a68780c5 ("arch: define the ARCH_DMA_ADDR_T_64BIT config symbol in lib/Kconfig").

I completely missed this change in the past, and I don't really agree
with it either.

Most 32-bit Arm platforms are in fact limited to 32-bit DMA, even when they have
MMIO or RAM areas above the 4GB boundary that require LPAE.

> The TI drivers have been updated, finally to accept ARCH_DMA_ADDR_T_64BIT=y by using
> things like (__force u32) for example.
>
> Honestly, I've done sanity check of CPSW with LPAE=y (ARCH_DMA_ADDR_T_64BIT=y) very long time ago.

This is of course a good idea, drivers should work with any
combination of 32-bit
or 64-bit phys_addr_t and dma_addr_t.

        Arnd

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 431B6424BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 13:50:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P4v11lgzzDr4Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 21:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P4rX36X7zDqw8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 21:48:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sV3BW+Wy"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45P4rW6lVGz8t23
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 21:48:27 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45P4rW64kyz9sBr; Wed, 12 Jun 2019 21:48:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sV3BW+Wy"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45P4rW4fF8z9s9y
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 21:48:26 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id e25so10026295itk.3
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/z0Jdvaew8ZNTrmPwRXBvXU6v+TaVoGCDpIAHDRM6P8=;
 b=sV3BW+Wy3876BAc/isBu+hSuU2nBMUlPeL4Hzw+9a5jlvXaJN52e2OTNm6yiO8J1gP
 eyAqrp4Iz0+TTevNp5Wcgyi47QDpDAUNfeFNDGYSHRDHpy6odAd9SppPd2o1y5s4gkvq
 PhzVdhByu4jiWyTybds5t5QfeWmG9oH1rGD1iVlVmxK78cnWxFoW7OSTFLRJt0vuj8VP
 lYsxvFOK11hP8pNMTLIfcmW1YIxcRVPqzDreMTxG1kbDMMcW/3Tx0n+qjYaDpJykYF8O
 K8HA1txL4xUz9ydyHEOWcBCcL11ld1qNVoSI1744Y7XgmMtfX7ORRQqhk+qBicy4JNhx
 o2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/z0Jdvaew8ZNTrmPwRXBvXU6v+TaVoGCDpIAHDRM6P8=;
 b=AptUr2vw5K03SejfZQ6LzVGQ/o0YUOZ3R2xniknKxxKElAOwHWzuh+G4sHFX/ykdye
 di8GpTQgpHNVGsUmXnL9shnKb1x7RvPTlPiRabE/1XNfbdBaJ8jrX/ZBqbjduA+bxFHK
 LOKgMvbAjAAGsrjgbO+w2Clq+V/RdNY+nRlMUxknrmb9uMHG4lF8V+L7hk+3xWqIOkG8
 Ft+2AexzrP4pHihm8WcdJab9Z+Q5vMHrh3KRtbAdLS9UR9jlh3CZZH0IMbnMV9a/9QBu
 thSsN2svkWwwmeBM8pT4Nm5CMmXgaJj5Uc4EohytHvjC4i+z16CmQWl+eCuBlXXJpaX4
 ONJA==
X-Gm-Message-State: APjAAAVve+ND+bYmhYLzMUCq/0A6hgyyAWxr1fwj4SZvU38LLEtWIpxJ
 eVdQtAJ7792ynbkdyOH0tzw6WEsiu54Dl0YzW4Y=
X-Google-Smtp-Source: APXvYqzN4gZSdU1v/0N78zQbpjP/CanYz5Dgld7i+PhumbwMU8L0DHwQqmcZMAiJSxjiA4Ha/MPoKdTEop+HhRr5Kks=
X-Received: by 2002:a05:660c:383:: with SMTP id
 x3mr21228859itj.44.1560340103393; 
 Wed, 12 Jun 2019 04:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190611092144.11194-1-oded.gabbay@gmail.com>
 <20190611095857.GB24058@kroah.com>
 <20190611151753.GA11404@infradead.org> <20190611152655.GA3972@kroah.com>
 <CAFCwf13A73AxKzaa7Dk3tU-1NDgTFs4+xCO2os7SuSyUHZ9Z3Q@mail.gmail.com>
 <CAFCwf134nTD4FM_9Q+THQ7ZAZzGxhs15O6EheaRJMqM5wxi+aA@mail.gmail.com>
 <CAOSf1CE82uVVni638jkJJpQ7XLXX+HdD7xuB7Wv-f8mn=SBMeg@mail.gmail.com>
 <20190612065314.GA28838@infradead.org>
In-Reply-To: <20190612065314.GA28838@infradead.org>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 12 Jun 2019 21:48:12 +1000
Message-ID: <CAOSf1CF=gkGDVbiqT2NM1Rd_-aWKePA9D1hyj4FwY+M+4gPRBQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] habanalabs: enable 64-bit DMA mask in POWER9
To: Christoph Hellwig <hch@infradead.org>
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
Cc: Oded Gabbay <oded.gabbay@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2019 at 4:53 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Jun 12, 2019 at 04:35:22PM +1000, Oliver O'Halloran wrote:
> > Setting a 48 bit DMA mask doesn't work today because we only allocate
> > IOMMU tables to cover the 0..2GB range of PCI bus addresses.
>
> I don't think that is true upstream, and if it is we need to fix bug
> in the powerpc code.  powerpc should be falling back treating a 48-bit
> dma mask like a 32-bit one at least, that is use dynamic iommu mappings
> instead of using the direct mapping.  And from my reding of
> arch/powerpc/kernel/dma-iommu.c that is exactly what it does.

This is more or less what Alexey's patches fix. The IOMMU table
allocated for the 32bit DMA window is only sized for 2GB in the
platform code, see pnv_pci_ioda2_setup_default_config().

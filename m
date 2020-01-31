Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0D814EB20
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 11:44:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488DNq4tbyzDqgC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 21:44:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488DJ7706KzDqcG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 21:40:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eh+m0Uxt; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 488DJ53W5Bz9sSP; Fri, 31 Jan 2020 21:40:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 488DJ44WsFz9sSL;
 Fri, 31 Jan 2020 21:40:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1580467205;
 bh=t+s8IXmWy8smiLWcBN6/ROFxyXt50DgN0gQz63dthJs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eh+m0UxtIKLSkLBM2+h1bfL7Sqbjt8HBh90YjNP4Rmh6apty+6QHqyakuoH5MivVz
 1AVKSBRjL4LLJxYAl/MbKqfCvv7dlmlQ6zFRm90onc7za6+2tOMXKp6klsaVfIq9vc
 l4maU/5MoO05LVVvrZgtcp3TeOxB4UDWJWqbHDIIv6HbF4+Wr+3V1c8b9qylp07DNm
 ojI0PSCZuUcvtUyjvaKSz0thr/fU3zRP6IN1Zs+XS8a6UCXgSpJ6JHGcfwPv0HOaT0
 nT25LXzSCa8/P8EYPWAJnD3Lm8cx6b9d+AnPDb3FU0X/e6RCQKy5rD167sAdsreVgM
 6aAYUdIeub9fQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] of: Add OF_DMA_DEFAULT_COHERENT & select it on powerpc
In-Reply-To: <CAPDyKFrbYmV6_nV6psVLq6VRKMXf0PXpemBbj48yjOr3P130BA@mail.gmail.com>
References: <20200126115247.13402-1-mpe@ellerman.id.au>
 <CAPDyKFrbYmV6_nV6psVLq6VRKMXf0PXpemBbj48yjOr3P130BA@mail.gmail.com>
Date: Fri, 31 Jan 2020 21:40:03 +1100
Message-ID: <87mua3gb98.fsf@mpe.ellerman.id.au>
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
Cc: DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ulf Hansson <ulf.hansson@linaro.org> writes:
> On Sun, 26 Jan 2020 at 12:53, Michael Ellerman <mpe@ellerman.id.au> wrote:
>> There's an OF helper called of_dma_is_coherent(), which checks if a
>> device has a "dma-coherent" property to see if the device is coherent
>> for DMA.
>>
>> But on some platforms devices are coherent by default, and on some
>> platforms it's not possible to update existing device trees to add the
>> "dma-coherent" property.
>>
>> So add a Kconfig symbol to allow arch code to tell
>> of_dma_is_coherent() that devices are coherent by default, regardless
>> of the presence of the property.
>>
>> Select that symbol on powerpc when NOT_COHERENT_CACHE is not set, ie.
>> when the system has a coherent cache.
>>
>> Fixes: 92ea637edea3 ("of: introduce of_dma_is_coherent() helper")
>> Cc: stable@vger.kernel.org # v3.16+
>> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Thanks Michael for helping out fixing and this! The patch looks good to me.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks for the review.

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 360E514EB28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 11:45:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488DQY0VcqzDqdb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 21:45:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488DJN3v27zDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 21:40:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Rti07r8w; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 488DJM33xdz9sSZ; Fri, 31 Jan 2020 21:40:19 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 488DJL5K8vz9sSP;
 Fri, 31 Jan 2020 21:40:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1580467218;
 bh=NpDbQvQ6a1gVpANE05CiJvGMkImEaOzhU76R7vlCsyM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Rti07r8wsEq5Cv2Oll1n+7tK55v/64zehHtajY+SpSJnAkMxgHfhLqY+HDr6VcpLS
 8GUBZZQXne2NFCa3W1n7IiZmmOPgIg1pd2M/blkyTI8Drd/eqCh0OexnldSyBoWAeH
 SJlXSM1rAlKhvco/yHCRsXmQq6yVKFauxYBbAHMMLqNS0Ya/PRDsOjD6NK1Kr8vPyF
 xtknii2clX37PXMKAssNCLCMwtOLIEtWdt13YEyv5xtr+7YZLUQixrz65ZPrFIyE0D
 VN3gvs/J48BWFxpdiIRy0/b6Xl8CfC6mfgW9uxqAnAMn9tm/u8+uw0rR6mHly/IxeY
 9HsYkw22XFWSg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: Add OF_DMA_DEFAULT_COHERENT & select it on powerpc
In-Reply-To: <20200128142646.GA17341@bogus>
References: <20200126115247.13402-1-mpe@ellerman.id.au>
 <20200128142646.GA17341@bogus>
Date: Fri, 31 Jan 2020 21:40:17 +1100
Message-ID: <87k157gb8u.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, robh+dt@kernel.org,
 chzigotzky@xenosoft.de, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:
> On Sun, 26 Jan 2020 22:52:47 +1100, Michael Ellerman wrote:
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
>> ---
>>  arch/powerpc/Kconfig | 1 +
>>  drivers/of/Kconfig   | 4 ++++
>>  drivers/of/address.c | 6 +++++-
>>  3 files changed, 10 insertions(+), 1 deletion(-)
>> 
>
> Applied, thanks.

Thanks.

cheers

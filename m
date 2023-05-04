Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1056F6441
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 07:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBhjZ4njKz3fD7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 15:10:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QFf8Ux0U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBhhl1dsdz3bZj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 May 2023 15:10:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QFf8Ux0U;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QBhhk6sYyz4x3d;
	Thu,  4 May 2023 15:10:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683177015;
	bh=rUwC7Lt3vFnAcTqaOV2gQ+KB+PNQj/IIiU5kKEIseWA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QFf8Ux0UKKvtuDIAcGdEiliNexVuu+4LFw9XigpjLyj+1TgAGOoDhAaNGjVQABHDf
	 dzQwxDK4oqbnnmQrUlIB7gsY1zoOaPuTMfQv5Wq87Dr5BdSTF63ICs2JTmx+9G5DAw
	 A4KfIWPhWO2V3PJdWxeGJTBMid/WhhVu6l+2PZJ5grF2D9c4g3nLBvzzWhxInJ6K+4
	 21k1wgjhKDe9rTr/sV5GKBzxFM7ORlubTJEkY2yS24w9sXh2fMgpdSXE91zGo2eYjn
	 /EzBD6EXlA+yaXRLY+PPQnPT7CACb53kTo/pc1hrd4XNYv8aVQq8PjmVa2pHkRFyBz
	 74C9z5XNa2rzw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/iommu: DMA address offset is incorrectly
 calculated with 2MB TCEs
In-Reply-To: <1ce16c05-b492-fed8-06af-0bbba9de9053@linux.vnet.ibm.com>
References: <20230419152623.26439-1-gbatra@linux.vnet.ibm.com>
 <87leimfuk0.fsf@mail.concordia>
 <1ce16c05-b492-fed8-06af-0bbba9de9053@linux.vnet.ibm.com>
Date: Thu, 04 May 2023 15:10:14 +1000
Message-ID: <87354c8yx5.fsf@mail.lhotse>
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Greg Joyce <gjoyce@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
> Hello Michael,
>
> I was looking into the Bug: 199106 
> (https://bugzilla.linux.ibm.com/show_bug.cgi?id=199106).
>
> In the Bug, Mellanox driver was timing out when enabling SRIOV device.
>
> I tested, Alexey's patch and it fixes the issue with Mellanox driver. 
> The down side
>
> to Alexey's fix is that even a small memory request by the driver will 
> be aligned up
>
> to 2MB. In my test, the Mellanox driver is issuing multiple requests of 
> 64K size.
>
> All these will get aligned up to 2MB, which is quite a waste of resources.

OK. I guess we should use your patch then.

It's not ideal as it means the device can potentially read/write to
memory it shouldn't, but 2MB is a lot to waste for a 64K alloc.

> In any case, both the patches work. Let me know which approach you 
> prefer. In case
>
> we decide to go with my patch, I just realized that I need to fix 
> nio_pages in
>
> iommu_free_coherent() as well.

Can you send a v3 with that fixed please.

cheers

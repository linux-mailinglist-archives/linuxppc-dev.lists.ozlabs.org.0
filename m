Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A411D923D1C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 14:02:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Kmu+FjaM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD1kW3Qytz3g3p
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 22:02:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Kmu+FjaM;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD1jn0cldz3fxN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 22:02:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719921721;
	bh=FXwb3NDkOXba4t5aP3C9g00gzWbtwMStp3ogpDj4GB0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Kmu+FjaMZERhRfktDqkks74plxvjyoFLsSJvWsb0Nge/HXsLlzHBYtPYdiNo2BxTJ
	 8HRfkJzZXvErLi9BgRPoJ1tltiojXBQ2G4GTmHJGmTFjBSLAEgTddJV9pDOuhG049l
	 2vTAwgis/bp9h4cQVwK7PraMeJT7QNWNqLC0ygfuPGvUVV9ZVwYuiPaAuNRnOfDs3X
	 /rYRv4LlwLS5bFLTrPxWJNAlbJgEkTJoEB66+3nDsX5AeQw/4vP4NYmKjgheo4qrVF
	 ioObEliwijeZ5NVR/Bw35UwDMnwD+dH9/fNXyD98M8ztr5gJAInnpZXNaQi4bwfIIv
	 dnCWXznUN+uyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WD1jf61Dfz4wc4;
	Tue,  2 Jul 2024 22:01:58 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Esben Haabendal
 <esben@geanix.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 2/3] powerpc/configs: Update defconfig with now
 user-visible CONFIG_FSL_IFC
In-Reply-To: <d203dd45-fe69-48dc-aa36-d9870065f2e9@kernel.org>
References: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com>
 <20240530-fsl-ifc-config-v3-2-1fd2c3d233dd@geanix.com>
 <d203dd45-fe69-48dc-aa36-d9870065f2e9@kernel.org>
Date: Tue, 02 Jul 2024 22:01:57 +1000
Message-ID: <87v81oj93e.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Krzysztof Kozlowski <krzk@kernel.org> writes:
> On 30/05/2024 16:46, Esben Haabendal wrote:
>> With CONFIG_FSL_IFC now being user-visible, and thus changed from a select
>> to depends in CONFIG_MTD_NAND_FSL_IFC, the dependencies needs to be
>> selected in defconfigs.
>> 
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>
> Anyone is going to pick this up?

Doesn't it need to be merged along with patch 1?

cheers
